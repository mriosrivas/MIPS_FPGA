/*
 * Example using rand() to generate a random number between from 0 - 9.
*/

#include <stdlib.h>
#include "mfp_io.h"

void delay();

//------------------
// main()
//------------------
int main() {
  volatile unsigned int val = 0;
  
  // enable 7-segment display 0
  MFP_7SEGEN = 0xFE;                    

  while (1) {
   val = rand() % 10;
   MFP_7SEGDIGITS = val;
   delay();
  }
  return 0;
}

void delay() {
  volatile unsigned int j;

  for (j = 0; j < (10000000); j++) ;	// delay 
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

