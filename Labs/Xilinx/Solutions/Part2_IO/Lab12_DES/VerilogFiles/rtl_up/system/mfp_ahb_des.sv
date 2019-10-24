/*
 * DES Encryption/Decryption Engine
 */
 
 module mfp_ahb_des(input  logic [1:64] key,
                input  logic [1:0]  encryptDecrypt,
			    input  logic [1:64] dataIn,
			    output logic [1:64] dataOut);
		
	logic [1:56] keyplus;
	logic [1:28] c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16;
	logic [1:28] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16;
	logic [1:56] c1d1, c2d2, c3d3, c4d4, c5d5, c6d6, c7d7, c8d8, c9d9, c10d10,
	             c11d11, c12d12, c13d13, c14d14, c15d15, c16d16;

	logic [1:48] k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16;
	
	logic [1:64] ip;
	
	logic [1:32] l0, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16;
	logic [1:32] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16;
	
	logic [1:48] e0, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15;
	logic [1:48] k1xe0, k2xe1, k3xe2, k4xe3, k5xe4, k6xe5, k7xe6, k8xe7, k9xe8, k10xe9, 
	             k11xe10, k12xe11, k13xe12, k14xe13, k15xe14, k16xe15;
	logic [1:32] s_k1xe0, s_k2xe1, s_k3xe2, s_k4xe3, s_k5xe4, s_k6xe5, s_k7xe6, s_k8xe7, s_k9xe8, s_k10xe9, 
                 s_k11xe10, s_k12xe11, s_k13xe12, s_k14xe13, s_k15xe14, s_k16xe15;
	
    logic [1:32] f_k1r0, f_k2r1, f_k3r2, f_k4r3, f_k5r4, f_k6r5, f_k7r6, f_k8r7, f_k9r8, f_k10r9, 
                 f_k11r10, f_k12r11, f_k13r12, f_k14r13, f_k15r14, f_k16r15;

	logic [1:64] c;

    assign dataOut = (encryptDecrypt == 2'b0) ? dataIn : c;

    assign keyplus = {key[57],key[49],key[41],key[33],key[25],key[17],key[9],
				      key[1],key[58],key[50],key[42],key[34],key[26],key[18],
				      key[10],key[2],key[59],key[51],key[43],key[35],key[27],
				      key[19],key[11],key[3],key[60],key[52],key[44],key[36],
				      key[63],key[55],key[47],key[39],key[31],key[23],key[15],
				      key[7],key[62],key[54],key[46],key[38],key[30],key[22],
				      key[14],key[6],key[61],key[53],key[45],key[37],key[29],
				      key[21],key[13],key[5],key[28],key[20],key[12],key[4]};

	assign c0 = keyplus[1:28];
	assign d0 = keyplus[29:56];
	
	assign c1 =  {c0[2:28],  c0[1]};      // << 1
	assign d1 =  {d0[2:28],  d0[1]};      // << 1
	assign c2 =  {c1[2:28],  c1[1]};      // << 1
	assign d2 =  {d1[2:28],  d1[1]};      // << 1
	assign c3 =  {c2[3:28],  c2[1:2]};    // << 2
	assign d3 =  {d2[3:28],  d2[1:2]};    // << 2
	assign c4 =  {c3[3:28],  c3[1:2]};    // << 2
	assign d4 =  {d3[3:28],  d3[1:2]};    // << 2
	assign c5 =  {c4[3:28],  c4[1:2]};    // << 2
	assign d5 =  {d4[3:28],  d4[1:2]};    // << 2
	assign c6 =  {c5[3:28],  c5[1:2]};    // << 2
	assign d6 =  {d5[3:28],  d5[1:2]};    // << 2
	assign c7 =  {c6[3:28],  c6[1:2]};    // << 2
	assign d7 =  {d6[3:28],  d6[1:2]};    // << 2
	assign c8 =  {c7[3:28],  c7[1:2]};    // << 2
	assign d8 =  {d7[3:28],  d7[1:2]};    // << 2
	assign c9 =  {c8[2:28],  c8[1]};      // << 1
	assign d9 =  {d8[2:28],  d8[1]};      // << 1				  
	assign c10 = {c9[3:28],  c9[1:2]};    // << 2
	assign d10 = {d9[3:28],  d9[1:2]};    // << 2
	assign c11 = {c10[3:28], c10[1:2]};   // << 2
	assign d11 = {d10[3:28], d10[1:2]};   // << 2
	assign c12 = {c11[3:28], c11[1:2]};   // << 2
	assign d12 = {d11[3:28], d11[1:2]};   // << 2
	assign c13 = {c12[3:28], c12[1:2]};   // << 2
	assign d13 = {d12[3:28], d12[1:2]};   // << 2
	assign c14 = {c13[3:28], c13[1:2]};   // << 2
	assign d14 = {d13[3:28], d13[1:2]};   // << 2
	assign c15 = {c14[3:28], c14[1:2]};   // << 2
	assign d15 = {d14[3:28], d14[1:2]};   // << 2
	assign c16 = {c15[2:28], c15[1]};     // << 1
	assign d16 = {d15[2:28], d15[1]};     // << 1				  

	assign c1d1 = {c1,d1};
	assign c2d2 = {c2,d2};
	assign c3d3 = {c3,d3};
	assign c4d4 = {c4,d4};
	assign c5d5 = {c5,d5};
	assign c6d6 = {c6,d6};
	assign c7d7 = {c7,d7};
	assign c8d8 = {c8,d8};
	assign c9d9 = {c9,d9};
	assign c10d10 = {c10,d10};
	assign c11d11 = {c11,d11};
	assign c12d12 = {c12,d12};
	assign c13d13 = {c13,d13};
	assign c14d14 = {c14,d14};
	assign c15d15 = {c15,d15};
	assign c16d16 = {c16,d16};

	// assign keys
	keys key_k1 (c1d1,   k1);
	keys key_k2 (c2d2,   k2);
	keys key_k3 (c3d3,   k3);
	keys key_k4 (c4d4,   k4);
	keys key_k5 (c5d5,   k5);
	keys key_k6 (c6d6,   k6);
	keys key_k7 (c7d7,   k7);
	keys key_k8 (c8d8,   k8);
	keys key_k9 (c9d9,   k9);
	keys key_k10(c10d10, k10);
	keys key_k11(c11d11, k11);
	keys key_k12(c12d12, k12);
	keys key_k13(c13d13, k13);
	keys key_k14(c14d14, k14);
	keys key_k15(c15d15, k15);
	keys key_k16(c16d16, k16);
	
	assign ip = {dataIn[58], dataIn[50], dataIn[42], dataIn[34], dataIn[26], dataIn[18], dataIn[10], dataIn[2],
				 dataIn[60], dataIn[52], dataIn[44], dataIn[36], dataIn[28], dataIn[20], dataIn[12], dataIn[4],
				 dataIn[62], dataIn[54], dataIn[46], dataIn[38], dataIn[30], dataIn[22], dataIn[14], dataIn[6],
				 dataIn[64], dataIn[56], dataIn[48], dataIn[40], dataIn[32], dataIn[24], dataIn[16], dataIn[8],
				 dataIn[57], dataIn[49], dataIn[41], dataIn[33], dataIn[25], dataIn[17], dataIn[9], dataIn[1],
				 dataIn[59], dataIn[51], dataIn[43], dataIn[35], dataIn[27], dataIn[19], dataIn[11], dataIn[3],
				 dataIn[61], dataIn[53], dataIn[45], dataIn[37], dataIn[29], dataIn[21], dataIn[13], dataIn[5],
				 dataIn[63], dataIn[55], dataIn[47], dataIn[39], dataIn[31], dataIn[23], dataIn[15], dataIn[7]};
				 
	assign l0 = ip[1:32];
	assign r0 = ip[33:64];
	
	assign l1 = r0;
	assign l2 = r1;
	assign l3 = r2;
	assign l4 = r3;
	assign l5 = r4;
	assign l6 = r5;
	assign l7 = r6;
	assign l8 = r7;
	assign l9 = r8;
	assign l10 = r9;
	assign l11 = r10;
	assign l12 = r11;
	assign l13 = r12;
	assign l14 = r13;
	assign l15 = r14;
	assign l16 = r15;
	
	etable etable_e0 (r0,  e0);
	etable etable_e1 (r1,  e1);
	etable etable_e2 (r2,  e2);
	etable etable_e3 (r3,  e3);
	etable etable_e4 (r4,  e4);
	etable etable_e5 (r5,  e5);
	etable etable_e6 (r6,  e6);
	etable etable_e7 (r7,  e7);
	etable etable_e8 (r8,  e8);
	etable etable_e9 (r9,  e9);
	etable etable_e10(r10, e10);
	etable etable_e11(r11, e11);
	etable etable_e12(r12, e12);
	etable etable_e13(r13, e13);
	etable etable_e14(r14, e14);
	etable etable_e15(r15, e15);

    always_comb
      case (encryptDecrypt)
        2'b01: begin // encrypt
          k1xe0   = k1  ^ e0;
          k2xe1   = k2  ^ e1;
          k3xe2   = k3  ^ e2;
          k4xe3   = k4  ^ e3;
          k5xe4   = k5  ^ e4;
          k6xe5   = k6  ^ e5;
          k7xe6   = k7  ^ e6;
          k8xe7   = k8  ^ e7;
          k9xe8   = k9  ^ e8;
          k10xe9  = k10 ^ e9;
          k11xe10 = k11 ^ e10;
          k12xe11 = k12 ^ e11;
          k13xe12 = k13 ^ e12;
          k14xe13 = k14 ^ e13;
          k15xe14 = k15 ^ e14;
          k16xe15 = k16 ^ e15;
        end
        default: begin // decrypt
          k1xe0   = k16 ^ e0;
          k2xe1   = k15 ^ e1;
          k3xe2   = k14 ^ e2;
          k4xe3   = k13 ^ e3;
          k5xe4   = k12 ^ e4;
          k6xe5   = k11 ^ e5;
          k7xe6   = k10 ^ e6;
          k8xe7   = k9  ^ e7;
          k9xe8   = k8  ^ e8;
          k10xe9  = k7  ^ e9;
          k11xe10 = k6  ^ e10;
          k12xe11 = k5  ^ e11;
          k13xe12 = k4  ^ e12;
          k14xe13 = k3  ^ e13;
          k15xe14 = k2  ^ e14;
          k16xe15 = k1  ^ e15;
        end
      endcase

    s1 s1_k1xe0(k1xe0[1:6],s_k1xe0[1:4]);
    s2 s2_k1xe0(k1xe0[7:12],s_k1xe0[5:8]);
    s3 s3_k1xe0(k1xe0[13:18],s_k1xe0[9:12]);
    s4 s4_k1xe0(k1xe0[19:24],s_k1xe0[13:16]);
    s5 s5_k1xe0(k1xe0[25:30],s_k1xe0[17:20]);
    s6 s6_k1xe0(k1xe0[31:36],s_k1xe0[21:24]);
    s7 s7_k1xe0(k1xe0[37:42],s_k1xe0[25:28]);
    s8 s8_k1xe0(k1xe0[43:48],s_k1xe0[29:32]);

    s1 s1_k2xe1(k2xe1[1:6],s_k2xe1[1:4]);
    s2 s2_k2xe1(k2xe1[7:12],s_k2xe1[5:8]);
    s3 s3_k2xe1(k2xe1[13:18],s_k2xe1[9:12]);
    s4 s4_k2xe1(k2xe1[19:24],s_k2xe1[13:16]);
    s5 s5_k2xe1(k2xe1[25:30],s_k2xe1[17:20]);
    s6 s6_k2xe1(k2xe1[31:36],s_k2xe1[21:24]);
    s7 s7_k2xe1(k2xe1[37:42],s_k2xe1[25:28]);
    s8 s8_k2xe1(k2xe1[43:48],s_k2xe1[29:32]);

    s1 s1_k3xe2(k3xe2[1:6],s_k3xe2[1:4]);
    s2 s2_k3xe2(k3xe2[7:12],s_k3xe2[5:8]);
    s3 s3_k3xe2(k3xe2[13:18],s_k3xe2[9:12]);
    s4 s4_k3xe2(k3xe2[19:24],s_k3xe2[13:16]);
    s5 s5_k3xe2(k3xe2[25:30],s_k3xe2[17:20]);
    s6 s6_k3xe2(k3xe2[31:36],s_k3xe2[21:24]);
    s7 s7_k3xe2(k3xe2[37:42],s_k3xe2[25:28]);
    s8 s8_k3xe2(k3xe2[43:48],s_k3xe2[29:32]);

    s1 s1_k4xe3(k4xe3[1:6],s_k4xe3[1:4]);
    s2 s2_k4xe3(k4xe3[7:12],s_k4xe3[5:8]);
    s3 s3_k4xe3(k4xe3[13:18],s_k4xe3[9:12]);
    s4 s4_k4xe3(k4xe3[19:24],s_k4xe3[13:16]);
    s5 s5_k4xe3(k4xe3[25:30],s_k4xe3[17:20]);
    s6 s6_k4xe3(k4xe3[31:36],s_k4xe3[21:24]);
    s7 s7_k4xe3(k4xe3[37:42],s_k4xe3[25:28]);
    s8 s8_k4xe3(k4xe3[43:48],s_k4xe3[29:32]);

    s1 s1_k5xe4(k5xe4[1:6],s_k5xe4[1:4]);
    s2 s2_k5xe4(k5xe4[7:12],s_k5xe4[5:8]);
    s3 s3_k5xe4(k5xe4[13:18],s_k5xe4[9:12]);
    s4 s4_k5xe4(k5xe4[19:24],s_k5xe4[13:16]);
    s5 s5_k5xe4(k5xe4[25:30],s_k5xe4[17:20]);
    s6 s6_k5xe4(k5xe4[31:36],s_k5xe4[21:24]);
    s7 s7_k5xe4(k5xe4[37:42],s_k5xe4[25:28]);
    s8 s8_k5xe4(k5xe4[43:48],s_k5xe4[29:32]);

    s1 s1_k6xe5(k6xe5[1:6],s_k6xe5[1:4]);
    s2 s2_k6xe5(k6xe5[7:12],s_k6xe5[5:8]);
    s3 s3_k6xe5(k6xe5[13:18],s_k6xe5[9:12]);
    s4 s4_k6xe5(k6xe5[19:24],s_k6xe5[13:16]);
    s5 s5_k6xe5(k6xe5[25:30],s_k6xe5[17:20]);
    s6 s6_k6xe5(k6xe5[31:36],s_k6xe5[21:24]);
    s7 s7_k6xe5(k6xe5[37:42],s_k6xe5[25:28]);
    s8 s8_k6xe5(k6xe5[43:48],s_k6xe5[29:32]);

    s1 s1_k7xe6(k7xe6[1:6],s_k7xe6[1:4]);
    s2 s2_k7xe6(k7xe6[7:12],s_k7xe6[5:8]);
    s3 s3_k7xe6(k7xe6[13:18],s_k7xe6[9:12]);
    s4 s4_k7xe6(k7xe6[19:24],s_k7xe6[13:16]);
    s5 s5_k7xe6(k7xe6[25:30],s_k7xe6[17:20]);
    s6 s6_k7xe6(k7xe6[31:36],s_k7xe6[21:24]);
    s7 s7_k7xe6(k7xe6[37:42],s_k7xe6[25:28]);
    s8 s8_k7xe6(k7xe6[43:48],s_k7xe6[29:32]);

    s1 s1_k8xe7(k8xe7[1:6],s_k8xe7[1:4]);
    s2 s2_k8xe7(k8xe7[7:12],s_k8xe7[5:8]);
    s3 s3_k8xe7(k8xe7[13:18],s_k8xe7[9:12]);
    s4 s4_k8xe7(k8xe7[19:24],s_k8xe7[13:16]);
    s5 s5_k8xe7(k8xe7[25:30],s_k8xe7[17:20]);
    s6 s6_k8xe7(k8xe7[31:36],s_k8xe7[21:24]);
    s7 s7_k8xe7(k8xe7[37:42],s_k8xe7[25:28]);
    s8 s8_k8xe7(k8xe7[43:48],s_k8xe7[29:32]);

    s1 s1_k9xe8(k9xe8[1:6],s_k9xe8[1:4]);
    s2 s2_k9xe8(k9xe8[7:12],s_k9xe8[5:8]);
    s3 s3_k9xe8(k9xe8[13:18],s_k9xe8[9:12]);
    s4 s4_k9xe8(k9xe8[19:24],s_k9xe8[13:16]);
    s5 s5_k9xe8(k9xe8[25:30],s_k9xe8[17:20]);
    s6 s6_k9xe8(k9xe8[31:36],s_k9xe8[21:24]);
    s7 s7_k9xe8(k9xe8[37:42],s_k9xe8[25:28]);
    s8 s8_k9xe8(k9xe8[43:48],s_k9xe8[29:32]);

    s1 s1_k10xe9(k10xe9[1:6],s_k10xe9[1:4]);
    s2 s2_k10xe9(k10xe9[7:12],s_k10xe9[5:8]);
    s3 s3_k10xe9(k10xe9[13:18],s_k10xe9[9:12]);
    s4 s4_k10xe9(k10xe9[19:24],s_k10xe9[13:16]);
    s5 s5_k10xe9(k10xe9[25:30],s_k10xe9[17:20]);
    s6 s6_k10xe9(k10xe9[31:36],s_k10xe9[21:24]);
    s7 s7_k10xe9(k10xe9[37:42],s_k10xe9[25:28]);
    s8 s8_k10xe9(k10xe9[43:48],s_k10xe9[29:32]);

    s1 s1_k11xe10(k11xe10[1:6],s_k11xe10[1:4]);
    s2 s2_k11xe10(k11xe10[7:12],s_k11xe10[5:8]);
    s3 s3_k11xe10(k11xe10[13:18],s_k11xe10[9:12]);
    s4 s4_k11xe10(k11xe10[19:24],s_k11xe10[13:16]);
    s5 s5_k11xe10(k11xe10[25:30],s_k11xe10[17:20]);
    s6 s6_k11xe10(k11xe10[31:36],s_k11xe10[21:24]);
    s7 s7_k11xe10(k11xe10[37:42],s_k11xe10[25:28]);
    s8 s8_k11xe10(k11xe10[43:48],s_k11xe10[29:32]);

    s1 s1_k12xe11(k12xe11[1:6],s_k12xe11[1:4]);
    s2 s2_k12xe11(k12xe11[7:12],s_k12xe11[5:8]);
    s3 s3_k12xe11(k12xe11[13:18],s_k12xe11[9:12]);
    s4 s4_k12xe11(k12xe11[19:24],s_k12xe11[13:16]);
    s5 s5_k12xe11(k12xe11[25:30],s_k12xe11[17:20]);
    s6 s6_k12xe11(k12xe11[31:36],s_k12xe11[21:24]);
    s7 s7_k12xe11(k12xe11[37:42],s_k12xe11[25:28]);
    s8 s8_k12xe11(k12xe11[43:48],s_k12xe11[29:32]);

    s1 s1_k13xe12(k13xe12[1:6],s_k13xe12[1:4]);
    s2 s2_k13xe12(k13xe12[7:12],s_k13xe12[5:8]);
    s3 s3_k13xe12(k13xe12[13:18],s_k13xe12[9:12]);
    s4 s4_k13xe12(k13xe12[19:24],s_k13xe12[13:16]);
    s5 s5_k13xe12(k13xe12[25:30],s_k13xe12[17:20]);
    s6 s6_k13xe12(k13xe12[31:36],s_k13xe12[21:24]);
    s7 s7_k13xe12(k13xe12[37:42],s_k13xe12[25:28]);
    s8 s8_k13xe12(k13xe12[43:48],s_k13xe12[29:32]);

    s1 s1_k14xe13(k14xe13[1:6],s_k14xe13[1:4]);
    s2 s2_k14xe13(k14xe13[7:12],s_k14xe13[5:8]);
    s3 s3_k14xe13(k14xe13[13:18],s_k14xe13[9:12]);
    s4 s4_k14xe13(k14xe13[19:24],s_k14xe13[13:16]);
    s5 s5_k14xe13(k14xe13[25:30],s_k14xe13[17:20]);
    s6 s6_k14xe13(k14xe13[31:36],s_k14xe13[21:24]);
    s7 s7_k14xe13(k14xe13[37:42],s_k14xe13[25:28]);
    s8 s8_k14xe13(k14xe13[43:48],s_k14xe13[29:32]);

    s1 s1_k15xe14(k15xe14[1:6],s_k15xe14[1:4]);
    s2 s2_k15xe14(k15xe14[7:12],s_k15xe14[5:8]);
    s3 s3_k15xe14(k15xe14[13:18],s_k15xe14[9:12]);
    s4 s4_k15xe14(k15xe14[19:24],s_k15xe14[13:16]);
    s5 s5_k15xe14(k15xe14[25:30],s_k15xe14[17:20]);
    s6 s6_k15xe14(k15xe14[31:36],s_k15xe14[21:24]);
    s7 s7_k15xe14(k15xe14[37:42],s_k15xe14[25:28]);
    s8 s8_k15xe14(k15xe14[43:48],s_k15xe14[29:32]);

    s1 s1_k16xe15(k16xe15[1:6],s_k16xe15[1:4]);
    s2 s2_k16xe15(k16xe15[7:12],s_k16xe15[5:8]);
    s3 s3_k16xe15(k16xe15[13:18],s_k16xe15[9:12]);
    s4 s4_k16xe15(k16xe15[19:24],s_k16xe15[13:16]);
    s5 s5_k16xe15(k16xe15[25:30],s_k16xe15[17:20]);
    s6 s6_k16xe15(k16xe15[31:36],s_k16xe15[21:24]);
    s7 s7_k16xe15(k16xe15[37:42],s_k16xe15[25:28]);
    s8 s8_k16xe15(k16xe15[43:48],s_k16xe15[29:32]);

    p p_k1r0(s_k1xe0, f_k1r0);
    p p_k2r1(s_k2xe1, f_k2r1);
    p p_k3r2(s_k3xe2, f_k3r2);
    p p_k4r3(s_k4xe3, f_k4r3);
    p p_k5r4(s_k5xe4, f_k5r4);
    p p_k6r5(s_k6xe5, f_k6r5);
    p p_k7r6(s_k7xe6, f_k7r6);
    p p_k8r7(s_k8xe7, f_k8r7);
    p p_k9r8(s_k9xe8, f_k9r8);
    p p_k10r9(s_k10xe9, f_k10r9);
    p p_k11r10(s_k11xe10, f_k11r10);
    p p_k12r11(s_k12xe11, f_k12r11);
    p p_k13r12(s_k13xe12, f_k13r12);
    p p_k14r13(s_k14xe13, f_k14r13);
    p p_k15r14(s_k15xe14, f_k15r14);
    p p_k16r15(s_k16xe15, f_k16r15);
	
	assign r1  = l0  ^ f_k1r0;
	assign r2  = l1  ^ f_k2r1;
	assign r3  = l2  ^ f_k3r2;
	assign r4  = l3  ^ f_k4r3;
	assign r5  = l4  ^ f_k5r4;
	assign r6  = l5  ^ f_k6r5;
	assign r7  = l6  ^ f_k7r6;
	assign r8  = l7  ^ f_k8r7;
	assign r9  = l8  ^ f_k9r8;
	assign r10 = l9  ^ f_k10r9;
	assign r11 = l10 ^ f_k11r10;
	assign r12 = l11 ^ f_k12r11;
	assign r13 = l12 ^ f_k13r12;
	assign r14 = l13 ^ f_k14r13;
	assign r15 = l14 ^ f_k15r14;
	assign r16 = l15 ^ f_k16r15;
	
	ipinv ipinv({r16,l16}, c);

endmodule			

module keys(input logic [1:56] cd, output logic [1:48] k);
	assign k = {cd[14], cd[17], cd[11], cd[24], cd[1],  cd[5],
				cd[3],  cd[28], cd[15], cd[6],  cd[21], cd[10],
				cd[23], cd[19], cd[12], cd[4],  cd[26], cd[8],
				cd[16], cd[7],  cd[27], cd[20], cd[13], cd[2],
				cd[41], cd[52], cd[31], cd[37], cd[47], cd[55],
				cd[30], cd[40], cd[51], cd[45], cd[33], cd[48],
				cd[44], cd[49], cd[39], cd[56], cd[34], cd[53],
				cd[46], cd[42], cd[50], cd[36], cd[29], cd[32]};
endmodule

module etable(input logic [1:32] r, output logic [1:48] e);
  assign e = {r[32], r[1],  r[2],  r[3],  r[4],  r[5],
              r[4],  r[5],  r[6],  r[7],  r[8],  r[9],
              r[8],  r[9],  r[10], r[11], r[12], r[13],
              r[12], r[13], r[14], r[15], r[16], r[17],
              r[16], r[17], r[18], r[19], r[20], r[21],				 
              r[20], r[21], r[22], r[23], r[24], r[25],
              r[24], r[25], r[26], r[27], r[28], r[29],
              r[28], r[29], r[30], r[31], r[32], r[1]};
endmodule

module s1(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd14;
				1: block4 = 4'd4;
				2: block4 = 4'd13;
				3: block4 = 4'd1;
				4: block4 = 4'd2;
				5: block4 = 4'd15;
				6: block4 = 4'd11;
				7: block4 = 4'd8;
				8: block4 = 4'd3;
				9: block4 = 4'd10;
				10: block4 = 4'd6;
				11: block4 = 4'd12;
				12: block4 = 4'd5;
				13: block4 = 4'd9;
				14: block4 = 4'd0;
				15: block4 = 4'd7;
			endcase
		1: 	case (col)
				0: block4 = 4'd0;
				1: block4 = 4'd15;
				2: block4 = 4'd7;
				3: block4 = 4'd4;
				4: block4 = 4'd14;
				5: block4 = 4'd2;
				6: block4 = 4'd13;
				7: block4 = 4'd1;
				8: block4 = 4'd10;
				9: block4 = 4'd6;
				10: block4 = 4'd12;
				11: block4 = 4'd11;
				12: block4 = 4'd9;
				13: block4 = 4'd5;
				14: block4 = 4'd3;
				15: block4 = 4'd8;
			endcase
		2: 	case (col)
				0: block4 = 4'd4;
				1: block4 = 4'd1;
				2: block4 = 4'd14;
				3: block4 = 4'd8;
				4: block4 = 4'd13;
				5: block4 = 4'd6;
				6: block4 = 4'd2;
				7: block4 = 4'd11;
				8: block4 = 4'd15;
				9: block4 = 4'd12;
				10: block4 = 4'd9;
				11: block4 = 4'd7;
				12: block4 = 4'd3;
				13: block4 = 4'd10;
				14: block4 = 4'd5;
				15: block4 = 4'd0;
			endcase
		3: 	case (col)
				0: block4 = 4'd15;
				1: block4 = 4'd12;
				2: block4 = 4'd8;
				3: block4 = 4'd2;
				4: block4 = 4'd4;
				5: block4 = 4'd9;
				6: block4 = 4'd1;
				7: block4 = 4'd7;
				8: block4 = 4'd5;
				9: block4 = 4'd11;
				10: block4 = 4'd3;
				11: block4 = 4'd14;
				12: block4 = 4'd10;
				13: block4 = 4'd0;
				14: block4 = 4'd6;
				15: block4 = 4'd13;
			endcase
	endcase

endmodule

module s2(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd15;
				1: block4 = 4'd1;
				2: block4 = 4'd8;
				3: block4 = 4'd14;
				4: block4 = 4'd6;
				5: block4 = 4'd11;
				6: block4 = 4'd3;
				7: block4 = 4'd4;
				8: block4 = 4'd9;
				9: block4 = 4'd7;
				10: block4 = 4'd2;
				11: block4 = 4'd13;
				12: block4 = 4'd12;
				13: block4 = 4'd0;
				14: block4 = 4'd5;
				15: block4 = 4'd10;
			endcase
		1: 	case (col)
				0: block4 = 4'd3;
				1: block4 = 4'd13;
				2: block4 = 4'd4;
				3: block4 = 4'd7;
				4: block4 = 4'd15;
				5: block4 = 4'd2;
				6: block4 = 4'd8;
				7: block4 = 4'd14;
				8: block4 = 4'd12;
				9: block4 = 4'd0;
				10: block4 = 4'd1;
				11: block4 = 4'd10;
				12: block4 = 4'd6;
				13: block4 = 4'd9;
				14: block4 = 4'd11;
				15: block4 = 4'd5;
			endcase
		2: 	case (col)
				0: block4 = 4'd0;
				1: block4 = 4'd14;
				2: block4 = 4'd7;
				3: block4 = 4'd11;
				4: block4 = 4'd10;
				5: block4 = 4'd4;
				6: block4 = 4'd13;
				7: block4 = 4'd1;
				8: block4 = 4'd5;
				9: block4 = 4'd8;
				10: block4 = 4'd12;
				11: block4 = 4'd6;
				12: block4 = 4'd9;
				13: block4 = 4'd3;
				14: block4 = 4'd2;
				15: block4 = 4'd15;
			endcase
		3: 	case (col)
				0: block4 = 4'd13;
				1: block4 = 4'd8;
				2: block4 = 4'd10;
				3: block4 = 4'd1;
				4: block4 = 4'd3;
				5: block4 = 4'd15;
				6: block4 = 4'd4;
				7: block4 = 4'd2;
				8: block4 = 4'd11;
				9: block4 = 4'd6;
				10: block4 = 4'd7;
				11: block4 = 4'd12;
				12: block4 = 4'd0;
				13: block4 = 4'd5;
				14: block4 = 4'd14;
				15: block4 = 4'd9;
			endcase
	endcase

endmodule

module s3(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd10;
				1: block4 = 4'd0;
				2: block4 = 4'd9;
				3: block4 = 4'd14;
				4: block4 = 4'd6;
				5: block4 = 4'd3;
				6: block4 = 4'd15;
				7: block4 = 4'd5;
				8: block4 = 4'd1;
				9: block4 = 4'd13;
				10: block4 = 4'd12;
				11: block4 = 4'd7;
				12: block4 = 4'd11;
				13: block4 = 4'd4;
				14: block4 = 4'd2;
				15: block4 = 4'd8;
			endcase
		1: 	case (col)
				0: block4 = 4'd13;
				1: block4 = 4'd7;
				2: block4 = 4'd0;
				3: block4 = 4'd9;
				4: block4 = 4'd3;
				5: block4 = 4'd4;
				6: block4 = 4'd6;
				7: block4 = 4'd10;
				8: block4 = 4'd2;
				9: block4 = 4'd8;
				10: block4 = 4'd5;
				11: block4 = 4'd14;
				12: block4 = 4'd12;
				13: block4 = 4'd11;
				14: block4 = 4'd15;
				15: block4 = 4'd1;
			endcase
		2: 	case (col)
				0: block4 = 4'd13;
				1: block4 = 4'd6;
				2: block4 = 4'd4;
				3: block4 = 4'd9;
				4: block4 = 4'd8;
				5: block4 = 4'd15;
				6: block4 = 4'd3;
				7: block4 = 4'd0;
				8: block4 = 4'd11;
				9: block4 = 4'd1;
				10: block4 = 4'd2;
				11: block4 = 4'd12;
				12: block4 = 4'd5;
				13: block4 = 4'd10;
				14: block4 = 4'd14;
				15: block4 = 4'd7;
			endcase
		3: 	case (col)
				0: block4 = 4'd1;
				1: block4 = 4'd10;
				2: block4 = 4'd13;
				3: block4 = 4'd0;
				4: block4 = 4'd6;
				5: block4 = 4'd9;
				6: block4 = 4'd8;
				7: block4 = 4'd7;
				8: block4 = 4'd4;
				9: block4 = 4'd15;
				10: block4 = 4'd14;
				11: block4 = 4'd3;
				12: block4 = 4'd11;
				13: block4 = 4'd5;
				14: block4 = 4'd2;
				15: block4 = 4'd12;
			endcase
	endcase

endmodule

module s4(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd7;
				1: block4 = 4'd13;
				2: block4 = 4'd14;
				3: block4 = 4'd3;
				4: block4 = 4'd0;
				5: block4 = 4'd6;
				6: block4 = 4'd9;
				7: block4 = 4'd10;
				8: block4 = 4'd1;
				9: block4 = 4'd2;
				10: block4 = 4'd8;
				11: block4 = 4'd5;
				12: block4 = 4'd11;
				13: block4 = 4'd12;
				14: block4 = 4'd4;
				15: block4 = 4'd15;
			endcase
		1: 	case (col)
				0: block4 = 4'd13;
				1: block4 = 4'd8;
				2: block4 = 4'd11;
				3: block4 = 4'd5;
				4: block4 = 4'd6;
				5: block4 = 4'd15;
				6: block4 = 4'd0;
				7: block4 = 4'd3;
				8: block4 = 4'd4;
				9: block4 = 4'd7;
				10: block4 = 4'd2;
				11: block4 = 4'd12;
				12: block4 = 4'd1;
				13: block4 = 4'd10;
				14: block4 = 4'd14;
				15: block4 = 4'd9;
			endcase
		2: 	case (col)
				0: block4 = 4'd10;
				1: block4 = 4'd6;
				2: block4 = 4'd9;
				3: block4 = 4'd0;
				4: block4 = 4'd12;
				5: block4 = 4'd11;
				6: block4 = 4'd7;
				7: block4 = 4'd13;
				8: block4 = 4'd15;
				9: block4 = 4'd1;
				10: block4 = 4'd3;
				11: block4 = 4'd14;
				12: block4 = 4'd5;
				13: block4 = 4'd2;
				14: block4 = 4'd8;
				15: block4 = 4'd4;
			endcase
		3: 	case (col)
				0: block4 = 4'd3;
				1: block4 = 4'd15;
				2: block4 = 4'd0;
				3: block4 = 4'd6;
				4: block4 = 4'd10;
				5: block4 = 4'd1;
				6: block4 = 4'd13;
				7: block4 = 4'd8;
				8: block4 = 4'd9;
				9: block4 = 4'd4;
				10: block4 = 4'd5;
				11: block4 = 4'd11;
				12: block4 = 4'd12;
				13: block4 = 4'd7;
				14: block4 = 4'd2;
				15: block4 = 4'd14;
			endcase
	endcase

endmodule

module s5(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd2;
				1: block4 = 4'd12;
				2: block4 = 4'd4;
				3: block4 = 4'd1;
				4: block4 = 4'd7;
				5: block4 = 4'd10;
				6: block4 = 4'd11;
				7: block4 = 4'd6;
				8: block4 = 4'd8;
				9: block4 = 4'd5;
				10: block4 = 4'd3;
				11: block4 = 4'd15;
				12: block4 = 4'd13;
				13: block4 = 4'd0;
				14: block4 = 4'd14;
				15: block4 = 4'd9;
			endcase
		1: 	case (col)
				0: block4 = 4'd14;
				1: block4 = 4'd11;
				2: block4 = 4'd2;
				3: block4 = 4'd12;
				4: block4 = 4'd4;
				5: block4 = 4'd7;
				6: block4 = 4'd13;
				7: block4 = 4'd1;
				8: block4 = 4'd5;
				9: block4 = 4'd0;
				10: block4 = 4'd15;
				11: block4 = 4'd10;
				12: block4 = 4'd3;
				13: block4 = 4'd9;
				14: block4 = 4'd8;
				15: block4 = 4'd6;
			endcase
		2: 	case (col)
				0: block4 = 4'd4;
				1: block4 = 4'd2;
				2: block4 = 4'd1;
				3: block4 = 4'd11;
				4: block4 = 4'd10;
				5: block4 = 4'd13;
				6: block4 = 4'd7;
				7: block4 = 4'd8;
				8: block4 = 4'd15;
				9: block4 = 4'd9;
				10: block4 = 4'd12;
				11: block4 = 4'd5;
				12: block4 = 4'd6;
				13: block4 = 4'd3;
				14: block4 = 4'd0;
				15: block4 = 4'd14;
			endcase
		3: 	case (col)
				0: block4 = 4'd11;
				1: block4 = 4'd8;
				2: block4 = 4'd12;
				3: block4 = 4'd7;
				4: block4 = 4'd1;
				5: block4 = 4'd14;
				6: block4 = 4'd2;
				7: block4 = 4'd13;
				8: block4 = 4'd6;
				9: block4 = 4'd15;
				10: block4 = 4'd0;
				11: block4 = 4'd9;
				12: block4 = 4'd10;
				13: block4 = 4'd4;
				14: block4 = 4'd5;
				15: block4 = 4'd3;
			endcase
	endcase

endmodule

module s6(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd12;
				1: block4 = 4'd1;
				2: block4 = 4'd10;
				3: block4 = 4'd15;
				4: block4 = 4'd9;
				5: block4 = 4'd2;
				6: block4 = 4'd6;
				7: block4 = 4'd8;
				8: block4 = 4'd0;
				9: block4 = 4'd13;
				10: block4 = 4'd3;
				11: block4 = 4'd4;
				12: block4 = 4'd14;
				13: block4 = 4'd7;
				14: block4 = 4'd5;
				15: block4 = 4'd11;
			endcase
		1: 	case (col)
				0: block4 = 4'd10;
				1: block4 = 4'd15;
				2: block4 = 4'd4;
				3: block4 = 4'd2;
				4: block4 = 4'd7;
				5: block4 = 4'd12;
				6: block4 = 4'd9;
				7: block4 = 4'd5;
				8: block4 = 4'd6;
				9: block4 = 4'd1;
				10: block4 = 4'd13;
				11: block4 = 4'd14;
				12: block4 = 4'd0;
				13: block4 = 4'd11;
				14: block4 = 4'd3;
				15: block4 = 4'd8;
			endcase
		2: 	case (col)
				0: block4 = 4'd9;
				1: block4 = 4'd14;
				2: block4 = 4'd15;
				3: block4 = 4'd5;
				4: block4 = 4'd2;
				5: block4 = 4'd8;
				6: block4 = 4'd12;
				7: block4 = 4'd3;
				8: block4 = 4'd7;
				9: block4 = 4'd0;
				10: block4 = 4'd4;
				11: block4 = 4'd10;
				12: block4 = 4'd1;
				13: block4 = 4'd13;
				14: block4 = 4'd11;
				15: block4 = 4'd6;
			endcase
		3: 	case (col)
				0: block4 = 4'd4;
				1: block4 = 4'd3;
				2: block4 = 4'd2;
				3: block4 = 4'd12;
				4: block4 = 4'd9;
				5: block4 = 4'd5;
				6: block4 = 4'd15;
				7: block4 = 4'd10;
				8: block4 = 4'd11;
				9: block4 = 4'd14;
				10: block4 = 4'd1;
				11: block4 = 4'd7;
				12: block4 = 4'd6;
				13: block4 = 4'd0;
				14: block4 = 4'd8;
				15: block4 = 4'd13;
			endcase
	endcase

endmodule

module s7(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd4;
				1: block4 = 4'd11;
				2: block4 = 4'd2;
				3: block4 = 4'd14;
				4: block4 = 4'd15;
				5: block4 = 4'd0;
				6: block4 = 4'd8;
				7: block4 = 4'd13;
				8: block4 = 4'd3;
				9: block4 = 4'd12;
				10: block4 = 4'd9;
				11: block4 = 4'd7;
				12: block4 = 4'd5;
				13: block4 = 4'd10;
				14: block4 = 4'd6;
				15: block4 = 4'd1;
			endcase
		1: 	case (col)
				0: block4 = 4'd13;
				1: block4 = 4'd0;
				2: block4 = 4'd11;
				3: block4 = 4'd7;
				4: block4 = 4'd4;
				5: block4 = 4'd9;
				6: block4 = 4'd1;
				7: block4 = 4'd10;
				8: block4 = 4'd14;
				9: block4 = 4'd3;
				10: block4 = 4'd5;
				11: block4 = 4'd12;
				12: block4 = 4'd2;
				13: block4 = 4'd15;
				14: block4 = 4'd8;
				15: block4 = 4'd6;
			endcase
		2: 	case (col)
				0: block4 = 4'd1;
				1: block4 = 4'd4;
				2: block4 = 4'd11;
				3: block4 = 4'd13;
				4: block4 = 4'd12;
				5: block4 = 4'd3;
				6: block4 = 4'd7;
				7: block4 = 4'd14;
				8: block4 = 4'd10;
				9: block4 = 4'd15;
				10: block4 = 4'd6;
				11: block4 = 4'd8;
				12: block4 = 4'd0;
				13: block4 = 4'd5;
				14: block4 = 4'd9;
				15: block4 = 4'd2;
			endcase
		3: 	case (col)
				0: block4 = 4'd6;
				1: block4 = 4'd11;
				2: block4 = 4'd13;
				3: block4 = 4'd8;
				4: block4 = 4'd1;
				5: block4 = 4'd4;
				6: block4 = 4'd10;
				7: block4 = 4'd7;
				8: block4 = 4'd9;
				9: block4 = 4'd5;
				10: block4 = 4'd0;
				11: block4 = 4'd15;
				12: block4 = 4'd14;
				13: block4 = 4'd2;
				14: block4 = 4'd3;
				15: block4 = 4'd12;
			endcase
	endcase

endmodule

module s8(input  logic [1:6] block6,
          output logic [1:4] block4);
		  
	logic [1:2] row;
	logic [1:4] col;

	assign row = {block6[1], block6[6]};
	assign col = block6[2:5];
	
    always @(*)
      case (row)
		0: 	case (col)
				0: block4 = 4'd13;
				1: block4 = 4'd2;
				2: block4 = 4'd8;
				3: block4 = 4'd4;
				4: block4 = 4'd6;
				5: block4 = 4'd15;
				6: block4 = 4'd11;
				7: block4 = 4'd1;
				8: block4 = 4'd10;
				9: block4 = 4'd9;
				10: block4 = 4'd3;
				11: block4 = 4'd14;
				12: block4 = 4'd5;
				13: block4 = 4'd0;
				14: block4 = 4'd12;
				15: block4 = 4'd7;
			endcase
		1: 	case (col)
				0: block4 = 4'd1;
				1: block4 = 4'd15;
				2: block4 = 4'd13;
				3: block4 = 4'd8;
				4: block4 = 4'd10;
				5: block4 = 4'd3;
				6: block4 = 4'd7;
				7: block4 = 4'd4;
				8: block4 = 4'd12;
				9: block4 = 4'd5;
				10: block4 = 4'd6;
				11: block4 = 4'd11;
				12: block4 = 4'd0;
				13: block4 = 4'd14;
				14: block4 = 4'd9;
				15: block4 = 4'd2;
			endcase
		2: 	case (col)
				0: block4 = 4'd7;
				1: block4 = 4'd11;
				2: block4 = 4'd4;
				3: block4 = 4'd1;
				4: block4 = 4'd9;
				5: block4 = 4'd12;
				6: block4 = 4'd14;
				7: block4 = 4'd2;
				8: block4 = 4'd0;
				9: block4 = 4'd6;
				10: block4 = 4'd10;
				11: block4 = 4'd13;
				12: block4 = 4'd15;
				13: block4 = 4'd3;
				14: block4 = 4'd5;
				15: block4 = 4'd8;
			endcase
		3: 	case (col)
				0: block4 = 4'd2;
				1: block4 = 4'd1;
				2: block4 = 4'd14;
				3: block4 = 4'd7;
				4: block4 = 4'd4;
				5: block4 = 4'd10;
				6: block4 = 4'd8;
				7: block4 = 4'd13;
				8: block4 = 4'd15;
				9: block4 = 4'd12;
				10: block4 = 4'd9;
				11: block4 = 4'd0;
				12: block4 = 4'd3;
				13: block4 = 4'd5;
				14: block4 = 4'd6;
				15: block4 = 4'd11;
			endcase
	endcase

endmodule


module p(input logic [1:32] s, output logic [1:32] f);

  assign f = {s[16], s[7],  s[20], s[21],
              s[29], s[12], s[28], s[17],
              s[1],  s[15], s[23], s[26],
              s[5],  s[18], s[31], s[10],
              s[2],  s[8],  s[24], s[14],
              s[32], s[27], s[3],  s[9],
              s[19], s[13], s[30], s[6],
              s[22], s[11], s[4],  s[25]};

endmodule

module ipinv(input logic [1:64] r16l16, output logic [1:64] c);

  assign c = {r16l16[40], r16l16[8], r16l16[48], r16l16[16], r16l16[56], r16l16[24], r16l16[64], r16l16[32],
              r16l16[39], r16l16[7], r16l16[47], r16l16[15], r16l16[55], r16l16[23], r16l16[63], r16l16[31],
              r16l16[38], r16l16[6], r16l16[46], r16l16[14], r16l16[54], r16l16[22], r16l16[62], r16l16[30],
              r16l16[37], r16l16[5], r16l16[45], r16l16[13], r16l16[53], r16l16[21], r16l16[61], r16l16[29],
              r16l16[36], r16l16[4], r16l16[44], r16l16[12], r16l16[52], r16l16[20], r16l16[60], r16l16[28],			  
              r16l16[35], r16l16[3], r16l16[43], r16l16[11], r16l16[51], r16l16[19], r16l16[59], r16l16[27],			  
              r16l16[34], r16l16[2], r16l16[42], r16l16[10], r16l16[50], r16l16[18], r16l16[58], r16l16[26],			  
              r16l16[33], r16l16[1], r16l16[41], r16l16[9],  r16l16[49], r16l16[17], r16l16[57], r16l16[25]};
endmodule