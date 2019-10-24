/*
 * main.S for microAptiv_UP MIPS core running on Nexys4 DDR board
 *
 * Description:
 * Writes the values 0-7 to the eight 7-segment display on
 * the Nexys4-DDR board. 
 */

.globl main
  
# $8 = I/O base
# $9 = cnt (value to write to 7-segment dislays)
# $10 = 0 and digit values
# $12 = 4 (bit width of digits)
# $13 = temporary variable (holds number of bits to shift left)
# $14 = concatenated value of 8 7-segment display digits 
main:
  lui   $8, 0xbf80        # I/O register base
  addiu $9, $0, 7         # cnt = 7
  addi  $10, $0, 0x0      # $10 = 0
  sw    $10, 0xc($8)      # enable all 8 of the 7-segment displays
  add   $11, $0, $0       # $11 = 0 (start with digit 0)
  addi  $12, $0, 4        # $12 = 4 (bit-width of each digit value)
  add   $14, $0, $0       # initialize digits register
L1:
  mul   $13, $9,  $12     # $13 = digit # * bit width = amount to shift by
  sllv  $10, $9,  $13     # $10 = cnt << (digit*bit width)
  or    $14, $14, $10     # $14 |= new digit value
  addi  $9,  $9,  -1      # cnt--
  ble   $0,  $9,  L1      # repeat
  nop                     # branch delay slot
  sw    $14,  0x10($8)    # write to the eight 7-segment display digits 

L2:
  beq   $0, $0, L2        # loop forever
  nop                     # branch delay slot