/*
 * main.c for the MIPSfpga core running on a Nexys4 DDR FPGA board.
 * 
 * Writes a sequence of increasing numbers to the 8 7-segment displays.
 */

#include "mfp_io.h"
#include "fdc.h"

void delay();

//------------------
// main()
//------------------
int main() {
  volatile unsigned int i, cnt = 0;
  volatile unsigned int allDigits = 0;

  fdc_init();
  fdc_printf("Starting program.");
  
  MFP_7SEGEN = 0;        // enable all 7-segment displays
  while(1) {
    // write increasing values to each 7-segment display digit
    for (i=0; i<8; i++) {   
      allDigits |= (cnt&0xF)<<(i*4);
	  cnt++;
	}
	MFP_7SEGDIGITS = allDigits;
	fdc_printf("Value of digits: 0x%x\n", allDigits);
	allDigits = 0;

	delay();
  }
  return 0;
}

void delay() {
  volatile unsigned int j;

  for (j = 0; j < (9000000); j++) ;	// delay 
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

