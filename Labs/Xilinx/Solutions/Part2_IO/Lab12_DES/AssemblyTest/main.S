/*
 * main.S for microAptiv_UP MIPS core running on Nexys4 DDR board
 *
 * Description:
 * Stores these values in a source array at base address 0x80001b00
 * 0x596F7572 206C6970, 0x73206172 6520736D, 0x6F6F7468 65722074,
 * //0x68616E20 76617365, 0x6C696E65 0D0A0000
 *
 * Transfers data via DMA from source array to a destination array at base 
 * address 0x80001b30
 * 1. first using no encryption
 * 2. then using encryption
 *
 * 3. Then DMA transfer using decryption from destination array back to destination array
 */

.globl main
  
# $8 = I/O base
# $9 = DMA/DES register base
# $10 = source array base address
# $11 = destination array base address
# $12 = temporary
main:
  # set up registers
  lui   $9,  0xbf30        # $9 = DMA/DES register base
  lui   $10, 0x8000        # $10 = source array base address
  ori   $10, $10, 0x1b00  
  lui   $11, 0x8000        # $11 = destination array base address
  ori   $11, $11, 0x1b30  

  # initialize source array
  li    $12, 0x206C6970
  sw    $12, 0($10)
  li    $12, 0x596F7572
  sw    $12, 4($10)
  li    $12, 0x6520736D
  sw    $12, 8($10)
  li    $12, 0x73206172
  sw    $12, 0xc($10)
  li    $12, 0x65722074
  sw    $12, 0x10($10)
  li    $12, 0x6F6F7468
  sw    $12, 0x14($10)
  add   $a0, $0, $10      # $a0 = source array base address
  jal   display           # display values of source array

  # set up DMA and DES
  sw    $10, 0($9)        # DMA source address = source array
  sw    $11, 4($9)        # DMA destination address - destination array
  addi  $12, $0, 24       # size of transfer (=number of bytes in array)
  sw    $12, 8($9)
  li    $12, 0xEA6D0D73   # keylo
  sw    $12, 0x10($9)
  li    $12, 0x0E329232   # keyhi
  sw    $12, 0x14($9)

  # 1. Transfer data from source to destination without encryption
  sw    $0,  0x18($9)     # start with no encryption
  addi  $12, $0, 1        # start DMA transfer
  sw    $12, 0xc($9)      # DMAstart = 1  
  add   $a0, $0, $11      # $a0 = destination array base address
  jal   display           # display values of destination array
  nop                     # branch delay slot
  nop
  
  # 2. Transfer data from source to destination with encryption
  addi  $12, $0, 1        # dma with encryption
  sw    $12,  0x18($9)      
  addi  $12, $0, 1        # start DMA transfer
  sw    $12, 0xc($9)      # DMAstart = 1  
  add   $a0, $0, $11      # $a0 = destination array base address
  jal   display           # display values of destination array
  nop                     # branch delay slot

  # 3. Transfer data from destination to destination with decryption
  sw    $11, 0($9)        # DMA source address = destination array
  addi  $12, $0, 2        # dma with decryption
  sw    $12,  0x18($9)      
  addi  $12, $0, 1        # start DMA transfer
  sw    $12, 0xc($9)      # DMAstart = 1  
  add   $a0, $0, $11      # $a0 = destination array base address
  jal   display           # display values of destination array
  nop                     # branch delay slot

L2:
  beq   $0, $0, L2        # loop forever
  nop                     # branch delay slot
  
  
display:
  lui   $8,  0xbf80       # $8 = I/O base
  sw    $0,  0xc($8)      # enable 7-segment displays
  addi  $12, $a0, 24      # end of array
repeat:
  beq   $a0, $12, done
  nop                     # branch delay slot
  lw    $13, 0($a0)       # $13 = array element
  sw    $13, 0x10($8)     # show array contents on 7-segment display 
  addi  $a0, $a0, 4       # increment array address to point to next element in array
  j     repeat
  nop                     # branch delay slot

done:
  jr    $ra
  nop                     # branch delay slot
