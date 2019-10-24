	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	RGB2GrayMatrix
.LFB0 = .
	.file 1 "trafo.c"
	.loc 1 6 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	RGB2GrayMatrix
	.type	RGB2GrayMatrix, @function
RGB2GrayMatrix:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	.loc 1 9 0
	blez	$6,.L9
	move	$8,$7

.LVL1 = .
	b	.L3
	move	$4,$0

.LVL2 = .
.L4:
	.loc 1 11 0 discriminator 3
	sb	$0,0($2)
.LVL3 = .
.L7:
	addiu	$2,$2,1
.LVL4 = .
	.loc 1 10 0 discriminator 3
	bnel	$2,$3,.L7
	sb	$0,0($2)

.LVL5 = .
	.loc 1 9 0 discriminator 2
	addiu	$4,$4,1
.LVL6 = .
.L8:
	beq	$4,$6,.L9
	addu	$5,$5,$8

.LVL7 = .
.L3:
	.loc 1 10 0 discriminator 1
	blezl	$7,.L8
	addiu	$4,$4,1

	addu	$3,$8,$5
	.loc 1 10 0 is_stmt 0
	b	.L4
	move	$2,$5

.LVL8 = .
.L9:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	RGB2GrayMatrix
	.cfi_endproc
.LFE0:
	.size	RGB2GrayMatrix, .-RGB2GrayMatrix
	.align	2
	.globl	rgb2gray
.LFB1 = .
	.loc 1 16 0 is_stmt 1
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	rgb2gray
	.type	rgb2gray, @function
rgb2gray:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL9 = .
	.loc 1 18 0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	rgb2gray
	.cfi_endproc
.LFE1:
	.size	rgb2gray, .-rgb2gray
	.align	2
	.globl	computeHistogram
.LFB2 = .
	.loc 1 21 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	computeHistogram
	.type	computeHistogram, @function
computeHistogram:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL10 = .
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	computeHistogram
	.cfi_endproc
.LFE2:
	.size	computeHistogram, .-computeHistogram
	.align	2
	.globl	computeThreshold
.LFB3 = .
	.loc 1 26 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	computeThreshold
	.type	computeThreshold, @function
computeThreshold:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL11 = .
	.loc 1 28 0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	computeThreshold
	.cfi_endproc
.LFE3:
	.size	computeThreshold, .-computeThreshold
	.align	2
	.globl	Gray2BinaryMatrix
.LFB4 = .
	.loc 1 31 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	Gray2BinaryMatrix
	.type	Gray2BinaryMatrix, @function
Gray2BinaryMatrix:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL12 = .
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	Gray2BinaryMatrix
	.cfi_endproc
.LFE4:
	.size	Gray2BinaryMatrix, .-Gray2BinaryMatrix
.Letext0:
	.file 2 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1e3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0x1
	.4byte	.LASF12
	.4byte	.LASF13
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x2
	.byte	0x4
	.4byte	0x50
	.uleb128 0x3
	.ascii	"R\000"
	.byte	0x2
	.byte	0x5
	.4byte	0x50
	.byte	0
	.uleb128 0x3
	.ascii	"G\000"
	.byte	0x2
	.byte	0x6
	.4byte	0x50
	.byte	0x1
	.uleb128 0x3
	.ascii	"B\000"
	.byte	0x2
	.byte	0x7
	.4byte	0x50
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x2
	.byte	0x8
	.4byte	0x25
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0x10
	.4byte	0x50
	.byte	0x1
	.4byte	0x7e
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x10
	.4byte	0x7e
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x57
	.uleb128 0x9
	.4byte	.LASF5
	.byte	0x1
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xec
	.uleb128 0xa
	.4byte	.LASF0
	.byte	0x1
	.byte	0x6
	.4byte	0x7e
	.4byte	.LLST0
	.uleb128 0xa
	.4byte	.LASF1
	.byte	0x1
	.byte	0x6
	.4byte	0xec
	.4byte	.LLST1
	.uleb128 0xb
	.4byte	.LASF2
	.byte	0x1
	.byte	0x6
	.4byte	0xf2
	.uleb128 0x1
	.byte	0x56
	.uleb128 0xb
	.4byte	.LASF3
	.byte	0x1
	.byte	0x6
	.4byte	0xf2
	.uleb128 0x1
	.byte	0x57
	.uleb128 0xc
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0xf2
	.4byte	.LLST2
	.uleb128 0xc
	.ascii	"j\000"
	.byte	0x1
	.byte	0x7
	.4byte	0xf2
	.4byte	.LLST3
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x50
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xe
	.4byte	0x62
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x114
	.uleb128 0xf
	.4byte	0x72
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0x1
	.byte	0x15
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15e
	.uleb128 0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0x15
	.4byte	0xec
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x15
	.4byte	0x15e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xb
	.4byte	.LASF2
	.byte	0x1
	.byte	0x15
	.4byte	0xf2
	.uleb128 0x1
	.byte	0x56
	.uleb128 0xb
	.4byte	.LASF3
	.byte	0x1
	.byte	0x15
	.4byte	0xf2
	.uleb128 0x1
	.byte	0x57
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x164
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1a
	.4byte	0x50
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x192
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1a
	.4byte	0x15e
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x11
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1f
	.4byte	0xec
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x1
	.byte	0x1f
	.4byte	0xec
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1f
	.4byte	0x50
	.uleb128 0x1
	.byte	0x56
	.uleb128 0xb
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1f
	.4byte	0xf2
	.uleb128 0x1
	.byte	0x57
	.uleb128 0xb
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1f
	.4byte	0xf2
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x3
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x11
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
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0xd
	.byte	0x72
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x1e
	.byte	0x1c
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0xf
	.byte	0x72
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x1e
	.byte	0x1c
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0xd
	.byte	0x72
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x1c
	.byte	0x74
	.sleb128 0
	.byte	0x77
	.sleb128 0
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x2
	.byte	0x30
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
.LASF6:
	.ascii	"computeHistogram\000"
.LASF15:
	.ascii	"pixelRGB\000"
.LASF5:
	.ascii	"RGB2GrayMatrix\000"
.LASF2:
	.ascii	"nrows\000"
.LASF17:
	.ascii	"pixel\000"
.LASF10:
	.ascii	"threshold\000"
.LASF12:
	.ascii	"trafo.c\000"
.LASF13:
	.ascii	"C:\\Users\\Dani\\Desktop\\ImageTransformation\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF11:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF0:
	.ascii	"orig\000"
.LASF8:
	.ascii	"histogram\000"
.LASF16:
	.ascii	"rgb2gray\000"
.LASF14:
	.ascii	"_pixel_RGB_t\000"
.LASF9:
	.ascii	"short int\000"
.LASF18:
	.ascii	"computeThreshold\000"
.LASF1:
	.ascii	"dest\000"
.LASF7:
	.ascii	"GrayImage\000"
.LASF19:
	.ascii	"Gray2BinaryMatrix\000"
.LASF3:
	.ascii	"ncols\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
