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
	.loc 1 4 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
.LVL0 = .
	.loc 1 8 0
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$0,12($2)
	.loc 1 9 0
	sw	$0,16($2)
	.loc 1 11 0
 #APP
 # 11 "main.c" 1
	   lui $t3, 0x3fa0;   lui $t4, 0x4020;loop:   nop;   UDI3 $t4, $t3, $t6, 0;   nop;   lui $t5, 0x4000;   UDI5 $t6, $t5, $t6, 0;   nop;   UDI4 $t6, $t6, $t2, 0;   nop;   lui $t8, 0xc000;   UDI3 $t2, $t8, $t2, 0;   nop;   lui $t8, 0x7fff;   ori $t1, $zero, 0xffff;   add $t8, $t8, $t1;   and $t1, $t2, $t8;   lui $t9, 0xbc23;   ori $t0, $zero, 0xd70a;   add $t9, $t9, $t0;   nop;   UDI3 $t1, $t9, $t1, 0;   nop;   lui $t9, 0x8000;   and $t1, $t1, $t9;   bne $t1, $zero, Out_Bisection;   nop;   UDI4 $t4, $t4, $t7, 0;   nop;   lui $t8, 0xc000;   UDI3 $t7, $t8, $t7, 0;   nop;   and $t2, $t2, $t9;   and $t7, $t7, $t9;   beq $t2, $t7, bc;   add $t3, $t6, $zero;   j loop2;bc:   add $t4, $t6, $zero;   loop2: nop;j loop;Out_Bisection: nop;   add $3, $t6, $zero;
 # 0 "" 2
.LVL1 = .
 #NO_APP
.L2:
	.loc 1 83 0 discriminator 1
	sw	$0,12($2)
	.loc 1 84 0 discriminator 1
	sw	$3,16($2)
	.loc 1 85 0 discriminator 1
	b	.L2
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x50
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0x1
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.4byte	0x4c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x4c
	.4byte	.LLST0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
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
	.uleb128 0x3
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x53
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
.LASF0:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF2:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_FPU-Step4\000"
.LASF1:
	.ascii	"main.c\000"
.LASF3:
	.ascii	"main\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
