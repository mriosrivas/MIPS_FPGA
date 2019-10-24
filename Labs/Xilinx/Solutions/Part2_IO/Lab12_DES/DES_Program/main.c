/*
 * Exercising DES Engine.
 */

#include "fdc.h"
#include "mfp_io.h"

#define ARRAYSIZE 500

void initarray(int* arr, int mult, unsigned int size);
void displayarray(int* arr, unsigned int size);
void setupDES(unsigned int keyhi, unsigned int keylo, unsigned int encryptDecrypt);
void dma(unsigned int src, unsigned int dst, unsigned int size);
void doDMA(int *src, int *dst, unsigned int size);
void dmaNoEncryption();
void dmaEnDecryption();
void flushCache();

int src[ARRAYSIZE];
int dst[ARRAYSIZE];

int main() {
  
  fdc_init();
  fdc_printf("Starting program.\n");

  initarray(src, 1, ARRAYSIZE);
  dmaNoEncryption();
  dmaEnDecryption();
  while(1)        // infinite loop
    ;

  return 0;
}

void dmaNoEncryption() { 
  fdc_printf("DMA with no encryption:\n");
  setupDES(0x12345678, 0xAABBCCDD, 0);
  doDMA(src, dst, ARRAYSIZE);
}

void dmaEnDecryption() { 
  fdc_printf("DMA with encryption:\n");
  setupDES(0x12345678, 0xAABBCCDD, 1);
  doDMA(src, dst, ARRAYSIZE);

  fdc_printf("DMA with decryption:\n");
  setupDES(0x12345678, 0xAABBCCDD, 2);
  doDMA(dst, dst, ARRAYSIZE);
}

void doDMA(int *src, int *dst, unsigned int size) {
  fdc_printf("Values of SOURCE array (0x%x) before DMA:\n", (unsigned int) src);	  
  displayarray(src, size);
  fdc_printf("Values of DESTINATION array (0x%x) before DMA:\n", (unsigned int) dst);	  
  displayarray(dst, size);
  flushCache(); // flush the cache before DMA
  dma((unsigned int)src, (unsigned int)dst, size*4);

  fdc_printf("Values of DESTINATION array AFTER DMA:\n");
  displayarray(dst, size);	  
}	  
void initarray(int* arr, int mult, unsigned int size) {
	int i;

	for (i=0; i<size; i++)
      arr[i] = i*mult;
}

// display array data
void displayarray(int* arr, unsigned int size) {
	int i;

    fdc_printf("Displaying array at address: 0x%x, size = %d\n", arr, size);	  
	
    for (i=0; i<size; i++) {
      fdc_printf("arr[%d] = 0x%x (%d)\n", i, arr[i], arr[i]);
      while (MFP_BUTTONS)    // pause if any buttons pushed
        ;
	}
}

void setupDES(unsigned int keyhi, unsigned int keylo, unsigned int encryptDecrypt) {
  MFP_DESKEYHI      = keyhi;
  MFP_DESKEYLO      = keylo;
  MFP_DESENDECRYPT  = encryptDecrypt;
}

void dma(unsigned int src, unsigned int dst, unsigned int size) {
  MFP_DMASRC = (unsigned int) src;
  MFP_DMADST = (unsigned int) dst;
  MFP_DMASIZE = size;
  MFP_DMASTART = 1;
}

void flushCache() {
	// Flush the data cache with the CACHE instruction, block by block.
	asm volatile
    ( 
        // $t1 should be set to (TOTAL_CACHE_SIZE_IN_BYTES)/16.
        "   li $t1, 256;"       
        "   li $t2, 0;"
        "   lui $t3, 0x0;"
        "loop1:"
        "   cache 0x01, 0($t3);"    
        "   addiu $t3, $t3, 16;"
        "   addiu $t2, $t2, 1;"
        "   blt $t2, $t1, loop1;"
    );
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
