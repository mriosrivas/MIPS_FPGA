//
//	wsram_2k2way_xilinx : Cilinx WS-RAM for 2k per way - 4 way
//
//	$Id: \$
//	mips_repository_id: d_wsram_2k4way_xilinx.v, v 3.4 
//


//	mips_start_of_legal_notice
//	***************************************************************************
//	Unpublished work (c) MIPS Technologies, Inc.  All rights reserved. 
//	Unpublished rights reserved under the copyright laws of the United States
//	of America and other countries.
//	
//	MIPS TECHNOLOGIES PROPRIETARY / RESTRICTED CONFIDENTIAL - HEIGHTENED
//	STANDARD OF CARE REQUIRED AS PER CONTRACT
//	
//	This code is confidential and proprietary to MIPS Technologies, Inc. ("MIPS
//	Technologies") and may be disclosed only as permitted in writing by MIPS
//	Technologies.  Any copying, reproducing, modifying, use or disclosure of
//	this code (in whole or in part) that is not expressly permitted in writing
//	by MIPS Technologies is strictly prohibited.  At a minimum, this code is
//	protected under trade secret, unfair competition and copyright laws. 
//	Violations thereof may result in criminal penalties and fines.
//	
//	MIPS Technologies reserves the right to change the code to improve
//	function, design or otherwise.	MIPS Technologies does not assume any
//	liability arising out of the application or use of this code, or of any
//	error or omission in such code.  Any warranties, whether express,
//	statutory, implied or otherwise, including but not limited to the implied
//	warranties of merchantability or fitness for a particular purpose, are
//	excluded.  Except as expressly provided in any written license agreement
//	from MIPS Technologies, the furnishing of this code does not give recipient
//	any license to any intellectual property rights, including any patent
//	rights, that cover this code.
//	
//	This code shall not be exported, reexported, transferred, or released,
//	directly or indirectly, in violation of the law of any country or
//	international law, regulation, treaty, Executive Order, statute, amendments
//	or supplements thereto.  Should a conflict arise regarding the export,
//	reexport, transfer, or release of this code, the laws of the United States
//	of America shall be the governing law.
//	
//	This code may only be disclosed to the United States government
//	("Government"), or to Government users, with prior written consent from
//	MIPS Technologies.  This code constitutes one or more of the following:
//	commercial computer software, commercial computer software documentation or
//	other commercial items.  If the user of this code, or any related
//	documentation of any kind, including related technical data or manuals, is
//	an agency, department, or other entity of the Government, the use,
//	duplication, reproduction, release, modification, disclosure, or transfer
//	of this code, or any related documentation of any kind, is restricted in
//	accordance with Federal Acquisition Regulation 12.212 for civilian agencies
//	and Defense Federal Acquisition Regulation Supplement 227.7202 for military
//	agencies.  The use of this code by the Government is further restricted in
//	accordance with the terms of the license agreement(s) and/or applicable
//	contract terms and conditions covering this code from MIPS Technologies.
//	
//	
//	
//	***************************************************************************
//	mips_end_of_legal_notice
//	

`include "m14k_const.vh"
module d_wsram_4k3way_xilinx(
	clk,
	line_idx,
	rd_str,
	wr_str,
	early_ce, 
	greset,
	wr_mask,
	wr_data,
	rd_data,
	bist_to,
	bist_from);


	/* Inputs */
	input		clk;		// Clock
	input [7:0]	line_idx;	// Read Array Index
	input		rd_str;		// Read Strobe
	input		wr_str;		// Write Strobe
	input		early_ce;
	input		greset;	
	input [5:0]	wr_mask;	// Write Mask
	input [5:0]	wr_data;	// Data for Tag Write
	input [0:0]	bist_to;

	/* Outputs */
	output [5:0]	rd_data;		// output from read
	output [0:0]	bist_from;


   	wire [11:0] ws_rd_data;
 	wire	en;
	
	assign bist_from[0] = 1'b0;
	assign	rd_data[5:0] = ws_rd_data[5:0];

`ifdef M14K_EARLY_RAM_CE
	assign  en = early_ce;
`else
	assign	en = (wr_str || rd_str);
`endif


	// Need to create a 128 X 10 bit writeable array
	// All xilinx block rams are 4kbit, so this is a huge waste of ram space
        // 3 lru bits
	RAMB4K_S2 d_wsram___inst0 (
		.WE	(wr_str && wr_mask[0]),
		.EN	(en),
		.RST	(1'b0),
		.CLK	(clk),
		.ADDR	({3'b0,line_idx}),
		.DI	({1'b0,wr_data[0]}),
		.DO	({ws_rd_data[6],ws_rd_data[0]})
		);

	RAMB4K_S2 d_wsram___inst1 (
		.WE	(wr_str && wr_mask[1]),
		.EN	(en),
		.RST	(1'b0),
		.CLK	(clk),
		.ADDR	({3'b0,line_idx}),
		.DI	({1'b0,wr_data[1]}),
		.DO	({ws_rd_data[7],ws_rd_data[1]})
		);

	RAMB4K_S2 d_wsram___inst2 (
		.WE	(wr_str && wr_mask[2]),
		.EN	(en),
		.RST	(1'b0),
		.CLK	(clk),
		.ADDR	({3'b0,line_idx}),
		.DI	({1'b0,wr_data[2]}),
		.DO	({ws_rd_data[8],ws_rd_data[2]})
		);
        
        // 3 dirty bits
	RAMB4K_S2 d_wsram___inst3 (
		.WE	(wr_str && wr_mask[3]),
		.EN	(en),
		.RST	(1'b0),
		.CLK	(clk),
		.ADDR	({3'b0,line_idx}),
		.DI	({1'b0,wr_data[3]}),
		.DO	({ws_rd_data[9],ws_rd_data[3]})
		);

	RAMB4K_S2 d_wsram___inst4 (
		.WE	(wr_str && wr_mask[4]),
		.EN	(en),
		.RST	(1'b0),
		.CLK	(clk),
		.ADDR	({3'b0,line_idx}),
		.DI	({1'b0,wr_data[4]}),
		.DO	({ws_rd_data[10],ws_rd_data[4]})
		);

	RAMB4K_S2 d_wsram___inst5 (
		.WE	(wr_str && wr_mask[5]),
		.EN	(en),
		.RST	(1'b0),
		.CLK	(clk),
		.ADDR	({3'b0,line_idx}),
		.DI	({1'b0,wr_data[5]}),
		.DO	({ws_rd_data[11],ws_rd_data[5]})
		);
	
endmodule

