/*
 * SPI interface for the Nexys4 DDR board running at 50 MHz
 *
 * 17 March 2017
 */

module mfp_ahb_spi(
           input        clk,
           input        resetn,
           input [7:0]  data,
           input        cmdb,
           input        send,
           output       done,
           output       sdo,
           output       rs,
           output       sck);

  wire transmitDone, transmit, slowclk, enClk; 
  wire [7:0] sendData;

  clockdiv clockdiv(clk, resetn, slowclk);
  regRen #(9) sendDataReg(clk, resetn, done, 
                         {cmdb, data}, {rs, sendData});
  SPIinitsendFSM SPIinitsendFSM(clk, resetn, send, transmitDone,
                                transmit, done);
  SPItransmitFSM SPItransmitFSM(slowclk, resetn, transmit, sendData,
                        transmitDone, sdo, enClk);
  assign sck = slowclk & enClk;   
  
endmodule


// Slow clock (~1 kHz) for SPI transmission
module clockdiv(input  clk,
                input  resetn,
                output clkdiv);

  reg [15:0] cnt;

  always @(posedge clk, negedge resetn)
    if (~resetn)
      cnt    <=  16'b0;
    else
      cnt <= cnt + 1;

  assign clkdiv = cnt[15];
endmodule

module SPIinitsendFSM(input  clk, 
                      input  resetn, 
                      input  send, transmitDone,
                      output transmit, done);

   reg  [1:0] state, nextstate;

   parameter noData = 2'b00;
   parameter start  = 2'b01;
   parameter finish = 2'b10;

   // State Register
   always @(posedge clk, negedge resetn)
      if (~resetn) state <= noData;
      else         state <= nextstate;

   // Next State Logic
   always @(*)
      case (state)
         noData: if (send)         nextstate = start;
                 else              nextstate = noData;
         start:  if (transmitDone) nextstate = finish;
                 else              nextstate = start;
         finish: if (transmitDone) nextstate = finish;
                 else              nextstate = noData;
         default:                  nextstate = noData;
      endcase

   // Output Logic
   assign done =     (state == noData);
   assign transmit = (state == start);
endmodule

module SPItransmitFSM(input       clk, 
                      input       resetn, 
                      input       transmit, 
                      input [7:0] data,
                      output      transmitDone, 
                      output reg  sdo, enClk);

   reg  [3:0] state, nextstate;

   parameter init   = 4'b1111;
   parameter S0     = 4'b0000;
   parameter S1     = 4'b0001;
   parameter S2     = 4'b0010;
   parameter S3     = 4'b0011;
   parameter S4     = 4'b0100;
   parameter S5     = 4'b0101;
   parameter S6     = 4'b0110;
   parameter S7     = 4'b0111;
   parameter finish = 4'b1000;

   // State Register
   always @(negedge clk, negedge resetn)
      if (~resetn) state <= init;
      else         state <= nextstate;

   // Next State Logic
   always @(*)
      case (state)
         init: if (transmit)   nextstate = S7;
               else            nextstate = init;
         S7:                   nextstate = S6;
         S6:                   nextstate = S5;
         S5:                   nextstate = S4;
         S4:                   nextstate = S3;
         S3:                   nextstate = S2;
         S2:                   nextstate = S1;
         S1:                   nextstate = S0;
         S0:                   nextstate = finish;
         finish: if (transmit) nextstate = finish;
                 else          nextstate = init;
         default:              nextstate = init;
      endcase

   // Output Logic
   assign transmitDone = (state == finish);
   always @(*)
      case (state)
         init:    begin sdo = 1'b0;    enClk = 1'b0; end
         S0:      begin sdo = data[0]; enClk = 1'b1; end 
         S1:      begin sdo = data[1]; enClk = 1'b1; end 
         S2:      begin sdo = data[2]; enClk = 1'b1; end 
         S3:      begin sdo = data[3]; enClk = 1'b1; end 
         S4:      begin sdo = data[4]; enClk = 1'b1; end 
         S5:      begin sdo = data[5]; enClk = 1'b1; end 
         S6:      begin sdo = data[6]; enClk = 1'b1; end 
         S7:      begin sdo = data[7]; enClk = 1'b1; end 
         finish:  begin sdo = 1'b0;    enClk = 1'b0; end 
         default: begin sdo = 1'b0;    enClk = 1'b0; end 
      endcase
endmodule

module regRen
#(parameter WIDTH=32)
(           input                    clk, 
            input                    resetn, 
            input                    en,
            input      [(WIDTH-1):0] d, 
            output reg [(WIDTH-1):0] q);

  always @(posedge clk, negedge resetn)
    if (~resetn)
      q <= 0;
    else if (en)
      q <= d;

endmodule
      
