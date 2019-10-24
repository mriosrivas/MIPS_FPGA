-- mfp_ahb_sevensegtimer.vhd
-- Translated from mfp_ahb_sevensegtimer.v for MIPSfpga v2
-- 
-- 2 Apr 2017
--
-- Seven-segment display timer for the Nexys4-DDR board

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mipsfpga_const.all;


entity mfp_ahb_sevensegtimer is
    port (
        clk         : in    std_logic;
        resetn      : in    std_logic;
        EN          : in    std_logic_vector(7 downto 0);
        DIGITS      : in    std_logic_vector(31 downto 0);
        DISPENOUT   : out   std_logic_vector(7 downto 0);
        DISPOUT     : out   std_logic_vector(6 downto 0)
    );
end mfp_ahb_sevensegtimer;


architecture rtl of mfp_ahb_sevensegtimer is

begin

-- add code here

end rtl;
