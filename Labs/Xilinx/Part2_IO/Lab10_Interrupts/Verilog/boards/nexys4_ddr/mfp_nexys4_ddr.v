// mfp_nexys4_ddr.v
// January 1, 2017
//
// Instantiate the mipsfpga system and rename signals to
// match GPIO, LEDs and switches on Digilent's (Xilinx)
// Nexys4 DDR board

// Digilent's (Xilinx) Nexys4-DDR board:
// Outputs:
// 16 LEDs (IO_LEDR[15:0]) 
// Inputs:
// 16 slide switches (IO_Switch[15:0]), 5
// 5 pushbutton switches (IO_PB): {BTNU, BTND, BTNL, BTNC, BTNR}
//
// Added: slow clock

// Configuration file for using slow clock
`include "mfp_config.vh"

module mfp_nexys4_ddr( 
                        input         CLK100MHZ,
                        input         CPU_RESETN,
                        input         BTNU, BTND, BTNL, BTNC, BTNR, 
                        input  [15:0] SW,
                        output [15:0] LED,
                        inout  [ 8:1] JB,
                        input         UART_TXD_IN);

  // Press btnCpuReset to reset the processor. 
        
  wire clk; 
  wire tck_in, tck;
  
  IBUF IBUF1(.O(tck_in),.I(JB[4]));
  BUFG BUFG1(.O(tck), .I(tck_in));
  
  `ifdef MFP_USE_SLOW_CLOCK

  wire       muxed_clk;
  wire [1:0] sw_db;

  mfp_multi_switch_or_button_sync_and_debouncer
  # (.WIDTH (2))
  mfp_multi_switch_or_button_sync_and_debouncer
  (   
        .clk    ( CLK100MHZ ),
        .sw_in  ( SW [1:0]  ),
        .sw_out ( sw_db     )
  );

  mfp_clock_divider_100_MHz_to_25_MHz_12_Hz_0_75_Hz 
  mfp_clock_divider_100_MHz_to_25_MHz_12_Hz_0_75_Hz
  (
        .clki    ( CLK100MHZ ),
        .sel_lo  ( sw_db [0] ),
        .sel_mid ( sw_db [1] ),
        .clko    ( muxed_clk )
  );

  BUFG BUFG_slow_clk (.O ( clk ), .I ( muxed_clk ));

  `else

  clk_wiz_0 clk_wiz_0 (.clk_in1 (CLK100MHZ), .clk_out1 (clk));

  `endif
  
  mfp_sys mfp_sys(
			        .SI_Reset_N(CPU_RESETN),
                    .SI_ClkIn(clk),
                    .HADDR(),
                    .HRDATA(),
                    .HWDATA(),
                    .HWRITE(),
                    .HSIZE(),
                    .EJ_TRST_N_probe(JB[7]),
                    .EJ_TDI(JB[2]),
                    .EJ_TDO(JB[3]),
                    .EJ_TMS(JB[1]),
                    .EJ_TCK(tck),
                    .SI_ColdReset_N(JB[8]),
                    .EJ_DINT(1'b0),
                    .IO_Switch({2'b0,SW}),
                    .IO_PB({BTNU, BTND, BTNL, BTNC, BTNR}),
                    .IO_LED(LED),
                    .UART_RX(UART_TXD_IN));
          
endmodule
