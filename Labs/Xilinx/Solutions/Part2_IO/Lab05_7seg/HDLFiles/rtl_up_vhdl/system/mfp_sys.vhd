-- mfp_sys.vhd
-- Translated from mfp_sys.v for MIPSfpga v2
-- 
-- 15 Jan 2017
--
-- This module is an add-on to the MIPS core, m14k_top. It instantiates 
-- the MIPS core (m14k_top) and an AHB module of memories and I/Os on 
-- the AHB-Lite bus. It also taps out the interface signals and 
-- initializes signals required by the core.

library ieee;
use ieee.std_logic_1164.all;
use work.mipsfpga_const.all;


entity mfp_sys is 
    port (
        SI_Reset_N      : in    std_logic;
        SI_ClkIn        : in    std_logic;
        SI_ColdReset_N  : in    std_logic;
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
        EJ_DINT         : in    std_logic;
        IO_Switch       : in    std_logic_vector(MFP_N_SW-1 downto 0);
        IO_PB           : in    std_logic_vector(MFP_N_PB-1 downto 0);
        IO_LED          : out   std_logic_vector(MFP_N_LED-1 downto 0);
        IO_7SEGEN_N     : out   std_logic_vector(7 downto 0);
        IO_7SEG_N       : out   std_logic_vector(6 downto 0);
        UART_RX         : in    std_logic
    );
end mfp_sys;



architecture rtl of mfp_sys is

    --------------------------------------------------------------------
    -- component declarations
    --------------------------------------------------------------------
    component m14k_top is 
        port (
            HRDATA          : in    std_logic_vector(31 downto 0);
            HREADY          : in    std_logic;
            HRESP           : in    std_logic;  
            SI_AHBStb       : in    std_logic;
            HCLK            : out   std_logic;
            HRESETn         : out   std_logic;
            HADDR           : out   std_logic_vector(31 downto 0);
            HBURST          : out   std_logic_vector(2 downto 0);
            HPROT           : out   std_logic_vector(3 downto 0);
            HMASTLOCK       : out   std_logic;
            HSIZE           : out   std_logic_vector(2 downto 0);
            HTRANS          : out   std_logic_vector(1 downto 0);
            HWRITE          : out   std_logic;
            HWDATA          : out   std_logic_vector(31 downto 0);
            SI_ClkIn        : in    std_logic;
            SI_ColdReset    : in    std_logic;
            SI_Endian       : in    std_logic;
            SI_Int          : in    std_logic_vector(7 downto 0);
            SI_NMI          : in    std_logic;
            SI_Reset        : in    std_logic;
            SI_MergeMode    : in    std_logic_vector(1 downto 0);
            SI_CPUNum       : in    std_logic_vector(9 downto 0);
            SI_IPTI         : in    std_logic_vector(2 downto 0);
            SI_EICPresent   : in    std_logic;
            SI_EICVector    : in    std_logic_vector(5 downto 0);
            SI_Offset       : in    std_logic_vector(17 downto 1);
            SI_EISS         : in    std_logic_vector(3 downto 0);
            SI_BootExcISAMode   : in    std_logic;
            SI_SRSDisable       : in    std_logic_vector(3 downto 0);
            SI_TraceDisable     : in    std_logic;
            SI_ClkOut       : out   std_logic;
            SI_ERL          : out   std_logic;
            SI_EXL          : out   std_logic;
            SI_NMITaken     : out   std_logic;
            SI_NESTERL      : out   std_logic;
            SI_NESTEXL      : out   std_logic;
            SI_RP           : out   std_logic;
            SI_Sleep        : out   std_logic;
            SI_TimerInt     : out   std_logic;
            SI_SWInt        : out   std_logic_vector(1 downto 0);
            SI_IAck         : out   std_logic;
            SI_IPL          : out   std_logic_vector(7 downto 0);
            SI_IVN          : out   std_logic_vector(5 downto 0);
            SI_ION          : out   std_logic_vector(17 downto 1);
            SI_Ibs          : out   std_logic_vector(7 downto 0);
            SI_Dbs          : out   std_logic_vector(3 downto 0);
            PM_InstnComplete    : out   std_logic;
            gscanmode       : in    std_logic;
            gscanenable     : in    std_logic;
            gscanin         : in    std_logic_vector(M14K_NUM_SCAN_CHAIN-1 downto 0);
            gscanout        : out   std_logic_vector(M14K_NUM_SCAN_CHAIN-1 downto 0);
            gscanramwr      : in    std_logic;
            gmbinvoke       : in    std_logic;
            gmbdone         : out   std_logic;
            gmbddfail       : out   std_logic;
            gmbtdfail       : out   std_logic;
            gmbwdfail       : out   std_logic;
            gmbspfail       : out   std_logic;
            gmbdifail       : out   std_logic;
            gmbtifail       : out   std_logic;
            gmbwifail       : out   std_logic;
            gmbispfail      : out   std_logic;
            gmb_ic_algorithm    : in    std_logic_vector(7 downto 0);
            gmb_dc_algorithm    : in    std_logic_vector(7 downto 0);
            gmb_isp_algorithm   : in    std_logic_vector(7 downto 0);
            gmb_sp_algorithm    : in    std_logic_vector(7 downto 0);
            BistIn          : in    std_logic_vector(M14K_TOP_BIST_IN-1 downto 0);
            BistOut         : out   std_logic_vector(M14K_TOP_BIST_OUT-1 downto 0);
            EJ_TCK          : in    std_logic;
            EJ_TDO          : out   std_logic;
            EJ_TDI          : in    std_logic;
            EJ_TMS          : in    std_logic;
            EJ_TRST_N       : in    std_logic;
            EJ_TDOzstate    : out   std_logic;
            EJ_ECREjtagBrk  : out   std_logic;
            EJ_ManufID      : in    std_logic_vector(10 downto 0);
            EJ_PartNumber   : in    std_logic_vector(15 downto 0);
            EJ_Version      : in    std_logic_vector(3 downto 0);
            EJ_DINTsup      : in    std_logic;
            EJ_DINT         : in    std_logic;
            EJ_DisableProbeDebug    : in    std_logic;
            EJ_PerRst       : out   std_logic;
            EJ_PrRst        : out   std_logic;
            EJ_SRstE        : out   std_logic;
            EJ_DebugM       : out   std_logic;
            TC_ClockRatio   : out   std_logic_vector(2 downto 0);
            TC_Valid        : out   std_logic;
            TC_Data         : out   std_logic_vector(63 downto 0);
            TC_Stall        : in    std_logic;
            TC_PibPresent   : in    std_logic;
            UDI_toudi       : in    std_logic_vector(M14K_UDI_EXT_TOUDI_WIDTH-1 downto 0);
            UDI_fromudi     : out   std_logic_vector(M14K_UDI_EXT_FROMUDI_WIDTH-1 downto 0);
            CP2_tocp2       : in    std_logic_vector(M14K_CP2_EXT_TOCP2_WIDTH-1 downto 0);
            CP2_fromcp2     : out   std_logic_vector(M14K_CP2_EXT_FROMCP2_WIDTH-1 downto 0);
            ISP_toisp       : in    std_logic_vector(M14K_ISP_EXT_TOISP_WIDTH-1 downto 0);
            ISP_fromisp     : out   std_logic_vector(M14K_ISP_EXT_FROMISP_WIDTH-1 downto 0);
            DSP_todsp       : in    std_logic_vector(M14K_DSP_EXT_TODSP_WIDTH-1 downto 0);
            DSP_fromdsp     : out   std_logic_vector(M14K_DSP_EXT_FROMDSP_WIDTH-1 downto 0);
            SI_IPFDCI       : in    std_logic_vector(2 downto 0);
            SI_FDCInt       : out   std_logic;
            SI_IPPCI        : in    std_logic_vector(2 downto 0);
            SI_PCInt        : out   std_logic
        );
    end component m14k_top;

    component mfp_ahb_withloader is
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
            IO_7SEG_N       : out   std_logic_vector(6 downto 0);
            UART_RX     : in    std_logic;
            MFP_Reset_serialload    : out   std_logic 
        );
    end component mfp_ahb_withloader;
        
    component mfp_ejtag_reset is
        port (
            clk     : in    std_logic;
            trst_n  : out   std_logic
        );
    end component mfp_ejtag_reset;
    
    --------------------------------------------------------------------
    -- signal declarations
    --------------------------------------------------------------------
    signal HADDR_int  : std_logic_vector(31 downto 0);
    signal HRDATA_int : std_logic_vector(31 downto 0);
    signal HWDATA_int : std_logic_vector(31 downto 0);
    signal HWRITE_int : std_logic;
    signal HSIZE_int  : std_logic_vector(2 downto 0);

	signal HREADY      : std_logic;     -- AHB: Indicate the previous transfer is complete
	signal HRESP       : std_logic;     -- AHB: 0 is OKAY, 1 is ERROR
	signal SI_AHBStb   : std_logic;     -- AHB: Signal indicating phase and frequency relationship between clk and hclk. 
	signal HCLK        : std_logic;     -- AHB: The bus clock times all bus transfer.
	signal HRESETn     : std_logic;     -- AHB: The bus reset signal is active LOW and resets the system and the bus.
	signal HBURST      : std_logic_vector(2 downto 0);  -- AHB: Burst type; Only Two types:
                                                        -- 3'b000  ---     Single; 3'b10  --- 4-beat Wrapping;
	signal HPROT       : std_logic_vector(3 downto 0);  -- AHB: The single indicate the transfer type; Tie to 4'b0011, no significant meaning;
	signal HMASTLOCK   : std_logic;                     -- AHB: Indicates the current transfer is part of a locked sequence; Tie to 0.
	signal HTRANS      : std_logic_vector(1 downto 0);  -- AHB: Indicates the transfer type; Three Types
                                                        -- 2'b00 --- IDLE, 2'b10 --- NONSEQUENTIAL, 2'b11 --- SEQUENTIAL.


-- System Interface Signals
    signal SI_Endian    : std_logic;	                    -- Base endianess: 1=big
	signal SI_Int       : std_logic_vector(7 downto 0);     -- Ext. Interrupt pins
	signal SI_NMI          : std_logic;                     -- Non-maskable interrupt
	signal SI_Reset        : std_logic;                     -- greset
	signal SI_ColdReset    : std_logic;
	signal SI_MergeMode    : std_logic_vector(1 downto 0);	-- SI_MergeMode[0] not used in this design
					-- Merging algorithm: 
					-- 00- No sub-word store merging
	                                -- X1- Reserved
	                                -- 10- Full merging - swiss cheese ok
					-- Bus Mode
					-- 00- Full ECi - swiss cheese, tribytes
					-- 01- Naturally aligned B,H,W's only 	
					-- 1X- Reserved


	signal SI_CPUNum       : std_logic_vector(9 downto 0);	-- EBase CPU number
	signal SI_IPTI         : std_logic_vector(2 downto 0);	-- TimerInt connection
	signal SI_EICPresent   : std_logic;	-- External Interrupt cpntroller present
	signal SI_EICVector    : std_logic_vector(5 downto 0);	-- Vector number for EIC interrupt


	signal SI_Offset       : std_logic_vector(17 downto 1);


	signal SI_EISS         : std_logic_vector(3 downto 0);	-- Shadow set, comes with the requested interrupt

	signal SI_BootExcISAMode  : std_logic;



	signal SI_SRSDisable       : std_logic_vector(3 downto 0);  -- Disable banks of shadow sets
	signal SI_TraceDisable     : std_logic; -- Disables trace hardware
	
	signal SI_ClkOut   : std_logic;	-- External bus reference clock
	signal SI_ERL      : std_logic;         -- Error level pin
	signal SI_EXL      : std_logic;         -- Exception level pin
	signal SI_NMITaken : std_logic;	-- NMI pinned out
	signal SI_NESTERL  : std_logic;	-- nested error level pinned out
	signal SI_NESTEXL  : std_logic;	-- nested exception level pinned out
	signal SI_RP       : std_logic;          -- Reduce power pin
	signal SI_Sleep    : std_logic;       -- Processor is in sleep mode
	signal SI_TimerInt : std_logic;    -- count==compare interrupt


	signal SI_SWInt    : std_logic_vector(1 downto 0);	-- Software interrupt requests to external interrupt controller
	signal SI_IAck     : std_logic;	                    -- Interrupt Acknowledge
	signal SI_IPL      : std_logic_vector(7 downto 0);  -- Current IPL, contains information of which int SI_IACK ack.
	signal SI_IVN      : std_logic_vector(5 downto 0);  -- Cuurent IVN, contains information of which int SI_IAck ack.
	signal SI_ION      : std_Logic_vector(17 downto 1); -- Cuurent ION, contains information of which int SI_IAck ack.


	signal SI_Ibs  : std_logic_vector(7 downto 0);  -- Instruction break status
	signal SI_Dbs  : std_logic_vector(3 downto 0);  -- Data break status

	-- Performance monitoring signals
    signal PM_InstnComplete : std_logic;

	-- Scan I/O's 
	signal gscanmode   : std_logic;
	signal gscanenable : std_logic;
	signal gscanin     : std_logic_vector(M14K_NUM_SCAN_CHAIN-1 downto 0);
	signal gscanout    : std_logic_vector(M14K_NUM_SCAN_CHAIN-1 downto 0);      
        
	signal gscanramwr  : std_logic;
	signal gmbinvoke   : std_logic;
	signal gmbdone     : std_logic;     -- Asserted to indicate that all mem-BIST test is done
	signal gmbddfail   : std_logic;  	-- Asserted to indicate that D$ date test failed
	signal gmbtdfail   : std_logic;  	-- Asserted to indicate that D$ tag test failed
	signal gmbwdfail   : std_logic;  	-- Asserted to indicate that D$ WS test failed
	signal gmbspfail   : std_logic;  	-- Asserted to indicate that D$ date test failed
	signal gmbdifail   : std_logic;  	-- Asserted to indicate that I$ date test failed
	signal gmbtifail   : std_logic;  	-- Asserted to indicate that I$tag test failed
	signal gmbwifail   : std_logic;  	-- Asserted to indicate that I$WS test failed
	signal gmbispfail  : std_logic;  	-- Asserted to indicate that D$ date test failed
	signal gmb_ic_algorithm  : std_logic_vector(7 downto 0); -- Alogrithm selection for I$ BIST controller.
	signal gmb_dc_algorithm  : std_logic_vector(7 downto 0); -- Alogrithm selection for D$ BIST controller.
	signal gmb_isp_algorithm : std_logic_vector(7 downto 0); -- Alogrithm selection for ISPRAM BIST controller.
	signal gmb_sp_algorithm  : std_logic_vector(7 downto 0); -- Alogrithm selection for DSPRAM BIST controller.

	-- User defined Bist I/O's
	signal BistIn  : std_logic_vector(M14K_TOP_BIST_IN-1 downto 0);
	signal BistOut : std_logic_vector(M14K_TOP_BIST_OUT-1 downto 0);

	-- EJTAG I/O's
	signal EJ_TDOzstate     : std_logic;
 	signal EJ_ECREjtagBrk   : std_logic;
	signal EJ_ManufID       : std_logic_vector(10 downto 0);
	signal EJ_PartNumber    : std_logic_vector(15 downto 0);
	signal EJ_Version       : std_logic_vector(3 downto 0);
	signal EJ_DINTsup       : std_logic;
	signal EJ_DisableProbeDebug  : std_logic;
	signal EJ_PerRst        : std_logic;
	signal EJ_PrRst         : std_logic;
	signal EJ_SRstE         : std_logic;
	signal EJ_DebugM        : std_logic;	-- Indication that we are in debug mode

	-- TCB PIB signals
	signal TC_ClockRatio : std_logic_vector(2 downto 0);  	-- User's clock ratio selection.
	signal TC_Valid      : std_logic;             	        -- Data valid indicator.  Not used in this design.
	signal TC_Data       : std_logic_vector(63 downto 0);   -- Data from TCB.
	signal TC_Stall      : std_logic;             	        -- Stall request.  Not used in this design.
	signal TC_PibPresent : std_logic;                       -- PIB is present   


-- Impl specific IOs to cpu external modules
	signal UDI_toudi   : std_logic_vector(M14K_UDI_EXT_TOUDI_WIDTH-1 downto 0);   -- External input to UDI module
	signal UDI_fromudi : std_logic_vector(M14K_UDI_EXT_FROMUDI_WIDTH-1 downto 0); -- Output from UDI module to external system    

	signal CP2_tocp2   : std_logic_vector(M14K_CP2_EXT_TOCP2_WIDTH-1 downto 0);   -- External input to COP2
	signal CP2_fromcp2 : std_logic_vector(M14K_CP2_EXT_FROMCP2_WIDTH-1 downto 0); -- External output from COP2

	signal ISP_toisp   : std_logic_vector(M14K_ISP_EXT_TOISP_WIDTH-1 downto 0);   -- External input ISPRAM
	signal ISP_fromisp : std_logic_vector(M14K_ISP_EXT_FROMISP_WIDTH-1 downto 0); -- External output from ISPRAM

	signal DSP_todsp   : std_logic_vector(M14K_DSP_EXT_TODSP_WIDTH-1 downto 0);   -- External input DSPRAM
	signal DSP_fromdsp : std_logic_vector(M14K_DSP_EXT_FROMDSP_WIDTH-1 downto 0); -- External output from DSPRAM

	signal SI_IPFDCI  : std_logic_vector(2 downto 0);  -- FDC connection
	signal SI_FDCInt  : std_logic;                     -- FDC receive FIFO full interrupt

	signal SI_IPPCI  : std_logic_vector(2 downto 0);  -- PCI connection
	signal SI_PCInt  : std_logic;                     -- PCI receive full interrupt

    
    signal trst_n, EJ_TRST_N    : std_logic;   -- Reset core at EJTAG initialization
    signal MFP_Reset_serialload : std_logic;   -- Reset core during serial load of memory via UART
    
begin

    HADDR   <= HADDR_int;
    HRDATA  <= HRDATA_int;
    HWDATA  <= HWDATA_int;
    HWRITE  <= HWRITE_int;
    HSIZE   <= HSIZE_int;

    EJ_TRST_N <= trst_n and EJ_TRST_N_probe;
    SI_ColdReset <= not SI_ColdReset_N;
    SI_Reset <= (not SI_Reset_N) or MFP_Reset_serialload;

    mfp_ejtag_reset_i: mfp_ejtag_reset
        port map (
            clk     => SI_ClkIn,
            trst_n  => trst_n
        );

    m14k_top_i: m14k_top
        port map (
            HRDATA          => HRDATA_int,
            HREADY          => HREADY,
            HRESP           => HRESP,
            HCLK            => HCLK,
            HRESETn         => HRESETn,
            HADDR           => HADDR_int,
            HBURST          => HBURST,
            HPROT           => HPROT,
            HMASTLOCK       => HMASTLOCK,
            HSIZE           => HSIZE_int,
            HTRANS          => HTRANS,
            HWRITE          => HWRITE_int,
            HWDATA          => HWDATA_int,
            SI_AHBStb           => SI_AHBStb,
            SI_ClkIn            => SI_ClkIn,
            SI_ColdReset        => SI_ColdReset,
            SI_Endian           => SI_Endian,
            SI_Int              => SI_Int,
            SI_NMI              => SI_NMI,
            SI_Reset            => SI_Reset,
            SI_MergeMode        => SI_MergeMode,
            SI_CPUNum           => SI_CPUNum,
            SI_IPTI             => SI_IPTI,
            SI_EICPresent       => SI_EICPresent,
            SI_EICVector        => SI_EICVector,
            SI_Offset           => SI_Offset,
            SI_EISS             => SI_EISS,
            SI_BootExcISAMode   => SI_BootExcISAMode,
            SI_SRSDisable       => SI_SRSDisable,
            SI_TraceDisable     => SI_TraceDisable,
            SI_IPFDCI       => SI_IPFDCI,
            SI_IPPCI        => SI_IPPCI,
            SI_ClkOut       => SI_ClkOut,
            SI_ERL          => SI_ERL,
            SI_EXL          => SI_EXL,
            SI_NMITaken     => SI_NMITaken,
            SI_NESTERL      => SI_NESTERL,
            SI_NESTEXL      => SI_NESTEXL,
            SI_RP           => SI_RP,
            SI_Sleep        => SI_Sleep,
            SI_TimerInt     => SI_TimerInt,
            SI_SWInt        => SI_SWInt,
            SI_IAck         => SI_IAck,
            SI_IPL          => SI_IPL,
            SI_IVN          => SI_IVN,
            SI_ION          => SI_ION,
            SI_Ibs          => SI_Ibs,
            SI_Dbs          => SI_Dbs,
            SI_FDCInt       => SI_FDCInt,
            SI_PCInt        => SI_PCInt,          
            PM_InstnComplete    => PM_InstnComplete,           
            gscanmode       => gscanmode,
            gscanenable     => gscanenable,
            gscanramwr      => gscanramwr,
            gscanin         => gscanin,
            gscanout        => gscanout,
            gmbinvoke       => gmbinvoke,
            gmbdone         => gmbdone,
            gmbddfail       => gmbddfail,
            gmbtdfail       => gmbtdfail,
            gmbwdfail       => gmbwdfail,
            gmbspfail       => gmbspfail,
            gmbdifail       => gmbdifail,
            gmbtifail       => gmbtifail,
            gmbwifail       => gmbwifail,
            gmbispfail      => gmbispfail,
            gmb_ic_algorithm    => gmb_ic_algorithm,
            gmb_dc_algorithm    => gmb_dc_algorithm,
            gmb_isp_algorithm   => gmb_isp_algorithm,
            gmb_sp_algorithm    => gmb_sp_algorithm,           
            BistIn          => BistIn,
            BistOut         => BistOut,
            EJ_DINT         => EJ_DINT,
            EJ_TCK          => EJ_TCK,
            EJ_TDI          => EJ_TDI,
            EJ_TMS          => EJ_TMS,
            EJ_TRST_N       => EJ_TRST_N,
            EJ_TDO          => EJ_TDO,
            EJ_ManufID      => EJ_ManufID,
            EJ_PartNumber   => EJ_PartNumber,
            EJ_Version      => EJ_Version,
            EJ_DINTsup      => EJ_DINTsup,
            EJ_DisableProbeDebug    => EJ_DisableProbeDebug,
            EJ_TDOzstate    => EJ_TDOzstate,
            EJ_ECREjtagBrk  => EJ_ECREjtagBrk,
            EJ_PerRst       => EJ_PerRst,
            EJ_PrRst        => EJ_PrRst,
            EJ_SRstE        => EJ_SRstE,
            EJ_DebugM       => EJ_DebugM,
            TC_Stall        => TC_Stall,
            TC_PibPresent   => TC_PibPresent,
            TC_ClockRatio   => TC_ClockRatio,
            TC_Valid        => TC_Valid,
            TC_Data         => TC_Data,            
            UDI_toudi       => UDI_toudi,
            UDI_fromudi     => UDI_fromudi,         
            CP2_tocp2       => CP2_tocp2,
            CP2_fromcp2     => CP2_fromcp2,         
            ISP_toisp       => ISP_toisp,
            ISP_fromisp     => ISP_fromisp,
            DSP_todsp       => DSP_todsp,
            DSP_fromdsp     => DSP_fromdsp
        );

    mfp_ahb_withloader_i: mfp_ahb_withloader
        port map (
            HCLK        => HCLK,
            HRESETn     => SI_Reset_N,
            HADDR       => HADDR_int,
            HBURST      => HBURST,
            HMASTLOCK   => HMASTLOCK,
            HPROT       => HPROT,
            HSIZE       => HSIZE_int,
            HTRANS      => HTRANS,
            HWDATA      => HWDATA_int,
            HWRITE      => HWRITE_int,
            HRDATA      => HRDATA_int,
            HREADY      => HREADY,
            HRESP       => HRESP,
            SI_Endian   => SI_Endian,      
            IO_Switch   => IO_Switch,
            IO_PB       => IO_PB,
            IO_LED      => IO_LED,
            IO_7SEGEN_N => IO_7SEGEN_N,
            IO_7SEG_N   => IO_7SEG_N,
            UART_RX     => UART_RX,
            MFP_Reset_serialload    => MFP_Reset_serialload
        );


    -- the following signals need to be tied to something
    SI_NMI          <= '0';
    SI_EICPresent   <= '0';
    SI_EICVector    <= (others => '0');
    SI_EISS         <= (others => '0');
	SI_Int          <= (others => '0'); -- Ext. Interrupt pins
	SI_Offset       <= (others => '0');
	SI_IPTI         <= (others => '0');	-- TimerInt connection
	SI_CPUNum       <= (others => '0');	-- EBase CPU number
	SI_Endian       <= '0';	            -- Base endianess: 1=big
	SI_MergeMode    <= (others => '0');	
	SI_SRSDisable   <= "1111";          -- Disable banks of shadow sets
    SI_TraceDisable <= '1';             -- Disables trace hardware
	SI_IPFDCI       <= (others => '0'); -- FDC connection
	SI_IPPCI        <= (others => '0'); -- PCI connection
	SI_AHBStb       <= '1';             -- AHB: Signal indicating phase and frequency relationship between clk and hclk. 
	SI_BootExcISAMode <= '0';  

	-- EJTAG I/O's
	EJ_ManufID     <= (others => '0');
	EJ_PartNumber  <= (others => '0');
	EJ_Version     <= (others => '0');
	EJ_DINTsup     <= '0';
	EJ_DisableProbeDebug <= '0';    -- Must be 0 to enable EJTAG debug

	TC_Stall      <= '0';   -- Stall request.  Not used in this design.
	TC_PibPresent <= '0';   -- PIB is present   

	gscanmode   <= '0';
	gscanenable <= '0';
	gmbinvoke   <= '0';
	gscanramwr  <= '0';
	gscanin     <= (others => '0');
	
	gmb_ic_algorithm  <= (others => '0');
	gmb_dc_algorithm  <= (others => '0');
	gmb_isp_algorithm <= (others => '0');
	gmb_sp_algorithm  <= (others => '0');

	UDI_toudi <= (others => '0');  -- External input to UDI module
	CP2_tocp2 <= (others => '0');  -- External input to COP2
	ISP_toisp <= (others => '0');  -- External input ISPRAM
	DSP_todsp <= (others => '0');  -- External input DSPRAM

    BistIn <= (others => '0');

end rtl;
