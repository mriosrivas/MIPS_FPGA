-- mfp_ahb_sevensegdec.vhd
-- Translated from mfp_sevensegdec.v for MIPSfpga v2
-- 
-- 2 Apr 2017
--
-- Seven-segment display decoder

library ieee;
use ieee.std_logic_1164.all;
use work.mipsfpga_const.all;



entity mfp_ahb_sevensecdec is
    port (
        data        : in    std_logic_vector(3 downto 0);
        seg         : out   std_logic_vector(6 downto 0)
    );
end mfp_ahb_sevensecdec;


architecture rtl of mfp_ahb_sevensecdec is
begin

 -- add code here

end rtl;
