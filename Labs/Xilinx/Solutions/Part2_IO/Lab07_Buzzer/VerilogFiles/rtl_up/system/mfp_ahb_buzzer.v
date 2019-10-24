/*
 * Buzzer hardware for the Nexys4 DDR board running at 50 MHz
 *
 * 19 March 2017
 */

module mfp_ahb_buzzer(
              input        clk,
              input        resetn,
              input [31:0] numMicros,
              output       buzz);

  wire noTone;
  wire resetCnt; 
  wire microsEq;
  wire [31:0] cntMicros;
  wire [31:0] numMicrosCurr;

  assign resetCnt = (numMicros != numMicrosCurr) | microsEq | ~resetn;
  assign noTone = ~|numMicrosCurr;
  assign microsEq = (numMicrosCurr == cntMicros);

  regR regNumMicros(clk, resetn, numMicros, numMicrosCurr);
  microsCounter microsCounter(clk, resetCnt, cntMicros);
  toggleBuzz toggleBuzz(clk, ~resetn, noTone, microsEq, buzz);

endmodule


module microsCounter(input              clk,
                     input              reset,
                     output reg [31:0]  micros);
  reg [5:0] cnt;

  always @(posedge clk)
    if (reset) begin
      cnt    <=  6'b0;
      micros <= 32'b0;
    end
    else begin 
      if (cnt == 6'd50) begin
        cnt <= 6'b0;
        micros <= micros + 1;
      end 
      else
        cnt <= cnt + 1;
    end

endmodule

module toggleBuzz(input        clk, 
                  input        reset,
                  input        noTone, 
                  input        en,
                  output reg   buzz);

  always @(posedge clk)
    if (reset | noTone)
      buzz <= 1'b0;
    else if (en)
      buzz <= ~buzz;

endmodule


module regR
#(parameter WIDTH=32)
(           input                    clk, 
            input                    resetn, 
            input      [(WIDTH-1):0] d, 
            output reg [(WIDTH-1):0] q);

  always @(posedge clk, negedge resetn)
    if (~resetn)
      q <= 0;
    else
      q <= d;

endmodule
      
