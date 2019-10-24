/*
 * main.c for the MIPSfpga core running on the Nexys4 DDR
 * FPGA target board.
 *
 * Lab 04: Memory Game. 
 *
 * This program:
 * 1. Waits for the user to press any key (pushbutton).
 * 2. Creates some random LED flashes on the three right-most.
 * 3. Detects the user keypresses on the left, center, and right 
 *    pushbuttons (BTNL, BTNC, and BTNR).
 * 4. Computes the number of correct user entries and lights up that 
 *    number of LEDs.
 * 5. Repeats
 *
 * Note that "random" patterns can be hard-coded in if the student 
 * programmer doesn't yet know about the rand() library call.
 */

#include <stdlib.h>
#include "mfp_io.h"

#define NUMLIGHTS 8
#define LEFT 4
#define MIDDLE 2
#define RIGHT 1

void delay(int reps);
int  getUserPress();
void getUserRelease();
void generateRandomPattern(int *pattern);
void displayPattern(int *pattern);
void detectKeyPresses(int *keys);
void displayScore(int *pattern, int *keys);

//------------------
// main()
//------------------
int main() {
  int pattern[15];
  int keys[15];

  MFP_LEDS = 0xffff;
  while (1) {
    getUserPress();
    generateRandomPattern(pattern);
    displayPattern(pattern);
    detectKeyPresses(keys);
    displayScore(pattern, keys);
  }
  return 0;
}


void delay(int reps) {
  volatile unsigned int i, j;

  for (i = 0; i < reps; i++)
    for (j = 0; j < 10000; j++) 
      ;	// delay 
}

int getUserPress() {
  volatile int pb;

  do {
    pb = MFP_BUTTONS;
  } while (pb == 0);
  return pb;
}

void getUserRelease() {
  volatile int pb;

  do {
    pb = MFP_BUTTONS;
  } while (pb != 0);
}

void generateRandomPattern(int *pattern) {
  volatile int i, val;

  for (i = 0; i < NUMLIGHTS; i++) {
    val = rand() % 3;
    val = 1 << val;
    pattern[i] = val;
  }
}

void displayPattern(int *pattern) {
  volatile int i;

  MFP_LEDS = 0xffff;
  delay(500);

  for (i = 0; i < NUMLIGHTS; i++) {
    MFP_LEDS = pattern[i];
    delay(200);
    MFP_LEDS = 0;
    delay(100);
  }
  MFP_LEDS = 0;
}

void detectKeyPresses(int *keys) {
  volatile int pb, i;
  volatile int numGuesses = 0;

  for (i=0; i < NUMLIGHTS; i++) {
    pb = getUserPress();
    keys[i] = pb;
    delay(100);
    getUserRelease();
    numGuesses = (numGuesses << 1) | 1;
    MFP_LEDS = numGuesses;
  }
  delay(300);
}

void displayScore(int *pattern, int *keys) {
  volatile int i, score = 0;

  MFP_LEDS = 0;
  delay(200);
  for (i=0; i < NUMLIGHTS; i++) {
    if (pattern[i] == keys[i])
      score = (score << 1) | 1;
  }
  MFP_LEDS = score;
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

