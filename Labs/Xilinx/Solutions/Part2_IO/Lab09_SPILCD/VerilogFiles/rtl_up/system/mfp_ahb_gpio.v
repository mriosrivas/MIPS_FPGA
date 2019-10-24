// mfp_ahb_gpio.v
//
// General-purpose I/O module for Altera's DE2-115 and 
// Digilent's (Xilinx) Nexys4-DDR board


`include "mfp_ahb_const.vh"

module mfp_ahb_gpio(
    input                        HCLK,
    input                        HRESETn,
    input      [  4          :0] HADDR,
    input      [  1          :0] HTRANS,
    input      [ 31          :0] HWDATA,
    input                        HWRITE,
    input                        HSEL,
    output reg [ 31          :0] HRDATA,

// memory-mapped I/O
    input      [`MFP_N_SW-1  :0] IO_Switch,
    input      [`MFP_N_PB-1  :0] IO_PB,
    output reg [`MFP_N_LED-1 :0] IO_LED,
    output     [ 7           :0] IO_7SEGEN_N,
    output     [ 6           :0] IO_7SEG_N,
	output                       IO_BUZZ,
    output                       IO_SPI_SDO,
    output                       IO_SPI_RS,
    output                       IO_SPI_SCK 
);

  // internal signals for I/Os: 7-segment displays, millisecond counter, buzzer
  wire [ 6:0] segments;      // 7 segments value for enabled signal
    
  reg  [ 7:0] SEGEN_N;       // 7-segment display enables
  reg  [31:0] SEGDIGITS_N;   // value of 8 7-segment display digits
  wire [31:0] millis;        // number of milliseconds since start of program
  reg  [31:0] buzzerMicros;
  reg  [ 7:0] SPIdata;       // 8-bit data to send from CPU
  reg         SPIcmdb;       // cmd bar (1=data, 0 = command)
  reg         SPIsend;       // CPU asserts SPIsend when data is ready to be sent
  wire        SPIdone;       // SPI slave asserts SPIdone when done sending data


  // signals delayed to align with HWDATA
  reg  [4:0]  HADDR_d;
  reg         HWRITE_d;
  reg         HSEL_d;
  reg  [1:0]  HTRANS_d;
  wire        we;            // write enable

  // delay HADDR, HWRITE, HSEL, and HTRANS to align with HWDATA for writing
  always @ (posedge HCLK) 
  begin
    HADDR_d  <= HADDR;
	HWRITE_d <= HWRITE;
	HSEL_d   <= HSEL;
	HTRANS_d <= HTRANS;
  end
  
  // overall write enable signal
  assign we = (HTRANS_d != `HTRANS_IDLE) & HSEL_d & HWRITE_d;

  mfp_ahb_sevensegtimer sevensegtimer(
    .clk      (HCLK),    
    .resetn   (HRESETn),
	.EN       (SEGEN_N), 
	.DIGITS   (SEGDIGITS_N), 
	.DISPENOUT(IO_7SEGEN_N), 
    .DISPOUT  (IO_7SEG_N));

  mfp_ahb_milliscounter mfp_ahb_milliscounter(
    .clk(HCLK), 
	.resetn(HRESETn),
    .millis(millis));

  mfp_ahb_buzzer mfp_ahb_buzzer(
    .clk(HCLK), 
	.resetn(HRESETn), 
	.numMicros(buzzerMicros), 
    .buzz(IO_BUZZ));

  mfp_ahb_spi mfp_ahb_spi(
    .clk(HCLK), 
    .resetn(HRESETn), 
    .data(SPIdata), 
    .cmdb(SPIcmdb), 
    .send(SPIsend), 
    .done(SPIdone), 
    .sdo(IO_SPI_SDO),
    .rs(IO_SPI_RS),
    .sck(IO_SPI_SCK));
	
  always @(posedge HCLK or negedge HRESETn)
    if (~HRESETn) begin
      IO_LED       <= `MFP_N_LED'b0;  // turn LEDs off at reset
      // turn 7-segment displays off at reset
      SEGEN_N      <= 8'hff;          // 7-segment display enables
      SEGDIGITS_N  <= 32'hffffffff;   // 7-segment digit values	  
      buzzerMicros <= 32'b0;          // buzzer is off
	  SPIdata      <= 8'b0;           // SPI data is 0
      SPIcmdb      <= 1'b0;           // SPI cmd defaulting to sending a command
      SPIsend      <= 1'b0;           // CPU not sending SPI data

	  end else if (we)
        case (HADDR_d)
          `H_LED_IONUM:        IO_LED       <= HWDATA[`MFP_N_LED-1:0];
          `H_7SEGEN_IONUM:     SEGEN_N      <= HWDATA[7:0];
          `H_7SEGDIGITS_IONUM: SEGDIGITS_N  <= HWDATA;
          `H_BUZZER_IONUM:     buzzerMicros <= HWDATA;
          `H_SPI_DATA_IONUM: begin 
                             SPIdata      <= HWDATA[7:0]; 
                             SPIcmdb      <= HWDATA[8]; 
                             SPIsend      <= 1'b1;
                           end

        endcase
      else if (~SPIdone) 
        SPIsend <= 1'b0;

    
  always @(posedge HCLK or negedge HRESETn)
    if (~HRESETn)
      HRDATA <= 32'h0;
    else
	  case (HADDR)
        `H_SW_IONUM:       HRDATA <= { {32 - `MFP_N_SW {1'b0}}, IO_Switch };
        `H_PB_IONUM:       HRDATA <= { {32 - `MFP_N_PB {1'b0}}, IO_PB };
        `H_MILLIS_IONUM:   HRDATA <= millis;
        `H_SPI_DONE_IONUM: HRDATA = {31'b0, SPIdone};
		default:           HRDATA <= 32'h0;
      endcase
		 
endmodule

