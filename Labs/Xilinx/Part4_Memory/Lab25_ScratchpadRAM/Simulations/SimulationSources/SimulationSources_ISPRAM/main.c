#include <mips/m32c0.h>
#include "mfp_io.h"

// Configure performance counters
#define INIT_PERF_COUNTS() ({\
        _m32c0_mtc0(C0_PERFCNT, 0, (0 << 5) | (1 << 1)); \
        _m32c0_mtc0(C0_PERFCNT, 2, (1 << 5) | (1 << 1)); \
        _m32c0_mtc0(C0_PERFCNT, 1, 0); \
        _m32c0_mtc0(C0_PERFCNT, 3, 0); \
    })

#define READ_PERF_COUNTS(num_cycles, completed_instrs) ({\
        num_cycles = _m32c0_mfc0(C0_PERFCNT, 1); \
        completed_instrs = _m32c0_mfc0(C0_PERFCNT, 3); \
        _m32c0_mtc0(C0_PERFCNT, 0, 0); \
        _m32c0_mtc0(C0_PERFCNT, 2, 0); \
        _m32c0_mtc0(C0_PERFCNT, 1, 0); \
        _m32c0_mtc0(C0_PERFCNT, 3, 0); \
    }) 


// Function for writting a value in decimal format to the 7-seg displays.
void writeValTo7Segs(unsigned int val);


//----------------------------------------------------------------------
// Structure for storing the measurements from the Performance Counters
//----------------------------------------------------------------------
typedef struct {
    
    int event1;
    int event2;

} test_result_t;



/////////////////////////
// ISPRAM Initialization
/////////////////////////
void ISPRAM_Init(){

    asm volatile
    ( 
        "nop;"
        // Set bit SPR=1. With this, cacheops affect to both the I$ and the ISPRAM.
        "mfc0    $t4, $26, 0;"
        "lui     $t5, 0x1000;"
        "or      $t4, $t4, $t5;"
        "mtc0    $t4, $26, 0;"
        "nop;"
        // Initialization of the Cacheop-Tag to 0x00000000 in CP0 Register 28 - Select 0. Given that the cacheops will write to both the ISPRAM and the I$, we will invalidate the tag in the I$.
        "lui     $t3, 0x0000;"
        "mtc0    $t3, $28, 0;"


        // First instruction to store in the ISPRAM: addiu $t7,$a0,0 (0x248f0000).
        "lui     $t3, 0x248f;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x0($0);"
        // Second instruction to store in the ISPRAM: addiu $t8,$a1,0 (0x24b80000).
        "lui     $t3, 0x24b8;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x4($0);"
        // Third instruction to store in the ISPRAM: lui t4,0x7f (0x3c0c007f).
        "lui     $t3, 0x3c0c;"
        "ori   $t3, $t3, 0x007f;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x8($0);"
        // Fourth instruction to store in the ISPRAM: ori t4,t4,0xffff (0x358cffff).
        "lui     $t3, 0x358c;"
        "ori   $t3, $t3, 0xffff;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0xc($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x01ec;"
        "ori   $t3, $t3, 0x4024;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x10($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x030c;"
        "ori   $t3, $t3, 0x4824;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x14($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x3c0c;"
        "ori   $t3, $t3, 0x0080;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x18($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x010c;"
        "ori   $t3, $t3, 0x4025;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x1c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x012c;"
        "ori   $t3, $t3, 0x4825;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x20($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x3c0c;"
        "ori   $t3, $t3, 0x7f80;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x24($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x01ec;"
        "ori   $t3, $t3, 0x5024;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x28($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x000a;"
        "ori   $t3, $t3, 0x55c2;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x2c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x030c;"
        "ori   $t3, $t3, 0x5824;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x30($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x000b;"
        "ori   $t3, $t3, 0x5dc2;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x34($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x114b;"
        "ori   $t3, $t3, 0x000c;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x38($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0000;"
        "ori   $t3, $t3, 0x0000;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x3c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x014b;"
        "ori   $t3, $t3, 0x082b;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x40($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x1020;"
        "ori   $t3, $t3, 0x0006;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x44($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0000;"
        "ori   $t3, $t3, 0x0000;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x48($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x016a;"
        "ori   $t3, $t3, 0x6022;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x4c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0188;"
        "ori   $t3, $t3, 0x4007;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x50($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x014c;"
        "ori   $t3, $t3, 0x5020;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x54($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x1000;"
        "ori   $t3, $t3, 0x0004;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x58($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0000;"
        "ori   $t3, $t3, 0x0000;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x5c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x014b;"
        "ori   $t3, $t3, 0x6022;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x60($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0189;"
        "ori   $t3, $t3, 0x4807;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x64($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x016c;"
        "ori   $t3, $t3, 0x5820;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x68($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0109;"
        "ori   $t3, $t3, 0x6820;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x6c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x3c0c;"
        "ori   $t3, $t3, 0x0100;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x70($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x01ac;"
        "ori   $t3, $t3, 0x6024;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x74($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x1180;"
        "ori   $t3, $t3, 0x0003;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x78($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x0000;"
        "ori   $t3, $t3, 0x0000;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x7c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x000d;"
        "ori   $t3, $t3, 0x6842;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x80($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x214a;"
        "ori   $t3, $t3, 0x0001;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x84($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x3c0c;"
        "ori   $t3, $t3, 0x007f;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x88($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x358c;"
        "ori   $t3, $t3, 0xffff;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x8c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x01ac;"
        "ori   $t3, $t3, 0x6824;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x90($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x000a;"
        "ori   $t3, $t3, 0x55c0;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x94($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x3c0c;"
        "ori   $t3, $t3, 0x7f80;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x98($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x014c;"
        "ori   $t3, $t3, 0x5024;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0x9c($0);"
        // ... instruction to store in the ISPRAM: ... (0x...).
        "lui     $t3, 0x01aa;"
        "ori   $t3, $t3, 0x1025;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0xa0($0);"


        // Initialization of return instruction in the ISPRAM: jr ra (0x03e00008).
        "lui     $t3, 0x03e0;"
        "ori   $t3, $t3, 0x8;"
        "mtc0    $t3, $28, 1;"
        "cache   0x8,0xa4($0);"
        // Initialization of delay slot in the ISPRAM: nop (0x00000000).
        "mtc0    $0, $28, 1;"
        "cache   0x8,0xa8($0);"
        "nop;"
        // Set bit SPR=0. With this, cacheops only affect to the I$.
        "mfc0    $t4, $26, 0;"
        "lui     $t5, 0xefff;"
        "ori    $t5, $t5, 0xffff;"
        "and     $t4, $t4, $t5;"
        "mtc0    $t4, $26, 0;"
        "nop;"
    );

}

//------------------------------------------------------
// Main Function
//------------------------------------------------------
int main() {

    test_result_t test_result;
    int x;

    /////////////////////////
    // Initialize the ISPRAM
    /////////////////////////
    ISPRAM_Init();    



    /////////////////////////////////////////
    // Execute the algorithm from the ISPRAM
    /////////////////////////////////////////

    // Init performance counters
    INIT_PERF_COUNTS();

    asm volatile
    ( 
        "addiu $sp ,$sp ,-4;"
        "sw $ra,0($sp);"
        "lui $a0, 0x3fa0;"      // $a0=1.25 (0x3fa00000)
        "lui $a1, 0x4020;"      // $a1=2.5  (0x40200000)
        "jal 0x40000;"
        "addiu $t9, $v0, 0;"
        "lw $ra,0($sp);"
        "addiu $sp, $sp, 4;"
    );
    asm volatile
    ( 
        "   add %0, $t9, $zero;"
        : "=r" (x)
    );

    // Read performance counters
    READ_PERF_COUNTS(test_result.event1,test_result.event2);



    /* Display Results*/
    while (1) {
        // Check the switches state and show the corresponding value.
        switch( MFP_SWITCHES ) {

            case 0:
                writeValTo7Segs(test_result.event1);
                break;
            case 1:
                writeValTo7Segs(test_result.event2);
                break;
            case 2:
		        MFP_7SEGEN = 0x00;
		        MFP_7SEGDIGITS = (int)x;
                break;
            default:
                writeValTo7Segs(0);
        }
    }

    return 0;
}


// Function for writting a value in decimal format to the 7-seg displays
void writeValTo7Segs(unsigned int val) {

  volatile int digit, i=0;
  volatile unsigned int allDigits=0, enDigits;


  for (i=0; ((val>0) && (i<8)); i++) {
    digit = val % 10;
    allDigits |= (digit<<(i*4));
    val = val / 10;
    enDigits |= 1 << i;
  }

  MFP_7SEGDIGITS = allDigits; // write value to 7-segment display
  MFP_7SEGEN = ~enDigits;     // enable subset of 7-segment displays
  
  return;
}