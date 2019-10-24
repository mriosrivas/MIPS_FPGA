-- mfp_ahb_withloader.vhd
-- Translated from mfp_ahb_withloader.v for MIPSfpga v2
-- 
-- 15 Jan 2017

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.mipsfpga_const.all;

entity mfp_ahb_withloader is
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
    
        -- memory-mapped I/O
        IO_Switch   : in    std_logic_vector(MFP_N_SW-1 downto 0);
        IO_PB       : in    std_logic_vector(MFP_N_PB-1 downto 0);
        IO_LED      : out   std_logic_vector(MFP_N_LED-1 downto 0);
        IO_7SEGEN_N     : out   std_logic_vector(7 downto 0);
        IO_7SEG_N       : out   std_logic_vector(6 downto 0);
    
        -- for serial loading of memory using uart
        UART_RX     : in    std_logic;
    
        -- reset system due to serial load
        MFP_Reset_serialload : out  std_logic
    );
end mfp_ahb_withloader;
    
    
    
    
architecture rtl of mfp_ahb_withloader is

    --------------------------------------------------------------------
    -- component declarations
    --------------------------------------------------------------------
    component mfp_uart_receiver is
        port (
            clock      : in     std_logic;
            reset_n    : in     std_Logic;
            rx         : in     std_logic;
            byte_data  : out    std_logic_vector(7 downto 0);
            byte_ready : out    std_logic
        );
    end component mfp_uart_receiver;


    component mfp_srec_parser is
        port (
            clock           : in    std_logic;
            reset_n         : in    std_logic;
            char_data       : in    std_logic_vector(7 downto 0);
            char_ready      : in    std_logic;
            in_progress     : out   std_logic;
            format_error    : out   std_logic;
            checksum_error  : out   std_logic;
            error_location  : out   std_logic_vector(7 downto 0);
            write_address   : out   std_logic_vector(31 downto 0);
            write_byte      : out   std_logic_vector(7 downto 0);
            write_enable    : out   std_logic
        );
    end component mfp_srec_parser;


    component mfp_srec_parser_to_ahb_lite_bridge is
        port (
            clock           : in    std_logic;
            reset_n         : in    std_logic;
            big_endian      : in    std_logic;
            write_address   : in    std_logic_vector(31 downto 0);
            write_byte      : in    std_logic_vector(7 downto 0);
            write_enable    : in    std_logic;
            HADDR           : out   std_logic_vector(31 downto 0);
            HBURST          : out   std_Logic_vector(2 downto 0);
            HMASTLOCK       : out   std_logic;
            HPROT           : out   std_logic_vector(3 downto 0);
            HSIZE           : out   std_logic_vector(2 downto 0);
            HTRANS          : out   std_logic_vector(1 downto 0);
            HWDATA          : out   std_logic_vector(31 downto 0);
            HWRITE          : out   std_logic
        );
    end component mfp_srec_parser_to_ahb_lite_bridge;


    component mfp_ahb is
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
        
        -- memory-mapped I/O
            IO_Switch   : in    std_logic_vector(MFP_N_SW-1 downto 0);
            IO_PB       : in    std_logic_vector(MFP_N_PB-1 downto 0);
            IO_LED      : out   std_logic_vector(MFP_N_LED-1 downto 0);
            IO_7SEGEN_N     : out   std_logic_vector(7 downto 0);
            IO_7SEG_N       : out   std_logic_vector(6 downto 0)
        );
    end component mfp_ahb;


    --------------------------------------------------------------------
    -- signal declarations
    --------------------------------------------------------------------
    signal char_data : std_logic_vector(7 downto 0);
    signal char_ready : std_logic;
    
    -- srec parser signals
    signal in_progress : std_logic;
    signal format_error : std_logic;
    signal checksum_error : std_logic;
    signal error_location : std_logic_vector(7 downto 0);
    signal write_address : std_logic_vector(31 downto 0);
    signal write_byte : std_logic_vector(7 downto 0);
    signal write_enable : std_logic;

    -- srec parser to ahb lite bridge signals
    signal loader_HADDR : std_logic_vector(31 downto 0);
    signal loader_HBURST : std_logic_vector(2 downto 0);
    signal loader_HMASTLOCK : std_logic;
    signal loader_HPROT : std_logic_vector(3 downto 0);
    signal loader_HSIZE : std_logic_vector(2 downto 0);
    signal loader_HTRANS : std_logic_vector(1 downto 0);
    signal loader_HWDATA : std_logic_vector(31 downto 0);
    signal loader_HWRITE : std_logic;

    signal ahb_HADDR : std_logic_vector(31 downto 0);
    signal ahb_HBURST : std_logic_vector(2 downto 0);
    signal ahb_HMASTLOCK : std_logic;
    signal ahb_HPROT : std_logic_vector(3 downto 0);
    signal ahb_HSIZE : std_logic_vector(2 downto 0);
    signal ahb_HTRANS : std_logic_vector(1 downto 0);
    signal ahb_HWDATA : std_logic_vector(31 downto 0);
    signal ahb_HWRITE : std_logic;

begin 

    mfp_uart_receiver_i : mfp_uart_receiver
        port map (
            clock       => HCLK,
            reset_n     => HRESETn,
            rx          => UART_RX,
            byte_data   => char_data,
            byte_ready  => char_ready
        );

    mfp_srec_parser_i : mfp_srec_parser
        port map (
            clock           => HCLK,
            reset_n         => HRESETn,
        
            char_data       => char_data,
            char_ready      => char_ready,
        
            in_progress     => in_progress,
            format_error    => format_error,
            checksum_error  => checksum_error,
            error_location  => error_location,
        
            write_address   => write_address,
            write_byte      => write_byte,
            write_enable    => write_enable
        );

    MFP_Reset_serialload <= in_progress;

    mfp_srec_parser_to_ahb_lite_bridge_i : mfp_srec_parser_to_ahb_lite_bridge
        port map (
            clock           => HCLK,
            reset_n         => HRESETn,
            big_endian      => SI_Endian,
                       
            write_address   => write_address,
            write_byte      => write_byte,
            write_enable    => write_enable,
                       
            HADDR           => loader_HADDR,
            HBURST          => loader_HBURST,
            HMASTLOCK       => loader_HMASTLOCK,
            HPROT           => loader_HPROT,
            HSIZE           => loader_HSIZE,
            HTRANS          => loader_HTRANS,
            HWDATA          => loader_HWDATA,
            HWRITE          => loader_HWRITE
        );

    ahb_HADDR       <= loader_HADDR when in_progress = '1' else HADDR;
    ahb_HBURST      <= loader_HBURST when in_progress = '1' else HBURST;
    ahb_HMASTLOCK   <= loader_HMASTLOCK when in_progress = '1' else HMASTLOCK;
    ahb_HPROT       <= loader_HPROT when in_progress = '1' else HPROT;
    ahb_HSIZE       <= loader_HSIZE when in_progress = '1' else HSIZE;
    ahb_HTRANS      <= loader_HTRANS when  in_progress = '1' else HTRANS;
    ahb_HWDATA      <= loader_HWDATA when in_progress = '1' else HWDATA;
    ahb_HWRITE      <= loader_HWRITE when in_progress = '1' else HWRITE;

    mfp_ahb_i : mfp_ahb
        port map (
            HCLK        => HCLK,
            HRESETn     => HRESETn,
            HADDR       => ahb_HADDR,
            HBURST      => ahb_HBURST,
            HMASTLOCK   => ahb_HMASTLOCK,
            HPROT       => ahb_HPROT,
            HSIZE       => ahb_HSIZE,
            HTRANS      => ahb_HTRANS,
            HWDATA      => ahb_HWDATA,
            HWRITE      => ahb_HWRITE,
            HRDATA      => HRDATA,
            HREADY      => HREADY,
            HRESP       => HRESP,
            SI_Endian   => SI_Endian,
        
        -- memory-mapped I/O
            IO_Switch   => IO_Switch,
            IO_PB       => IO_PB,
            IO_LED      => IO_LED,
            IO_7SEGEN_N => IO_7SEGEN_N,
            IO_7SEG_N   => IO_7SEG_N
        );

end rtl;
