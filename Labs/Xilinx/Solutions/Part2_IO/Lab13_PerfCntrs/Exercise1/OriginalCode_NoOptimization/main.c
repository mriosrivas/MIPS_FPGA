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


// Structure for storing the measurements from the Performance Counters
typedef struct {
    
    unsigned int event1;
    unsigned int event2;

} test_result_t;



// Main Function
int main() {

    test_result_t test_result;

    // Init performance counters
    INIT_PERF_COUNTS();

    asm volatile
    ( 
        "   add $s0, $0, $0;"
        "   add $s1, $0, $0;"
        "   addi $t0, $0, 1000;"
        "   loop:"
        "   slt $t1, $s0, $t0;"
        "   beq $t1, $0, done;"
        "   add $s1, $s1, $s0;"
        "   addi $s0, $s0, 1;"
        "   j loop;"
        "   done:"
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

