-- mipsfpga_const.vhd
-- 
-- 13 Jul 2016

-- Consts from m14k_config.vh and mipsfpga_ahb_consts.vh


library ieee;
use ieee.std_logic_1164.all;

package mipsfpga_const is

------------------------------------------------------------------------
-- (from m14k_config.vh)
------------------------------------------------------------------------
constant M14K_NUM_SCAN_CHAIN    : integer := 1;
constant M14K_TOP_BIST_IN       : integer := 1;
constant M14K_TOP_BIST_OUT      : integer := 1;

constant M14K_UDI_EXT_TOUDI_WIDTH   : integer := 128;
constant M14K_UDI_EXT_FROMUDI_WIDTH : integer := 128;

constant M14K_CP2_EXT_TOCP2_WIDTH   : integer := 1;
constant M14K_CP2_EXT_FROMCP2_WIDTH : integer := 1;

constant M14K_ISP_EXT_TOISP_WIDTH   : integer := 1;
constant M14K_ISP_EXT_FROMISP_WIDTH : integer := 1;

constant M14K_DSP_EXT_TODSP_WIDTH   : integer := 1;
constant M14K_DSP_EXT_FROMDSP_WIDTH : integer := 1;


------------------------------------------------------------------------
-- Physical bit-width of memory-mapped I/O interfaces
------------------------------------------------------------------------
constant MFP_N_LED    : integer := 16;
constant MFP_N_SW     : integer := 16;
constant MFP_N_PB     : integer := 5;


------------------------------------------------------------------------
-- Memory-mapped I/O addresses
-- (from mfp_ahb_consts.vh)
------------------------------------------------------------------------

constant H_LED_ADDR        : integer := 16#1f800000#;
constant H_SW_ADDR         : integer := 16#1f800004#;
constant H_PB_ADDR         : integer := 16#1f800008#;
constant H_7SEGEN_ADDR     : integer := 16#1f80000c#;
constant H_7SEGDIGITS_ADDR : integer := 16#1f800010#;

constant H_LED_IONUM        : integer := 16#0#;
constant H_SW_IONUM         : integer := 16#1#;
constant H_PB_IONUM         : integer := 16#2#;
constant H_7SEGEN_IONUM     : integer := 16#3#;
constant H_7SEGDIGITS_IONUM : integer := 16#4#;

------------------------------------------------------------------------
-- RAM addresses
-- (from mfp_ahb_consts.vh)
------------------------------------------------------------------------
constant H_RAM_RESET_ADDR_WIDTH     : integer := 8;
constant H_RAM_ADDR_WIDTH           : integer := 16;

constant H_RAM_RESET_ADDR_Match     : integer := 16#7f#;
constant H_RAM_ADDR_Match           : std_logic := '0';
constant H_LED_ADDR_Match           : integer := 16#7e#;


--------------------------------------------
-- AHB-Lite values used by MIPSfpga core
-- (from mfp_ahb_consts.vh)
---------------------------------------------
constant HTRANS_IDLE    : integer := 2#00#;
constant HTRANS_NONSEQ  : integer := 2#10#;
constant HTRANS_SEQ     : integer := 2#11#;

constant HBURST_SINGLE  : integer := 2#000#;
constant HBURST_WRAP4   : integer := 2#010#;

constant HSIZE_1        : integer := 2#000#;
constant HSIZE_2        : integer := 2#001#;
constant HSIZE_4        : integer := 2#010#;

end mipsfpga_const;
