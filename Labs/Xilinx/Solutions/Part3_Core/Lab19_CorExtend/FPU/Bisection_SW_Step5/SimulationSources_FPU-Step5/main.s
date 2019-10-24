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
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 14 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,48,$31		# vars= 0, regs= 8/0, args= 16, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
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
.LVL0 = .
	.loc 1 19 0
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$0,12($2)
	.loc 1 20 0
	sw	$0,16($2)
	.loc 1 17 0
	lw	$17,%gp_rel(.LC0)($28)
	lw	$19,%gp_rel(.LC1)($28)
	.loc 1 25 0
	lw	$22,%gp_rel(.LC2)($28)
	.loc 1 28 0
	lw	$21,%gp_rel(.LC3)($28)
	lw	$20,%gp_rel(.LC4)($28)
.LVL1 = .
.L6:
.L3:
	.loc 1 25 0
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
	.loc 1 28 0
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
	.loc 1 31 0
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
	.loc 1 34 0
	jal	__mulsf3
	move	$5,$17

.LVL11 = .
	move	$4,$2
	jal	__subsf3
	lw	$5,%gp_rel(.LC3)($28)

.LVL12 = .
	.loc 1 37 0
	move	$4,$2
	jal	__mulsf3
	move	$5,$18

.LVL13 = .
	move	$4,$2
	jal	__ltsf2
	move	$5,$0

.LVL14 = .
	bltzl	$2,.L6
	move	$19,$16

.LVL15 = .
	.loc 1 25 0
	b	.L3
	move	$17,$16

.LVL16 = .
.L2:
	.loc 1 48 0
	move	$3,$16
.LVL17 = .
	.loc 1 51 0
	li	$2,-1082130432			# 0xffffffffbf800000
.L5:
	.loc 1 51 0 is_stmt 0 discriminator 1
	sw	$0,12($2)
	.loc 1 52 0 is_stmt 1 discriminator 1
	sw	$3,16($2)
	.loc 1 53 0 discriminator 1
	b	.L5
	nop

	.set	macro
	.set	reorder
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
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x136
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x1
	.4byte	.LASF16
	.4byte	.LASF17
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
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
	.uleb128 0x4
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.4byte	0xab
	.uleb128 0x5
	.ascii	"_f\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x25
	.uleb128 0x5
	.ascii	"_i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x3a
	.byte	0
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0x8
	.4byte	0x8e
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0xe
	.4byte	0x3a
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x10
	.4byte	0xab
	.uleb128 0x3
	.byte	0x60
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.4byte	.LLST0
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.4byte	.LLST1
	.uleb128 0xa
	.ascii	"tol\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.byte	0x4
	.4byte	0x3c23d70a
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.4byte	.LLST2
	.uleb128 0x9
	.ascii	"fc\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.4byte	.LLST3
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.uleb128 0x9
	.ascii	"fb\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.4byte	.LLST4
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.4byte	.LFE0-.Ltext0
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
	.4byte	.LFE0-.Ltext0
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
	.4byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL8-1-.Ltext0
	.4byte	.LFE0-.Ltext0
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
.LASF7:
	.ascii	"long long int\000"
.LASF9:
	.ascii	"unsigned int\000"
.LASF16:
	.ascii	"main.c\000"
.LASF19:
	.ascii	"main\000"
.LASF14:
	.ascii	"res_soft\000"
.LASF17:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_FPU-Step5\000"
.LASF2:
	.ascii	"long unsigned int\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"float\000"
.LASF11:
	.ascii	"char\000"
.LASF20:
	.ascii	"fc_abs\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF15:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF1:
	.ascii	"long int\000"
.LASF12:
	.ascii	"double\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF13:
	.ascii	"long double\000"
.LASF5:
	.ascii	"short int\000"
.LASF18:
	.ascii	"_float\000"
.LASF10:
	.ascii	"sizetype\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
