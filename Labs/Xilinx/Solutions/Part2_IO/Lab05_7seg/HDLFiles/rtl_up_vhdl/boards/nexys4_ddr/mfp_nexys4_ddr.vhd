-- mfp_nexys4_ddr.vhd
-- Translated from mfp_nexys4_ddr.v for MIPSfpga v2
-- 
-- 15 Jan 2017


-- Instantiate the mipsfpga system and rename signals to
-- match GPIO, LEDs and switches on Digilent's (Xilinx)
-- Nexys4-DDR board

-- Digilent's (Xilinx) Nexys4-DDR board:
-- Outputs:
-- 16 LEDs (IO_LEDR[15:0]) 
-- Inputs:
-- 16 slide switches (IO_Switch[15:0]), 5
-- 5 Pushbuttons (IO_PB): {BTNU, BTND, BTNL, BTNC, BTNR}

library ieee;
use ieee.std_logic_1164.all;
use work.mipsfpga_const.all;


entity mfp_nexys4_ddr is 
    port (
        CLK100MHZ   : in    std_logic;
        CPU_RESETN  : in    std_logic;
        BTNU        : in    std_logic;  -- button up
        BTND        : in    std_logic;  -- button down
        BTNL        : in    std_logic;  -- button left
        BTNC        : in    std_logic;  -- button center
        BTNR        : in    std_logic;  -- button right
        SW          : in    std_logic_vector(MFP_N_SW-1 downto 0);
        LED         : out   std_logic_vector(MFP_N_LED-1 downto 0);
        JB          : inout std_logic_vector(8 downto 1);
        AN          : out   std_logic_vector(7 downto 0);
        CA          : out   std_logic;  -- 7 seg display segment A
        CB          : out   std_logic;  -- 7 seg display segment B
        CC          : out   std_logic;  -- 7 seg display segment C
        CD          : out   std_logic;  -- 7 seg display segment D
        CE          : out   std_logic;  -- 7 seg display segment E
        CF          : out   std_logic;  -- 7 seg display segment F
        CG          : out   std_logic;  -- 7 seg display segment G
        UART_TXD_IN : in    std_logic  -- UART input
    );
end mfp_nexys4_ddr;




architecture rtl of mfp_nexys4_ddr is

    ----------------------------------------------------------------------------
    -- component declarations
    ----------------------------------------------------------------------------
    component mfp_sys is
        port (
            SI_reset_N      : in    std_logic;
            SI_ClkIn        : in    std_logic;
            HADDR           : out   std_logic_vector(31 downto 0);
            HRDATA          : out   std_logic_vector(31 downto 0);
            HWDATA          : out   std_logic_vector(31 downto 0);
            HWRITE          : out   std_logic;
            HSIZE           : out   std_logic_vector(2 downto 0);
            EJ_TRST_N_probe : in    std_logic;
            EJ_TDI          : in    std_logic;
            EJ_TDO          : out   std_logic;
            EJ_TMS          : in    std_logic;
            EJ_TCK          : in    std_logic;
            SI_ColdReset_N  : in    std_logic;
            EJ_DINT         : in    std_logic;
            IO_Switch       : in    std_logic_vector(MFP_N_SW-1 downto 0);
            IO_PB           : in    std_logic_vector(MFP_N_PB-1 downto 0);
            IO_LED          : out   std_logic_vector(MFP_N_LED-1 downto 0);
            IO_7SEGEN_N     : out   std_logic_vector(7 downto 0);
            IO_7SEG_N       : out   std_logic_vector(6 downto 0);
            UART_RX         : in    std_logic
        );
    end component mfp_sys;

    component clk_wiz_0 is
        port (
            clk_in1     : in    std_logic;
            clk_out1    : out   std_logic
        );
    end component clk_wiz_0;

    component IBUF is
        port (
            I   : in    std_logic;
            O   : out   std_logic
        );
    end component IBUF;

    component BUFG is
        port (
            I   : in    std_logic;
            O   : out   std_logic
        );
    end component BUFG;


    ----------------------------------------------------------------------------
    -- signal declarations
    ----------------------------------------------------------------------------
    signal clk_out  : std_logic;
    signal tck_in   : std_logic;
    signal tck      : std_logic;
    --signal IO_LED_internal : std_logic_vector(MFP_N_LED-1 downto 0);
    signal IO_PB_internal : std_logic_vector(MFP_N_PB-1 downto 0);
    signal IO_7SEGEN_N_internal : std_logic_vector(7 downto 0);
    signal IO_7SEG_N_internal : std_logic_vector(6 downto 0);

    -- tck_in (jtag clock) is referenced in the constraint file. 
    -- This lines are to prevent xst from renaming it
    attribute keep : string;
    attribute keep of tck_in : signal is "true";

begin

    -- clock signals need to pass through IBUF and BUFG. The systhesis tool usually
    -- add them by itself, but it can get confused in non trivial clocks.
    IBUF_i: IBUF port map (I => JB(4), O => tck_in);
    BUFG_i: BUFG port map (I => tck_in, O => tck);

    -- Master clock's PLL
    clk_wiz_0_i: clk_wiz_0 port map (clk_in1 => CLK100MHZ, clk_out1 => clk_out);
  
    -- JB(6) and JB(5) are keept unconnected
    
    -- mipsfpga_sys input mapping
    IO_PB_internal <= (BTNU, BTND, BTNL, BTNC, BTNR);
    
    mfp_sys_i: mfp_sys
        port map (
            SI_reset_N      => CPU_RESETN,
            SI_ClkIn        => clk_out,
            HADDR           => open,
            HRDATA          => open,
            HWDATA          => open,
            HWRITE          => open,
            HSIZE           => open,
            EJ_TRST_N_probe => JB(7),
            EJ_TDI          => JB(2),
            EJ_TDO          => JB(3),
            EJ_TMS          => JB(1),
            EJ_TCK          => tck,
            SI_ColdReset_N  => JB(8),
            EJ_DINT         => '0',
            IO_Switch       => SW,
            IO_PB           => IO_PB_internal,
            IO_LED          => LED,
            IO_7SEGEN_N     => AN,
            IO_7SEG_N       => IO_7SEG_N_internal,
            UART_RX         => UART_TXD_IN

        );
        
    -- mipsfpga output mapping
    (CA, CB, CC, CD, CE, CF, CG) <= IO_7SEG_N_internal;

end rtl;
