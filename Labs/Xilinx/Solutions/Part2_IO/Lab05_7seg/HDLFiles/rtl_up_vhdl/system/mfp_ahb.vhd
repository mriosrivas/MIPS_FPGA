-- mfp_ahb.vhd
-- Translated from mfp_ahb.v for MIPSfpga v2
-- 
-- 15 Jan 2017
--
-- AHB-lite bus module with 3 slaves: RAM1, RAM2,and
-- GPIO (memory-mapped I/O: switches and LEDs from the FPGA board).
-- The module includes an address decoder and multiplexer (for 
-- selecting which slave module produces HRDATA).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mipsfpga_const.all;


entity mfp_ahb is
        port (
            HCLK        : in    std_logic;
            HRESETn     : in    std_logic;
            HADDR       : in    std_logic_vector(31 downto 0);
            HBURST      : in    std_logic_vector(2 downto 0);
            HMASTLOCK   : in    std_logic;
            HPROT       : in    std_logic_vector(3 downto 0);
            HSIZE       : in    std_logic_vector(2 downto 0);
            HTRANS      : in    std_logic_vector(1 downto 0);
            HWDATA      : in    std_logic_vector(31 downto 0);
            HWRITE      : in    std_logic;
            HRDATA      : out   std_logic_vector(31 downto 0);
            HREADY      : out   std_logic;
            HRESP       : out   std_logic;
            SI_Endian   : in    std_logic;
            
            IO_Switch   : in    std_logic_vector(MFP_N_SW-1 downto 0);
            IO_PB       : in    std_logic_vector(MFP_N_PB-1 downto 0);
            IO_LED      : out   std_logic_vector(MFP_N_LED-1 downto 0);
            IO_7SEGEN_N     : out   std_logic_vector(7 downto 0);
            IO_7SEG_N       : out   std_logic_vector(6 downto 0)
        );
end mfp_ahb;



architecture rtl of mfp_ahb is


    ----------------------------------------------------------------------------
    -- component declarations
    ----------------------------------------------------------------------------
    component mfp_ahb_b_ram is
        port (
            HCLK        : in    std_logic;
            HRESETn     : in    std_logic;
            HADDR       : in    std_logic_vector(31 downto 0);
            HBURST      : in    std_logic_vector(2 downto 0);
            HMASTLOCK   : in    std_logic;
            HPROT       : in    std_logic_vector(3 downto 0);
            HSIZE       : in    std_logic_vector(2 downto 0);
            HTRANS      : in    std_logic_vector(1 downto 0);
            HWDATA      : in    std_logic_vector(31 downto 0);
            HWRITE      : in    std_logic;
            HSEL        : in    std_logic;
            HRDATA      : out   std_logic_vector(31 downto 0)
        );
    end component mfp_ahb_b_ram;
    
    
    component mfp_ahb_p_ram is
        port (
            HCLK        : in    std_logic;
            HRESETn     : in    std_logic;
            HADDR       : in    std_logic_vector(31 downto 0);
            HBURST      : in    std_logic_vector(2 downto 0);
            HMASTLOCK   : in    std_logic;
            HPROT       : in    std_logic_vector(3 downto 0);
            HSIZE       : in    std_logic_vector(2 downto 0);
            HTRANS      : in    std_logic_vector(1 downto 0);
            HWDATA      : in    std_logic_vector(31 downto 0);
            HWRITE      : in    std_logic;
            HSEL        : in    std_logic;
            HRDATA      : out   std_logic_vector(31 downto 0)
        );
    end component mfp_ahb_p_ram;
    
    
    component mipsfpga_ahb_gpio is
        port (
            HCLK        : in    std_logic;
            HRESETn     : in    std_logic;
            HADDR       : in    std_logic_vector(3 downto 0);
            HTRANS      : in    std_logic_vector(1 downto 0);
            HWDATA      : in    std_logic_vector(31 downto 0);
            HWRITE      : in    std_logic;
            HSEL        : in    std_logic;
            HRDATA      : out   std_logic_vector(31 downto 0);
            
            IO_Switch   : in    std_logic_vector(MFP_N_SW-1 downto 0);
            IO_PB       : in    std_logic_vector(MFP_N_PB-1 downto 0);
            IO_LED      : out   std_logic_vector(MFP_N_LED-1 downto 0);
            IO_7SEGEN_N     : out   std_logic_vector(7 downto 0);
            IO_7SEG_N       : out   std_logic_vector(6 downto 0)
        );
    end component mipsfpga_ahb_gpio;


    ----------------------------------------------------------------------------
    -- signal declarations
    ----------------------------------------------------------------------------
    signal HRDATA2, HRDATA1, HRDATA0 : std_logic_vector(31 downto 0);
    signal HSEL : std_logic_vector(2 downto 0);
    signal HSEL_d : std_logic_vector(2 downto 0);  -- HSEL delayed 1 cycle

begin

    HREADY <= '1';
    HRESP <= '0';

    mfp_ahb_b_ram_i : mfp_ahb_b_ram
        port map (
            HCLK        => HCLK,
            HRESETn     => HRESETn,
            HADDR       => HADDR,
            HBURST      => HBURST,
            HMASTLOCK   => HMASTLOCK,
            HPROT       => HPROT,
            HSIZE       => HSIZE,
            HTRANS      => HTRANS,
            HWDATA      => HWDATA,
            HWRITE      => HWRITE,
            HRDATA      => HRDATA0,
            HSEL        => HSEL(0)
        );
        
    mfp_ahb_p_ram_i : mfp_ahb_p_ram
            port map (
                HCLK        => HCLK,
                HRESETn     => HRESETn,
                HADDR       => HADDR,
                HBURST      => HBURST,
                HMASTLOCK   => HMASTLOCK,
                HPROT       => HPROT,
                HSIZE       => HSIZE,
                HTRANS      => HTRANS,
                HWDATA      => HWDATA,
                HWRITE      => HWRITE,
                HRDATA      => HRDATA1,
                HSEL        => HSEL(1)
            );
    
    i_ahb_gpio: mipsfpga_ahb_gpio
        port map (
            HCLK        => HCLK,
            HRESETn     => HRESETn,
            HADDR       => HADDR(5 downto 2),
            HTRANS      => HTRANS,
            HWDATA      => HWDATA,
            HWRITE      => HWRITE,
            HSEL        => HSEL(2),
            HRDATA      => HRDATA2,
            IO_Switch   => IO_Switch,
            IO_PB       => IO_PB,
            IO_LED      => IO_LED,
            IO_7SEGEN_N => IO_7SEGEN_N,
            IO_7SEG_N   => IO_7SEG_N
        );


    -- 128 KB RAM  at 0xbfc00000 (physical: 0x1fc00000)
    HSEL(0) <= '1' when (unsigned(HADDR(28 downto 22)) = H_RAM_RESET_ADDR_match) else '0';
    
    -- 256 KB RAM at 0x80000000 (physical: 0x00000000)
    HSEL(1) <= '1' when (HADDR(28) = H_RAM_ADDR_match) else '0';
    
     -- GPIO at 0xbf800000 (physical: 0x1f800000)
    HSEL(2) <= '1' when (unsigned(HADDR(28 downto 22)) = H_LED_ADDR_match) else '0';


    p_delay_hsel : process(HCLK)
    begin
        if rising_edge(HCLK) then
            HSEL_d <= HSEL;
        end if;
    end process p_delay_hsel;

    -- MAY BE SEMATIC DIFFERENCES BETWEEN THIS MUX AND THE MUX FROM THE ORIGINAL FILE!!
    --
    -- The original verilog implementation for this priority mux is as follows
    --
    --  casez (HSEL)
    --      3'b??1:    HRDATA = HRDATA0;
    --      3'b?10:    HRDATA = HRDATA1;
    --      3'b100:    HRDATA = HRDATA2;
    --      default:   HRDATA = HRDATA1;
    --  endcase
    --
    -- verilog's "casez" include Z values as dont care.
    HRDATA <=   HRDATA0 when HSEL_d(0) = '1' else
        HRDATA1 when HSEL_d(1 downto 0) = "10" else
        HRDATA2 when HSEL_d(2 downto 0) = "100" else
        HRDATA1;

end rtl;
