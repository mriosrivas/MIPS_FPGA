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


    ----------------------------------------------------------------------------
    -- component declarations
    ----------------------------------------------------------------------------
    component mfp_ahb_sevensecdec is
        port (
            data        : in    std_logic_vector(3 downto 0);
            seg         : out   std_logic_vector(6 downto 0)
        );
    end component mfp_ahb_sevensecdec;
    

    ----------------------------------------------------------------------------
    -- signal declarations
    ----------------------------------------------------------------------------
    signal numout : std_logic_vector(3 downto 0);
    signal cnt16 : std_logic_vector(15 downto 0);
    signal cntSel : std_logic_vector(2 downto 0);
    signal cnt16_high : std_logic;
    
    signal en0, en1, en2, en3, en4, en5, en6, en7 : std_logic_vector(7 downto 0);

begin

    i_sevensecdec: mfp_ahb_sevensecdec
        port map (
            data        => numout,
            seg         => DISPOUT
        );

    p_counter16 : process(clk, resetn) 
    begin
        if (resetn = '0') then
            cnt16 <= (others => '0');
        elsif rising_edge(clk) then
            cnt16 <= std_logic_vector(unsigned(cnt16) + 1);
        end if;
    end process;

    cnt16_high <= cnt16(15);

    p_counterSel : process(cnt16_high, resetn) 
    begin
        if (resetn = '0') then
            cntSel <= (others => '0');
        elsif rising_edge(cnt16_high) then
            cntSel <= std_logic_vector(unsigned(cntSel) + 1);
        end if;
    end process;

    en0 <= EN or X"fe";
    en1 <= EN or X"fd";
    en2 <= EN or X"fb";
    en3 <= EN or X"f7";
    en4 <= EN or X"ef";
    en5 <= EN or X"df";
    en6 <= EN or X"bf";
    en7 <= EN or X"7f";

    -- 7 segment enable mux
    with cntSel select DISPENOUT <=
                en0 when "000",
                en1 when "001",
                en2 when "010",
                en3 when "011",
                en4 when "100",
                en5 when "101",
                en6 when "110",
                en7 when "111",
                en0 when others;
       
    -- 7 segment digits mux
    with cntSel select numout <=
                DIGITS(3 downto 0)   when "000",
                DIGITS(7 downto 4)   when "001",
                DIGITS(11 downto 8)  when "010",
                DIGITS(15 downto 12) when "011",
                DIGITS(19 downto 16) when "100",
                DIGITS(23 downto 20) when "101",
                DIGITS(27 downto 24) when "110",
                DIGITS(31 downto 28) when "111",
                DIGITS(3 downto 0)   when others;

end rtl;
