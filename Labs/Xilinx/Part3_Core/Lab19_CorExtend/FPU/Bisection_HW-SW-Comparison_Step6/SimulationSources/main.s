	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 39 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
.LBB5 = .
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
.LVL0 = .
 #NO_APP
.L2:
	b	.L2
.LBE5 = .
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	bisection_soft
.LFB1 = .
	.loc 1 95 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	bisection_soft
	.type	bisection_soft, @function
bisection_soft:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.L4:
	.loc 1 122 0 discriminator 1
	b	.L4
	nop

	.set	macro
	.set	reorder
	.end	bisection_soft
	.cfi_endproc
.LFE1:
	.size	bisection_soft, .-bisection_soft
	.align	2
	.globl	bisection_fpu
.LFB2 = .
	.loc 1 133 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	bisection_fpu
	.type	bisection_fpu, @function
bisection_fpu:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
.LVL1 = .
	.loc 1 137 0
 #APP
 # 137 "main.c" 1
	   lui $t3, 0x3fa0;   lui $t4, 0x4020;loop:   j loop2;   nop;bc:   loop2: nop;j loop;Out_Bisection: nop;   add $2, $t6, $zero;
 # 0 "" 2
.LVL2 = .
	.loc 1 191 0
 #NO_APP
	jr	$31
	.end	bisection_fpu
	.cfi_endproc
.LFE2:
	.size	bisection_fpu, .-bisection_fpu
	.align	2
	.globl	writeValTo7Segs
.LFB3 = .
	.loc 1 196 0
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
.LVL3 = .
	addiu	$sp,$sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 198 0
	sw	$0,4($sp)
	.loc 1 199 0
	sw	$0,8($sp)
	.loc 1 202 0
	sw	$0,4($sp)
	beq	$4,$0,.L7
	nop

	lw	$2,4($sp)
	slt	$2,$2,8
	beq	$2,$0,.L7
	nop

	.loc 1 203 0 discriminator 4
	li	$6,-859045888			# 0xffffffffcccc0000
	ori	$6,$6,0xcccd
	.loc 1 206 0 discriminator 4
	li	$7,1			# 0x1
	.loc 1 203 0 discriminator 4
	multu	$4,$6
.L12:
	mfhi	$5
	srl	$2,$5,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,0($sp)
	.loc 1 204 0 discriminator 4
	lw	$3,0($sp)
	lw	$2,4($sp)
	lw	$4,8($sp)
.LVL4 = .
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$4
	sw	$2,8($sp)
	.loc 1 205 0 discriminator 4
	srl	$4,$5,3
.LVL5 = .
	.loc 1 206 0 discriminator 4
	lw	$2,4($sp)
	lw	$3,12($sp)
	sll	$2,$7,$2
	or	$2,$2,$3
	sw	$2,12($sp)
	.loc 1 202 0 discriminator 4
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
	beq	$4,$0,.L7
	nop

	.loc 1 202 0 is_stmt 0 discriminator 3
	lw	$2,4($sp)
	slt	$2,$2,8
	bne	$2,$0,.L12
	multu	$4,$6

.L7:
	.loc 1 209 0 is_stmt 1
	lw	$2,8($sp)
	li	$3,-1082130432			# 0xffffffffbf800000
	sw	$2,16($3)
	.loc 1 210 0
	lw	$2,12($sp)
	nor	$2,$0,$2
	sw	$2,12($3)
	.loc 1 213 0
	jr	$31
	addiu	$sp,$sp,16

	.cfi_def_cfa_offset 0
	.set	macro
	.set	reorder
	.end	writeValTo7Segs
	.cfi_endproc
.LFE3:
	.size	writeValTo7Segs, .-writeValTo7Segs
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x24e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.LASF31
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
	.4byte	.LASF14
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x4
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
	.4byte	0x8c
	.uleb128 0x6
	.ascii	"_i\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x46
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1a
	.4byte	0x9a
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x1
	.byte	0x5f
	.4byte	0x8c
	.byte	0x1
	.4byte	0x123
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"tol\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"fc\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"fb\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"led\000"
	.byte	0x1
	.byte	0x62
	.4byte	0x46
	.byte	0
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x1
	.byte	0x27
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17f
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x29
	.4byte	0xb7
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x2a
	.4byte	0x46
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2b
	.4byte	0x46
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0x2b
	.4byte	0x46
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x2c
	.4byte	0x46
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2c
	.4byte	0x46
	.byte	0
	.uleb128 0xc
	.4byte	0xc2
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bb
	.uleb128 0xd
	.4byte	0xd2
	.uleb128 0xd
	.4byte	0xdb
	.uleb128 0xd
	.4byte	0xe4
	.uleb128 0xd
	.4byte	0xef
	.uleb128 0xd
	.4byte	0xf8
	.uleb128 0xd
	.4byte	0x102
	.uleb128 0xd
	.4byte	0x10d
	.uleb128 0xd
	.4byte	0x117
	.byte	0
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x85
	.4byte	0x46
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ec
	.uleb128 0xe
	.ascii	"led\000"
	.byte	0x1
	.byte	0x86
	.4byte	0x46
	.byte	0
	.uleb128 0xf
	.ascii	"x\000"
	.byte	0x1
	.byte	0x87
	.4byte	0x46
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0xc4
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x247
	.uleb128 0x11
	.ascii	"val\000"
	.byte	0x1
	.byte	0xc4
	.4byte	0x2c
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x1
	.byte	0xc6
	.4byte	0x247
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0x247
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0xc7
	.4byte	0x24c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x1
	.byte	0xc7
	.4byte	0x24c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x13
	.4byte	0x46
	.uleb128 0x13
	.4byte	0x2c
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
	.uleb128 0x20
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE3-.Ltext0
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
.LASF27:
	.ascii	"allDigits\000"
.LASF17:
	.ascii	"res_soft\000"
.LASF31:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_FPU-Step6\000"
.LASF32:
	.ascii	"bisection_soft\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"num_instr_fpu\000"
.LASF12:
	.ascii	"float\000"
.LASF5:
	.ascii	"unsigned char\000"
.LASF25:
	.ascii	"writeValTo7Segs\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF19:
	.ascii	"num_cycles_soft\000"
.LASF14:
	.ascii	"reg32_t\000"
.LASF24:
	.ascii	"bisection_fpu\000"
.LASF11:
	.ascii	"double\000"
.LASF23:
	.ascii	"main\000"
.LASF15:
	.ascii	"_float\000"
.LASF29:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF26:
	.ascii	"digit\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"enDigits\000"
.LASF20:
	.ascii	"num_instr_soft\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF18:
	.ascii	"res_fpu\000"
.LASF8:
	.ascii	"long long int\000"
.LASF30:
	.ascii	"main.c\000"
.LASF10:
	.ascii	"char\000"
.LASF21:
	.ascii	"num_cycles_fpu\000"
.LASF6:
	.ascii	"short int\000"
.LASF3:
	.ascii	"long int\000"
.LASF13:
	.ascii	"long double\000"
.LASF4:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"fc_abs\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
