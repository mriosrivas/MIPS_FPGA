	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	writeValTo7Segs
.LFB1 = .
	.file 1 "main.c"
	.loc 1 218 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7Segs
	.type	writeValTo7Segs, @function
writeValTo7Segs:
	.frame	$sp,16,$31		# vars= 16, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	addiu	$sp,$sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 220 0
	sw	$0,4($sp)
	.loc 1 221 0
	sw	$0,8($sp)
	.loc 1 224 0
	sw	$0,4($sp)
	beq	$4,$0,.L2
	nop

	lw	$2,4($sp)
	slt	$2,$2,8
	beq	$2,$0,.L2
	nop

	.loc 1 225 0 discriminator 4
	li	$6,-859045888			# 0xffffffffcccc0000
	ori	$6,$6,0xcccd
	.loc 1 228 0 discriminator 4
	li	$7,1			# 0x1
	.loc 1 225 0 discriminator 4
	multu	$4,$6
.L7:
	mfhi	$5
	srl	$2,$5,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,0($sp)
	.loc 1 226 0 discriminator 4
	lw	$3,0($sp)
	lw	$2,4($sp)
	lw	$4,8($sp)
.LVL1 = .
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$4
	sw	$2,8($sp)
	.loc 1 227 0 discriminator 4
	srl	$4,$5,3
.LVL2 = .
	.loc 1 228 0 discriminator 4
	lw	$2,4($sp)
	lw	$3,12($sp)
	sll	$2,$7,$2
	or	$2,$2,$3
	sw	$2,12($sp)
	.loc 1 224 0 discriminator 4
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
	beq	$4,$0,.L2
	nop

	.loc 1 224 0 is_stmt 0 discriminator 3
	lw	$2,4($sp)
	slt	$2,$2,8
	bne	$2,$0,.L7
	multu	$4,$6

.L2:
	.loc 1 231 0 is_stmt 1
	lw	$2,8($sp)
	li	$3,-1082130432			# 0xffffffffbf800000
	sw	$2,16($3)
	.loc 1 232 0
	lw	$2,12($sp)
	nor	$2,$0,$2
	sw	$2,12($3)
	.loc 1 235 0
	jr	$31
	addiu	$sp,$sp,16

	.cfi_def_cfa_offset 0
	.set	macro
	.set	reorder
	.end	writeValTo7Segs
	.cfi_endproc
.LFE1:
	.size	writeValTo7Segs, .-writeValTo7Segs
	.align	2
	.globl	main
.LFB0 = .
	.loc 1 48 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,48,$31		# vars= 0, regs= 8/0, args= 16, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
.LVL3 = .
	.loc 1 55 0
	move	$2,$0
	.loc 1 56 0
	lui	$5,%hi(A)
	addiu	$5,$5,%lo(A)
	.loc 1 57 0
	lui	$4,%hi(B)
	addiu	$4,$4,%lo(B)
	.loc 1 55 0
	li	$7,32			# 0x20
.LVL4 = .
	.loc 1 56 0 discriminator 3
	sll	$3,$2,2
.L29:
	addu	$6,$3,$5
	sw	$2,0($6)
	.loc 1 57 0 discriminator 3
	addu	$3,$3,$4
	sw	$2,0($3)
	.loc 1 55 0 discriminator 3
	addiu	$2,$2,1
.LVL5 = .
	.set	noreorder
	.set	nomacro
	bne	$2,$7,.L29
	sll	$3,$2,2
	.set	macro
	.set	reorder

	move	$2,$0
.LVL6 = .
	.loc 1 60 0
	lui	$4,%hi(D)
	addiu	$4,$4,%lo(D)
	.loc 1 59 0
	li	$5,512			# 0x200
.LVL7 = .
	.loc 1 60 0 discriminator 3
	sll	$3,$2,2
.L30:
	addu	$3,$3,$4
	sw	$2,0($3)
	.loc 1 59 0 discriminator 3
	addiu	$2,$2,1
.LVL8 = .
	.set	noreorder
	.set	nomacro
	bne	$2,$5,.L30
	sll	$3,$2,2
	.set	macro
	.set	reorder

	.loc 1 48 0
	addiu	$sp,$sp,-48
	.cfi_def_cfa_offset 48
	sw	$31,44($sp)
	sw	$22,40($sp)
	sw	$21,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 22, -8
	.cfi_offset 21, -12
	.cfi_offset 20, -16
	.cfi_offset 19, -20
	.cfi_offset 18, -24
	.cfi_offset 17, -28
	.cfi_offset 16, -32
	.loc 1 64 0
 #APP
 # 64 "main.c" 1
	   li $t1, 4096;   li $t2, 0;   lui $t3, 0x0;loop1:   cache 0x01, 0($t3);   addiu $t3, $t3, 16;   addiu $t2, $t2, 1;   blt $t2, $t1, loop1;
 # 0 "" 2
	.loc 1 79 0
 # 79 "main.c" 1
	   li $t1, 32;   li $t2, 0;   li $t3, 0;   lui $t4, 0x8000;   addiu $t4, $t4, A;   lui $t5, 0x8000;   addiu $t5, $t5, B;   lui $t6, 0x8000;   addiu $t6, $t6, C;   loop2:   lw  $t7, 0($t4);   addiu $t4, $t4, 4;   nop;   lw  $t8, 0($t5);   addiu $t5, $t5, 4;   nop;   add $t9,$t8,$t7;   sw $t9, 0($t6);   addiu $t6, $t6, 4;   nop;   addiu $t2, $t2, 1;   blt $t2, $t1, loop2;
 # 0 "" 2
 #NO_APP
.LBB2 = .
	.loc 1 107 0
	li	$2,322			# 0x142
.LVL9 = .
 #APP
 # 107 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,354			# 0x162
 #APP
 # 107 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 107 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 107 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 111 0
 #APP
 # 111 "main.c" 1
	   li $t1, 16;   li $t2, 0;   li $t3, 0;   lui $t6, 0x8000;   addiu $t6, $t6, C;   lui $t4, 0x8000;   addiu $t4, $t4, C;   sll $t5, $t1, 3;   addiu $t5, $t5, -4;   add $t4, $t4, $t5;   lui $t5, 0x8000;   addiu $t5, $t5, R;   loop3:   lw  $t7, 0($t6);   addiu $t6, $t6, 4;   nop;   nop;   nop;   nop;   nop;   lw  $t8, 0($t4);   addiu $t4, $t4, -4;   sub $t7, $t8, $t7;   nop;   nop;   nop;   nop;   nop;   sw $t7, 0($t5);   addiu $t5, $t5, 4;   nop;   nop;   nop;   nop;   nop;   nop;   addiu $t2, $t2, 1;   blt $t2, $t1, loop3;   add $22, $t7, $zero;
 # 0 "" 2
.LVL10 = .
 #NO_APP
.LBB3 = .
.LBB4 = .
	.loc 1 157 0
 #APP
 # 157 "main.c" 1
	mfc0 $21,$25,1
 # 0 "" 2
.LVL11 = .
 #NO_APP
.LBE4 = .
.LBB5 = .
 #APP
 # 157 "main.c" 1
	mfc0 $20,$25,3
 # 0 "" 2
.LVL12 = .
 #NO_APP
.LBE5 = .
 #APP
 # 157 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 157 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 157 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 157 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE3 = .
	.loc 1 162 0
 #APP
 # 162 "main.c" 1
	   li $t1, 512;   li $t2, 0;   li $t3, 0;   lui $t4, 0x8000;   addiu $t4, $t4, D;   loop4:   lw  $t7, 0($t4);   add $t3, $t3, $t7;   addiu $t4, $t4, 4;   nop;   addiu $t2, $t2, 1;   blt $t2, $t1, loop4;
 # 0 "" 2
	.loc 1 182 0
 #NO_APP
	li	$16,-1082130432			# 0xffffffffbf800000
	lui	$17,%hi(.L14)
	addiu	$17,$17,%lo(.L14)
	.loc 1 199 0
	li	$18,1			# 0x1
	.loc 1 195 0
	li	$19,7			# 0x7
.L11:
	.loc 1 182 0
	lw	$2,4($16)
	sltu	$3,$2,7
	.set	noreorder
	.set	nomacro
	beq	$3,$0,.L12
	sll	$2,$2,2
	.set	macro
	.set	reorder

	addu	$2,$17,$2
	lw	$2,0($2)
	jr	$2
	.rdata
	.align	2
	.align	2
.L14:
	.word	.L13
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.text
.L13:
	.loc 1 184 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$21
	.set	macro
	.set	reorder

.LVL13 = .
	.loc 1 185 0
	b	.L11
.L15:
	.loc 1 187 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$20
	.set	macro
	.set	reorder

.LVL14 = .
	.loc 1 188 0
	b	.L11
.L16:
.LBB6 = .
	.loc 1 191 0
 #APP
 # 191 "main.c" 1
	mfc0 $4,$16,1
 # 0 "" 2
.LVL15 = .
 #NO_APP
.LBE6 = .
	ext	$4,$4,7,3
.LVL16 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	addiu	$4,$4,1
	.set	macro
	.set	reorder

.LVL17 = .
	.loc 1 192 0
	b	.L11
.L17:
.LBB7 = .
	.loc 1 195 0
 #APP
 # 195 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
.LVL18 = .
 #NO_APP
.LBE7 = .
	ext	$2,$2,13,3
.LVL19 = .
	.set	noreorder
	.set	nomacro
	beql	$2,$19,.L24
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

.LBB8 = .
	.loc 1 195 0 is_stmt 0 discriminator 1
 #APP
 # 195 "main.c" 1
	mfc0 $4,$16,1
 # 0 "" 2
.LVL20 = .
 #NO_APP
.LBE8 = .
	ext	$4,$4,13,3
.LVL21 = .
	addiu	$4,$4,6
	sll	$4,$18,$4
.L24:
	.loc 1 195 0 discriminator 4
	jal	writeValTo7Segs
.LVL22 = .
	.loc 1 196 0 is_stmt 1 discriminator 4
	b	.L11
.L18:
.LBB9 = .
	.loc 1 199 0
 #APP
 # 199 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
.LVL23 = .
 #NO_APP
.LBE9 = .
	ext	$2,$2,10,3
.LVL24 = .
	.set	noreorder
	.set	nomacro
	beq	$2,$0,.L23
	move	$4,$0
	.set	macro
	.set	reorder

.LBB10 = .
	.loc 1 199 0 is_stmt 0 discriminator 1
 #APP
 # 199 "main.c" 1
	mfc0 $4,$16,1
 # 0 "" 2
.LVL25 = .
 #NO_APP
.LBE10 = .
	ext	$4,$4,10,3
.LVL26 = .
	addiu	$4,$4,1
	sll	$4,$18,$4
.L23:
	.loc 1 199 0 discriminator 4
	jal	writeValTo7Segs
.LVL27 = .
	.loc 1 200 0 is_stmt 1 discriminator 4
	b	.L11
.L19:
.LBB11 = .
	.loc 1 203 0
 #APP
 # 203 "main.c" 1
	mfc0 $4,$16,0
 # 0 "" 2
.LVL28 = .
 #NO_APP
.LBE11 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	andi	$4,$4,0x7
	.set	macro
	.set	reorder

.LVL29 = .
	.loc 1 204 0
	b	.L11
.L20:
	.loc 1 206 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$22
	.set	macro
	.set	reorder

.LVL30 = .
	.loc 1 207 0
	b	.L11
.L12:
	.loc 1 209 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$0
	.set	macro
	.set	reorder

.LVL31 = .
	b	.L11
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	_mips_handle_exception
.LFB2 = .
	.loc 1 239 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL32 = .
	.loc 1 240 0
	li	$3,32769			# 0x8001
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$3,0($2)
.L32:
	.loc 1 241 0 discriminator 1
	b	.L32
	nop

	.set	macro
	.set	reorder
	.end	_mips_handle_exception
	.cfi_endproc
.LFE2:
	.size	_mips_handle_exception, .-_mips_handle_exception

	.comm	D,2048,16

	.comm	R,64,16

	.comm	C,128,16

	.comm	B,128,16

	.comm	A,128,16
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x345
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x1
	.4byte	.LASF18
	.4byte	.LASF19
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.2byte	0x393
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x8
	.byte	0x1
	.byte	0x1c
	.4byte	0x6e
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1e
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x21
	.4byte	0x4d
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0xda
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd4
	.uleb128 0x9
	.ascii	"val\000"
	.byte	0x1
	.byte	0xda
	.4byte	0x2c
	.4byte	.LLST0
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.byte	0xdc
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0xdd
	.4byte	0xd9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x1
	.byte	0xdd
	.4byte	0xd9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xc
	.4byte	0x46
	.uleb128 0xc
	.4byte	0x2c
	.uleb128 0xd
	.4byte	.LASF11
	.byte	0x1
	.byte	0x30
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27a
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x46
	.4byte	.LLST1
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x46
	.uleb128 0x1
	.byte	0x66
	.uleb128 0xf
	.4byte	.LASF12
	.byte	0x1
	.byte	0x32
	.4byte	0x46
	.byte	0
	.uleb128 0x10
	.4byte	.LASF13
	.byte	0x1
	.byte	0x33
	.4byte	0x6e
	.4byte	.LLST2
	.uleb128 0x11
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x145
	.uleb128 0xb
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x9d
	.4byte	0x25
	.uleb128 0x1
	.byte	0x65
	.byte	0
	.uleb128 0x11
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x160
	.uleb128 0xb
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x9d
	.4byte	0x25
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0x11
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x17d
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x25
	.4byte	.LLST3
	.byte	0
	.uleb128 0x11
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x19a
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xc3
	.4byte	0x25
	.4byte	.LLST4
	.byte	0
	.uleb128 0x11
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x1b7
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xc3
	.4byte	0x25
	.4byte	.LLST5
	.byte	0
	.uleb128 0x11
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x1d4
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xc7
	.4byte	0x25
	.4byte	.LLST6
	.byte	0
	.uleb128 0x11
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.4byte	0x1f1
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xc7
	.4byte	0x25
	.4byte	.LLST7
	.byte	0
	.uleb128 0x11
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0x20a
	.uleb128 0x12
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xcb
	.4byte	0x25
	.byte	0
	.uleb128 0x13
	.4byte	.LVL13
	.4byte	0x79
	.4byte	0x21e
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x85
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL14
	.4byte	0x79
	.4byte	0x232
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL17
	.4byte	0x79
	.uleb128 0x15
	.4byte	.LVL22
	.4byte	0x79
	.uleb128 0x15
	.4byte	.LVL27
	.4byte	0x79
	.uleb128 0x15
	.4byte	.LVL29
	.4byte	0x79
	.uleb128 0x13
	.4byte	.LVL30
	.4byte	0x79
	.4byte	0x26a
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x86
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL31
	.4byte	0x79
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0xef
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2aa
	.uleb128 0x17
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0xef
	.4byte	0x2aa
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x18
	.4byte	.LASF15
	.byte	0x1
	.byte	0xef
	.4byte	0x46
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x19
	.byte	0x4
	.uleb128 0x1a
	.4byte	0x46
	.4byte	0x2bc
	.uleb128 0x1b
	.4byte	0x2bc
	.byte	0x1f
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x1c
	.ascii	"A\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x2d2
	.uleb128 0x5
	.byte	0x3
	.4byte	A
	.uleb128 0xc
	.4byte	0x2ac
	.uleb128 0x1c
	.ascii	"B\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x2e6
	.uleb128 0x5
	.byte	0x3
	.4byte	B
	.uleb128 0xc
	.4byte	0x2ac
	.uleb128 0x1c
	.ascii	"C\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x2fa
	.uleb128 0x5
	.byte	0x3
	.4byte	C
	.uleb128 0xc
	.4byte	0x2ac
	.uleb128 0x1a
	.4byte	0x46
	.4byte	0x30f
	.uleb128 0x1b
	.4byte	0x2bc
	.byte	0xf
	.byte	0
	.uleb128 0x1c
	.ascii	"R\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x31e
	.uleb128 0x5
	.byte	0x3
	.4byte	R
	.uleb128 0xc
	.4byte	0x2ff
	.uleb128 0x1a
	.4byte	0x46
	.4byte	0x334
	.uleb128 0x1d
	.4byte	0x2bc
	.2byte	0x1ff
	.byte	0
	.uleb128 0x1c
	.ascii	"D\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x343
	.uleb128 0x5
	.byte	0x3
	.4byte	D
	.uleb128 0xc
	.4byte	0x323
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x5
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x6
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x64
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"event2\000"
.LASF18:
	.ascii	"main.c\000"
.LASF6:
	.ascii	"test_result_t\000"
.LASF3:
	.ascii	"event1\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF19:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_WriteAllocat"
	.ascii	"ionPolicies_BlueFragment\000"
.LASF5:
	.ascii	"reg32_t\000"
.LASF9:
	.ascii	"enDigits\000"
.LASF17:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF11:
	.ascii	"main\000"
.LASF12:
	.ascii	"result\000"
.LASF8:
	.ascii	"allDigits\000"
.LASF14:
	.ascii	"_mips_handle_exception\000"
.LASF15:
	.ascii	"reason\000"
.LASF10:
	.ascii	"writeValTo7Segs\000"
.LASF7:
	.ascii	"digit\000"
.LASF13:
	.ascii	"test_result\000"
.LASF16:
	.ascii	"sizetype\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
