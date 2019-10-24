/*
 * main.c for the MIPSfpga system running on Nexys4 DDR FPGA board.
 *
 * Lab 5: SwTo7segDec
 * This program displays the value of the switches in decimal on the 
 * 7-segment displays.
 */


#include "mfp_io.h"
#include "fdc.h"

#define MAXNUMDIGITS 5   // With 16 switches, maximum decimal value is 2^16 - 1 = 65535

void writeValTo7Segs(unsigned int val);

//------------------
// main()
//------------------
int main() {
  volatile unsigned int switches;

  fdc_init();
  fdc_printf("Starting program.");

  while (1) {  
    switches = MFP_SWITCHES;
    writeValTo7Segs(switches);
  }
  return 0;
}

void writeValTo7Segs(unsigned int val) {

  volatile int digit, i=0;
  volatile unsigned int allDigits=0, enDigits;

  fdc_printf("val = %d.\n", val);
  
  for (i=0; ((val>0) && (i<MAXNUMDIGITS)); i++) {
    digit = val % 10;
	allDigits |= (digit<<(i*4));
    val = val / 10;
    enDigits |= 1 << i;
  }

  MFP_7SEGDIGITS = allDigits; // write value to 7-segment display
  MFP_7SEGEN = ~enDigits;     // enable subset of 7-segment displays
  
  return;
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

