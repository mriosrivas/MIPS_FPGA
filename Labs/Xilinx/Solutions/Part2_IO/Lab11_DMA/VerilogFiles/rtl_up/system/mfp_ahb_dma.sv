//
// SystemVerilog code for DMA Engine and AHB Arbiter
//
// This code can be converted to Verilog as needed.
//
// DMA engine has priority over CPU
// DMA engine is write-only from the perspective of the CPU.
//

`include "mfp_ahb_const.vh"

`define   H_DMASRC_ADDR  		(32'h1f300000)
`define   H_DMADST_ADDR  		(32'h1f300004)
`define   H_DMASIZE_ADDR  		(32'h1f300008)
`define   H_DMASTART_ADDR  		(32'h1f30000c)

`define   H_DMAUPPER_ADDR  		(12'h1f3)

`define   H_DMASRC_NUM  		(2'h0)
`define   H_DMADST_NUM  		(2'h1)
`define   H_DMASIZE_NUM  		(2'h2)
`define   H_DMASTART_NUM  		(2'h3)
`define   H_DMASTART_NUM  		(2'h3)
`define   DMAFIFO_ADDR_WIDTH	(8) 
`define   DMAFIFO_MAX_ADDR		(255) 



module AHBarbiter(
	   input  logic         HCLK,
	   input  logic         HRESETn,
       input  logic [31: 0] HADDR_cpu,
       input  logic [31: 0] HADDR_dma,
       input  logic [ 2: 0] HSIZE_cpu,
       input  logic [ 2: 0] HSIZE_dma,
       input  logic [ 1: 0] HTRANS_cpu,
       input  logic [ 1: 0] HTRANS_dma,
       input  logic [31: 0] HWDATA_cpu,
       input  logic [31: 0] HWDATA_dma,
       input  logic         HWRITE_cpu,
       input  logic         HWRITE_dma,
	
       output logic [31: 0] HADDR,
       output logic [ 2: 0] HSIZE,
       output logic [ 1: 0] HTRANS,
       output logic [31: 0] HWDATA,
       output logic         HWRITE,

       output logic         HREADY_cpu,
	   output logic         HREADY_dma
);

  logic dmaGrant, dmaDone;
  logic cpuAddr, cpuData;
  typedef enum logic {CPU, DMA} statetype;
  statetype state, nextstate;

  // condition inputs
  assign dmaGrant = (HTRANS_dma == 2'b10) & (HTRANS_cpu == 2'b00);
  assign dmaDone = (HTRANS_dma == 2'b00);
  
  // state register
  always_ff @(posedge HCLK, negedge HRESETn)
    if (~HRESETn) state <= CPU;
    else          state <= nextstate;

  // next state logic
  always_comb
    case (state)
      CPU:    if (dmaGrant)      nextstate = DMA;
               else              nextstate = CPU;
      DMA:    if (dmaDone)       nextstate = CPU;
               else              nextstate = DMA;
      default:                   nextstate = CPU;
    endcase

  // output logic
  always_comb
    case (state)
      CPU:    begin
                cpuData = 1'b1;
                HREADY_cpu = 1'b1;
                cpuAddr = 1'b1;
              end
      DMA:    begin
                cpuData = 1'b0;
                HREADY_cpu = 1'b0;
                if (dmaDone) cpuAddr = 1'b1;
                else         cpuAddr = 1'b0;
              end
    endcase
  
  assign HREADY_dma = ~HREADY_cpu;  
  // Muxes
  assign HADDR  = cpuAddr ? HADDR_cpu   : HADDR_dma;
  assign HSIZE  = cpuAddr ? HSIZE_cpu   : HSIZE_dma;
  assign HTRANS = cpuAddr ? HTRANS_cpu  : HTRANS_dma;
  assign HWRITE = cpuAddr ? HWRITE_cpu  : HWRITE_dma;
  assign HWDATA = cpuData ? HWDATA_cpu  : HWDATA_dma;
endmodule


module AHBdma(
    input  logic          HCLK,
    input  logic          HRESETn,
    input  logic [ 31: 0] HADDR,
    input  logic [  2: 0] HBURST,
    input  logic          HMASTLOCK,
    input  logic [  3: 0] HPROT,
    input  logic [  2: 0] HSIZE,
    input  logic [  1: 0] HTRANS,
    input  logic [ 31: 0] HWDATA,
    input  logic          HWRITE,
    input  logic [ 31: 0] HRDATA,

    input  logic          SI_Endian,

    output logic [ 31: 0] HADDR_dma,
    output logic [  2: 0] HSIZE_dma,
    output logic [  1: 0] HTRANS_dma,
    output logic [ 31: 0] HWDATA_dma,
    output logic          HWRITE_dma,
    input  logic          HREADY_dma
);

  logic [31:0] fifocnt, transcnt;
  logic [31:0] srcaddrincr, dstaddrincr;
  logic        resettransctr, chunkdone;
  logic        we, we_d, incrsrcaddr, incrdstaddr, incrfifocnt, incrtranscnt;
  logic [31:0] srcaddr, dstaddr, numwords;
  logic        resetstartdma, startdma;
  
  AHBdmaregs dmaregs(HCLK, HRESETn, HADDR, HBURST, HMASTLOCK, HPROT, 
                     HSIZE, HTRANS, HWDATA, HWRITE, SI_Endian, 
                     srcaddr, dstaddr, numwords, resetstartdma, 
                     startdma);

  AHBdmafsm dmafsm(HCLK, HRESETn, srcaddrincr, dstaddrincr, numwords, fifocnt, transcnt,
                   startdma, HREADY_dma, we, HTRANS_dma, HADDR_dma, HWRITE_dma, incrsrcaddr, 
                   incrdstaddr, incrfifocnt, incrtranscnt, resetstartdma, chunkdone);

  counterCLR  #(32) fifo_cntr(HCLK, HRESETn, (startdma | chunkdone), 
                              incrfifocnt, fifocnt);
  counterInit1CLR  #(32) trans_cntr(HCLK, HRESETn, startdma, 
                              incrtranscnt, transcnt);
  addrincr #(32) srcaddr_incr(HCLK, HRESETn, incrsrcaddr, startdma, 
                                 srcaddr, srcaddrincr);
  addrincr #(32) dstaddr_incr(HCLK, HRESETn, incrdstaddr, 
                             startdma, dstaddr, dstaddrincr);
  dmafifo fifo(HCLK, HRESETn, fifocnt, HRDATA, we, HWDATA_dma);
  
  assign HSIZE_dma = `HSIZE_4;  // always sending words at a time for DMA transfers

endmodule

module AHBdmafsm(input  logic          clk, 
                 input  logic          resetn, 
                 input  logic [ 31: 0] srcaddr, dstaddr, numwords, 
                 input  logic [ 31: 0] fifocnt, transcnt,
                 input  logic          startdma,
                 input  logic          HREADY_dma,
                 output logic          we,
                 output logic [  1: 0] HTRANS_dma,
                 output logic [ 31: 0] HADDR_dma,
                 output logic          HWRITE_dma,
                 output logic          incrsrcaddr,
                 output logic          incrdstaddr,
                 output logic          incrfifocnt, incrtranscnt,
                 output logic          resetstartdma,
                 output logic          chunkdone
);
  logic [31:0] chunksize;
  logic maxchunkread, chunkread, chunkwritten, transdone;
  
  typedef enum logic [1:0] {IDLE, WAIT, READ, WRITE} statetype;
  statetype state, nextstate;

  // state register
  always_ff @(posedge clk, negedge resetn)
    if (~resetn) state <= IDLE;
    else         state <= nextstate;

  // next state logic
  always_comb
    case (state)
      IDLE:    if (startdma)        nextstate = WAIT;
               else                 nextstate = IDLE;
      WAIT:    if (HREADY_dma)      nextstate = READ;
               else                 nextstate = WAIT;
      READ:    if (~chunkread)      nextstate = READ;
               else                 nextstate = WRITE;
      WRITE:   if (~chunkwritten)   nextstate = WRITE;
               else if (transdone)  nextstate = IDLE;
               else                 nextstate = READ;
      default:                      nextstate = IDLE;
    endcase

  // output logic
  always_comb begin
    we = 0;
    HTRANS_dma = 2'b00;
    HADDR_dma = 32'b0;
    HWRITE_dma = 1'b0;
    incrsrcaddr = 1'b0;
    incrdstaddr = 1'b0;
    incrfifocnt = 1'b0;
    incrtranscnt = 1'b0;
    resetstartdma = 1'b0;
    chunkdone = 1'b0;
    case (state)
      WAIT: HTRANS_dma = 2'b10;
      READ: begin
               we = 1;
               HTRANS_dma = 2'b10;
               HADDR_dma = srcaddr;
               incrsrcaddr = 1'b1;
               incrfifocnt = 1'b1;
               incrtranscnt = ~chunkread;
               resetstartdma = 1'b1;
               chunkdone = chunkread;
            end
      WRITE: begin
               HTRANS_dma = 2'b10;
               HADDR_dma = dstaddr;
               HWRITE_dma = 1'b1;
               incrdstaddr = 1'b1;
               incrfifocnt = 1'b1;
               chunkdone = chunkwritten;
               incrtranscnt = chunkwritten & ~transdone;
            end
      default: HTRANS_dma = 2'b00;
    endcase
  end

  // book-keeping logic  
  assign transdone = (transcnt == numwords);
  assign maxchunkread = (fifocnt == `DMAFIFO_MAX_ADDR);
  assign chunkread = maxchunkread | transdone;
  assign chunkwritten = (fifocnt == chunksize);
    
  // chunksize register
  always_ff @(posedge clk, negedge resetn)
    if (~resetn)           chunksize <= 32'b0;
    else if (incrsrcaddr)  chunksize <= fifocnt;

endmodule


module AHBdmaregs(
    input  logic          HCLK,
    input  logic          HRESETn,
    input  logic [ 31: 0] HADDR,
    input  logic [  2: 0] HBURST,
    input  logic          HMASTLOCK,
    input  logic [  3: 0] HPROT,
    input  logic [  2: 0] HSIZE,
    input  logic [  1: 0] HTRANS,
    input  logic [ 31: 0] HWDATA,
    input  logic          HWRITE,
    input  logic          SI_Endian,

    output logic [ 31: 0] srcaddr, dstaddr, numwords,
    input  logic          resetstartdma,
    output logic          startdma
);

  logic [31:0] physaddr;
  logic [3:0]  addrMSB;
  logic        HWRITE_d;
  logic [31:0] HADDR_d;
  
  assign addrMSB = HWDATA[31:28] - 4'h8;
  assign physaddr = {addrMSB, HWDATA[27:0]};
  
  always_ff @(posedge HCLK) begin
    HWRITE_d <= HWRITE;
    HADDR_d <= HADDR;
  end
  
  // assign memory-mapped I/O registers
  always_ff @(posedge HCLK, negedge HRESETn, posedge resetstartdma)
    if (~HRESETn) begin
      srcaddr  <= 32'b0;
      dstaddr <= 32'b0;
      numwords  <= 32'b0;
      startdma  <= 1'b0;
    end  
    else if (resetstartdma)
      startdma <= 1'b0;
    else if (HADDR_d[31:20] == `H_DMAUPPER_ADDR & HWRITE_d)
      case (HADDR_d[3:2])
        `H_DMASRC_NUM:		srcaddr   <= physaddr;
        `H_DMADST_NUM:		dstaddr   <= physaddr;
        `H_DMASIZE_NUM:		numwords  <= (HWDATA[31:2]) ? ({2'b0,HWDATA[31:2]}) : 32'b0;
        `H_DMASTART_NUM:	startdma  <= numwords ? HWDATA[0] : 1'b0;
      endcase

endmodule


module dmafifo
(
    input  logic          clk,
    input  logic          resetn,
    input  logic [ 31: 0] addr,
    input  logic [ 31: 0] wdata,
    input  logic          we,
    output logic [ 31: 0] rdata 
);
  logic [31:0] rdatafromwrite, rdatamem;  // internal signal needed for back-to-back write/read
  logic        rdatasel;
  
  logic [31:0] addr_d;
  logic        we_d;

  always @(posedge clk) begin
    addr_d <= addr;
    we_d <= we;
  end

  // account for case of back-to-back write/read to same address - this wouldn't be an issue
  // if Xilinx had combinational read outputs on block memory.
  always_ff @(posedge clk)
    if  ((addr == addr_d) & we_d) begin
      rdatafromwrite = wdata;
      rdatasel = 1'b1;
    end
    else
      rdatasel = 1'b0;
    
  assign rdata = rdatasel ? rdatafromwrite : rdatamem;
  
  ram_dual_port #(32, `DMAFIFO_ADDR_WIDTH) ram_dual_port
  (
    .data(wdata),
    .read_addr(addr),
    .write_addr(addr_d),
    .we(we_d),
    .clk(clk),
    .q(rdatamem)
  );
endmodule

module counterCLR 
#(parameter WIDTH = 8)
(
                input  logic              clk,
                input  logic              resetn,
                input  logic              clear,
                input  logic              enable,
                output logic [WIDTH-1:0]  cnt);

  always @(posedge clk, negedge resetn)
    if (~resetn)     cnt <= 0;
    else if (clear)  cnt <= 0;
    else if (enable) cnt <= cnt + 1;

endmodule

module counterInit1CLR 
#(parameter WIDTH = 8)
(
                input  logic              clk,
                input  logic              resetn,
                input  logic              clear,
                input  logic              enable,
                output logic [WIDTH-1:0]  cnt);

  always @(posedge clk, negedge resetn)
    if (~resetn)     cnt <= 1;
    else if (clear)  cnt <= 1;
    else if (enable) cnt <= cnt + 1;

endmodule                              
module addrincr 
#(parameter WIDTH = 8)
(
                input  logic              clk,
                input  logic              resetn,
                input  logic              en,
                input  logic              init,
                input  logic [WIDTH-1:0]  initval,
                output logic [WIDTH-1:0]  out);

  always_ff @(posedge clk, negedge resetn)
    if (~resetn | init) out <= initval;
    else if (en)       out <= out + 4;

endmodule

