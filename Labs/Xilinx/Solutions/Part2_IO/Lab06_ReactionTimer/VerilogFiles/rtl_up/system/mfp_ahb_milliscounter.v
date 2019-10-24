/*
 * Millisecond counter for the Nexys4 DDR board running at 50 MHz
 *
 * 17 March 2017
 */

module mfp_ahb_milliscounter(
                             input              clk,
                             input              resetn,
                             output reg [31:0]  millis);

  reg [15:0] cnt;

  always @(posedge clk, negedge resetn)
    if (~resetn) begin
      cnt <= 16'b0;
      millis <= 32'b0;
    end
    else begin 
      if (cnt == 16'd50000) begin
        cnt <= 16'b0;
        millis <= millis + 1;
      end 
      else
        cnt <= cnt + 1;
    end

endmodule


