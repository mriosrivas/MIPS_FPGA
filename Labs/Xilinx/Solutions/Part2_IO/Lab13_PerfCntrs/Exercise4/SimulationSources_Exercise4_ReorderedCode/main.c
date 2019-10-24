#include <mips/m32c0.h>
#include "mfp_io.h"
#include "fdc.h"

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

int test_arrayA[100];
int test_arrayB[100];
int test_arrayResult[100];


// Main Function
int main() {

    test_result_t test_result;
    int i;

    for(i=0;i<100;i++) test_arrayA[i]=i;
    for(i=0;i<100;i++) test_arrayB[i]=i*i;
    for(i=0;i<100;i++) test_arrayResult[i]=0;

    // Init performance counters
    INIT_PERF_COUNTS();

    asm volatile
    ( 
        ".set noreorder;"
        "   addi    $t1,$0,100;"
        "   lui 	$t6, 0x8000;"
        "   addiu 	$t6, $t6, test_arrayA;"
        "   lui 	$t7, 0x8000;"
        "   addiu 	$t7, $t7, test_arrayB;"
        "   lui 	$t8, 0x8000;"
        "   addiu 	$t8, $t8, test_arrayResult;"
        "LOOP:  LW      $t2,0($t6);"
        "       ADDI    $t6,$t6,4;"
        "		ADD 	$t2,$t2,$t2;"
        "       LW      $t3,0($t7);"
        "       ADDI    $t7,$t7,4;"
        "		ADD 	$t3,$t2,$t3;"
        "		BEQ		$t3,$0, NoAct;"
        "       ADDI    $t1,$t1,-1;"
        "       SW      $t3,0($t8);"
        "NoAct: BNE     $t1,$0,LOOP;"
        "       ADDI    $t8,$t8,4;"
        ".set reorder;"
    );

    // Read performance counters
    READ_PERF_COUNTS(test_result.event1,test_result.event2);

    fdc_init();
    fdc_printf("\nResult[0]=%d, Result[50]=%d, Result[99]=%d\n",test_arrayResult[0],test_arrayResult[50],test_arrayResult[99]);

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

