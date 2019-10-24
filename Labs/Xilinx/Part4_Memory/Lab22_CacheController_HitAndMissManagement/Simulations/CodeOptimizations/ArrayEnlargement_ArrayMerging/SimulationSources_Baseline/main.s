	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame

	.comm	A,2048,4

	.comm	B,2048,4

	.comm	C,4,4
	.align	2
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 43 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 16, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-40
	.cfi_def_cfa_offset 40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	.cfi_offset 31, -4
	.cfi_offset 30, -8
	move	$fp,$sp
	.cfi_def_cfa_register 30
	.loc 1 50 0
	sw	$0,16($fp)
	b	.L2
.L3:
	.loc 1 51 0 discriminator 3
	lui	$2,%hi(A)
	lw	$3,16($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(A)
	addu	$2,$3,$2
	lw	$3,16($fp)
	sw	$3,0($2)
	.loc 1 52 0 discriminator 3
	lui	$2,%hi(B)
	lw	$3,16($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(B)
	addu	$2,$3,$2
	lw	$3,16($fp)
	sw	$3,0($2)
	.loc 1 50 0 discriminator 3
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L2:
	.loc 1 50 0 is_stmt 0 discriminator 1
	lw	$2,16($fp)
	slt	$2,$2,512
	bne	$2,$0,.L3
	.loc 1 57 0 is_stmt 1
 #APP
 # 57 "main.c" 1
	   li $t1, 4096;   li $t2, 0;   lui $t3, 0x0;loop1:   cache 0x01, 0($t3);   addiu $t3, $t3, 16;   addiu $t2, $t2, 1;   blt $t2, $t1, loop1;
 # 0 "" 2
 #NO_APP
.LBB2 = .
	.loc 1 71 0
	li	$2,322			# 0x142
 #APP
 # 71 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,354			# 0x162
 #APP
 # 71 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 71 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 71 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 73 0
 #APP
 # 73 "main.c" 1
	   li $t1, 512;   li $t2, 0;   li $t9, 0;   lui $t4, 0x8000;   lui $t5, 0x8000;   addiu $t4, $t4, A;   addiu $t5, $t5, B;   loop2:   lw  $t7, 0($t4);   addiu $t4, $t4, 4;   nop;   nop;   nop;   lw  $t8, 0($t5);   addiu $t5, $t5, 4;   nop;   nop;   nop;   add $t6, $t7, $t8;   add $t9, $t9, $t6;   nop;   addiu $t2, $t2, 1;   blt $t2, $t1, loop2;   add $2, $t9, $zero;
 # 0 "" 2
 #NO_APP
	sw	$2,20($fp)
.LBB3 = .
.LBB4 = .
	.loc 1 103 0
 #APP
 # 103 "main.c" 1
	mfc0 $2,$25,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE4 = .
	sw	$2,24($fp)
.LBB5 = .
 #APP
 # 103 "main.c" 1
	mfc0 $2,$25,3
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE5 = .
	sw	$2,28($fp)
 #APP
 # 103 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 103 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 103 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 103 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.L18:
.LBE3 = .
	.loc 1 109 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x4
	lw	$2,0($2)
	sltu	$3,$2,7
	beq	$3,$0,.L4
	sll	$3,$2,2
	lui	$2,%hi(.L6)
	addiu	$2,$2,%lo(.L6)
	addu	$2,$3,$2
	lw	$2,0($2)
	jr	$2
	.rdata
	.align	2
	.align	2
.L6:
	.word	.L5
	.word	.L7
	.word	.L8
	.word	.L9
	.word	.L10
	.word	.L11
	.word	.L12
	.text
.L5:
	.loc 1 111 0
	lw	$2,24($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 112 0
	b	.L13
.L7:
	.loc 1 114 0
	lw	$2,28($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 115 0
	b	.L13
.L8:
.LBB6 = .
	.loc 1 118 0
 #APP
 # 118 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE6 = .
	andi	$2,$2,0x380
	srl	$2,$2,7
	addiu	$2,$2,1
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 119 0
	b	.L13
.L9:
.LBB7 = .
	.loc 1 122 0
 #APP
 # 122 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE7 = .
	andi	$2,$2,0xe000
	srl	$3,$2,13
	li	$2,7			# 0x7
	beq	$3,$2,.L14
.LBB8 = .
	.loc 1 122 0 is_stmt 0 discriminator 1
 #APP
 # 122 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE8 = .
	andi	$2,$2,0xe000
	srl	$2,$2,13
	addiu	$2,$2,6
	move	$3,$2
	li	$2,1			# 0x1
	sll	$2,$2,$3
	b	.L15
.L14:
	.loc 1 122 0 discriminator 2
	li	$2,32			# 0x20
.L15:
	.loc 1 122 0 discriminator 4
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 123 0 is_stmt 1 discriminator 4
	b	.L13
.L10:
.LBB9 = .
	.loc 1 126 0
 #APP
 # 126 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE9 = .
	andi	$2,$2,0x1c00
	srl	$2,$2,10
	beq	$2,$0,.L16
.LBB10 = .
	.loc 1 126 0 is_stmt 0 discriminator 1
 #APP
 # 126 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE10 = .
	andi	$2,$2,0x1c00
	srl	$2,$2,10
	addiu	$2,$2,1
	move	$3,$2
	li	$2,1			# 0x1
	sll	$2,$2,$3
	b	.L17
.L16:
	.loc 1 126 0 discriminator 2
	move	$2,$0
.L17:
	.loc 1 126 0 discriminator 4
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 127 0 is_stmt 1 discriminator 4
	b	.L13
.L11:
.LBB11 = .
	.loc 1 130 0
 #APP
 # 130 "main.c" 1
	mfc0 $2,$16,0
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE11 = .
	andi	$2,$2,0x7
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 131 0
	b	.L13
.L12:
	.loc 1 133 0
	lw	$2,20($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 134 0
	b	.L13
.L4:
	.loc 1 136 0
	move	$4,$0
	jal	writeValTo7Segs
.L13:
	.loc 1 138 0
	b	.L18
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	writeValTo7Segs
.LFB1 = .
	.loc 1 145 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7Segs
	.type	writeValTo7Segs, @function
writeValTo7Segs:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$fp,20($sp)
	.cfi_offset 30, -4
	move	$fp,$sp
	.cfi_def_cfa_register 30
	sw	$4,24($fp)
	.loc 1 147 0
	sw	$0,4($fp)
	.loc 1 148 0
	sw	$0,8($fp)
	.loc 1 151 0
	sw	$0,4($fp)
	b	.L20
	nop

.L22:
	.loc 1 152 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sll	$2,$2,1
	sll	$4,$2,2
	addu	$2,$2,$4
	subu	$2,$3,$2
	sw	$2,0($fp)
	.loc 1 153 0 discriminator 4
	lw	$3,0($fp)
	lw	$2,4($fp)
	sll	$2,$2,2
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,8($fp)
	.loc 1 154 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sw	$2,24($fp)
	.loc 1 155 0 discriminator 4
	lw	$2,4($fp)
	li	$3,1			# 0x1
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,12($fp)
	or	$2,$3,$2
	sw	$2,12($fp)
	.loc 1 151 0 discriminator 4
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
.L20:
	.loc 1 151 0 is_stmt 0 discriminator 1
	lw	$2,24($fp)
	beq	$2,$0,.L21
	nop

	.loc 1 151 0 discriminator 3
	lw	$2,4($fp)
	slt	$2,$2,8
	bne	$2,$0,.L22
	nop

.L21:
	.loc 1 158 0 is_stmt 1
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,8($fp)
	sw	$3,0($2)
	.loc 1 159 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	lw	$3,12($fp)
	nor	$3,$0,$3
	sw	$3,0($2)
	.loc 1 161 0
	nop
	.loc 1 162 0
	move	$sp,$fp
	.cfi_def_cfa_register 29
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	writeValTo7Segs
	.cfi_endproc
.LFE1:
	.size	writeValTo7Segs, .-writeValTo7Segs
	.align	2
	.globl	_mips_handle_exception
.LFB2 = .
	.loc 1 166 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	.cfi_def_cfa_offset 8
	sw	$fp,4($sp)
	.cfi_offset 30, -4
	move	$fp,$sp
	.cfi_def_cfa_register 30
	sw	$4,8($fp)
	sw	$5,12($fp)
	.loc 1 167 0
	li	$2,-1082130432			# 0xffffffffbf800000
	li	$3,32769			# 0x8001
	sw	$3,0($2)
.L25:
	.loc 1 168 0 discriminator 1
	b	.L25
	nop

	.set	macro
	.set	reorder
	.end	_mips_handle_exception
	.cfi_endproc
.LFE2:
	.size	_mips_handle_exception, .-_mips_handle_exception
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x271
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x1
	.4byte	.LASF17
	.4byte	.LASF18
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
	.4byte	.LASF8
	.byte	0x1
	.byte	0x2b
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18d
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"x\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.byte	0x2e
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0xd3
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x67
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0xee
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x67
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x109
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x76
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x124
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7a
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x13f
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7a
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x15a
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7e
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.4byte	0x175
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7e
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xc
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF9
	.byte	0x1
	.byte	0x91
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e7
	.uleb128 0xe
	.ascii	"val\000"
	.byte	0x1
	.byte	0x91
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.byte	0x93
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x93
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x1
	.byte	0x94
	.4byte	0x1ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x94
	.4byte	0x1ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	0x46
	.uleb128 0xf
	.4byte	0x2c
	.uleb128 0xd
	.4byte	.LASF13
	.byte	0x1
	.byte	0xa6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x223
	.uleb128 0xe
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0xa6
	.4byte	0x223
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa6
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.uleb128 0x12
	.4byte	0x46
	.4byte	0x236
	.uleb128 0x13
	.4byte	0x236
	.2byte	0x1ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x14
	.ascii	"A\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x24c
	.uleb128 0x5
	.byte	0x3
	.4byte	A
	.uleb128 0xf
	.4byte	0x225
	.uleb128 0x14
	.ascii	"B\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x260
	.uleb128 0x5
	.byte	0x3
	.4byte	B
	.uleb128 0xf
	.4byte	0x225
	.uleb128 0x14
	.ascii	"C\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x1e7
	.uleb128 0x5
	.byte	0x3
	.4byte	C
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xc
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.byte	0
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
.LASF16:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g\000"
.LASF4:
	.ascii	"event2\000"
.LASF17:
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
.LASF12:
	.ascii	"enDigits\000"
.LASF8:
	.ascii	"main\000"
.LASF11:
	.ascii	"allDigits\000"
.LASF13:
	.ascii	"_mips_handle_exception\000"
.LASF18:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_Baseline\000"
.LASF9:
	.ascii	"writeValTo7Segs\000"
.LASF10:
	.ascii	"digit\000"
.LASF7:
	.ascii	"test_result\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF14:
	.ascii	"reason\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
