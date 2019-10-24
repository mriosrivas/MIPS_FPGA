	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	__addsf3
	.globl	__mulsf3
	.globl	__subsf3
	.globl	__lesf2
	.globl	__ltsf2
	.align	2
	.globl	bisection_soft
.LFB1 = .
	.file 1 "main.c"
	.loc 1 95 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	bisection_soft
	.type	bisection_soft, @function
bisection_soft:
	.frame	$sp,56,$31		# vars= 0, regs= 9/0, args= 16, gp= 0
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	.cfi_def_cfa_offset 56
	sw	$31,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 23, -8
	.cfi_offset 22, -12
	.cfi_offset 21, -16
	.cfi_offset 20, -20
	.cfi_offset 19, -24
	.cfi_offset 18, -28
	.cfi_offset 17, -32
	.cfi_offset 16, -36
.LVL0 = .
	.loc 1 97 0
	lw	$17,%gp_rel(.LC0)($28)
	lw	$19,%gp_rel(.LC1)($28)
	.loc 1 103 0
	lw	$22,%gp_rel(.LC2)($28)
	.loc 1 106 0
	lw	$21,%gp_rel(.LC3)($28)
	.loc 1 109 0
	lw	$20,%gp_rel(.LC4)($28)
	move	$23,$21
.LVL1 = .
.L5:
.L3:
	.loc 1 103 0
	move	$4,$19
	jal	__addsf3
	move	$5,$17

.LVL2 = .
	move	$4,$2
	jal	__mulsf3
	move	$5,$22

.LVL3 = .
	move	$16,$2
.LVL4 = .
	.loc 1 106 0
	move	$4,$2
	jal	__mulsf3
	move	$5,$2

.LVL5 = .
	move	$4,$2
	jal	__subsf3
	move	$5,$21

.LVL6 = .
	move	$18,$2
.LVL7 = .
	.loc 1 109 0
	ext	$4,$2,0,31
	jal	__subsf3
	move	$5,$20

.LVL8 = .
	move	$4,$2
	jal	__lesf2
	move	$5,$0

.LVL9 = .
	blez	$2,.L2
	move	$4,$17

.LVL10 = .
	.loc 1 112 0
	jal	__mulsf3
	move	$5,$17

.LVL11 = .
	move	$4,$2
	jal	__subsf3
	move	$5,$23

.LVL12 = .
	.loc 1 115 0
	move	$4,$2
	jal	__mulsf3
	move	$5,$18

.LVL13 = .
	move	$4,$2
	jal	__ltsf2
	move	$5,$0

.LVL14 = .
	bltzl	$2,.L5
	move	$19,$16

.LVL15 = .
	.loc 1 103 0
	b	.L3
	move	$17,$16

.LVL16 = .
.L2:
	.loc 1 126 0
	move	$2,$16
	lw	$31,52($sp)
	lw	$23,48($sp)
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
.LVL17 = .
	lw	$18,28($sp)
.LVL18 = .
	lw	$17,24($sp)
.LVL19 = .
	lw	$16,20($sp)
.LVL20 = .
	jr	$31
	addiu	$sp,$sp,56

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	bisection_soft
	.cfi_endproc
.LFE1:
	.size	bisection_soft, .-bisection_soft
	.align	2
	.globl	bisection_fpu
.LFB2 = .
	.loc 1 134 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	bisection_fpu
	.type	bisection_fpu, @function
bisection_fpu:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
.LVL21 = .
	.loc 1 138 0
 #APP
 # 138 "main.c" 1
	   lui $t3, 0x3fa0;   lui $t4, 0x4020;loop:   nop;   UDI3 $t4, $t3, $t6, 0;   nop;   lui $t5, 0x4000;   UDI5 $t6, $t5, $t6, 0;   nop;   UDI4 $t6, $t6, $t2, 0;   nop;   lui $t8, 0xc000;   UDI3 $t2, $t8, $t2, 0;   nop;   lui $t8, 0x7fff;   ori $t1, $zero, 0xffff;   add $t8, $t8, $t1;   and $t1, $t2, $t8;   lui $t9, 0xbc23;   ori $t0, $zero, 0xd70a;   add $t9, $t9, $t0;   nop;   UDI3 $t1, $t9, $t1, 0;   nop;   lui $t9, 0x8000;   and $t1, $t1, $t9;   bne $t1, $zero, Out_Bisection;   nop;   UDI4 $t4, $t4, $t7, 0;   nop;   lui $t8, 0xc000;   UDI3 $t7, $t8, $t7, 0;   nop;   and $t2, $t2, $t9;   and $t7, $t7, $t9;   beq $t2, $t7, bc;   add $t3, $t6, $zero;   j loop2;bc:   add $t4, $t6, $zero;   loop2: nop;j loop;Out_Bisection: nop;   add $2, $t6, $zero;
 # 0 "" 2
.LVL22 = .
	.loc 1 209 0
 #NO_APP
	jr	$31
	.end	bisection_fpu
	.cfi_endproc
.LFE2:
	.size	bisection_fpu, .-bisection_fpu
	.align	2
	.globl	writeValTo7Segs
.LFB3 = .
	.loc 1 214 0
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
.LVL23 = .
	addiu	$sp,$sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 216 0
	sw	$0,4($sp)
	.loc 1 217 0
	sw	$0,8($sp)
	.loc 1 220 0
	sw	$0,4($sp)
	beq	$4,$0,.L9
	nop

	lw	$2,4($sp)
	slt	$2,$2,8
	beq	$2,$0,.L9
	nop

	.loc 1 221 0 discriminator 4
	li	$6,-859045888			# 0xffffffffcccc0000
	ori	$6,$6,0xcccd
	.loc 1 224 0 discriminator 4
	li	$7,1			# 0x1
	.loc 1 221 0 discriminator 4
	multu	$4,$6
.L14:
	mfhi	$5
	srl	$2,$5,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,0($sp)
	.loc 1 222 0 discriminator 4
	lw	$3,0($sp)
	lw	$2,4($sp)
	lw	$4,8($sp)
.LVL24 = .
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$4
	sw	$2,8($sp)
	.loc 1 223 0 discriminator 4
	srl	$4,$5,3
.LVL25 = .
	.loc 1 224 0 discriminator 4
	lw	$2,4($sp)
	lw	$3,12($sp)
	sll	$2,$7,$2
	or	$2,$2,$3
	sw	$2,12($sp)
	.loc 1 220 0 discriminator 4
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
	beq	$4,$0,.L9
	nop

	.loc 1 220 0 is_stmt 0 discriminator 3
	lw	$2,4($sp)
	slt	$2,$2,8
	bne	$2,$0,.L14
	multu	$4,$6

.L9:
	.loc 1 227 0 is_stmt 1
	lw	$2,8($sp)
	li	$3,-1082130432			# 0xffffffffbf800000
	sw	$2,16($3)
	.loc 1 228 0
	lw	$2,12($sp)
	nor	$2,$0,$2
	sw	$2,12($3)
	.loc 1 231 0
	jr	$31
	addiu	$sp,$sp,16

	.cfi_def_cfa_offset 0
	.set	macro
	.set	reorder
	.end	writeValTo7Segs
	.cfi_endproc
.LFE3:
	.size	writeValTo7Segs, .-writeValTo7Segs
	.align	2
	.globl	main
.LFB0 = .
	.loc 1 39 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,56,$31		# vars= 0, regs= 9/0, args= 16, gp= 0
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-56
	.cfi_def_cfa_offset 56
	sw	$31,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 23, -8
	.cfi_offset 22, -12
	.cfi_offset 21, -16
	.cfi_offset 20, -20
	.cfi_offset 19, -24
	.cfi_offset 18, -28
	.cfi_offset 17, -32
	.cfi_offset 16, -36
.LBB2 = .
	.loc 1 46 0
	li	$2,2			# 0x2
 #APP
 # 46 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,34			# 0x22
 #APP
 # 46 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 46 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 46 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 47 0
	jal	bisection_soft
.LVL26 = .
	move	$23,$2
.LVL27 = .
.LBB3 = .
.LBB4 = .
	.loc 1 48 0
 #APP
 # 48 "main.c" 1
	mfc0 $22,$25,1
 # 0 "" 2
.LVL28 = .
 #NO_APP
.LBE4 = .
.LBB5 = .
 #APP
 # 48 "main.c" 1
	mfc0 $21,$25,3
 # 0 "" 2
.LVL29 = .
 #NO_APP
.LBE5 = .
 #APP
 # 48 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 48 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 48 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 48 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE3 = .
.LBB6 = .
	.loc 1 50 0
	li	$2,2			# 0x2
.LVL30 = .
 #APP
 # 50 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,34			# 0x22
 #APP
 # 50 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 50 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 50 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE6 = .
	.loc 1 51 0
	jal	bisection_fpu
.LVL31 = .
	move	$20,$2
.LVL32 = .
.LBB7 = .
.LBB8 = .
	.loc 1 52 0
 #APP
 # 52 "main.c" 1
	mfc0 $19,$25,1
 # 0 "" 2
.LVL33 = .
 #NO_APP
.LBE8 = .
.LBB9 = .
 #APP
 # 52 "main.c" 1
	mfc0 $18,$25,3
 # 0 "" 2
.LVL34 = .
 #NO_APP
.LBE9 = .
 #APP
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE7 = .
	.loc 1 57 0
	li	$16,-1082130432			# 0xffffffffbf800000
	lui	$17,%hi(.L19)
	addiu	$17,$17,%lo(.L19)
.LVL35 = .
.L16:
	lw	$3,4($16)
	sltu	$2,$3,6
	.set	noreorder
	.set	nomacro
	beq	$2,$0,.L17
	sll	$3,$3,2
	.set	macro
	.set	reorder

	addu	$3,$17,$3
	lw	$2,0($3)
	jr	$2
	.rdata
	.align	2
	.align	2
.L19:
	.word	.L18
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
	.text
.L18:
	.loc 1 61 0
	sw	$0,12($16)
	.loc 1 62 0
	sw	$20,16($16)
	.loc 1 63 0
	b	.L16
.L20:
	.loc 1 65 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$19
	.set	macro
	.set	reorder

.LVL36 = .
	.loc 1 66 0
	b	.L16
.L21:
	.loc 1 68 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$18
	.set	macro
	.set	reorder

.LVL37 = .
	.loc 1 69 0
	b	.L16
.L22:
	.loc 1 73 0
	sw	$0,12($16)
	.loc 1 74 0
	sw	$23,16($16)
	.loc 1 75 0
	b	.L16
.L23:
	.loc 1 77 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$22
	.set	macro
	.set	reorder

.LVL38 = .
	.loc 1 78 0
	b	.L16
.L24:
	.loc 1 80 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$21
	.set	macro
	.set	reorder

.LVL39 = .
	.loc 1 81 0
	b	.L16
.L17:
	.loc 1 84 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7Segs
	move	$4,$0
	.set	macro
	.set	reorder

.LVL40 = .
	b	.L16
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.sdata,"aw",@progbits
	.align	2
.LC0:
	.word	1075838976
	.align	2
.LC1:
	.word	1067450368
	.align	2
.LC2:
	.word	1056964608
	.align	2
.LC3:
	.word	1073741824
	.align	2
.LC4:
	.word	1008981770
	.text
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x31e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x1
	.4byte	.LASF29
	.4byte	.LASF30
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x393
	.4byte	0x33
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x5
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.4byte	0xb7
	.uleb128 0x6
	.ascii	"_f\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x25
	.uleb128 0x6
	.ascii	"_i\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x4d
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1a
	.4byte	0x9a
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x1
	.byte	0x5f
	.4byte	0x25
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x146
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.4byte	.LLST0
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.4byte	.LLST1
	.uleb128 0xa
	.ascii	"tol\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.byte	0x4
	.4byte	0x3c23d70a
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.4byte	.LLST2
	.uleb128 0x9
	.ascii	"fc\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.4byte	.LLST3
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.uleb128 0x9
	.ascii	"fb\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x25
	.4byte	.LLST4
	.uleb128 0xc
	.ascii	"led\000"
	.byte	0x1
	.byte	0x62
	.4byte	0x4d
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x86
	.4byte	0x4d
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x177
	.uleb128 0xc
	.ascii	"led\000"
	.byte	0x1
	.byte	0x87
	.4byte	0x4d
	.byte	0
	.uleb128 0xe
	.ascii	"x\000"
	.byte	0x1
	.byte	0x88
	.4byte	0x4d
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0xf
	.4byte	.LASF18
	.byte	0x1
	.byte	0xd6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d2
	.uleb128 0x10
	.ascii	"val\000"
	.byte	0x1
	.byte	0xd6
	.4byte	0x33
	.4byte	.LLST5
	.uleb128 0x11
	.4byte	.LASF19
	.byte	0x1
	.byte	0xd8
	.4byte	0x1d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0x1
	.byte	0xd8
	.4byte	0x1d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF20
	.byte	0x1
	.byte	0xd9
	.4byte	0x1d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0xd9
	.4byte	0x1d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x12
	.4byte	0x4d
	.uleb128 0x12
	.4byte	0x33
	.uleb128 0x13
	.4byte	.LASF32
	.byte	0x1
	.byte	0x27
	.4byte	0x4d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x29
	.4byte	0xb7
	.4byte	.LLST6
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x1
	.byte	0x2a
	.4byte	0x4d
	.4byte	.LLST7
	.uleb128 0x11
	.4byte	.LASF24
	.byte	0x1
	.byte	0x2b
	.4byte	0x4d
	.uleb128 0x1
	.byte	0x66
	.uleb128 0x11
	.4byte	.LASF25
	.byte	0x1
	.byte	0x2b
	.4byte	0x4d
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0x2c
	.4byte	0x4d
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x2c
	.4byte	0x4d
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x15
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x25e
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x66
	.byte	0
	.uleb128 0x15
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x279
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x65
	.byte	0
	.uleb128 0x15
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x294
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x63
	.byte	0
	.uleb128 0x15
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x2af
	.uleb128 0xe
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x62
	.byte	0
	.uleb128 0x16
	.4byte	.LVL26
	.4byte	0xc2
	.uleb128 0x16
	.4byte	.LVL31
	.4byte	0x146
	.uleb128 0x17
	.4byte	.LVL36
	.4byte	0x177
	.4byte	0x2d5
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL37
	.4byte	0x177
	.4byte	0x2e9
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL38
	.4byte	0x177
	.4byte	0x2fd
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x86
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL39
	.4byte	0x177
	.4byte	0x311
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x85
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL40
	.4byte	0x177
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
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
	.uleb128 0x17
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0x3fa00000
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0x40200000
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL5-1-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL8-1-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x10
	.byte	0xf5
	.uleb128 0x11
	.uleb128 0x25
	.byte	0xf5
	.uleb128 0x11
	.uleb128 0x25
	.byte	0x1e
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x40000000
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL25-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x3
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x64
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
.LASF20:
	.ascii	"allDigits\000"
.LASF22:
	.ascii	"res_soft\000"
.LASF30:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_FPU-Step6\000"
.LASF16:
	.ascii	"bisection_soft\000"
.LASF2:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"num_instr_fpu\000"
.LASF0:
	.ascii	"float\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"writeValTo7Segs\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF24:
	.ascii	"num_cycles_soft\000"
.LASF14:
	.ascii	"reg32_t\000"
.LASF17:
	.ascii	"bisection_fpu\000"
.LASF12:
	.ascii	"double\000"
.LASF32:
	.ascii	"main\000"
.LASF15:
	.ascii	"_float\000"
.LASF28:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF19:
	.ascii	"digit\000"
.LASF3:
	.ascii	"long long unsigned int\000"
.LASF21:
	.ascii	"enDigits\000"
.LASF25:
	.ascii	"num_instr_soft\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF23:
	.ascii	"res_fpu\000"
.LASF9:
	.ascii	"long long int\000"
.LASF29:
	.ascii	"main.c\000"
.LASF11:
	.ascii	"char\000"
.LASF26:
	.ascii	"num_cycles_fpu\000"
.LASF7:
	.ascii	"short int\000"
.LASF4:
	.ascii	"long int\000"
.LASF13:
	.ascii	"long double\000"
.LASF5:
	.ascii	"signed char\000"
.LASF31:
	.ascii	"fc_abs\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
