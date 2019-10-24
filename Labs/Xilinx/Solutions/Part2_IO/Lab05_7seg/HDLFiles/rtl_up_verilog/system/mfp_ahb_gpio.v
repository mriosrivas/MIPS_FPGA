// mfp_ahb_gpio.v
//
// General-purpose I/O module for Altera's DE2-115 and 
// Digilent's (Xilinx) Nexys4-DDR board


`include "mfp_ahb_const.vh"

module mfp_ahb_gpio(
    input                        HCLK,
    input                        HRESETn,
    input      [  3          :0] HADDR,
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
    output     [ 6           :0] IO_7SEG_N 

);

  // internal signals for 7-segment displays
  wire [ 6:0] segments;    // 7 segments value for enabled signal
    
  reg  [ 7:0] SEGEN_N;     // 7-segment display enables
  reg  [31:0] SEGDIGITS_N; // value of 8 7-segment display digits

  reg  [3:0]  HADDR_d;
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

  always @(posedge HCLK or negedge HRESETn)
    if (~HRESETn) begin
      IO_LED       <= `MFP_N_LED'b0;  // turn LEDs off at reset
      // turn 7-segment displays off at reset
      SEGEN_N      <= 8'hff;          // 7-segment display enables
      SEGDIGITS_N  <= 32'hffffffff;   // 7-segment digit values	  
    end else if (we)
      case (HADDR_d)
        `H_LED_IONUM:        IO_LED      <= HWDATA[`MFP_N_LED-1:0];
        `H_7SEGEN_IONUM:     SEGEN_N     <= HWDATA[7:0];
        `H_7SEGDIGITS_IONUM: SEGDIGITS_N <= HWDATA;
      endcase
    
  always @(posedge HCLK or negedge HRESETn)
    if (~HRESETn)
      HRDATA <= 32'h0;
    else
	  case (HADDR)
        `H_SW_IONUM: HRDATA <= { {32 - `MFP_N_SW {1'b0}}, IO_Switch };
        `H_PB_IONUM: HRDATA <= { {32 - `MFP_N_PB {1'b0}}, IO_PB };
         default:    HRDATA <= 32'h0;
      endcase
		 
endmodule

