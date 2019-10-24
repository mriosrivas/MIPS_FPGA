/*
 * Seven-segment display decoder
 *
 * January 25, 2017
 */

module mfp_ahb_sevensegdec(input      [3:0] data,
                           output reg [6:0] seg);
  always @(*)
    case(data)
                  // abc_defg
      4'h0: seg = 7'b000_0001;  // 0x01
      4'h1: seg = 7'b100_1111;  // 0x4f
      4'h2: seg = 7'b001_0010;  // 0x12
      4'h3: seg = 7'b000_0110;  // 0x06
      4'h4: seg = 7'b100_1100;  // 0x4c
      4'h5: seg = 7'b010_0100;  // 0x24
      4'h6: seg = 7'b010_0000;  // 0x20
      4'h7: seg = 7'b000_1111;  // 0x0f
      4'h8: seg = 7'b000_0000;  // 0x00
      4'h9: seg = 7'b000_1100;  // 0x0c
      4'ha: seg = 7'b000_1000;  // 0x08
      4'hb: seg = 7'b110_0000;  // 0x60
      4'hc: seg = 7'b111_0010;  // 0x72
      4'hd: seg = 7'b100_0010;  // 0x42
      4'he: seg = 7'b011_0000;  // 0x30
      4'hf: seg = 7'b011_1000;  // 0x38
      default: 
            seg = 7'b111_1111;
    endcase
endmodule
