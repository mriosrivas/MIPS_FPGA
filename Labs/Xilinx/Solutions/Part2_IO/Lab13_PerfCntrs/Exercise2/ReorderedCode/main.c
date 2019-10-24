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

int V[1000];
int Addition;

// Main Function
int main() {

    test_result_t test_result;
    int i;

    for(i=0;i<1000;i++) V[i]=i;
    Addition=0;


    // Init performance counters
    INIT_PERF_COUNTS();

    asm volatile
    ( 
        ".set noreorder;"
        "LUI 	$t0, 0x8000;"
        "ADDIU 	$t0, $t0, V;"
		"SUB $t1,$t1,$t1;"
		"SUB $t3,$t3,$t3;"
		"ADDI $t4,$0,1000;"
		"Loop1:	BEQ $t3,$t4,OutLoop1;"
                "ADDI $t3,$t3,1;"
				"LW $t5,0($t0);"
				"ADDI $t0,$t0,4;"
				"B Loop1;"
                "ADD $t1,$t1,$t5;"
        "OutLoop1: LUI   $t3, 0x8000;"
        "ADDIU  $t3, $t3, Addition;"
        "SW $t1,0($t3);"
        ".set reorder;"
    );

    // Read performance counters
    READ_PERF_COUNTS(test_result.event1,test_result.event2);

    fdc_init();
    fdc_printf("\nAddition=%d\n",Addition);

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

