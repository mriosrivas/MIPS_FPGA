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
	.loc 1 124 0
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
	.loc 1 126 0
	sw	$0,4($sp)
	.loc 1 127 0
	sw	$0,8($sp)
	.loc 1 130 0
	sw	$0,4($sp)
	beq	$4,$0,.L2
	nop

	lw	$2,4($sp)
	slt	$2,$2,8
	beq	$2,$0,.L2
	nop

	.loc 1 131 0 discriminator 4
	li	$6,-859045888			# 0xffffffffcccc0000
	ori	$6,$6,0xcccd
	.loc 1 134 0 discriminator 4
	li	$7,1			# 0x1
	.loc 1 131 0 discriminator 4
	multu	$4,$6
.L7:
	mfhi	$5
	srl	$2,$5,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,0($sp)
	.loc 1 132 0 discriminator 4
	lw	$3,0($sp)
	lw	$2,4($sp)
	lw	$4,8($sp)
.LVL1 = .
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$4
	sw	$2,8($sp)
	.loc 1 133 0 discriminator 4
	srl	$4,$5,3
.LVL2 = .
	.loc 1 134 0 discriminator 4
	lw	$2,4($sp)
	lw	$3,12($sp)
	sll	$2,$7,$2
	or	$2,$2,$3
	sw	$2,12($sp)
	.loc 1 130 0 discriminator 4
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
	beq	$4,$0,.L2
	nop

	.loc 1 130 0 is_stmt 0 discriminator 3
	lw	$2,4($sp)
	slt	$2,$2,8
	bne	$2,$0,.L7
	multu	$4,$6

.L2:
	.loc 1 137 0 is_stmt 1
	lw	$2,8($sp)
	li	$3,-1082130432			# 0xffffffffbf800000
	sw	$2,16($3)
	.loc 1 138 0
	lw	$2,12($sp)
	nor	$2,$0,$2
	sw	$2,12($3)
	.loc 1 141 0
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
	.loc 1 37 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,48,$31		# vars= 0, regs= 7/0, args= 16, gp= 0
	.mask	0x803f0000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-48
	.cfi_def_cfa_offset 48
	sw	$31,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 21, -8
	.cfi_offset 20, -12
	.cfi_offset 19, -16
	.cfi_offset 18, -20
	.cfi_offset 17, -24
	.cfi_offset 16, -28
	.loc 1 43 0
 #APP
 # 43 "main.c" 1
	   li $t1, 4096;   li $t2, 0;   lui $t3, 0x0;loop1:   cache 0x01, 0($t3);   addiu $t3, $t3, 16;   addiu $t2, $t2, 1;   blt $t2, $t1, loop1;
 # 0 "" 2
 #NO_APP
.LBB2 = .
	.loc 1 57 0
	li	$2,322			# 0x142
 #APP
 # 57 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,354			# 0x162
 #APP
 # 57 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 57 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 57 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 59 0
 #APP
 # 59 "main.c" 1
	   li $t1, 2;   li $t6, 256;   li $t3, 0;   loop3:      lui $t4, 0x8000;      addiu $t4, $t4, test_data;      li $t2, 0;      loop2:         lw  $t5, 0($t4);         addiu $t4, $t4, 16;         nop;         nop;         nop;         nop;         nop;         nop;         addiu $t2, $t2, 1;         blt $t2, $t6, loop2;      addiu $t3, $t3, 1;      blt $t3, $t1, loop3;
 # 0 "" 2
 #NO_APP
.LBB3 = .
.LBB4 = .
	.loc 1 84 0
 #APP
 # 84 "main.c" 1
	mfc0 $21,$25,1
 # 0 "" 2
.LVL3 = .
 #NO_APP
.LBE4 = .
.LBB5 = .
 #APP
 # 84 "main.c" 1
	mfc0 $20,$25,3
 # 0 "" 2
.LVL4 = .
 #NO_APP
.LBE5 = .
 #APP
 # 84 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 84 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 84 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 84 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE3 = .
	.loc 1 89 0
	li	$16,-1082130432			# 0xffffffffbf800000
	lui	$17,%hi(.L12)
	addiu	$17,$17,%lo(.L12)
	.loc 1 107 0
	li	$18,1			# 0x1
	.loc 1 103 0
	li	$19,7			# 0x7
.L9:
	.loc 1 89 0
	lw	$2,4($16)
	sltu	$3,$2,6
	.set	noreorder
	.set	nomacro
	beq	$3,$0,.L10
	sll	$2,$2,2
	.set	macro
	.set	reorder

	addu	$2,$17,$2
	lw	$2,0($2)
	jr	$2
	.rdata
	.align	2
	.align	2
.L12:
	.word	.L11
	.word	.L13
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
	.text
.L11:
	.loc 1 92 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$21
	.set	macro
	.set	reorder

.LVL5 = .
	.loc 1 93 0
	b	.L9
.L13:
	.loc 1 95 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$20
	.set	macro
	.set	reorder

.LVL6 = .
	.loc 1 96 0
	b	.L9
.L14:
.LBB6 = .
	.loc 1 99 0
 #APP
 # 99 "main.c" 1
	mfc0 $4,$16,1
 # 0 "" 2
.LVL7 = .
 #NO_APP
.LBE6 = .
	ext	$4,$4,7,3
.LVL8 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	addiu	$4,$4,1
	.set	macro
	.set	reorder

.LVL9 = .
	.loc 1 100 0
	b	.L9
.L15:
.LBB7 = .
	.loc 1 103 0
 #APP
 # 103 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
.LVL10 = .
 #NO_APP
.LBE7 = .
	ext	$2,$2,13,3
.LVL11 = .
	.set	noreorder
	.set	nomacro
	beql	$2,$19,.L21
	li	$4,32			# 0x20
	.set	macro
	.set	reorder

.LBB8 = .
	.loc 1 103 0 is_stmt 0 discriminator 1
 #APP
 # 103 "main.c" 1
	mfc0 $4,$16,1
 # 0 "" 2
.LVL12 = .
 #NO_APP
.LBE8 = .
	ext	$4,$4,13,3
.LVL13 = .
	addiu	$4,$4,6
	sll	$4,$18,$4
.L21:
	.loc 1 103 0 discriminator 4
	jal	writeValTo7Segs
.LVL14 = .
	.loc 1 104 0 is_stmt 1 discriminator 4
	b	.L9
.L16:
.LBB9 = .
	.loc 1 107 0
 #APP
 # 107 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
.LVL15 = .
 #NO_APP
.LBE9 = .
	ext	$2,$2,10,3
.LVL16 = .
	.set	noreorder
	.set	nomacro
	beq	$2,$0,.L20
	move	$4,$0
	.set	macro
	.set	reorder

.LBB10 = .
	.loc 1 107 0 is_stmt 0 discriminator 1
 #APP
 # 107 "main.c" 1
	mfc0 $4,$16,1
 # 0 "" 2
.LVL17 = .
 #NO_APP
.LBE10 = .
	ext	$4,$4,10,3
.LVL18 = .
	addiu	$4,$4,1
	sll	$4,$18,$4
.L20:
	.loc 1 107 0 discriminator 4
	jal	writeValTo7Segs
.LVL19 = .
	.loc 1 108 0 is_stmt 1 discriminator 4
	b	.L9
.L17:
.LBB11 = .
	.loc 1 111 0
 #APP
 # 111 "main.c" 1
	mfc0 $4,$16,0
 # 0 "" 2
.LVL20 = .
 #NO_APP
.LBE11 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	andi	$4,$4,0x7
	.set	macro
	.set	reorder

.LVL21 = .
	.loc 1 112 0
	b	.L9
.L10:
	.loc 1 115 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$0
	.set	macro
	.set	reorder

.LVL22 = .
	b	.L9
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main

	.comm	test_data,20000,16
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x268
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x1
	.4byte	.LASF15
	.4byte	.LASF16
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
	.byte	0x1a
	.4byte	0x6e
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1c
	.4byte	0x46
	.byte	0
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1d
	.4byte	0x46
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x1f
	.4byte	0x4d
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x7c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd4
	.uleb128 0x9
	.ascii	"val\000"
	.byte	0x1
	.byte	0x7c
	.4byte	0x2c
	.4byte	.LLST0
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.byte	0x7e
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7e
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0x7f
	.4byte	0xd9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x1
	.byte	0x7f
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
	.byte	0x25
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x242
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x1
	.byte	0x27
	.4byte	0x6e
	.4byte	.LLST1
	.uleb128 0xf
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x121
	.uleb128 0xb
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x54
	.4byte	0x25
	.uleb128 0x1
	.byte	0x65
	.byte	0
	.uleb128 0xf
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x13c
	.uleb128 0xb
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x54
	.4byte	0x25
	.uleb128 0x1
	.byte	0x64
	.byte	0
	.uleb128 0xf
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x159
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x63
	.4byte	0x25
	.4byte	.LLST2
	.byte	0
	.uleb128 0xf
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x176
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x67
	.4byte	0x25
	.4byte	.LLST3
	.byte	0
	.uleb128 0xf
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x193
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x67
	.4byte	0x25
	.4byte	.LLST4
	.byte	0
	.uleb128 0xf
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x1b0
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x6b
	.4byte	0x25
	.4byte	.LLST5
	.byte	0
	.uleb128 0xf
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.4byte	0x1cd
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x6b
	.4byte	0x25
	.4byte	.LLST6
	.byte	0
	.uleb128 0xf
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0x1e6
	.uleb128 0x11
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x6f
	.4byte	0x25
	.byte	0
	.uleb128 0x12
	.4byte	.LVL5
	.4byte	0x79
	.4byte	0x1fa
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x85
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL6
	.4byte	0x79
	.4byte	0x20e
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL9
	.4byte	0x79
	.uleb128 0x14
	.4byte	.LVL14
	.4byte	0x79
	.uleb128 0x14
	.4byte	.LVL19
	.4byte	0x79
	.uleb128 0x14
	.4byte	.LVL21
	.4byte	0x79
	.uleb128 0x15
	.4byte	.LVL22
	.4byte	0x79
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	0x46
	.4byte	0x253
	.uleb128 0x17
	.4byte	0x253
	.2byte	0x1387
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x18
	.4byte	.LASF17
	.byte	0x1
	.byte	0x22
	.4byte	0x242
	.uleb128 0x5
	.byte	0x3
	.4byte	test_data
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
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
	.2byte	0x5
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL4-.Ltext0
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
.LLST2:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
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
.LASF15:
	.ascii	"main.c\000"
.LASF6:
	.ascii	"test_result_t\000"
.LASF3:
	.ascii	"event1\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"reg32_t\000"
.LASF9:
	.ascii	"enDigits\000"
.LASF14:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF11:
	.ascii	"main\000"
.LASF17:
	.ascii	"test_data\000"
.LASF8:
	.ascii	"allDigits\000"
.LASF10:
	.ascii	"writeValTo7Segs\000"
.LASF7:
	.ascii	"digit\000"
.LASF12:
	.ascii	"test_result\000"
.LASF16:
	.ascii	"C:\\Users\\Dani\\Desktop\\CacheSize\000"
.LASF13:
	.ascii	"sizetype\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
