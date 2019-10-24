/*
 * main.c for MIPSfpga running on the Nexys4 DDR
 * FPGA target board
 *
 * Lab 07:
 * Plays a song on the buzzer. The song is the Star Wars theme.
 */

#include <stdlib.h>
#include "mfp_io.h"
#include "fdc.h"
#define ARRAYSIZE 18

void tone(unsigned int freq); 
void noTone();
void delay_ms(unsigned int num);
void writeValTo7Segs(unsigned int val);

//------------------
// main()
//------------------
int main() {
  volatile int i;

  int frequency[ARRAYSIZE] = {294, 294, 392, 587, 523, 494, 440, 
    784, 587, 523, 494, 440, 784, 587, 523, 494, 523, 440};
  int duration[18] = {220, 220, 970, 470, 135, 135, 135, 970, 
    470, 135, 135, 135, 970, 470, 135, 135, 135, 1500};

  fdc_init();
  fdc_printf("Starting program.\n");

  while (1) {
    for (i=0; i < ARRAYSIZE; i++) {
      writeValTo7Segs(frequency[i]);
      tone(frequency[i]);     // write tone to speaker
      delay_ms(duration[i]);  // wait duration of note

      noTone();               // 10 ms silence between notes
      delay_ms(10);
    }
  }
}

// Represent frequency as the number of microseconds in 1/2 of a period
void tone(unsigned int freq) {
  if ((freq == 0) | (freq > 2000))
    MFP_BUZZER = 0;
  else
    MFP_BUZZER = 500000/freq;
}

void noTone() {
  tone(0);
}


void delay_ms(unsigned int num) {
  volatile unsigned int start_ms=0, curr_ms=0, diff = 0;

  start_ms = MFP_MILLIS;
  while ( diff < num) {
    curr_ms = MFP_MILLIS;
    diff = curr_ms - start_ms;
  }
}

void writeValTo7Segs(unsigned int val) {

  volatile int digit, i=0;
  volatile unsigned int allDigits=0, enDigits;

  for (i=0; (val>0); i++) {
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
