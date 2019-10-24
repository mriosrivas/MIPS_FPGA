/*
 * Waits until the user presses a pushbutton and then writes a random
 * value to 7-segment display 0. Uses srand to seed the random value, so 
 * each run is truly random.
 */

#include <stdlib.h>
#include "fdc.h"
#include "mfp_io.h"

void delay();

//------------------
// main()
//------------------
int main() {
  volatile unsigned int val = 0;
  volatile unsigned int pb = 0;

  // enable 7-segment display 0
  MFP_7SEGEN = 0xFE;             

  fdc_init();
  fdc_printf("Waiting for pushbutton press...\n");
  
  while (pb == 0) {
    pb = MFP_BUTTONS;
    val++;
  }
  srand(val);

  while (1) {
   val = rand() % 10;
   fdc_printf("Random value: %d\n", val);
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
