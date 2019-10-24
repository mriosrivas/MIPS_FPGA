#include <mips/m32c0.h>
#include "mfp_io.h"


// Configure performance counters
#define INIT_PERF_COUNTS() ({\
        _m32c0_mtc0(C0_PERFCNT, 0, (10 << 5) | (1 << 1)); \
        _m32c0_mtc0(C0_PERFCNT, 2, (11 << 5) | (1 << 1)); \
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


// Structure for storing the measurements from the Performance Counters
typedef struct {
    
    unsigned int event1;
    unsigned int event2;

} test_result_t;


// Baseline arrays definition
struct fusion{
    int A;
    int B;
} array[512];

volatile int C;


// Main Function
int main() {

    int i,x;
    test_result_t test_result;


    // A and B initialization
    for(i=0;i<512;i++){
        array[i].A=i;
        array[i].B=i;
    }


    // Empty D$ by using cache instructions
    asm volatile
    ( 
        "   li $t1, 4096;"       // This should be set to (TOTAL_CACHE_SIZE)/16. For safety, we use the maximum possible value (i.e. the value for a 64KB D$)
        "   li $t2, 0;"
        "   lui $t3, 0x0;"
        "loop1:"
        "   cache 0x01, 0($t3);"    // According to the cache instruction, the op value must be, in binary, 000|01, as this means to invalidate the index in the D$
        "   addiu $t3, $t3, 16;"
        "   addiu $t2, $t2, 1;"
        "   blt $t2, $t1, loop1;"
    );


    // Init performance counters
    INIT_PERF_COUNTS();

    asm volatile
    ( 
        "   li $t1, 512;"
        "   li $t2, 0;"
        "   li $t9, 0;"
        "   lui $t4, 0x8000;"
        "   addiu $t4, $t4, array;"
        "   loop2:"
            "   lw  $t7, 0($t4);"
            "   addiu $t4, $t4, 4;"         // array[i].A
            "   nop;"                       // These nops are included for avoiding an undesired effect caused by the Fill Buffer. This will be explained in Lab 24.
            "   nop;"
            "   nop;"
            "   lw  $t8, 0($t4);"
            "   addiu $t4, $t4, 4;"         // array[i].B
            "   nop;"                       // These nops are included for avoiding an undesired effect caused by the Fill Buffer. This will be explained in Lab 24.
            "   nop;"
            "   nop;"
            "   add $t6, $t7, $t8;"          // C_Partial = A[i] + B[i]
            "   add $t9, $t9, $t6;"          // C = C + C_Partial
            "   nop;"
            "   addiu $t2, $t2, 1;"
            "   blt $t2, $t1, loop2;"
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
            // Display the D$ associativity
            case 2:
                writeValTo7Segs(((mips32_getconfig1() & CFG1_DAMASK) >> CFG1_DASHIFT) + 1);
                break;
            // Display the D$ number of lines per way
            case 3:
                writeValTo7Segs((((mips32_getconfig1() & CFG1_DSMASK) >> CFG1_DSSHIFT) == 7)? 32 : 1 << (((mips32_getconfig1() & CFG1_DSMASK) >> CFG1_DSSHIFT) + 6));
                break;
            // Display the D$ line size (in Bytes)
            case 4:
                writeValTo7Segs((((mips32_getconfig1() & CFG1_DLMASK) >> CFG1_DLSHIFT) == 0)? 0 : 1 << (((mips32_getconfig1() & CFG1_DLMASK) >> CFG1_DLSHIFT) + 1));
                break;
            // Display the D$ write policy
            case 5:
                writeValTo7Segs((mips32_getconfig0() & CFG0_K0MASK));
                break;
            case 6:
                writeValTo7Segs((int)x);
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


// Exception handler
void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

