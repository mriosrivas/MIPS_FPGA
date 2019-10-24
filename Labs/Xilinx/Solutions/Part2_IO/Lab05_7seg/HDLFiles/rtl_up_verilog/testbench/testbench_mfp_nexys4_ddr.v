// testbench.v
// 3 March 2017
//
// Drive the mipsfpga_sys module for simulation testing

`timescale 100ps/1ps

`include "mfp_ahb_const.vh"

module testbench_mfp_nexys4_ddr;

    reg                    SI_Reset_N, SI_ClkIn;
    reg                    EJ_TRST_N_probe, EJ_TDI; 
    wire                   EJ_TDO;
    reg                    SI_ColdReset_N;
    reg                    EJ_TMS, EJ_TCK, EJ_DINT;
    wire [`MFP_N_SW-1  :0] IO_Switch;
    wire [          4  :0] IO_PB;
    wire [`MFP_N_LED-1 :0] IO_LED;
    wire [ 7           :0] IO_7SEGEN_N;
    wire [ 6           :0] IO_7SEG_N; 

    reg                    UART_RX;

    wire [8            :1] JB;
    
    assign JB = {SI_ColdReset_N, EJ_TRST_N_probe, 1'b0, 1'b0, EJ_TCK, EJ_TDO, EJ_TDI, EJ_TMS};

  mfp_nexys4_ddr dut( 
    .CLK100MHZ(SI_ClkIn),
    .CPU_RESETN(SI_Reset_N),
    .BTNU(IO_PB[4]),
    .BTND(IO_PB[3]), 
    .BTNL(IO_PB[2]), 
    .BTNC(IO_PB[1]), 
    .BTNR(IO_PB[0]), 
    .SW(IO_Switch),
    .LED(IO_LED),
    .JB(JB),  
    .AN(IO_7SEGEN_N),
    .CA(IO_7SEG_N[6]),
    .CB(IO_7SEG_N[5]),
    .CC(IO_7SEG_N[4]),
    .CD(IO_7SEG_N[3]),
    .CE(IO_7SEG_N[2]),
    .CF(IO_7SEG_N[1]),
    .CG(IO_7SEG_N[0]),
    .UART_TXD_IN(UART_RX)
);

    initial
    begin
        SI_ClkIn = 0;
        EJ_TRST_N_probe = 0; EJ_TDI = 0; EJ_TMS = 0; EJ_TCK = 0; EJ_DINT = 0;
        UART_RX = 1;
        SI_ColdReset_N = 1;

        forever
            #50 SI_ClkIn = ~ SI_ClkIn;
    end

    initial
    begin
        SI_Reset_N  <= 0;
        repeat (100)  @(posedge SI_ClkIn);
        SI_Reset_N  <= 1;
        repeat (2000) @(posedge SI_ClkIn);
        $stop;
    end

    initial
    begin
        $dumpvars;
        $timeformat (-9, 1, "ns", 10);
    end
    
endmodule


