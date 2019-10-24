/*
 * main.c for MIPSfpga running on Nexys4 DDR 
 * FPGA target board
 *
 * Lab 6: Reaction Timer
 *
 * This program:
 * 1. Waits for the user to press a pushbutton
 * 2. Waits a random time between 0 and 3 seconds
 * 3. Turns on the LEDs
 * 4. Waits for user to press a pushbutton
 * 5. Displays the reaction time of the user in milliseconds on the
 *    7-segment displays. The reaction time is the time between the 
 *    LEDs turning on and the user pressing a button.
 *
 * Note that "random" patterns can be hard-coded in if the student 
 * programmer doesn't yet know about the rand() library call.

 */

#include <stdlib.h>
#include "mfp_io.h"
#include "fdc.h"

void waitForUserPress();
void waitForUserRelease();
void timeReaction();
void waitRandomTime();
void delay_ms(unsigned int num);
void writeValTo7Segs(unsigned int val);

//------------------
// main()
//------------------
int main() {

  fdc_init();
  fdc_printf("Starting program.\n");

  while (1) {
	fdc_printf("Waiting for user to initiate reaction time test by pressing a button.\n");

    waitForUserPress();
    timeReaction();
    MFP_LEDS = 0xFFFFF;	 // turn on LEDs 
	waitForUserRelease();
  }
  return 0;
}

void waitForUserPress() {
  volatile unsigned int pushbutton;

  // wait until user presses a pushbutton
  do {
    pushbutton = MFP_BUTTONS; 
  } while (pushbutton == 0);
  return;
}

void waitForUserRelease() {
  volatile unsigned int pushbutton;

  // wait until user presses a pushbutton
  do {
    pushbutton = MFP_BUTTONS; 
  } while (pushbutton != 0);
  return;
}

void waitRandomTime() {
  volatile unsigned int randVal;

  randVal = rand();
  randVal = randVal % 3000; // wait some time up to 3000 ms

  delay_ms(randVal);
                    
}

void timeReaction() {
  volatile unsigned int start_ms=0, end_ms=0, diff=0;

  MFP_LEDS = 0x0;      // turn off LEDs 
  MFP_7SEGEN = 0xFF;   // clear 7-segment displays 
  waitRandomTime();

    
  start_ms = MFP_MILLIS;
  fdc_printf("Start time: %d.\n", start_ms);
  MFP_LEDS = 0xFFFF;  // turn on LEDs
  waitForUserPress();

  end_ms = MFP_MILLIS;
  MFP_LEDS = 0x0;  // turn off LEDs
  fdc_printf("End time: %d.\n", end_ms);
  diff = end_ms - start_ms;

  fdc_printf("Difference: %d.\n", diff);

  writeValTo7Segs(diff);
  
  return;
}

void delay_ms(unsigned int num) {
  volatile unsigned int start_ms=0, curr_ms=0, diff = 0;

  start_ms = MFP_MILLIS;
  while ( diff < num) {
    curr_ms = MFP_MILLIS;
    diff = curr_ms - start_ms;
  }
  return;
}

void writeValTo7Segs(unsigned int val) {

  volatile int digit, i=0;
  volatile unsigned int allDigits=0, enDigits;

  fdc_printf("val = %d.\n", val);
  
  for (i=0; (val>0); i++) {
    digit = val % 10;
	allDigits |= (digit<<(i*4));
    val = val / 10;
    enDigits |= 1 << i;
  }

  fdc_printf("MFP_7SEGDIGITS = 0x%x\t MFP_7SEGEN = 0x%x\n", allDigits, ~enDigits);
  MFP_7SEGDIGITS = allDigits; // write value to 7-segment display
  MFP_7SEGEN = ~enDigits;     // enable subset of 7-segment displays
  
  return;
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
