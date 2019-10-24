-- mvp Version 2.24
-- cmd line +define: MIPS_SIMULATION
-- cmd line +define: MIPS_VMC_DUAL_INST
-- cmd line +define: MIPS_VMC_INST
-- cmd line +define: M14K_NO_ERROR_GEN
-- cmd line +define: M14K_NO_SHADOW_CACHE_CHECK
-- cmd line +define: M14K_TRACER_NO_FDCTRACE
--
--	Description: m14k_udi_seq
--             UDI based implementation of seq instruction
--



--	mips_start_of_legal_notice
--	***************************************************************************
--	Unpublished work (c) MIPS Technologies, Inc.  All rights reserved. 
--	Unpublished rights reserved under the copyright laws of the United States
--	of America and other countries.
--	
--	MIPS TECHNOLOGIES PROPRIETARY / RESTRICTED CONFIDENTIAL - HEIGHTENED
--	STANDARD OF CARE REQUIRED AS PER CONTRACT
--
--	This code is confidential and proprietary to MIPS Technologies, Inc. ("MIPS
--	Technologies") and may be disclosed only as permitted in writing by MIPS
--	Technologies.  Any copying, reproducing, modifying, use or disclosure of
--	this code (in whole or in part) that is not expressly permitted in writing
--	by MIPS Technologies is strictly prohibited.  At a minimum, this code is
--	protected under trade secret, unfair competition and copyright laws. 
--	Violations thereof may result in criminal penalties and fines.
--	
--	MIPS Technologies reserves the right to change the code to improve
--	function, design or otherwise.	MIPS Technologies does not assume any
--	liability arising out of the application or use of this code, or of any
--	error or omission in such code.  Any warranties, whether express,
--	statutory, implied or otherwise, including but not limited to the implied
--	warranties of merchantability or fitness for a particular purpose, are
--	excluded.  Except as expressly provided in any written license agreement
--	from MIPS Technologies, the furnishing of this code does not give recipient
--	any license to any intellectual property rights, including any patent
--	rights, that cover this code.
--	
--	This code shall not be exported, reexported, transferred, or released,
--	directly or indirectly, in violation of the law of any country or
--	international law, regulation, treaty, Executive Order, statute, amendments
--	or supplements thereto.  Should a conflict arise regarding the export,
--	reexport, transfer, or release of this code, the laws of the United States
--	of America shall be the governing law.
--	
--	This code may only be disclosed to the United States government
--	("Government"), or to Government users, with prior written consent from
--	MIPS Technologies.  This code constitutes one or more of the following:
--	commercial computer software, commercial computer software documentation or
--	other commercial items.  If the user of this code, or any related
--	documentation of any kind, including related technical data or manuals, is
--	an agency, department, or other entity of the Government, the use,
--	duplication, reproduction, release, modification, disclosure, or transfer
--	of this code, or any related documentation of any kind, is restricted in
--	accordance with Federal Acquisition Regulation 12.212 for civilian agencies
--	and Defense Federal Acquisition Regulation Supplement 227.7202 for military
--	agencies.  The use of this code by the Government is further restricted in
--	accordance with the terms of the license agreement(s) and/or applicable
--	contract terms and conditions covering this code from MIPS Technologies.
--	
--	
--	
--	***************************************************************************
--	mips_end_of_legal_notice

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mipsfpga_const.all;


entity m14k_udi_seleqz_nand_seq is 
    port (
        UDI_ir_e        : in  std_logic_vector(31 downto 0);
        UDI_irvalid_e   : in  std_logic;
        UDI_rs_e        : in  std_logic_vector(31 downto 0);
        UDI_rt_e        : in  std_logic_vector(31 downto 0);
        UDI_endianb_e   : in  std_logic;
        UDI_kd_mode_e   : in  std_logic;
        UDI_kill_m      : in  std_logic;
        UDI_start_e     : in  std_logic;
        UDI_run_m       : in  std_logic;
        UDI_greset      : in  std_logic;
        UDI_gclk        : in  std_logic;
        UDI_gscanenable : in  std_logic;
        UDI_rd_m        : out std_logic_vector(31 downto 0);
        UDI_wrreg_e     : out std_logic_vector(4 downto 0);
        UDI_ri_e        : out std_logic;
        UDI_stall_m     : out std_logic;
        UDI_present     : out std_logic;
        UDI_honor_cee   : out std_logic;
        UDI_toudi       : in  std_logic_vector(M14K_UDI_EXT_TOUDI_WIDTH-1 downto 0);
        UDI_fromudi     : out std_logic_vector(M14K_UDI_EXT_FROMUDI_WIDTH-1 downto 0)
    );
end m14k_udi_seq;



architecture rtl of m14k_udi_seq is


    ----------------------------------------------------------------------------
    -- component declarations
    ----------------------------------------------------------------------------
    component mvp_cregister_wide is
        generic (
            WIDTH : natural := 1
        );
        port (
            q           : out  std_logic_vector(WIDTH-1 downto 0);
            scanenable  : in  std_logic;
            cond        : in  std_logic;
            clk         : in  std_logic;
            d           : in std_logic_vector(WIDTH-1 downto 0)
        );
    end component mvp_cregister_wide;
    
    
    signal result_en : std_logic;
    signal seleqz_valid : std_logic;
    signal nand_valid : std_logic;
    signal seq_valid : std_logic;
    signal udi_instr_valid : std_logic;

    signal udi_res_e : std_logic_vector(31 downto 0);
    signal udi_res_seleqz_e : std_logic_vector(31 downto 0);
    signal udi_res_nand_e : std_logic_vector(31 downto 0);
    signal udi_res_seq_e : std_logic_vector(31 downto 0);

begin

    
    i_result: mvp_cregister_wide
        generic map (
            WIDTH => 32
        )
        port map (
            q           => UDI_rd_m(31 downto 0),
            scanenable  => UDI_gscanenable,
            cond        => udi_instr_valid, 
            clk         => UDI_gclk,
            d           => udi_res_e(31 downto 0)
        );


    seleqz_valid <= '1' when (to_integer(unsigned(UDI_ir_e(31 downto 26))) = 8#34#) and 
            (to_integer(unsigned(UDI_ir_e(5 downto 0))) = 8#20#) else '0';
            
    nand_valid <= '1' when (to_integer(unsigned(UDI_ir_e(31 downto 26))) = 8#34#) and 
            (to_integer(unsigned(UDI_ir_e(5 downto 0))) = 8#21#) else '0';
    
    seq_valid <= '1' when (to_integer(unsigned(UDI_ir_e(31 downto 26))) = 8#34#) and 
            (to_integer(unsigned(UDI_ir_e(5 downto 0))) = 8#22#) else '0';
    
    udi_instr_valid <= (UDI_irvalid_e and (seleqz_valid or nand_valid or seq_valid));


    -- SELEQZ computation
    udi_res_seleqz_e <= UDI_rs_e when (to_integer(unsigned(UDI_rt_e)) = 0) else 
                        (others => '0');

    -- NAND computation
    udi_res_nand_e <=  not (UDI_rs_e and UDI_rt_e);

    -- SEQ computation
    udi_res_seq_e <= (others => '1') when (UDI_rs_e = UDI_rt_e) else 
                  (others => '0');


    -- select the result from the valid instruction
    udi_res_e <= udi_res_nand_e when nand_valid = '1' else
                 udi_res_seleqz_e when seleqz_valid = '1' else
                 udi_res_seq_e;

    -- Destination register for the UDI instruction
    UDI_wrreg_e <= UDI_ir_e(15 downto 11);

    -- illegal UDI instruction
    UDI_ri_e <= not udi_instr_valid;

    UDI_fromudi <= (others => '0');
    UDI_stall_m <= '0';
    UDI_present <= '1';
    UDI_honor_cee <= '0';

end rtl;
