module vga_test
	(
		input wire clk, reset, rst_rf, rst_dm,
		output wire hsync, vsync,
		output wire [11:0] rgb
	);
	
	//Wires for Register Data
	wire [31:0] R0, R1, R2, R3, R4, 
                    R5, R6, R7, R8, R9, R10, R11, 
                    R12, R13, R14, R15, R16, R17,
                    R18, R19, R20, R21, R22, R23,
                    R24, R25, R26, R27, R28, R29,
                    R30, R31;
   
   //Make the processor process instructions at a rate of 1 Hz
   reg [26:0] counter;
   wire [26:0] counter_NS;
   wire clk_1Hz;
   always @(posedge clk or posedge reset)
        if (reset)
            counter <= 0;
        else
            counter <= counter_NS;
            
   assign counter_NS = (counter == 99999999) ? 0 : counter + 1;
   assign clk_1Hz = (counter == 99999999) ? 1 : 0;
   
   Processor p1 (clk_1Hz, reset, rst_rf, rst_dm,
                R0, R1, R2, R3, R4, 
                    R5, R6, R7, R8, R9, R10, R11, 
                    R12, R13, R14, R15, R16, R17,
                    R18, R19, R20, R21, R22, R23,
                    R24, R25, R26, R27, R28, R29,
                    R30, R31);
                    
   //32 Bit register data is broken into 8*32 HEX DIGITS with R0_0 meaning 0th Register and Least Significant Hex Digit
    wire [6:0] R0_0, R0_1, R0_2, R0_3, R0_4, R0_5, R0_6, R0_7, 
R1_0, R1_1, R1_2, R1_3, R1_4, R1_5, R1_6, R1_7, 
R2_0, R2_1, R2_2, R2_3, R2_4, R2_5, R2_6, R2_7, 
R3_0, R3_1, R3_2, R3_3, R3_4, R3_5, R3_6, R3_7, 
R4_0, R4_1, R4_2, R4_3, R4_4, R4_5, R4_6, R4_7, 
R5_0, R5_1, R5_2, R5_3, R5_4, R5_5, R5_6, R5_7, 
R6_0, R6_1, R6_2, R6_3, R6_4, R6_5, R6_6, R6_7, 
R7_0, R7_1, R7_2, R7_3, R7_4, R7_5, R7_6, R7_7, 
R8_0, R8_1, R8_2, R8_3, R8_4, R8_5, R8_6, R8_7, 
R9_0, R9_1, R9_2, R9_3, R9_4, R9_5, R9_6, R9_7, 
R10_0, R10_1, R10_2, R10_3, R10_4, R10_5, R10_6, R10_7, 
R11_0, R11_1, R11_2, R11_3, R11_4, R11_5, R11_6, R11_7, 
R12_0, R12_1, R12_2, R12_3, R12_4, R12_5, R12_6, R12_7, 
R13_0, R13_1, R13_2, R13_3, R13_4, R13_5, R13_6, R13_7, 
R14_0, R14_1, R14_2, R14_3, R14_4, R14_5, R14_6, R14_7, 
R15_0, R15_1, R15_2, R15_3, R15_4, R15_5, R15_6, R15_7, 
R16_0, R16_1, R16_2, R16_3, R16_4, R16_5, R16_6, R16_7, 
R17_0, R17_1, R17_2, R17_3, R17_4, R17_5, R17_6, R17_7, 
R18_0, R18_1, R18_2, R18_3, R18_4, R18_5, R18_6, R18_7, 
R19_0, R19_1, R19_2, R19_3, R19_4, R19_5, R19_6, R19_7, 
R20_0, R20_1, R20_2, R20_3, R20_4, R20_5, R20_6, R20_7, 
R21_0, R21_1, R21_2, R21_3, R21_4, R21_5, R21_6, R21_7, 
R22_0, R22_1, R22_2, R22_3, R22_4, R22_5, R22_6, R22_7, 
R23_0, R23_1, R23_2, R23_3, R23_4, R23_5, R23_6, R23_7, 
R24_0, R24_1, R24_2, R24_3, R24_4, R24_5, R24_6, R24_7, 
R25_0, R25_1, R25_2, R25_3, R25_4, R25_5, R25_6, R25_7, 
R26_0, R26_1, R26_2, R26_3, R26_4, R26_5, R26_6, R26_7, 
R27_0, R27_1, R27_2, R27_3, R27_4, R27_5, R27_6, R27_7, 
R28_0, R28_1, R28_2, R28_3, R28_4, R28_5, R28_6, R28_7, 
R29_0, R29_1, R29_2, R29_3, R29_4, R29_5, R29_6, R29_7, 
R30_0, R30_1, R30_2, R30_3, R30_4, R30_5, R30_6, R30_7, 
R31_0, R31_1, R31_2, R31_3, R31_4, R31_5, R31_6, R31_7;
    
    ValueToAscii a0(.in(R0[3:0]), .out(R0_0));
ValueToAscii a1(.in(R0[7:4]), .out(R0_1));
ValueToAscii a2(.in(R0[11:8]), .out(R0_2));
ValueToAscii a3(.in(R0[15:12]), .out(R0_3));
ValueToAscii a4(.in(R0[19:16]), .out(R0_4));
ValueToAscii a5(.in(R0[23:20]), .out(R0_5));
ValueToAscii a6(.in(R0[27:24]), .out(R0_6));
ValueToAscii a7(.in(R0[31:28]), .out(R0_7));
ValueToAscii a8(.in(R1[3:0]), .out(R1_0));
ValueToAscii a9(.in(R1[7:4]), .out(R1_1));
ValueToAscii a10(.in(R1[11:8]), .out(R1_2));
ValueToAscii a11(.in(R1[15:12]), .out(R1_3));
ValueToAscii a12(.in(R1[19:16]), .out(R1_4));
ValueToAscii a13(.in(R1[23:20]), .out(R1_5));
ValueToAscii a14(.in(R1[27:24]), .out(R1_6));
ValueToAscii a15(.in(R1[31:28]), .out(R1_7));
ValueToAscii a16(.in(R2[3:0]), .out(R2_0));
ValueToAscii a17(.in(R2[7:4]), .out(R2_1));
ValueToAscii a18(.in(R2[11:8]), .out(R2_2));
ValueToAscii a19(.in(R2[15:12]), .out(R2_3));
ValueToAscii a20(.in(R2[19:16]), .out(R2_4));
ValueToAscii a21(.in(R2[23:20]), .out(R2_5));
ValueToAscii a22(.in(R2[27:24]), .out(R2_6));
ValueToAscii a23(.in(R2[31:28]), .out(R2_7));
ValueToAscii a24(.in(R3[3:0]), .out(R3_0));
ValueToAscii a25(.in(R3[7:4]), .out(R3_1));
ValueToAscii a26(.in(R3[11:8]), .out(R3_2));
ValueToAscii a27(.in(R3[15:12]), .out(R3_3));
ValueToAscii a28(.in(R3[19:16]), .out(R3_4));
ValueToAscii a29(.in(R3[23:20]), .out(R3_5));
ValueToAscii a30(.in(R3[27:24]), .out(R3_6));
ValueToAscii a31(.in(R3[31:28]), .out(R3_7));
ValueToAscii a32(.in(R4[3:0]), .out(R4_0));
ValueToAscii a33(.in(R4[7:4]), .out(R4_1));
ValueToAscii a34(.in(R4[11:8]), .out(R4_2));
ValueToAscii a35(.in(R4[15:12]), .out(R4_3));
ValueToAscii a36(.in(R4[19:16]), .out(R4_4));
ValueToAscii a37(.in(R4[23:20]), .out(R4_5));
ValueToAscii a38(.in(R4[27:24]), .out(R4_6));
ValueToAscii a39(.in(R4[31:28]), .out(R4_7));
ValueToAscii a40(.in(R5[3:0]), .out(R5_0));
ValueToAscii a41(.in(R5[7:4]), .out(R5_1));
ValueToAscii a42(.in(R5[11:8]), .out(R5_2));
ValueToAscii a43(.in(R5[15:12]), .out(R5_3));
ValueToAscii a44(.in(R5[19:16]), .out(R5_4));
ValueToAscii a45(.in(R5[23:20]), .out(R5_5));
ValueToAscii a46(.in(R5[27:24]), .out(R5_6));
ValueToAscii a47(.in(R5[31:28]), .out(R5_7));
ValueToAscii a48(.in(R6[3:0]), .out(R6_0));
ValueToAscii a49(.in(R6[7:4]), .out(R6_1));
ValueToAscii a50(.in(R6[11:8]), .out(R6_2));
ValueToAscii a51(.in(R6[15:12]), .out(R6_3));
ValueToAscii a52(.in(R6[19:16]), .out(R6_4));
ValueToAscii a53(.in(R6[23:20]), .out(R6_5));
ValueToAscii a54(.in(R6[27:24]), .out(R6_6));
ValueToAscii a55(.in(R6[31:28]), .out(R6_7));
ValueToAscii a56(.in(R7[3:0]), .out(R7_0));
ValueToAscii a57(.in(R7[7:4]), .out(R7_1));
ValueToAscii a58(.in(R7[11:8]), .out(R7_2));
ValueToAscii a59(.in(R7[15:12]), .out(R7_3));
ValueToAscii a60(.in(R7[19:16]), .out(R7_4));
ValueToAscii a61(.in(R7[23:20]), .out(R7_5));
ValueToAscii a62(.in(R7[27:24]), .out(R7_6));
ValueToAscii a63(.in(R7[31:28]), .out(R7_7));
ValueToAscii a64(.in(R8[3:0]), .out(R8_0));
ValueToAscii a65(.in(R8[7:4]), .out(R8_1));
ValueToAscii a66(.in(R8[11:8]), .out(R8_2));
ValueToAscii a67(.in(R8[15:12]), .out(R8_3));
ValueToAscii a68(.in(R8[19:16]), .out(R8_4));
ValueToAscii a69(.in(R8[23:20]), .out(R8_5));
ValueToAscii a70(.in(R8[27:24]), .out(R8_6));
ValueToAscii a71(.in(R8[31:28]), .out(R8_7));
ValueToAscii a72(.in(R9[3:0]), .out(R9_0));
ValueToAscii a73(.in(R9[7:4]), .out(R9_1));
ValueToAscii a74(.in(R9[11:8]), .out(R9_2));
ValueToAscii a75(.in(R9[15:12]), .out(R9_3));
ValueToAscii a76(.in(R9[19:16]), .out(R9_4));
ValueToAscii a77(.in(R9[23:20]), .out(R9_5));
ValueToAscii a78(.in(R9[27:24]), .out(R9_6));
ValueToAscii a79(.in(R9[31:28]), .out(R9_7));
ValueToAscii a80(.in(R10[3:0]), .out(R10_0));
ValueToAscii a81(.in(R10[7:4]), .out(R10_1));
ValueToAscii a82(.in(R10[11:8]), .out(R10_2));
ValueToAscii a83(.in(R10[15:12]), .out(R10_3));
ValueToAscii a84(.in(R10[19:16]), .out(R10_4));
ValueToAscii a85(.in(R10[23:20]), .out(R10_5));
ValueToAscii a86(.in(R10[27:24]), .out(R10_6));
ValueToAscii a87(.in(R10[31:28]), .out(R10_7));
ValueToAscii a88(.in(R11[3:0]), .out(R11_0));
ValueToAscii a89(.in(R11[7:4]), .out(R11_1));
ValueToAscii a90(.in(R11[11:8]), .out(R11_2));
ValueToAscii a91(.in(R11[15:12]), .out(R11_3));
ValueToAscii a92(.in(R11[19:16]), .out(R11_4));
ValueToAscii a93(.in(R11[23:20]), .out(R11_5));
ValueToAscii a94(.in(R11[27:24]), .out(R11_6));
ValueToAscii a95(.in(R11[31:28]), .out(R11_7));
ValueToAscii a96(.in(R12[3:0]), .out(R12_0));
ValueToAscii a97(.in(R12[7:4]), .out(R12_1));
ValueToAscii a98(.in(R12[11:8]), .out(R12_2));
ValueToAscii a99(.in(R12[15:12]), .out(R12_3));
ValueToAscii a100(.in(R12[19:16]), .out(R12_4));
ValueToAscii a101(.in(R12[23:20]), .out(R12_5));
ValueToAscii a102(.in(R12[27:24]), .out(R12_6));
ValueToAscii a103(.in(R12[31:28]), .out(R12_7));
ValueToAscii a104(.in(R13[3:0]), .out(R13_0));
ValueToAscii a105(.in(R13[7:4]), .out(R13_1));
ValueToAscii a106(.in(R13[11:8]), .out(R13_2));
ValueToAscii a107(.in(R13[15:12]), .out(R13_3));
ValueToAscii a108(.in(R13[19:16]), .out(R13_4));
ValueToAscii a109(.in(R13[23:20]), .out(R13_5));
ValueToAscii a110(.in(R13[27:24]), .out(R13_6));
ValueToAscii a111(.in(R13[31:28]), .out(R13_7));
ValueToAscii a112(.in(R14[3:0]), .out(R14_0));
ValueToAscii a113(.in(R14[7:4]), .out(R14_1));
ValueToAscii a114(.in(R14[11:8]), .out(R14_2));
ValueToAscii a115(.in(R14[15:12]), .out(R14_3));
ValueToAscii a116(.in(R14[19:16]), .out(R14_4));
ValueToAscii a117(.in(R14[23:20]), .out(R14_5));
ValueToAscii a118(.in(R14[27:24]), .out(R14_6));
ValueToAscii a119(.in(R14[31:28]), .out(R14_7));
ValueToAscii a120(.in(R15[3:0]), .out(R15_0));
ValueToAscii a121(.in(R15[7:4]), .out(R15_1));
ValueToAscii a122(.in(R15[11:8]), .out(R15_2));
ValueToAscii a123(.in(R15[15:12]), .out(R15_3));
ValueToAscii a124(.in(R15[19:16]), .out(R15_4));
ValueToAscii a125(.in(R15[23:20]), .out(R15_5));
ValueToAscii a126(.in(R15[27:24]), .out(R15_6));
ValueToAscii a127(.in(R15[31:28]), .out(R15_7));
ValueToAscii a128(.in(R16[3:0]), .out(R16_0));
ValueToAscii a129(.in(R16[7:4]), .out(R16_1));
ValueToAscii a130(.in(R16[11:8]), .out(R16_2));
ValueToAscii a131(.in(R16[15:12]), .out(R16_3));
ValueToAscii a132(.in(R16[19:16]), .out(R16_4));
ValueToAscii a133(.in(R16[23:20]), .out(R16_5));
ValueToAscii a134(.in(R16[27:24]), .out(R16_6));
ValueToAscii a135(.in(R16[31:28]), .out(R16_7));
ValueToAscii a136(.in(R17[3:0]), .out(R17_0));
ValueToAscii a137(.in(R17[7:4]), .out(R17_1));
ValueToAscii a138(.in(R17[11:8]), .out(R17_2));
ValueToAscii a139(.in(R17[15:12]), .out(R17_3));
ValueToAscii a140(.in(R17[19:16]), .out(R17_4));
ValueToAscii a141(.in(R17[23:20]), .out(R17_5));
ValueToAscii a142(.in(R17[27:24]), .out(R17_6));
ValueToAscii a143(.in(R17[31:28]), .out(R17_7));
ValueToAscii a144(.in(R18[3:0]), .out(R18_0));
ValueToAscii a145(.in(R18[7:4]), .out(R18_1));
ValueToAscii a146(.in(R18[11:8]), .out(R18_2));
ValueToAscii a147(.in(R18[15:12]), .out(R18_3));
ValueToAscii a148(.in(R18[19:16]), .out(R18_4));
ValueToAscii a149(.in(R18[23:20]), .out(R18_5));
ValueToAscii a150(.in(R18[27:24]), .out(R18_6));
ValueToAscii a151(.in(R18[31:28]), .out(R18_7));
ValueToAscii a152(.in(R19[3:0]), .out(R19_0));
ValueToAscii a153(.in(R19[7:4]), .out(R19_1));
ValueToAscii a154(.in(R19[11:8]), .out(R19_2));
ValueToAscii a155(.in(R19[15:12]), .out(R19_3));
ValueToAscii a156(.in(R19[19:16]), .out(R19_4));
ValueToAscii a157(.in(R19[23:20]), .out(R19_5));
ValueToAscii a158(.in(R19[27:24]), .out(R19_6));
ValueToAscii a159(.in(R19[31:28]), .out(R19_7));
ValueToAscii a160(.in(R20[3:0]), .out(R20_0));
ValueToAscii a161(.in(R20[7:4]), .out(R20_1));
ValueToAscii a162(.in(R20[11:8]), .out(R20_2));
ValueToAscii a163(.in(R20[15:12]), .out(R20_3));
ValueToAscii a164(.in(R20[19:16]), .out(R20_4));
ValueToAscii a165(.in(R20[23:20]), .out(R20_5));
ValueToAscii a166(.in(R20[27:24]), .out(R20_6));
ValueToAscii a167(.in(R20[31:28]), .out(R20_7));
ValueToAscii a168(.in(R21[3:0]), .out(R21_0));
ValueToAscii a169(.in(R21[7:4]), .out(R21_1));
ValueToAscii a170(.in(R21[11:8]), .out(R21_2));
ValueToAscii a171(.in(R21[15:12]), .out(R21_3));
ValueToAscii a172(.in(R21[19:16]), .out(R21_4));
ValueToAscii a173(.in(R21[23:20]), .out(R21_5));
ValueToAscii a174(.in(R21[27:24]), .out(R21_6));
ValueToAscii a175(.in(R21[31:28]), .out(R21_7));
ValueToAscii a176(.in(R22[3:0]), .out(R22_0));
ValueToAscii a177(.in(R22[7:4]), .out(R22_1));
ValueToAscii a178(.in(R22[11:8]), .out(R22_2));
ValueToAscii a179(.in(R22[15:12]), .out(R22_3));
ValueToAscii a180(.in(R22[19:16]), .out(R22_4));
ValueToAscii a181(.in(R22[23:20]), .out(R22_5));
ValueToAscii a182(.in(R22[27:24]), .out(R22_6));
ValueToAscii a183(.in(R22[31:28]), .out(R22_7));
ValueToAscii a184(.in(R23[3:0]), .out(R23_0));
ValueToAscii a185(.in(R23[7:4]), .out(R23_1));
ValueToAscii a186(.in(R23[11:8]), .out(R23_2));
ValueToAscii a187(.in(R23[15:12]), .out(R23_3));
ValueToAscii a188(.in(R23[19:16]), .out(R23_4));
ValueToAscii a189(.in(R23[23:20]), .out(R23_5));
ValueToAscii a190(.in(R23[27:24]), .out(R23_6));
ValueToAscii a191(.in(R23[31:28]), .out(R23_7));
ValueToAscii a192(.in(R24[3:0]), .out(R24_0));
ValueToAscii a193(.in(R24[7:4]), .out(R24_1));
ValueToAscii a194(.in(R24[11:8]), .out(R24_2));
ValueToAscii a195(.in(R24[15:12]), .out(R24_3));
ValueToAscii a196(.in(R24[19:16]), .out(R24_4));
ValueToAscii a197(.in(R24[23:20]), .out(R24_5));
ValueToAscii a198(.in(R24[27:24]), .out(R24_6));
ValueToAscii a199(.in(R24[31:28]), .out(R24_7));
ValueToAscii a200(.in(R25[3:0]), .out(R25_0));
ValueToAscii a201(.in(R25[7:4]), .out(R25_1));
ValueToAscii a202(.in(R25[11:8]), .out(R25_2));
ValueToAscii a203(.in(R25[15:12]), .out(R25_3));
ValueToAscii a204(.in(R25[19:16]), .out(R25_4));
ValueToAscii a205(.in(R25[23:20]), .out(R25_5));
ValueToAscii a206(.in(R25[27:24]), .out(R25_6));
ValueToAscii a207(.in(R25[31:28]), .out(R25_7));
ValueToAscii a208(.in(R26[3:0]), .out(R26_0));
ValueToAscii a209(.in(R26[7:4]), .out(R26_1));
ValueToAscii a210(.in(R26[11:8]), .out(R26_2));
ValueToAscii a211(.in(R26[15:12]), .out(R26_3));
ValueToAscii a212(.in(R26[19:16]), .out(R26_4));
ValueToAscii a213(.in(R26[23:20]), .out(R26_5));
ValueToAscii a214(.in(R26[27:24]), .out(R26_6));
ValueToAscii a215(.in(R26[31:28]), .out(R26_7));
ValueToAscii a216(.in(R27[3:0]), .out(R27_0));
ValueToAscii a217(.in(R27[7:4]), .out(R27_1));
ValueToAscii a218(.in(R27[11:8]), .out(R27_2));
ValueToAscii a219(.in(R27[15:12]), .out(R27_3));
ValueToAscii a220(.in(R27[19:16]), .out(R27_4));
ValueToAscii a221(.in(R27[23:20]), .out(R27_5));
ValueToAscii a222(.in(R27[27:24]), .out(R27_6));
ValueToAscii a223(.in(R27[31:28]), .out(R27_7));
ValueToAscii a224(.in(R28[3:0]), .out(R28_0));
ValueToAscii a225(.in(R28[7:4]), .out(R28_1));
ValueToAscii a226(.in(R28[11:8]), .out(R28_2));
ValueToAscii a227(.in(R28[15:12]), .out(R28_3));
ValueToAscii a228(.in(R28[19:16]), .out(R28_4));
ValueToAscii a229(.in(R28[23:20]), .out(R28_5));
ValueToAscii a230(.in(R28[27:24]), .out(R28_6));
ValueToAscii a231(.in(R28[31:28]), .out(R28_7));
ValueToAscii a232(.in(R29[3:0]), .out(R29_0));
ValueToAscii a233(.in(R29[7:4]), .out(R29_1));
ValueToAscii a234(.in(R29[11:8]), .out(R29_2));
ValueToAscii a235(.in(R29[15:12]), .out(R29_3));
ValueToAscii a236(.in(R29[19:16]), .out(R29_4));
ValueToAscii a237(.in(R29[23:20]), .out(R29_5));
ValueToAscii a238(.in(R29[27:24]), .out(R29_6));
ValueToAscii a239(.in(R29[31:28]), .out(R29_7));
ValueToAscii a240(.in(R30[3:0]), .out(R30_0));
ValueToAscii a241(.in(R30[7:4]), .out(R30_1));
ValueToAscii a242(.in(R30[11:8]), .out(R30_2));
ValueToAscii a243(.in(R30[15:12]), .out(R30_3));
ValueToAscii a244(.in(R30[19:16]), .out(R30_4));
ValueToAscii a245(.in(R30[23:20]), .out(R30_5));
ValueToAscii a246(.in(R30[27:24]), .out(R30_6));
ValueToAscii a247(.in(R30[31:28]), .out(R30_7));
ValueToAscii a248(.in(R31[3:0]), .out(R31_0));
ValueToAscii a249(.in(R31[7:4]), .out(R31_1));
ValueToAscii a250(.in(R31[11:8]), .out(R31_2));
ValueToAscii a251(.in(R31[15:12]), .out(R31_3));
ValueToAscii a252(.in(R31[19:16]), .out(R31_4));
ValueToAscii a253(.in(R31[23:20]), .out(R31_5));
ValueToAscii a254(.in(R31[27:24]), .out(R31_6));
ValueToAscii a255(.in(R31[31:28]), .out(R31_7));

	
	//VGA/////////////////////////////////////////////////////////////////////////////
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;
    wire [9:0] x,y; //Pixel location
        // instantiate vga_sync for the monitor sync and x,y pixel tracing
    vga_sync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                            .video_on(video_on), .x(x), .y(y));
    //////////////////////////////////////////////////////////////////////////////////
    
    /*
    //COUNTER FOR LIVE DATA //////////////////////////////////////////////////////////
    //Instantiate a counter with counterValue representing the 0-9 count in ASCII
    wire [6:0] counterValue; 
    counter counter1(.clk(clk), .reset(reset), .out(counterValue));
    //////////////////////////////////////////////////////////////////////////////////
    */
    //READ MEMORY FILE FOR INPUT ASCII ARRAY, CREATE SIGNAL ARRAY                       
    wire [6:0] ascii;  //Signal is concatenated with X coordinate to get a value for the ROM address                 
    wire [6:0] a[367:0]; //Each index of this array holds a 7-bit ASCII value
    wire d[367:0]; //Each index of this array holds a signal that says whether the i-th item in array a above should display
    wire displayContents; //Control signal to determine whether a character should be displayed on the screen
    
    //Read memory file for ascii inputs
    reg [6:0] readAscii [7:0];
    initial begin
        $readmemh("ascii.txt", readAscii);
    end
    ///////////////////////////////////////////////////////////////////////////////////
    
    //INSTANTIATE TEXT GENERATION MODULES/////////////////////////////////////////////////////////
        //Manually feed in data to ascii_in or use another module to get live data, such as a counter
        //In this case readAscii is an array that had data imported from a hex memory file
        
 //Semicolon column 1       
 textGeneration r0 (.clk(clk), .reset(reset), .asciiData(a[0]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[0]), .x_desired(10'd120), .y_desired(10'd160));
textGeneration r1 (.clk(clk), .reset(reset), .asciiData(a[1]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[1]), .x_desired(10'd120), .y_desired(10'd176));
textGeneration r2 (.clk(clk), .reset(reset), .asciiData(a[2]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[2]), .x_desired(10'd120), .y_desired(10'd192));
textGeneration r3 (.clk(clk), .reset(reset), .asciiData(a[3]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[3]), .x_desired(10'd120), .y_desired(10'd208));
textGeneration r4 (.clk(clk), .reset(reset), .asciiData(a[4]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[4]), .x_desired(10'd120), .y_desired(10'd224));
textGeneration r5 (.clk(clk), .reset(reset), .asciiData(a[5]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[5]), .x_desired(10'd120), .y_desired(10'd240));
textGeneration r6 (.clk(clk), .reset(reset), .asciiData(a[6]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[6]), .x_desired(10'd120), .y_desired(10'd256));
textGeneration r7 (.clk(clk), .reset(reset), .asciiData(a[7]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[7]), .x_desired(10'd120), .y_desired(10'd272));
textGeneration r8 (.clk(clk), .reset(reset), .asciiData(a[8]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[8]), .x_desired(10'd120), .y_desired(10'd288));
textGeneration r9 (.clk(clk), .reset(reset), .asciiData(a[9]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[9]), .x_desired(10'd120), .y_desired(10'd304));
textGeneration r10 (.clk(clk), .reset(reset), .asciiData(a[10]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[10]), .x_desired(10'd120), .y_desired(10'd320));
textGeneration r11 (.clk(clk), .reset(reset), .asciiData(a[11]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[11]), .x_desired(10'd120), .y_desired(10'd336));
textGeneration r12 (.clk(clk), .reset(reset), .asciiData(a[12]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[12]), .x_desired(10'd120), .y_desired(10'd352));
textGeneration r13 (.clk(clk), .reset(reset), .asciiData(a[13]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[13]), .x_desired(10'd120), .y_desired(10'd368));
textGeneration r14 (.clk(clk), .reset(reset), .asciiData(a[14]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[14]), .x_desired(10'd120), .y_desired(10'd384));
textGeneration r15 (.clk(clk), .reset(reset), .asciiData(a[15]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[15]), .x_desired(10'd120), .y_desired(10'd400));
//Semicolon column 2
textGeneration r16 (.clk(clk), .reset(reset), .asciiData(a[16]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[16]), .x_desired(10'd256), .y_desired(10'd160));
textGeneration r17 (.clk(clk), .reset(reset), .asciiData(a[17]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[17]), .x_desired(10'd256), .y_desired(10'd176));
textGeneration r18 (.clk(clk), .reset(reset), .asciiData(a[18]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[18]), .x_desired(10'd256), .y_desired(10'd192));
textGeneration r19 (.clk(clk), .reset(reset), .asciiData(a[19]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[19]), .x_desired(10'd256), .y_desired(10'd208));
textGeneration r20 (.clk(clk), .reset(reset), .asciiData(a[20]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[20]), .x_desired(10'd256), .y_desired(10'd224));
textGeneration r21 (.clk(clk), .reset(reset), .asciiData(a[21]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[21]), .x_desired(10'd256), .y_desired(10'd240));
textGeneration r22 (.clk(clk), .reset(reset), .asciiData(a[22]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[22]), .x_desired(10'd256), .y_desired(10'd256));
textGeneration r23 (.clk(clk), .reset(reset), .asciiData(a[23]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[23]), .x_desired(10'd256), .y_desired(10'd272));
textGeneration r24 (.clk(clk), .reset(reset), .asciiData(a[24]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[24]), .x_desired(10'd256), .y_desired(10'd288));
textGeneration r25 (.clk(clk), .reset(reset), .asciiData(a[25]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[25]), .x_desired(10'd256), .y_desired(10'd304));
textGeneration r26 (.clk(clk), .reset(reset), .asciiData(a[26]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[26]), .x_desired(10'd256), .y_desired(10'd320));
textGeneration r27 (.clk(clk), .reset(reset), .asciiData(a[27]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[27]), .x_desired(10'd256), .y_desired(10'd336));
textGeneration r28 (.clk(clk), .reset(reset), .asciiData(a[28]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[28]), .x_desired(10'd256), .y_desired(10'd352));
textGeneration r29 (.clk(clk), .reset(reset), .asciiData(a[29]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[29]), .x_desired(10'd256), .y_desired(10'd368));
textGeneration r30 (.clk(clk), .reset(reset), .asciiData(a[30]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[30]), .x_desired(10'd256), .y_desired(10'd384));
textGeneration r31 (.clk(clk), .reset(reset), .asciiData(a[31]), .ascii_In(7'd58), .x(x), .y(y), .displayContents(d[31]), .x_desired(10'd256), .y_desired(10'd400));

//Title RISC-V CPU
textGeneration r32 (.clk(clk), .reset(reset), .asciiData(a[32]), .ascii_In(7'd82), .x(x), .y(y), .displayContents(d[32]), .x_desired(10'd112), .y_desired(10'd96));
textGeneration r33 (.clk(clk), .reset(reset), .asciiData(a[33]), .ascii_In(7'd73), .x(x), .y(y), .displayContents(d[33]), .x_desired(10'd120), .y_desired(10'd96));
textGeneration r34 (.clk(clk), .reset(reset), .asciiData(a[34]), .ascii_In(7'd83), .x(x), .y(y), .displayContents(d[34]), .x_desired(10'd128), .y_desired(10'd96));
textGeneration r35 (.clk(clk), .reset(reset), .asciiData(a[35]), .ascii_In(7'd67), .x(x), .y(y), .displayContents(d[35]), .x_desired(10'd136), .y_desired(10'd96));
textGeneration r36 (.clk(clk), .reset(reset), .asciiData(a[36]), .ascii_In(7'd45), .x(x), .y(y), .displayContents(d[36]), .x_desired(10'd144), .y_desired(10'd96));
textGeneration r37 (.clk(clk), .reset(reset), .asciiData(a[37]), .ascii_In(7'd86), .x(x), .y(y), .displayContents(d[37]), .x_desired(10'd152), .y_desired(10'd96));
textGeneration r38 (.clk(clk), .reset(reset), .asciiData(a[38]), .ascii_In(7'd32), .x(x), .y(y), .displayContents(d[38]), .x_desired(10'd160), .y_desired(10'd96));
textGeneration r39 (.clk(clk), .reset(reset), .asciiData(a[39]), .ascii_In(7'd67), .x(x), .y(y), .displayContents(d[39]), .x_desired(10'd168), .y_desired(10'd96));
textGeneration r40 (.clk(clk), .reset(reset), .asciiData(a[40]), .ascii_In(7'd80), .x(x), .y(y), .displayContents(d[40]), .x_desired(10'd176), .y_desired(10'd96));
textGeneration r41 (.clk(clk), .reset(reset), .asciiData(a[41]), .ascii_In(7'd85), .x(x), .y(y), .displayContents(d[41]), .x_desired(10'd184), .y_desired(10'd96));

//REG 0-9 COL 1
//X0-9
textGeneration r42 (.clk(clk), .reset(reset), .asciiData(a[42]), .ascii_In(7'd48), .x(x), .y(y), .displayContents(d[42]), .x_desired(10'd112), .y_desired(10'd160));
textGeneration r43 (.clk(clk), .reset(reset), .asciiData(a[43]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[43]), .x_desired(10'd112), .y_desired(10'd176));
textGeneration r44 (.clk(clk), .reset(reset), .asciiData(a[44]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[44]), .x_desired(10'd112), .y_desired(10'd192));
textGeneration r45 (.clk(clk), .reset(reset), .asciiData(a[45]), .ascii_In(7'd51), .x(x), .y(y), .displayContents(d[45]), .x_desired(10'd112), .y_desired(10'd208));
textGeneration r46 (.clk(clk), .reset(reset), .asciiData(a[46]), .ascii_In(7'd52), .x(x), .y(y), .displayContents(d[46]), .x_desired(10'd112), .y_desired(10'd224));
textGeneration r47 (.clk(clk), .reset(reset), .asciiData(a[47]), .ascii_In(7'd53), .x(x), .y(y), .displayContents(d[47]), .x_desired(10'd112), .y_desired(10'd240));
textGeneration r48 (.clk(clk), .reset(reset), .asciiData(a[48]), .ascii_In(7'd54), .x(x), .y(y), .displayContents(d[48]), .x_desired(10'd112), .y_desired(10'd256));
textGeneration r49 (.clk(clk), .reset(reset), .asciiData(a[49]), .ascii_In(7'd55), .x(x), .y(y), .displayContents(d[49]), .x_desired(10'd112), .y_desired(10'd272));
textGeneration r50 (.clk(clk), .reset(reset), .asciiData(a[50]), .ascii_In(7'd56), .x(x), .y(y), .displayContents(d[50]), .x_desired(10'd112), .y_desired(10'd288));
textGeneration r51 (.clk(clk), .reset(reset), .asciiData(a[51]), .ascii_In(7'd57), .x(x), .y(y), .displayContents(d[51]), .x_desired(10'd112), .y_desired(10'd304));

//REG 10-15 COL 1
//X(0-5)
textGeneration r52 (.clk(clk), .reset(reset), .asciiData(a[52]), .ascii_In(7'd48), .x(x), .y(y), .displayContents(d[52]), .x_desired(10'd112), .y_desired(10'd320));
textGeneration r53 (.clk(clk), .reset(reset), .asciiData(a[53]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[53]), .x_desired(10'd112), .y_desired(10'd336));
textGeneration r54 (.clk(clk), .reset(reset), .asciiData(a[54]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[54]), .x_desired(10'd112), .y_desired(10'd352));
textGeneration r55 (.clk(clk), .reset(reset), .asciiData(a[55]), .ascii_In(7'd51), .x(x), .y(y), .displayContents(d[55]), .x_desired(10'd112), .y_desired(10'd368));
textGeneration r56 (.clk(clk), .reset(reset), .asciiData(a[56]), .ascii_In(7'd52), .x(x), .y(y), .displayContents(d[56]), .x_desired(10'd112), .y_desired(10'd384));
textGeneration r57 (.clk(clk), .reset(reset), .asciiData(a[57]), .ascii_In(7'd53), .x(x), .y(y), .displayContents(d[57]), .x_desired(10'd112), .y_desired(10'd400));
//1(X)
textGeneration r58 (.clk(clk), .reset(reset), .asciiData(a[58]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[58]), .x_desired(10'd104), .y_desired(10'd320));
textGeneration r59 (.clk(clk), .reset(reset), .asciiData(a[59]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[59]), .x_desired(10'd104), .y_desired(10'd336));
textGeneration r60 (.clk(clk), .reset(reset), .asciiData(a[60]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[60]), .x_desired(10'd104), .y_desired(10'd352));
textGeneration r61 (.clk(clk), .reset(reset), .asciiData(a[61]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[61]), .x_desired(10'd104), .y_desired(10'd368));
textGeneration r62 (.clk(clk), .reset(reset), .asciiData(a[62]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[62]), .x_desired(10'd104), .y_desired(10'd384));
textGeneration r63 (.clk(clk), .reset(reset), .asciiData(a[63]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[63]), .x_desired(10'd104), .y_desired(10'd400));        

//REG 16-31 COL 2     
//1X   
textGeneration r64 (.clk(clk), .reset(reset), .asciiData(a[64]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[64]), .x_desired(10'd240), .y_desired(10'd160));
textGeneration r65 (.clk(clk), .reset(reset), .asciiData(a[65]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[65]), .x_desired(10'd240), .y_desired(10'd176));
textGeneration r66 (.clk(clk), .reset(reset), .asciiData(a[66]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[66]), .x_desired(10'd240), .y_desired(10'd192));
textGeneration r67 (.clk(clk), .reset(reset), .asciiData(a[67]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[67]), .x_desired(10'd240), .y_desired(10'd208));
//1(6-9)
textGeneration r68 (.clk(clk), .reset(reset), .asciiData(a[68]), .ascii_In(7'd54), .x(x), .y(y), .displayContents(d[68]), .x_desired(10'd248), .y_desired(10'd160));
textGeneration r69 (.clk(clk), .reset(reset), .asciiData(a[69]), .ascii_In(7'd55), .x(x), .y(y), .displayContents(d[69]), .x_desired(10'd248), .y_desired(10'd176));
textGeneration r70 (.clk(clk), .reset(reset), .asciiData(a[70]), .ascii_In(7'd56), .x(x), .y(y), .displayContents(d[70]), .x_desired(10'd248), .y_desired(10'd192));
textGeneration r71 (.clk(clk), .reset(reset), .asciiData(a[71]), .ascii_In(7'd57), .x(x), .y(y), .displayContents(d[71]), .x_desired(10'd248), .y_desired(10'd208));        
//2X
textGeneration r72 (.clk(clk), .reset(reset), .asciiData(a[72]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[72]), .x_desired(10'd240), .y_desired(10'd224));
textGeneration r73 (.clk(clk), .reset(reset), .asciiData(a[73]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[73]), .x_desired(10'd240), .y_desired(10'd240));
textGeneration r74 (.clk(clk), .reset(reset), .asciiData(a[74]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[74]), .x_desired(10'd240), .y_desired(10'd256));
textGeneration r75 (.clk(clk), .reset(reset), .asciiData(a[75]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[75]), .x_desired(10'd240), .y_desired(10'd272));
textGeneration r76 (.clk(clk), .reset(reset), .asciiData(a[76]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[76]), .x_desired(10'd240), .y_desired(10'd288));
textGeneration r77 (.clk(clk), .reset(reset), .asciiData(a[77]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[77]), .x_desired(10'd240), .y_desired(10'd304));
textGeneration r78 (.clk(clk), .reset(reset), .asciiData(a[78]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[78]), .x_desired(10'd240), .y_desired(10'd320));
textGeneration r79 (.clk(clk), .reset(reset), .asciiData(a[79]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[79]), .x_desired(10'd240), .y_desired(10'd336));
textGeneration r80 (.clk(clk), .reset(reset), .asciiData(a[80]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[80]), .x_desired(10'd240), .y_desired(10'd352));
textGeneration r81 (.clk(clk), .reset(reset), .asciiData(a[81]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[81]), .x_desired(10'd240), .y_desired(10'd368));
//2(0-9)
textGeneration r82 (.clk(clk), .reset(reset), .asciiData(a[82]), .ascii_In(7'd48), .x(x), .y(y), .displayContents(d[82]), .x_desired(10'd248), .y_desired(10'd224));
textGeneration r83 (.clk(clk), .reset(reset), .asciiData(a[83]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[83]), .x_desired(10'd248), .y_desired(10'd240));
textGeneration r84 (.clk(clk), .reset(reset), .asciiData(a[84]), .ascii_In(7'd50), .x(x), .y(y), .displayContents(d[84]), .x_desired(10'd248), .y_desired(10'd256));
textGeneration r85 (.clk(clk), .reset(reset), .asciiData(a[85]), .ascii_In(7'd51), .x(x), .y(y), .displayContents(d[85]), .x_desired(10'd248), .y_desired(10'd272));
textGeneration r86 (.clk(clk), .reset(reset), .asciiData(a[86]), .ascii_In(7'd52), .x(x), .y(y), .displayContents(d[86]), .x_desired(10'd248), .y_desired(10'd288));
textGeneration r87 (.clk(clk), .reset(reset), .asciiData(a[87]), .ascii_In(7'd53), .x(x), .y(y), .displayContents(d[87]), .x_desired(10'd248), .y_desired(10'd304));
textGeneration r88 (.clk(clk), .reset(reset), .asciiData(a[88]), .ascii_In(7'd54), .x(x), .y(y), .displayContents(d[88]), .x_desired(10'd248), .y_desired(10'd320));
textGeneration r89 (.clk(clk), .reset(reset), .asciiData(a[89]), .ascii_In(7'd55), .x(x), .y(y), .displayContents(d[89]), .x_desired(10'd248), .y_desired(10'd336));
textGeneration r90 (.clk(clk), .reset(reset), .asciiData(a[90]), .ascii_In(7'd56), .x(x), .y(y), .displayContents(d[90]), .x_desired(10'd248), .y_desired(10'd352));
textGeneration r91 (.clk(clk), .reset(reset), .asciiData(a[91]), .ascii_In(7'd57), .x(x), .y(y), .displayContents(d[91]), .x_desired(10'd248), .y_desired(10'd368));
//3X
textGeneration r92 (.clk(clk), .reset(reset), .asciiData(a[92]), .ascii_In(7'd51), .x(x), .y(y), .displayContents(d[92]), .x_desired(10'd240), .y_desired(10'd384));
textGeneration r93 (.clk(clk), .reset(reset), .asciiData(a[93]), .ascii_In(7'd51), .x(x), .y(y), .displayContents(d[93]), .x_desired(10'd240), .y_desired(10'd400));
//3(0-1)
textGeneration r94 (.clk(clk), .reset(reset), .asciiData(a[94]), .ascii_In(7'd48), .x(x), .y(y), .displayContents(d[94]), .x_desired(10'd248), .y_desired(10'd384));
textGeneration r95 (.clk(clk), .reset(reset), .asciiData(a[95]), .ascii_In(7'd49), .x(x), .y(y), .displayContents(d[95]), .x_desired(10'd248), .y_desired(10'd400));

//Register Data (MSB(7) -> LSB(0)) for column 1
textGeneration r96 (.clk(clk), .reset(reset), .asciiData(a[96]), .ascii_In(R0_7), .x(x), .y(y), .displayContents(d[96]), .x_desired(10'd128), .y_desired(10'd160));
textGeneration r97 (.clk(clk), .reset(reset), .asciiData(a[97]), .ascii_In(R0_6), .x(x), .y(y), .displayContents(d[97]), .x_desired(10'd136), .y_desired(10'd160));
textGeneration r98 (.clk(clk), .reset(reset), .asciiData(a[98]), .ascii_In(R0_5), .x(x), .y(y), .displayContents(d[98]), .x_desired(10'd144), .y_desired(10'd160));
textGeneration r99 (.clk(clk), .reset(reset), .asciiData(a[99]), .ascii_In(R0_4), .x(x), .y(y), .displayContents(d[99]), .x_desired(10'd152), .y_desired(10'd160));
textGeneration r100 (.clk(clk), .reset(reset), .asciiData(a[100]), .ascii_In(R0_3), .x(x), .y(y), .displayContents(d[100]), .x_desired(10'd160), .y_desired(10'd160));
textGeneration r101 (.clk(clk), .reset(reset), .asciiData(a[101]), .ascii_In(R0_2), .x(x), .y(y), .displayContents(d[101]), .x_desired(10'd168), .y_desired(10'd160));
textGeneration r102 (.clk(clk), .reset(reset), .asciiData(a[102]), .ascii_In(R0_1), .x(x), .y(y), .displayContents(d[102]), .x_desired(10'd176), .y_desired(10'd160));
textGeneration r103 (.clk(clk), .reset(reset), .asciiData(a[103]), .ascii_In(R0_0), .x(x), .y(y), .displayContents(d[103]), .x_desired(10'd184), .y_desired(10'd160));
textGeneration r104 (.clk(clk), .reset(reset), .asciiData(a[104]), .ascii_In(R1_7), .x(x), .y(y), .displayContents(d[104]), .x_desired(10'd128), .y_desired(10'd176));
textGeneration r105 (.clk(clk), .reset(reset), .asciiData(a[105]), .ascii_In(R1_6), .x(x), .y(y), .displayContents(d[105]), .x_desired(10'd136), .y_desired(10'd176));
textGeneration r106 (.clk(clk), .reset(reset), .asciiData(a[106]), .ascii_In(R1_5), .x(x), .y(y), .displayContents(d[106]), .x_desired(10'd144), .y_desired(10'd176));
textGeneration r107 (.clk(clk), .reset(reset), .asciiData(a[107]), .ascii_In(R1_4), .x(x), .y(y), .displayContents(d[107]), .x_desired(10'd152), .y_desired(10'd176));
textGeneration r108 (.clk(clk), .reset(reset), .asciiData(a[108]), .ascii_In(R1_3), .x(x), .y(y), .displayContents(d[108]), .x_desired(10'd160), .y_desired(10'd176));
textGeneration r109 (.clk(clk), .reset(reset), .asciiData(a[109]), .ascii_In(R1_2), .x(x), .y(y), .displayContents(d[109]), .x_desired(10'd168), .y_desired(10'd176));
textGeneration r110 (.clk(clk), .reset(reset), .asciiData(a[110]), .ascii_In(R1_1), .x(x), .y(y), .displayContents(d[110]), .x_desired(10'd176), .y_desired(10'd176));
textGeneration r111 (.clk(clk), .reset(reset), .asciiData(a[111]), .ascii_In(R1_0), .x(x), .y(y), .displayContents(d[111]), .x_desired(10'd184), .y_desired(10'd176));
textGeneration r112 (.clk(clk), .reset(reset), .asciiData(a[112]), .ascii_In(R2_7), .x(x), .y(y), .displayContents(d[112]), .x_desired(10'd128), .y_desired(10'd192));
textGeneration r113 (.clk(clk), .reset(reset), .asciiData(a[113]), .ascii_In(R2_6), .x(x), .y(y), .displayContents(d[113]), .x_desired(10'd136), .y_desired(10'd192));
textGeneration r114 (.clk(clk), .reset(reset), .asciiData(a[114]), .ascii_In(R2_5), .x(x), .y(y), .displayContents(d[114]), .x_desired(10'd144), .y_desired(10'd192));
textGeneration r115 (.clk(clk), .reset(reset), .asciiData(a[115]), .ascii_In(R2_4), .x(x), .y(y), .displayContents(d[115]), .x_desired(10'd152), .y_desired(10'd192));
textGeneration r116 (.clk(clk), .reset(reset), .asciiData(a[116]), .ascii_In(R2_3), .x(x), .y(y), .displayContents(d[116]), .x_desired(10'd160), .y_desired(10'd192));
textGeneration r117 (.clk(clk), .reset(reset), .asciiData(a[117]), .ascii_In(R2_2), .x(x), .y(y), .displayContents(d[117]), .x_desired(10'd168), .y_desired(10'd192));
textGeneration r118 (.clk(clk), .reset(reset), .asciiData(a[118]), .ascii_In(R2_1), .x(x), .y(y), .displayContents(d[118]), .x_desired(10'd176), .y_desired(10'd192));
textGeneration r119 (.clk(clk), .reset(reset), .asciiData(a[119]), .ascii_In(R2_0), .x(x), .y(y), .displayContents(d[119]), .x_desired(10'd184), .y_desired(10'd192));
textGeneration r120 (.clk(clk), .reset(reset), .asciiData(a[120]), .ascii_In(R3_7), .x(x), .y(y), .displayContents(d[120]), .x_desired(10'd128), .y_desired(10'd208));
textGeneration r121 (.clk(clk), .reset(reset), .asciiData(a[121]), .ascii_In(R3_6), .x(x), .y(y), .displayContents(d[121]), .x_desired(10'd136), .y_desired(10'd208));
textGeneration r122 (.clk(clk), .reset(reset), .asciiData(a[122]), .ascii_In(R3_5), .x(x), .y(y), .displayContents(d[122]), .x_desired(10'd144), .y_desired(10'd208));
textGeneration r123 (.clk(clk), .reset(reset), .asciiData(a[123]), .ascii_In(R3_4), .x(x), .y(y), .displayContents(d[123]), .x_desired(10'd152), .y_desired(10'd208));
textGeneration r124 (.clk(clk), .reset(reset), .asciiData(a[124]), .ascii_In(R3_3), .x(x), .y(y), .displayContents(d[124]), .x_desired(10'd160), .y_desired(10'd208));
textGeneration r125 (.clk(clk), .reset(reset), .asciiData(a[125]), .ascii_In(R3_2), .x(x), .y(y), .displayContents(d[125]), .x_desired(10'd168), .y_desired(10'd208));
textGeneration r126 (.clk(clk), .reset(reset), .asciiData(a[126]), .ascii_In(R3_1), .x(x), .y(y), .displayContents(d[126]), .x_desired(10'd176), .y_desired(10'd208));
textGeneration r127 (.clk(clk), .reset(reset), .asciiData(a[127]), .ascii_In(R3_0), .x(x), .y(y), .displayContents(d[127]), .x_desired(10'd184), .y_desired(10'd208));
textGeneration r128 (.clk(clk), .reset(reset), .asciiData(a[128]), .ascii_In(R4_7), .x(x), .y(y), .displayContents(d[128]), .x_desired(10'd128), .y_desired(10'd224));
textGeneration r129 (.clk(clk), .reset(reset), .asciiData(a[129]), .ascii_In(R4_6), .x(x), .y(y), .displayContents(d[129]), .x_desired(10'd136), .y_desired(10'd224));
textGeneration r130 (.clk(clk), .reset(reset), .asciiData(a[130]), .ascii_In(R4_5), .x(x), .y(y), .displayContents(d[130]), .x_desired(10'd144), .y_desired(10'd224));
textGeneration r131 (.clk(clk), .reset(reset), .asciiData(a[131]), .ascii_In(R4_4), .x(x), .y(y), .displayContents(d[131]), .x_desired(10'd152), .y_desired(10'd224));
textGeneration r132 (.clk(clk), .reset(reset), .asciiData(a[132]), .ascii_In(R4_3), .x(x), .y(y), .displayContents(d[132]), .x_desired(10'd160), .y_desired(10'd224));
textGeneration r133 (.clk(clk), .reset(reset), .asciiData(a[133]), .ascii_In(R4_2), .x(x), .y(y), .displayContents(d[133]), .x_desired(10'd168), .y_desired(10'd224));
textGeneration r134 (.clk(clk), .reset(reset), .asciiData(a[134]), .ascii_In(R4_1), .x(x), .y(y), .displayContents(d[134]), .x_desired(10'd176), .y_desired(10'd224));
textGeneration r135 (.clk(clk), .reset(reset), .asciiData(a[135]), .ascii_In(R4_0), .x(x), .y(y), .displayContents(d[135]), .x_desired(10'd184), .y_desired(10'd224));
textGeneration r136 (.clk(clk), .reset(reset), .asciiData(a[136]), .ascii_In(R5_7), .x(x), .y(y), .displayContents(d[136]), .x_desired(10'd128), .y_desired(10'd240));
textGeneration r137 (.clk(clk), .reset(reset), .asciiData(a[137]), .ascii_In(R5_6), .x(x), .y(y), .displayContents(d[137]), .x_desired(10'd136), .y_desired(10'd240));
textGeneration r138 (.clk(clk), .reset(reset), .asciiData(a[138]), .ascii_In(R5_5), .x(x), .y(y), .displayContents(d[138]), .x_desired(10'd144), .y_desired(10'd240));
textGeneration r139 (.clk(clk), .reset(reset), .asciiData(a[139]), .ascii_In(R5_4), .x(x), .y(y), .displayContents(d[139]), .x_desired(10'd152), .y_desired(10'd240));
textGeneration r140 (.clk(clk), .reset(reset), .asciiData(a[140]), .ascii_In(R5_3), .x(x), .y(y), .displayContents(d[140]), .x_desired(10'd160), .y_desired(10'd240));
textGeneration r141 (.clk(clk), .reset(reset), .asciiData(a[141]), .ascii_In(R5_2), .x(x), .y(y), .displayContents(d[141]), .x_desired(10'd168), .y_desired(10'd240));
textGeneration r142 (.clk(clk), .reset(reset), .asciiData(a[142]), .ascii_In(R5_1), .x(x), .y(y), .displayContents(d[142]), .x_desired(10'd176), .y_desired(10'd240));
textGeneration r143 (.clk(clk), .reset(reset), .asciiData(a[143]), .ascii_In(R5_0), .x(x), .y(y), .displayContents(d[143]), .x_desired(10'd184), .y_desired(10'd240));
textGeneration r144 (.clk(clk), .reset(reset), .asciiData(a[144]), .ascii_In(R6_7), .x(x), .y(y), .displayContents(d[144]), .x_desired(10'd128), .y_desired(10'd256));
textGeneration r145 (.clk(clk), .reset(reset), .asciiData(a[145]), .ascii_In(R6_6), .x(x), .y(y), .displayContents(d[145]), .x_desired(10'd136), .y_desired(10'd256));
textGeneration r146 (.clk(clk), .reset(reset), .asciiData(a[146]), .ascii_In(R6_5), .x(x), .y(y), .displayContents(d[146]), .x_desired(10'd144), .y_desired(10'd256));
textGeneration r147 (.clk(clk), .reset(reset), .asciiData(a[147]), .ascii_In(R6_4), .x(x), .y(y), .displayContents(d[147]), .x_desired(10'd152), .y_desired(10'd256));
textGeneration r148 (.clk(clk), .reset(reset), .asciiData(a[148]), .ascii_In(R6_3), .x(x), .y(y), .displayContents(d[148]), .x_desired(10'd160), .y_desired(10'd256));
textGeneration r149 (.clk(clk), .reset(reset), .asciiData(a[149]), .ascii_In(R6_2), .x(x), .y(y), .displayContents(d[149]), .x_desired(10'd168), .y_desired(10'd256));
textGeneration r150 (.clk(clk), .reset(reset), .asciiData(a[150]), .ascii_In(R6_1), .x(x), .y(y), .displayContents(d[150]), .x_desired(10'd176), .y_desired(10'd256));
textGeneration r151 (.clk(clk), .reset(reset), .asciiData(a[151]), .ascii_In(R6_0), .x(x), .y(y), .displayContents(d[151]), .x_desired(10'd184), .y_desired(10'd256));
textGeneration r152 (.clk(clk), .reset(reset), .asciiData(a[152]), .ascii_In(R7_7), .x(x), .y(y), .displayContents(d[152]), .x_desired(10'd128), .y_desired(10'd272));
textGeneration r153 (.clk(clk), .reset(reset), .asciiData(a[153]), .ascii_In(R7_6), .x(x), .y(y), .displayContents(d[153]), .x_desired(10'd136), .y_desired(10'd272));
textGeneration r154 (.clk(clk), .reset(reset), .asciiData(a[154]), .ascii_In(R7_5), .x(x), .y(y), .displayContents(d[154]), .x_desired(10'd144), .y_desired(10'd272));
textGeneration r155 (.clk(clk), .reset(reset), .asciiData(a[155]), .ascii_In(R7_4), .x(x), .y(y), .displayContents(d[155]), .x_desired(10'd152), .y_desired(10'd272));
textGeneration r156 (.clk(clk), .reset(reset), .asciiData(a[156]), .ascii_In(R7_3), .x(x), .y(y), .displayContents(d[156]), .x_desired(10'd160), .y_desired(10'd272));
textGeneration r157 (.clk(clk), .reset(reset), .asciiData(a[157]), .ascii_In(R7_2), .x(x), .y(y), .displayContents(d[157]), .x_desired(10'd168), .y_desired(10'd272));
textGeneration r158 (.clk(clk), .reset(reset), .asciiData(a[158]), .ascii_In(R7_1), .x(x), .y(y), .displayContents(d[158]), .x_desired(10'd176), .y_desired(10'd272));
textGeneration r159 (.clk(clk), .reset(reset), .asciiData(a[159]), .ascii_In(R7_0), .x(x), .y(y), .displayContents(d[159]), .x_desired(10'd184), .y_desired(10'd272));
textGeneration r160 (.clk(clk), .reset(reset), .asciiData(a[160]), .ascii_In(R8_7), .x(x), .y(y), .displayContents(d[160]), .x_desired(10'd128), .y_desired(10'd288));
textGeneration r161 (.clk(clk), .reset(reset), .asciiData(a[161]), .ascii_In(R8_6), .x(x), .y(y), .displayContents(d[161]), .x_desired(10'd136), .y_desired(10'd288));
textGeneration r162 (.clk(clk), .reset(reset), .asciiData(a[162]), .ascii_In(R8_5), .x(x), .y(y), .displayContents(d[162]), .x_desired(10'd144), .y_desired(10'd288));
textGeneration r163 (.clk(clk), .reset(reset), .asciiData(a[163]), .ascii_In(R8_4), .x(x), .y(y), .displayContents(d[163]), .x_desired(10'd152), .y_desired(10'd288));
textGeneration r164 (.clk(clk), .reset(reset), .asciiData(a[164]), .ascii_In(R8_3), .x(x), .y(y), .displayContents(d[164]), .x_desired(10'd160), .y_desired(10'd288));
textGeneration r165 (.clk(clk), .reset(reset), .asciiData(a[165]), .ascii_In(R8_2), .x(x), .y(y), .displayContents(d[165]), .x_desired(10'd168), .y_desired(10'd288));
textGeneration r166 (.clk(clk), .reset(reset), .asciiData(a[166]), .ascii_In(R8_1), .x(x), .y(y), .displayContents(d[166]), .x_desired(10'd176), .y_desired(10'd288));
textGeneration r167 (.clk(clk), .reset(reset), .asciiData(a[167]), .ascii_In(R8_0), .x(x), .y(y), .displayContents(d[167]), .x_desired(10'd184), .y_desired(10'd288));
textGeneration r168 (.clk(clk), .reset(reset), .asciiData(a[168]), .ascii_In(R9_7), .x(x), .y(y), .displayContents(d[168]), .x_desired(10'd128), .y_desired(10'd304));
textGeneration r169 (.clk(clk), .reset(reset), .asciiData(a[169]), .ascii_In(R9_6), .x(x), .y(y), .displayContents(d[169]), .x_desired(10'd136), .y_desired(10'd304));
textGeneration r170 (.clk(clk), .reset(reset), .asciiData(a[170]), .ascii_In(R9_5), .x(x), .y(y), .displayContents(d[170]), .x_desired(10'd144), .y_desired(10'd304));
textGeneration r171 (.clk(clk), .reset(reset), .asciiData(a[171]), .ascii_In(R9_4), .x(x), .y(y), .displayContents(d[171]), .x_desired(10'd152), .y_desired(10'd304));
textGeneration r172 (.clk(clk), .reset(reset), .asciiData(a[172]), .ascii_In(R9_3), .x(x), .y(y), .displayContents(d[172]), .x_desired(10'd160), .y_desired(10'd304));
textGeneration r173 (.clk(clk), .reset(reset), .asciiData(a[173]), .ascii_In(R9_2), .x(x), .y(y), .displayContents(d[173]), .x_desired(10'd168), .y_desired(10'd304));
textGeneration r174 (.clk(clk), .reset(reset), .asciiData(a[174]), .ascii_In(R9_1), .x(x), .y(y), .displayContents(d[174]), .x_desired(10'd176), .y_desired(10'd304));
textGeneration r175 (.clk(clk), .reset(reset), .asciiData(a[175]), .ascii_In(R9_0), .x(x), .y(y), .displayContents(d[175]), .x_desired(10'd184), .y_desired(10'd304));
textGeneration r176 (.clk(clk), .reset(reset), .asciiData(a[176]), .ascii_In(R10_7), .x(x), .y(y), .displayContents(d[176]), .x_desired(10'd128), .y_desired(10'd320));
textGeneration r177 (.clk(clk), .reset(reset), .asciiData(a[177]), .ascii_In(R10_6), .x(x), .y(y), .displayContents(d[177]), .x_desired(10'd136), .y_desired(10'd320));
textGeneration r178 (.clk(clk), .reset(reset), .asciiData(a[178]), .ascii_In(R10_5), .x(x), .y(y), .displayContents(d[178]), .x_desired(10'd144), .y_desired(10'd320));
textGeneration r179 (.clk(clk), .reset(reset), .asciiData(a[179]), .ascii_In(R10_4), .x(x), .y(y), .displayContents(d[179]), .x_desired(10'd152), .y_desired(10'd320));
textGeneration r180 (.clk(clk), .reset(reset), .asciiData(a[180]), .ascii_In(R10_3), .x(x), .y(y), .displayContents(d[180]), .x_desired(10'd160), .y_desired(10'd320));
textGeneration r181 (.clk(clk), .reset(reset), .asciiData(a[181]), .ascii_In(R10_2), .x(x), .y(y), .displayContents(d[181]), .x_desired(10'd168), .y_desired(10'd320));
textGeneration r182 (.clk(clk), .reset(reset), .asciiData(a[182]), .ascii_In(R10_1), .x(x), .y(y), .displayContents(d[182]), .x_desired(10'd176), .y_desired(10'd320));
textGeneration r183 (.clk(clk), .reset(reset), .asciiData(a[183]), .ascii_In(R10_0), .x(x), .y(y), .displayContents(d[183]), .x_desired(10'd184), .y_desired(10'd320));
textGeneration r184 (.clk(clk), .reset(reset), .asciiData(a[184]), .ascii_In(R11_7), .x(x), .y(y), .displayContents(d[184]), .x_desired(10'd128), .y_desired(10'd336));
textGeneration r185 (.clk(clk), .reset(reset), .asciiData(a[185]), .ascii_In(R11_6), .x(x), .y(y), .displayContents(d[185]), .x_desired(10'd136), .y_desired(10'd336));
textGeneration r186 (.clk(clk), .reset(reset), .asciiData(a[186]), .ascii_In(R11_5), .x(x), .y(y), .displayContents(d[186]), .x_desired(10'd144), .y_desired(10'd336));
textGeneration r187 (.clk(clk), .reset(reset), .asciiData(a[187]), .ascii_In(R11_4), .x(x), .y(y), .displayContents(d[187]), .x_desired(10'd152), .y_desired(10'd336));
textGeneration r188 (.clk(clk), .reset(reset), .asciiData(a[188]), .ascii_In(R11_3), .x(x), .y(y), .displayContents(d[188]), .x_desired(10'd160), .y_desired(10'd336));
textGeneration r189 (.clk(clk), .reset(reset), .asciiData(a[189]), .ascii_In(R11_2), .x(x), .y(y), .displayContents(d[189]), .x_desired(10'd168), .y_desired(10'd336));
textGeneration r190 (.clk(clk), .reset(reset), .asciiData(a[190]), .ascii_In(R11_1), .x(x), .y(y), .displayContents(d[190]), .x_desired(10'd176), .y_desired(10'd336));
textGeneration r191 (.clk(clk), .reset(reset), .asciiData(a[191]), .ascii_In(R11_0), .x(x), .y(y), .displayContents(d[191]), .x_desired(10'd184), .y_desired(10'd336));
textGeneration r192 (.clk(clk), .reset(reset), .asciiData(a[192]), .ascii_In(R12_7), .x(x), .y(y), .displayContents(d[192]), .x_desired(10'd128), .y_desired(10'd352));
textGeneration r193 (.clk(clk), .reset(reset), .asciiData(a[193]), .ascii_In(R12_6), .x(x), .y(y), .displayContents(d[193]), .x_desired(10'd136), .y_desired(10'd352));
textGeneration r194 (.clk(clk), .reset(reset), .asciiData(a[194]), .ascii_In(R12_5), .x(x), .y(y), .displayContents(d[194]), .x_desired(10'd144), .y_desired(10'd352));
textGeneration r195 (.clk(clk), .reset(reset), .asciiData(a[195]), .ascii_In(R12_4), .x(x), .y(y), .displayContents(d[195]), .x_desired(10'd152), .y_desired(10'd352));
textGeneration r196 (.clk(clk), .reset(reset), .asciiData(a[196]), .ascii_In(R12_3), .x(x), .y(y), .displayContents(d[196]), .x_desired(10'd160), .y_desired(10'd352));
textGeneration r197 (.clk(clk), .reset(reset), .asciiData(a[197]), .ascii_In(R12_2), .x(x), .y(y), .displayContents(d[197]), .x_desired(10'd168), .y_desired(10'd352));
textGeneration r198 (.clk(clk), .reset(reset), .asciiData(a[198]), .ascii_In(R12_1), .x(x), .y(y), .displayContents(d[198]), .x_desired(10'd176), .y_desired(10'd352));
textGeneration r199 (.clk(clk), .reset(reset), .asciiData(a[199]), .ascii_In(R12_0), .x(x), .y(y), .displayContents(d[199]), .x_desired(10'd184), .y_desired(10'd352));
textGeneration r200 (.clk(clk), .reset(reset), .asciiData(a[200]), .ascii_In(R13_7), .x(x), .y(y), .displayContents(d[200]), .x_desired(10'd128), .y_desired(10'd368));
textGeneration r201 (.clk(clk), .reset(reset), .asciiData(a[201]), .ascii_In(R13_6), .x(x), .y(y), .displayContents(d[201]), .x_desired(10'd136), .y_desired(10'd368));
textGeneration r202 (.clk(clk), .reset(reset), .asciiData(a[202]), .ascii_In(R13_5), .x(x), .y(y), .displayContents(d[202]), .x_desired(10'd144), .y_desired(10'd368));
textGeneration r203 (.clk(clk), .reset(reset), .asciiData(a[203]), .ascii_In(R13_4), .x(x), .y(y), .displayContents(d[203]), .x_desired(10'd152), .y_desired(10'd368));
textGeneration r204 (.clk(clk), .reset(reset), .asciiData(a[204]), .ascii_In(R13_3), .x(x), .y(y), .displayContents(d[204]), .x_desired(10'd160), .y_desired(10'd368));
textGeneration r205 (.clk(clk), .reset(reset), .asciiData(a[205]), .ascii_In(R13_2), .x(x), .y(y), .displayContents(d[205]), .x_desired(10'd168), .y_desired(10'd368));
textGeneration r206 (.clk(clk), .reset(reset), .asciiData(a[206]), .ascii_In(R13_1), .x(x), .y(y), .displayContents(d[206]), .x_desired(10'd176), .y_desired(10'd368));
textGeneration r207 (.clk(clk), .reset(reset), .asciiData(a[207]), .ascii_In(R13_0), .x(x), .y(y), .displayContents(d[207]), .x_desired(10'd184), .y_desired(10'd368));
textGeneration r208 (.clk(clk), .reset(reset), .asciiData(a[208]), .ascii_In(R14_7), .x(x), .y(y), .displayContents(d[208]), .x_desired(10'd128), .y_desired(10'd384));
textGeneration r209 (.clk(clk), .reset(reset), .asciiData(a[209]), .ascii_In(R14_6), .x(x), .y(y), .displayContents(d[209]), .x_desired(10'd136), .y_desired(10'd384));
textGeneration r210 (.clk(clk), .reset(reset), .asciiData(a[210]), .ascii_In(R14_5), .x(x), .y(y), .displayContents(d[210]), .x_desired(10'd144), .y_desired(10'd384));
textGeneration r211 (.clk(clk), .reset(reset), .asciiData(a[211]), .ascii_In(R14_4), .x(x), .y(y), .displayContents(d[211]), .x_desired(10'd152), .y_desired(10'd384));
textGeneration r212 (.clk(clk), .reset(reset), .asciiData(a[212]), .ascii_In(R14_3), .x(x), .y(y), .displayContents(d[212]), .x_desired(10'd160), .y_desired(10'd384));
textGeneration r213 (.clk(clk), .reset(reset), .asciiData(a[213]), .ascii_In(R14_2), .x(x), .y(y), .displayContents(d[213]), .x_desired(10'd168), .y_desired(10'd384));
textGeneration r214 (.clk(clk), .reset(reset), .asciiData(a[214]), .ascii_In(R14_1), .x(x), .y(y), .displayContents(d[214]), .x_desired(10'd176), .y_desired(10'd384));
textGeneration r215 (.clk(clk), .reset(reset), .asciiData(a[215]), .ascii_In(R14_0), .x(x), .y(y), .displayContents(d[215]), .x_desired(10'd184), .y_desired(10'd384));
textGeneration r216 (.clk(clk), .reset(reset), .asciiData(a[216]), .ascii_In(R15_7), .x(x), .y(y), .displayContents(d[216]), .x_desired(10'd128), .y_desired(10'd400));
textGeneration r217 (.clk(clk), .reset(reset), .asciiData(a[217]), .ascii_In(R15_6), .x(x), .y(y), .displayContents(d[217]), .x_desired(10'd136), .y_desired(10'd400));
textGeneration r218 (.clk(clk), .reset(reset), .asciiData(a[218]), .ascii_In(R15_5), .x(x), .y(y), .displayContents(d[218]), .x_desired(10'd144), .y_desired(10'd400));
textGeneration r219 (.clk(clk), .reset(reset), .asciiData(a[219]), .ascii_In(R15_4), .x(x), .y(y), .displayContents(d[219]), .x_desired(10'd152), .y_desired(10'd400));
textGeneration r220 (.clk(clk), .reset(reset), .asciiData(a[220]), .ascii_In(R15_3), .x(x), .y(y), .displayContents(d[220]), .x_desired(10'd160), .y_desired(10'd400));
textGeneration r221 (.clk(clk), .reset(reset), .asciiData(a[221]), .ascii_In(R15_2), .x(x), .y(y), .displayContents(d[221]), .x_desired(10'd168), .y_desired(10'd400));
textGeneration r222 (.clk(clk), .reset(reset), .asciiData(a[222]), .ascii_In(R15_1), .x(x), .y(y), .displayContents(d[222]), .x_desired(10'd176), .y_desired(10'd400));
textGeneration r223 (.clk(clk), .reset(reset), .asciiData(a[223]), .ascii_In(R15_0), .x(x), .y(y), .displayContents(d[223]), .x_desired(10'd184), .y_desired(10'd400));

//REGISTER DATA COL 2
textGeneration r224 (.clk(clk), .reset(reset), .asciiData(a[224]), .ascii_In(R16_7), .x(x), .y(y), .displayContents(d[224]), .x_desired(10'd264), .y_desired(10'd160));
textGeneration r225 (.clk(clk), .reset(reset), .asciiData(a[225]), .ascii_In(R16_6), .x(x), .y(y), .displayContents(d[225]), .x_desired(10'd272), .y_desired(10'd160));
textGeneration r226 (.clk(clk), .reset(reset), .asciiData(a[226]), .ascii_In(R16_5), .x(x), .y(y), .displayContents(d[226]), .x_desired(10'd280), .y_desired(10'd160));
textGeneration r227 (.clk(clk), .reset(reset), .asciiData(a[227]), .ascii_In(R16_4), .x(x), .y(y), .displayContents(d[227]), .x_desired(10'd288), .y_desired(10'd160));
textGeneration r228 (.clk(clk), .reset(reset), .asciiData(a[228]), .ascii_In(R16_3), .x(x), .y(y), .displayContents(d[228]), .x_desired(10'd296), .y_desired(10'd160));
textGeneration r229 (.clk(clk), .reset(reset), .asciiData(a[229]), .ascii_In(R16_2), .x(x), .y(y), .displayContents(d[229]), .x_desired(10'd304), .y_desired(10'd160));
textGeneration r230 (.clk(clk), .reset(reset), .asciiData(a[230]), .ascii_In(R16_1), .x(x), .y(y), .displayContents(d[230]), .x_desired(10'd312), .y_desired(10'd160));
textGeneration r231 (.clk(clk), .reset(reset), .asciiData(a[231]), .ascii_In(R16_0), .x(x), .y(y), .displayContents(d[231]), .x_desired(10'd320), .y_desired(10'd160));
textGeneration r232 (.clk(clk), .reset(reset), .asciiData(a[232]), .ascii_In(R17_7), .x(x), .y(y), .displayContents(d[232]), .x_desired(10'd264), .y_desired(10'd176));
textGeneration r233 (.clk(clk), .reset(reset), .asciiData(a[233]), .ascii_In(R17_6), .x(x), .y(y), .displayContents(d[233]), .x_desired(10'd272), .y_desired(10'd176));
textGeneration r234 (.clk(clk), .reset(reset), .asciiData(a[234]), .ascii_In(R17_5), .x(x), .y(y), .displayContents(d[234]), .x_desired(10'd280), .y_desired(10'd176));
textGeneration r235 (.clk(clk), .reset(reset), .asciiData(a[235]), .ascii_In(R17_4), .x(x), .y(y), .displayContents(d[235]), .x_desired(10'd288), .y_desired(10'd176));
textGeneration r236 (.clk(clk), .reset(reset), .asciiData(a[236]), .ascii_In(R17_3), .x(x), .y(y), .displayContents(d[236]), .x_desired(10'd296), .y_desired(10'd176));
textGeneration r237 (.clk(clk), .reset(reset), .asciiData(a[237]), .ascii_In(R17_2), .x(x), .y(y), .displayContents(d[237]), .x_desired(10'd304), .y_desired(10'd176));
textGeneration r238 (.clk(clk), .reset(reset), .asciiData(a[238]), .ascii_In(R17_1), .x(x), .y(y), .displayContents(d[238]), .x_desired(10'd312), .y_desired(10'd176));
textGeneration r239 (.clk(clk), .reset(reset), .asciiData(a[239]), .ascii_In(R17_0), .x(x), .y(y), .displayContents(d[239]), .x_desired(10'd320), .y_desired(10'd176));
textGeneration r240 (.clk(clk), .reset(reset), .asciiData(a[240]), .ascii_In(R18_7), .x(x), .y(y), .displayContents(d[240]), .x_desired(10'd264), .y_desired(10'd192));
textGeneration r241 (.clk(clk), .reset(reset), .asciiData(a[241]), .ascii_In(R18_6), .x(x), .y(y), .displayContents(d[241]), .x_desired(10'd272), .y_desired(10'd192));
textGeneration r242 (.clk(clk), .reset(reset), .asciiData(a[242]), .ascii_In(R18_5), .x(x), .y(y), .displayContents(d[242]), .x_desired(10'd280), .y_desired(10'd192));
textGeneration r243 (.clk(clk), .reset(reset), .asciiData(a[243]), .ascii_In(R18_4), .x(x), .y(y), .displayContents(d[243]), .x_desired(10'd288), .y_desired(10'd192));
textGeneration r244 (.clk(clk), .reset(reset), .asciiData(a[244]), .ascii_In(R18_3), .x(x), .y(y), .displayContents(d[244]), .x_desired(10'd296), .y_desired(10'd192));
textGeneration r245 (.clk(clk), .reset(reset), .asciiData(a[245]), .ascii_In(R18_2), .x(x), .y(y), .displayContents(d[245]), .x_desired(10'd304), .y_desired(10'd192));
textGeneration r246 (.clk(clk), .reset(reset), .asciiData(a[246]), .ascii_In(R18_1), .x(x), .y(y), .displayContents(d[246]), .x_desired(10'd312), .y_desired(10'd192));
textGeneration r247 (.clk(clk), .reset(reset), .asciiData(a[247]), .ascii_In(R18_0), .x(x), .y(y), .displayContents(d[247]), .x_desired(10'd320), .y_desired(10'd192));
textGeneration r248 (.clk(clk), .reset(reset), .asciiData(a[248]), .ascii_In(R19_7), .x(x), .y(y), .displayContents(d[248]), .x_desired(10'd264), .y_desired(10'd208));
textGeneration r249 (.clk(clk), .reset(reset), .asciiData(a[249]), .ascii_In(R19_6), .x(x), .y(y), .displayContents(d[249]), .x_desired(10'd272), .y_desired(10'd208));
textGeneration r250 (.clk(clk), .reset(reset), .asciiData(a[250]), .ascii_In(R19_5), .x(x), .y(y), .displayContents(d[250]), .x_desired(10'd280), .y_desired(10'd208));
textGeneration r251 (.clk(clk), .reset(reset), .asciiData(a[251]), .ascii_In(R19_4), .x(x), .y(y), .displayContents(d[251]), .x_desired(10'd288), .y_desired(10'd208));
textGeneration r252 (.clk(clk), .reset(reset), .asciiData(a[252]), .ascii_In(R19_3), .x(x), .y(y), .displayContents(d[252]), .x_desired(10'd296), .y_desired(10'd208));
textGeneration r253 (.clk(clk), .reset(reset), .asciiData(a[253]), .ascii_In(R19_2), .x(x), .y(y), .displayContents(d[253]), .x_desired(10'd304), .y_desired(10'd208));
textGeneration r254 (.clk(clk), .reset(reset), .asciiData(a[254]), .ascii_In(R19_1), .x(x), .y(y), .displayContents(d[254]), .x_desired(10'd312), .y_desired(10'd208));
textGeneration r255 (.clk(clk), .reset(reset), .asciiData(a[255]), .ascii_In(R19_0), .x(x), .y(y), .displayContents(d[255]), .x_desired(10'd320), .y_desired(10'd208));
textGeneration r256 (.clk(clk), .reset(reset), .asciiData(a[256]), .ascii_In(R20_7), .x(x), .y(y), .displayContents(d[256]), .x_desired(10'd264), .y_desired(10'd224));
textGeneration r257 (.clk(clk), .reset(reset), .asciiData(a[257]), .ascii_In(R20_6), .x(x), .y(y), .displayContents(d[257]), .x_desired(10'd272), .y_desired(10'd224));
textGeneration r258 (.clk(clk), .reset(reset), .asciiData(a[258]), .ascii_In(R20_5), .x(x), .y(y), .displayContents(d[258]), .x_desired(10'd280), .y_desired(10'd224));
textGeneration r259 (.clk(clk), .reset(reset), .asciiData(a[259]), .ascii_In(R20_4), .x(x), .y(y), .displayContents(d[259]), .x_desired(10'd288), .y_desired(10'd224));
textGeneration r260 (.clk(clk), .reset(reset), .asciiData(a[260]), .ascii_In(R20_3), .x(x), .y(y), .displayContents(d[260]), .x_desired(10'd296), .y_desired(10'd224));
textGeneration r261 (.clk(clk), .reset(reset), .asciiData(a[261]), .ascii_In(R20_2), .x(x), .y(y), .displayContents(d[261]), .x_desired(10'd304), .y_desired(10'd224));
textGeneration r262 (.clk(clk), .reset(reset), .asciiData(a[262]), .ascii_In(R20_1), .x(x), .y(y), .displayContents(d[262]), .x_desired(10'd312), .y_desired(10'd224));
textGeneration r263 (.clk(clk), .reset(reset), .asciiData(a[263]), .ascii_In(R20_0), .x(x), .y(y), .displayContents(d[263]), .x_desired(10'd320), .y_desired(10'd224));
textGeneration r264 (.clk(clk), .reset(reset), .asciiData(a[264]), .ascii_In(R21_7), .x(x), .y(y), .displayContents(d[264]), .x_desired(10'd264), .y_desired(10'd240));
textGeneration r265 (.clk(clk), .reset(reset), .asciiData(a[265]), .ascii_In(R21_6), .x(x), .y(y), .displayContents(d[265]), .x_desired(10'd272), .y_desired(10'd240));
textGeneration r266 (.clk(clk), .reset(reset), .asciiData(a[266]), .ascii_In(R21_5), .x(x), .y(y), .displayContents(d[266]), .x_desired(10'd280), .y_desired(10'd240));
textGeneration r267 (.clk(clk), .reset(reset), .asciiData(a[267]), .ascii_In(R21_4), .x(x), .y(y), .displayContents(d[267]), .x_desired(10'd288), .y_desired(10'd240));
textGeneration r268 (.clk(clk), .reset(reset), .asciiData(a[268]), .ascii_In(R21_3), .x(x), .y(y), .displayContents(d[268]), .x_desired(10'd296), .y_desired(10'd240));
textGeneration r269 (.clk(clk), .reset(reset), .asciiData(a[269]), .ascii_In(R21_2), .x(x), .y(y), .displayContents(d[269]), .x_desired(10'd304), .y_desired(10'd240));
textGeneration r270 (.clk(clk), .reset(reset), .asciiData(a[270]), .ascii_In(R21_1), .x(x), .y(y), .displayContents(d[270]), .x_desired(10'd312), .y_desired(10'd240));
textGeneration r271 (.clk(clk), .reset(reset), .asciiData(a[271]), .ascii_In(R21_0), .x(x), .y(y), .displayContents(d[271]), .x_desired(10'd320), .y_desired(10'd240));
textGeneration r272 (.clk(clk), .reset(reset), .asciiData(a[272]), .ascii_In(R22_7), .x(x), .y(y), .displayContents(d[272]), .x_desired(10'd264), .y_desired(10'd256));
textGeneration r273 (.clk(clk), .reset(reset), .asciiData(a[273]), .ascii_In(R22_6), .x(x), .y(y), .displayContents(d[273]), .x_desired(10'd272), .y_desired(10'd256));
textGeneration r274 (.clk(clk), .reset(reset), .asciiData(a[274]), .ascii_In(R22_5), .x(x), .y(y), .displayContents(d[274]), .x_desired(10'd280), .y_desired(10'd256));
textGeneration r275 (.clk(clk), .reset(reset), .asciiData(a[275]), .ascii_In(R22_4), .x(x), .y(y), .displayContents(d[275]), .x_desired(10'd288), .y_desired(10'd256));
textGeneration r276 (.clk(clk), .reset(reset), .asciiData(a[276]), .ascii_In(R22_3), .x(x), .y(y), .displayContents(d[276]), .x_desired(10'd296), .y_desired(10'd256));
textGeneration r277 (.clk(clk), .reset(reset), .asciiData(a[277]), .ascii_In(R22_2), .x(x), .y(y), .displayContents(d[277]), .x_desired(10'd304), .y_desired(10'd256));
textGeneration r278 (.clk(clk), .reset(reset), .asciiData(a[278]), .ascii_In(R22_1), .x(x), .y(y), .displayContents(d[278]), .x_desired(10'd312), .y_desired(10'd256));
textGeneration r279 (.clk(clk), .reset(reset), .asciiData(a[279]), .ascii_In(R22_0), .x(x), .y(y), .displayContents(d[279]), .x_desired(10'd320), .y_desired(10'd256));
textGeneration r280 (.clk(clk), .reset(reset), .asciiData(a[280]), .ascii_In(R23_7), .x(x), .y(y), .displayContents(d[280]), .x_desired(10'd264), .y_desired(10'd272));
textGeneration r281 (.clk(clk), .reset(reset), .asciiData(a[281]), .ascii_In(R23_6), .x(x), .y(y), .displayContents(d[281]), .x_desired(10'd272), .y_desired(10'd272));
textGeneration r282 (.clk(clk), .reset(reset), .asciiData(a[282]), .ascii_In(R23_5), .x(x), .y(y), .displayContents(d[282]), .x_desired(10'd280), .y_desired(10'd272));
textGeneration r283 (.clk(clk), .reset(reset), .asciiData(a[283]), .ascii_In(R23_4), .x(x), .y(y), .displayContents(d[283]), .x_desired(10'd288), .y_desired(10'd272));
textGeneration r284 (.clk(clk), .reset(reset), .asciiData(a[284]), .ascii_In(R23_3), .x(x), .y(y), .displayContents(d[284]), .x_desired(10'd296), .y_desired(10'd272));
textGeneration r285 (.clk(clk), .reset(reset), .asciiData(a[285]), .ascii_In(R23_2), .x(x), .y(y), .displayContents(d[285]), .x_desired(10'd304), .y_desired(10'd272));
textGeneration r286 (.clk(clk), .reset(reset), .asciiData(a[286]), .ascii_In(R23_1), .x(x), .y(y), .displayContents(d[286]), .x_desired(10'd312), .y_desired(10'd272));
textGeneration r287 (.clk(clk), .reset(reset), .asciiData(a[287]), .ascii_In(R23_0), .x(x), .y(y), .displayContents(d[287]), .x_desired(10'd320), .y_desired(10'd272));
textGeneration r288 (.clk(clk), .reset(reset), .asciiData(a[288]), .ascii_In(R24_7), .x(x), .y(y), .displayContents(d[288]), .x_desired(10'd264), .y_desired(10'd288));
textGeneration r289 (.clk(clk), .reset(reset), .asciiData(a[289]), .ascii_In(R24_6), .x(x), .y(y), .displayContents(d[289]), .x_desired(10'd272), .y_desired(10'd288));
textGeneration r290 (.clk(clk), .reset(reset), .asciiData(a[290]), .ascii_In(R24_5), .x(x), .y(y), .displayContents(d[290]), .x_desired(10'd280), .y_desired(10'd288));
textGeneration r291 (.clk(clk), .reset(reset), .asciiData(a[291]), .ascii_In(R24_4), .x(x), .y(y), .displayContents(d[291]), .x_desired(10'd288), .y_desired(10'd288));
textGeneration r292 (.clk(clk), .reset(reset), .asciiData(a[292]), .ascii_In(R24_3), .x(x), .y(y), .displayContents(d[292]), .x_desired(10'd296), .y_desired(10'd288));
textGeneration r293 (.clk(clk), .reset(reset), .asciiData(a[293]), .ascii_In(R24_2), .x(x), .y(y), .displayContents(d[293]), .x_desired(10'd304), .y_desired(10'd288));
textGeneration r294 (.clk(clk), .reset(reset), .asciiData(a[294]), .ascii_In(R24_1), .x(x), .y(y), .displayContents(d[294]), .x_desired(10'd312), .y_desired(10'd288));
textGeneration r295 (.clk(clk), .reset(reset), .asciiData(a[295]), .ascii_In(R24_0), .x(x), .y(y), .displayContents(d[295]), .x_desired(10'd320), .y_desired(10'd288));
textGeneration r296 (.clk(clk), .reset(reset), .asciiData(a[296]), .ascii_In(R25_7), .x(x), .y(y), .displayContents(d[296]), .x_desired(10'd264), .y_desired(10'd304));
textGeneration r297 (.clk(clk), .reset(reset), .asciiData(a[297]), .ascii_In(R25_6), .x(x), .y(y), .displayContents(d[297]), .x_desired(10'd272), .y_desired(10'd304));
textGeneration r298 (.clk(clk), .reset(reset), .asciiData(a[298]), .ascii_In(R25_5), .x(x), .y(y), .displayContents(d[298]), .x_desired(10'd280), .y_desired(10'd304));
textGeneration r299 (.clk(clk), .reset(reset), .asciiData(a[299]), .ascii_In(R25_4), .x(x), .y(y), .displayContents(d[299]), .x_desired(10'd288), .y_desired(10'd304));
textGeneration r300 (.clk(clk), .reset(reset), .asciiData(a[300]), .ascii_In(R25_3), .x(x), .y(y), .displayContents(d[300]), .x_desired(10'd296), .y_desired(10'd304));
textGeneration r301 (.clk(clk), .reset(reset), .asciiData(a[301]), .ascii_In(R25_2), .x(x), .y(y), .displayContents(d[301]), .x_desired(10'd304), .y_desired(10'd304));
textGeneration r302 (.clk(clk), .reset(reset), .asciiData(a[302]), .ascii_In(R25_1), .x(x), .y(y), .displayContents(d[302]), .x_desired(10'd312), .y_desired(10'd304));
textGeneration r303 (.clk(clk), .reset(reset), .asciiData(a[303]), .ascii_In(R25_0), .x(x), .y(y), .displayContents(d[303]), .x_desired(10'd320), .y_desired(10'd304));
textGeneration r304 (.clk(clk), .reset(reset), .asciiData(a[304]), .ascii_In(R26_7), .x(x), .y(y), .displayContents(d[304]), .x_desired(10'd264), .y_desired(10'd320));
textGeneration r305 (.clk(clk), .reset(reset), .asciiData(a[305]), .ascii_In(R26_6), .x(x), .y(y), .displayContents(d[305]), .x_desired(10'd272), .y_desired(10'd320));
textGeneration r306 (.clk(clk), .reset(reset), .asciiData(a[306]), .ascii_In(R26_5), .x(x), .y(y), .displayContents(d[306]), .x_desired(10'd280), .y_desired(10'd320));
textGeneration r307 (.clk(clk), .reset(reset), .asciiData(a[307]), .ascii_In(R26_4), .x(x), .y(y), .displayContents(d[307]), .x_desired(10'd288), .y_desired(10'd320));
textGeneration r308 (.clk(clk), .reset(reset), .asciiData(a[308]), .ascii_In(R26_3), .x(x), .y(y), .displayContents(d[308]), .x_desired(10'd296), .y_desired(10'd320));
textGeneration r309 (.clk(clk), .reset(reset), .asciiData(a[309]), .ascii_In(R26_2), .x(x), .y(y), .displayContents(d[309]), .x_desired(10'd304), .y_desired(10'd320));
textGeneration r310 (.clk(clk), .reset(reset), .asciiData(a[310]), .ascii_In(R26_1), .x(x), .y(y), .displayContents(d[310]), .x_desired(10'd312), .y_desired(10'd320));
textGeneration r311 (.clk(clk), .reset(reset), .asciiData(a[311]), .ascii_In(R26_0), .x(x), .y(y), .displayContents(d[311]), .x_desired(10'd320), .y_desired(10'd320));
textGeneration r312 (.clk(clk), .reset(reset), .asciiData(a[312]), .ascii_In(R27_7), .x(x), .y(y), .displayContents(d[312]), .x_desired(10'd264), .y_desired(10'd336));
textGeneration r313 (.clk(clk), .reset(reset), .asciiData(a[313]), .ascii_In(R27_6), .x(x), .y(y), .displayContents(d[313]), .x_desired(10'd272), .y_desired(10'd336));
textGeneration r314 (.clk(clk), .reset(reset), .asciiData(a[314]), .ascii_In(R27_5), .x(x), .y(y), .displayContents(d[314]), .x_desired(10'd280), .y_desired(10'd336));
textGeneration r315 (.clk(clk), .reset(reset), .asciiData(a[315]), .ascii_In(R27_4), .x(x), .y(y), .displayContents(d[315]), .x_desired(10'd288), .y_desired(10'd336));
textGeneration r316 (.clk(clk), .reset(reset), .asciiData(a[316]), .ascii_In(R27_3), .x(x), .y(y), .displayContents(d[316]), .x_desired(10'd296), .y_desired(10'd336));
textGeneration r317 (.clk(clk), .reset(reset), .asciiData(a[317]), .ascii_In(R27_2), .x(x), .y(y), .displayContents(d[317]), .x_desired(10'd304), .y_desired(10'd336));
textGeneration r318 (.clk(clk), .reset(reset), .asciiData(a[318]), .ascii_In(R27_1), .x(x), .y(y), .displayContents(d[318]), .x_desired(10'd312), .y_desired(10'd336));
textGeneration r319 (.clk(clk), .reset(reset), .asciiData(a[319]), .ascii_In(R27_0), .x(x), .y(y), .displayContents(d[319]), .x_desired(10'd320), .y_desired(10'd336));
textGeneration r320 (.clk(clk), .reset(reset), .asciiData(a[320]), .ascii_In(R28_7), .x(x), .y(y), .displayContents(d[320]), .x_desired(10'd264), .y_desired(10'd352));
textGeneration r321 (.clk(clk), .reset(reset), .asciiData(a[321]), .ascii_In(R28_6), .x(x), .y(y), .displayContents(d[321]), .x_desired(10'd272), .y_desired(10'd352));
textGeneration r322 (.clk(clk), .reset(reset), .asciiData(a[322]), .ascii_In(R28_5), .x(x), .y(y), .displayContents(d[322]), .x_desired(10'd280), .y_desired(10'd352));
textGeneration r323 (.clk(clk), .reset(reset), .asciiData(a[323]), .ascii_In(R28_4), .x(x), .y(y), .displayContents(d[323]), .x_desired(10'd288), .y_desired(10'd352));
textGeneration r324 (.clk(clk), .reset(reset), .asciiData(a[324]), .ascii_In(R28_3), .x(x), .y(y), .displayContents(d[324]), .x_desired(10'd296), .y_desired(10'd352));
textGeneration r325 (.clk(clk), .reset(reset), .asciiData(a[325]), .ascii_In(R28_2), .x(x), .y(y), .displayContents(d[325]), .x_desired(10'd304), .y_desired(10'd352));
textGeneration r326 (.clk(clk), .reset(reset), .asciiData(a[326]), .ascii_In(R28_1), .x(x), .y(y), .displayContents(d[326]), .x_desired(10'd312), .y_desired(10'd352));
textGeneration r327 (.clk(clk), .reset(reset), .asciiData(a[327]), .ascii_In(R28_0), .x(x), .y(y), .displayContents(d[327]), .x_desired(10'd320), .y_desired(10'd352));
textGeneration r328 (.clk(clk), .reset(reset), .asciiData(a[328]), .ascii_In(R29_7), .x(x), .y(y), .displayContents(d[328]), .x_desired(10'd264), .y_desired(10'd368));
textGeneration r329 (.clk(clk), .reset(reset), .asciiData(a[329]), .ascii_In(R29_6), .x(x), .y(y), .displayContents(d[329]), .x_desired(10'd272), .y_desired(10'd368));
textGeneration r330 (.clk(clk), .reset(reset), .asciiData(a[330]), .ascii_In(R29_5), .x(x), .y(y), .displayContents(d[330]), .x_desired(10'd280), .y_desired(10'd368));
textGeneration r331 (.clk(clk), .reset(reset), .asciiData(a[331]), .ascii_In(R29_4), .x(x), .y(y), .displayContents(d[331]), .x_desired(10'd288), .y_desired(10'd368));
textGeneration r332 (.clk(clk), .reset(reset), .asciiData(a[332]), .ascii_In(R29_3), .x(x), .y(y), .displayContents(d[332]), .x_desired(10'd296), .y_desired(10'd368));
textGeneration r333 (.clk(clk), .reset(reset), .asciiData(a[333]), .ascii_In(R29_2), .x(x), .y(y), .displayContents(d[333]), .x_desired(10'd304), .y_desired(10'd368));
textGeneration r334 (.clk(clk), .reset(reset), .asciiData(a[334]), .ascii_In(R29_1), .x(x), .y(y), .displayContents(d[334]), .x_desired(10'd312), .y_desired(10'd368));
textGeneration r335 (.clk(clk), .reset(reset), .asciiData(a[335]), .ascii_In(R29_0), .x(x), .y(y), .displayContents(d[335]), .x_desired(10'd320), .y_desired(10'd368));
textGeneration r336 (.clk(clk), .reset(reset), .asciiData(a[336]), .ascii_In(R30_7), .x(x), .y(y), .displayContents(d[336]), .x_desired(10'd264), .y_desired(10'd384));
textGeneration r337 (.clk(clk), .reset(reset), .asciiData(a[337]), .ascii_In(R30_6), .x(x), .y(y), .displayContents(d[337]), .x_desired(10'd272), .y_desired(10'd384));
textGeneration r338 (.clk(clk), .reset(reset), .asciiData(a[338]), .ascii_In(R30_5), .x(x), .y(y), .displayContents(d[338]), .x_desired(10'd280), .y_desired(10'd384));
textGeneration r339 (.clk(clk), .reset(reset), .asciiData(a[339]), .ascii_In(R30_4), .x(x), .y(y), .displayContents(d[339]), .x_desired(10'd288), .y_desired(10'd384));
textGeneration r340 (.clk(clk), .reset(reset), .asciiData(a[340]), .ascii_In(R30_3), .x(x), .y(y), .displayContents(d[340]), .x_desired(10'd296), .y_desired(10'd384));
textGeneration r341 (.clk(clk), .reset(reset), .asciiData(a[341]), .ascii_In(R30_2), .x(x), .y(y), .displayContents(d[341]), .x_desired(10'd304), .y_desired(10'd384));
textGeneration r342 (.clk(clk), .reset(reset), .asciiData(a[342]), .ascii_In(R30_1), .x(x), .y(y), .displayContents(d[342]), .x_desired(10'd312), .y_desired(10'd384));
textGeneration r343 (.clk(clk), .reset(reset), .asciiData(a[343]), .ascii_In(R30_0), .x(x), .y(y), .displayContents(d[343]), .x_desired(10'd320), .y_desired(10'd384));
textGeneration r344 (.clk(clk), .reset(reset), .asciiData(a[344]), .ascii_In(R31_7), .x(x), .y(y), .displayContents(d[344]), .x_desired(10'd264), .y_desired(10'd400));
textGeneration r345 (.clk(clk), .reset(reset), .asciiData(a[345]), .ascii_In(R31_6), .x(x), .y(y), .displayContents(d[345]), .x_desired(10'd272), .y_desired(10'd400));
textGeneration r346 (.clk(clk), .reset(reset), .asciiData(a[346]), .ascii_In(R31_5), .x(x), .y(y), .displayContents(d[346]), .x_desired(10'd280), .y_desired(10'd400));
textGeneration r347 (.clk(clk), .reset(reset), .asciiData(a[347]), .ascii_In(R31_4), .x(x), .y(y), .displayContents(d[347]), .x_desired(10'd288), .y_desired(10'd400));
textGeneration r348 (.clk(clk), .reset(reset), .asciiData(a[348]), .ascii_In(R31_3), .x(x), .y(y), .displayContents(d[348]), .x_desired(10'd296), .y_desired(10'd400));
textGeneration r349 (.clk(clk), .reset(reset), .asciiData(a[349]), .ascii_In(R31_2), .x(x), .y(y), .displayContents(d[349]), .x_desired(10'd304), .y_desired(10'd400));
textGeneration r350 (.clk(clk), .reset(reset), .asciiData(a[350]), .ascii_In(R31_1), .x(x), .y(y), .displayContents(d[350]), .x_desired(10'd312), .y_desired(10'd400));
textGeneration r351 (.clk(clk), .reset(reset), .asciiData(a[351]), .ascii_In(R31_0), .x(x), .y(y), .displayContents(d[351]), .x_desired(10'd320), .y_desired(10'd400));

//MADE BY FPGAJEFF
textGeneration r352 (.clk(clk), .reset(reset), .asciiData(a[352]), .ascii_In(7'd77), .x(x), .y(y), .displayContents(d[352]), .x_desired(10'd112), .y_desired(10'd112));
textGeneration r353 (.clk(clk), .reset(reset), .asciiData(a[353]), .ascii_In(7'd65), .x(x), .y(y), .displayContents(d[353]), .x_desired(10'd120), .y_desired(10'd112));
textGeneration r354 (.clk(clk), .reset(reset), .asciiData(a[354]), .ascii_In(7'd68), .x(x), .y(y), .displayContents(d[354]), .x_desired(10'd128), .y_desired(10'd112));
textGeneration r355 (.clk(clk), .reset(reset), .asciiData(a[355]), .ascii_In(7'd69), .x(x), .y(y), .displayContents(d[355]), .x_desired(10'd136), .y_desired(10'd112));
textGeneration r356 (.clk(clk), .reset(reset), .asciiData(a[356]), .ascii_In(7'd32), .x(x), .y(y), .displayContents(d[356]), .x_desired(10'd144), .y_desired(10'd112));
textGeneration r357 (.clk(clk), .reset(reset), .asciiData(a[357]), .ascii_In(7'd66), .x(x), .y(y), .displayContents(d[357]), .x_desired(10'd152), .y_desired(10'd112));
textGeneration r358 (.clk(clk), .reset(reset), .asciiData(a[358]), .ascii_In(7'd89), .x(x), .y(y), .displayContents(d[358]), .x_desired(10'd160), .y_desired(10'd112));
textGeneration r359 (.clk(clk), .reset(reset), .asciiData(a[359]), .ascii_In(7'd32), .x(x), .y(y), .displayContents(d[359]), .x_desired(10'd168), .y_desired(10'd112));
textGeneration r360 (.clk(clk), .reset(reset), .asciiData(a[360]), .ascii_In(7'd70), .x(x), .y(y), .displayContents(d[360]), .x_desired(10'd176), .y_desired(10'd112));
textGeneration r361 (.clk(clk), .reset(reset), .asciiData(a[361]), .ascii_In(7'd80), .x(x), .y(y), .displayContents(d[361]), .x_desired(10'd184), .y_desired(10'd112));
textGeneration r362 (.clk(clk), .reset(reset), .asciiData(a[362]), .ascii_In(7'd71), .x(x), .y(y), .displayContents(d[362]), .x_desired(10'd192), .y_desired(10'd112));
textGeneration r363 (.clk(clk), .reset(reset), .asciiData(a[363]), .ascii_In(7'd65), .x(x), .y(y), .displayContents(d[363]), .x_desired(10'd200), .y_desired(10'd112));
textGeneration r364 (.clk(clk), .reset(reset), .asciiData(a[364]), .ascii_In(7'd74), .x(x), .y(y), .displayContents(d[364]), .x_desired(10'd208), .y_desired(10'd112));
textGeneration r365 (.clk(clk), .reset(reset), .asciiData(a[365]), .ascii_In(7'd69), .x(x), .y(y), .displayContents(d[365]), .x_desired(10'd216), .y_desired(10'd112));
textGeneration r366 (.clk(clk), .reset(reset), .asciiData(a[366]), .ascii_In(7'd70), .x(x), .y(y), .displayContents(d[366]), .x_desired(10'd224), .y_desired(10'd112));
textGeneration r367 (.clk(clk), .reset(reset), .asciiData(a[367]), .ascii_In(7'd70), .x(x), .y(y), .displayContents(d[367]), .x_desired(10'd232), .y_desired(10'd112));



        /*
        textGeneration c0 (.clk(clk),.reset(reset),.asciiData(a[0]), .ascii_In(readAscii[0]), //readAscii[0] holds 7'h46 or Char 'F'
        .x(x),.y(y), .displayContents(d[0]), .x_desired(10'd80), .y_desired(10'd80)); //Desired X and Y coordinate to display F is X:80, Y:80
                                                                                        // (top-left most of monitor is (0,0))
        textGeneration c1 (.clk(clk),.reset(reset),.asciiData(a[1]), .ascii_In(readAscii[1]), //Char 'P'
        .x(x),.y(y), .displayContents(d[1]), .x_desired(10'd88), .y_desired(10'd80));
        
        textGeneration c2 (.clk(clk),.reset(reset),.asciiData(a[2]), .ascii_In(readAscii[2]),//Char 'G'
        .x(x),.y(y), .displayContents(d[2]), .x_desired(10'd96), .y_desired(10'd80));
        
        textGeneration c3 (.clk(clk),.reset(reset),.asciiData(a[3]), .ascii_In(readAscii[3]),//Char 'A'
        .x(x),.y(y), .displayContents(d[3]), .x_desired(10'd104), .y_desired(10'd80));
        
        textGeneration c4 (.clk(clk),.reset(reset),.asciiData(a[4]), .ascii_In(readAscii[4]), //Char 'J'
        .x(x),.y(y), .displayContents(d[4]), .x_desired(10'd112), .y_desired(10'd80));
        
        textGeneration c5 (.clk(clk),.reset(reset),.asciiData(a[5]), .ascii_In(readAscii[5]),//Char 'E'
        .x(x),.y(y), .displayContents(d[5]), .x_desired(10'd120), .y_desired(10'd80));
        
        textGeneration c6 (.clk(clk),.reset(reset),.asciiData(a[6]), .ascii_In(readAscii[6]),//Char 'F'
        .x(x),.y(y), .displayContents(d[6]), .x_desired(10'd128), .y_desired(10'd80));
        
         textGeneration c7 (.clk(clk),.reset(reset),.asciiData(a[7]), .ascii_In(readAscii[7]),//Char 'F'
        .x(x),.y(y), .displayContents(d[7]), .x_desired(10'd136), .y_desired(10'd80));
        
         textGeneration c8 (.clk(clk),.reset(reset),.asciiData(a[8]), .ascii_In(counterValue),//Counter outputs ASCII 7'h30 -> 7'39
        .x(x),.y(y), .displayContents(d[8]), .x_desired(10'd152), .y_desired(10'd80));          //which is then fed into ascii_In
*/
//Decoder to trigger displayContents signal high or low depending on which ASCII char is reached
    assign displayContents =
d[0] ? d[0] :
d[1] ? d[1] :
d[2] ? d[2] :
d[3] ? d[3] :
d[4] ? d[4] :
d[5] ? d[5] :
d[6] ? d[6] :
d[7] ? d[7] :
d[8] ? d[8] :
d[9] ? d[9] :
d[10] ? d[10] :
d[11] ? d[11] :
d[12] ? d[12] :
d[13] ? d[13] :
d[14] ? d[14] :
d[15] ? d[15] :
d[16] ? d[16] :
d[17] ? d[17] :
d[18] ? d[18] :
d[19] ? d[19] :
d[20] ? d[20] :
d[21] ? d[21] :
d[22] ? d[22] :
d[23] ? d[23] :
d[24] ? d[24] :
d[25] ? d[25] :
d[26] ? d[26] :
d[27] ? d[27] :
d[28] ? d[28] :
d[29] ? d[29] :
d[30] ? d[30] :
d[31] ? d[31] :
d[32] ? d[32] :
d[33] ? d[33] :
d[34] ? d[34] :
d[35] ? d[35] :
d[36] ? d[36] :
d[37] ? d[37] :
d[38] ? d[38] :
d[39] ? d[39] :
d[40] ? d[40] :
d[41] ? d[41] :
d[42] ? d[42] :
d[43] ? d[43] :
d[44] ? d[44] :
d[45] ? d[45] :
d[46] ? d[46] :
d[47] ? d[47] :
d[48] ? d[48] :
d[49] ? d[49] :
d[50] ? d[50] :
d[51] ? d[51] :
d[52] ? d[52] :
d[53] ? d[53] :
d[54] ? d[54] :
d[55] ? d[55] :
d[56] ? d[56] :
d[57] ? d[57] :
d[58] ? d[58] :
d[59] ? d[59] :
d[60] ? d[60] :
d[61] ? d[61] :
d[62] ? d[62] :
d[63] ? d[63] :
d[64] ? d[64] :
d[65] ? d[65] :
d[66] ? d[66] :
d[67] ? d[67] :
d[68] ? d[68] :
d[69] ? d[69] :
d[70] ? d[70] :
d[71] ? d[71] :
d[72] ? d[72] :
d[73] ? d[73] :
d[74] ? d[74] :
d[75] ? d[75] :
d[76] ? d[76] :
d[77] ? d[77] :
d[78] ? d[78] :
d[79] ? d[79] :
d[80] ? d[80] :
d[81] ? d[81] :
d[82] ? d[82] :
d[83] ? d[83] :
d[84] ? d[84] :
d[85] ? d[85] :
d[86] ? d[86] :
d[87] ? d[87] :
d[88] ? d[88] :
d[89] ? d[89] :
d[90] ? d[90] :
d[91] ? d[91] :
d[92] ? d[92] :
d[93] ? d[93] :
d[94] ? d[94] :
d[95] ? d[95] :
d[96] ? d[96] :
d[97] ? d[97] :
d[98] ? d[98] :
d[99] ? d[99] :
d[100] ? d[100] :
d[101] ? d[101] :
d[102] ? d[102] :
d[103] ? d[103] :
d[104] ? d[104] :
d[105] ? d[105] :
d[106] ? d[106] :
d[107] ? d[107] :
d[108] ? d[108] :
d[109] ? d[109] :
d[110] ? d[110] :
d[111] ? d[111] :
d[112] ? d[112] :
d[113] ? d[113] :
d[114] ? d[114] :
d[115] ? d[115] :
d[116] ? d[116] :
d[117] ? d[117] :
d[118] ? d[118] :
d[119] ? d[119] :
d[120] ? d[120] :
d[121] ? d[121] :
d[122] ? d[122] :
d[123] ? d[123] :
d[124] ? d[124] :
d[125] ? d[125] :
d[126] ? d[126] :
d[127] ? d[127] :
d[128] ? d[128] :
d[129] ? d[129] :
d[130] ? d[130] :
d[131] ? d[131] :
d[132] ? d[132] :
d[133] ? d[133] :
d[134] ? d[134] :
d[135] ? d[135] :
d[136] ? d[136] :
d[137] ? d[137] :
d[138] ? d[138] :
d[139] ? d[139] :
d[140] ? d[140] :
d[141] ? d[141] :
d[142] ? d[142] :
d[143] ? d[143] :
d[144] ? d[144] :
d[145] ? d[145] :
d[146] ? d[146] :
d[147] ? d[147] :
d[148] ? d[148] :
d[149] ? d[149] :
d[150] ? d[150] :
d[151] ? d[151] :
d[152] ? d[152] :
d[153] ? d[153] :
d[154] ? d[154] :
d[155] ? d[155] :
d[156] ? d[156] :
d[157] ? d[157] :
d[158] ? d[158] :
d[159] ? d[159] :
d[160] ? d[160] :
d[161] ? d[161] :
d[162] ? d[162] :
d[163] ? d[163] :
d[164] ? d[164] :
d[165] ? d[165] :
d[166] ? d[166] :
d[167] ? d[167] :
d[168] ? d[168] :
d[169] ? d[169] :
d[170] ? d[170] :
d[171] ? d[171] :
d[172] ? d[172] :
d[173] ? d[173] :
d[174] ? d[174] :
d[175] ? d[175] :
d[176] ? d[176] :
d[177] ? d[177] :
d[178] ? d[178] :
d[179] ? d[179] :
d[180] ? d[180] :
d[181] ? d[181] :
d[182] ? d[182] :
d[183] ? d[183] :
d[184] ? d[184] :
d[185] ? d[185] :
d[186] ? d[186] :
d[187] ? d[187] :
d[188] ? d[188] :
d[189] ? d[189] :
d[190] ? d[190] :
d[191] ? d[191] :
d[192] ? d[192] :
d[193] ? d[193] :
d[194] ? d[194] :
d[195] ? d[195] :
d[196] ? d[196] :
d[197] ? d[197] :
d[198] ? d[198] :
d[199] ? d[199] :
d[200] ? d[200] :
d[201] ? d[201] :
d[202] ? d[202] :
d[203] ? d[203] :
d[204] ? d[204] :
d[205] ? d[205] :
d[206] ? d[206] :
d[207] ? d[207] :
d[208] ? d[208] :
d[209] ? d[209] :
d[210] ? d[210] :
d[211] ? d[211] :
d[212] ? d[212] :
d[213] ? d[213] :
d[214] ? d[214] :
d[215] ? d[215] :
d[216] ? d[216] :
d[217] ? d[217] :
d[218] ? d[218] :
d[219] ? d[219] :
d[220] ? d[220] :
d[221] ? d[221] :
d[222] ? d[222] :
d[223] ? d[223] :
d[224] ? d[224] :
d[225] ? d[225] :
d[226] ? d[226] :
d[227] ? d[227] :
d[228] ? d[228] :
d[229] ? d[229] :
d[230] ? d[230] :
d[231] ? d[231] :
d[232] ? d[232] :
d[233] ? d[233] :
d[234] ? d[234] :
d[235] ? d[235] :
d[236] ? d[236] :
d[237] ? d[237] :
d[238] ? d[238] :
d[239] ? d[239] :
d[240] ? d[240] :
d[241] ? d[241] :
d[242] ? d[242] :
d[243] ? d[243] :
d[244] ? d[244] :
d[245] ? d[245] :
d[246] ? d[246] :
d[247] ? d[247] :
d[248] ? d[248] :
d[249] ? d[249] :
d[250] ? d[250] :
d[251] ? d[251] :
d[252] ? d[252] :
d[253] ? d[253] :
d[254] ? d[254] :
d[255] ? d[255] :
d[256] ? d[256] :
d[257] ? d[257] :
d[258] ? d[258] :
d[259] ? d[259] :
d[260] ? d[260] :
d[261] ? d[261] :
d[262] ? d[262] :
d[263] ? d[263] :
d[264] ? d[264] :
d[265] ? d[265] :
d[266] ? d[266] :
d[267] ? d[267] :
d[268] ? d[268] :
d[269] ? d[269] :
d[270] ? d[270] :
d[271] ? d[271] :
d[272] ? d[272] :
d[273] ? d[273] :
d[274] ? d[274] :
d[275] ? d[275] :
d[276] ? d[276] :
d[277] ? d[277] :
d[278] ? d[278] :
d[279] ? d[279] :
d[280] ? d[280] :
d[281] ? d[281] :
d[282] ? d[282] :
d[283] ? d[283] :
d[284] ? d[284] :
d[285] ? d[285] :
d[286] ? d[286] :
d[287] ? d[287] :
d[288] ? d[288] :
d[289] ? d[289] :
d[290] ? d[290] :
d[291] ? d[291] :
d[292] ? d[292] :
d[293] ? d[293] :
d[294] ? d[294] :
d[295] ? d[295] :
d[296] ? d[296] :
d[297] ? d[297] :
d[298] ? d[298] :
d[299] ? d[299] :
d[300] ? d[300] :
d[301] ? d[301] :
d[302] ? d[302] :
d[303] ? d[303] :
d[304] ? d[304] :
d[305] ? d[305] :
d[306] ? d[306] :
d[307] ? d[307] :
d[308] ? d[308] :
d[309] ? d[309] :
d[310] ? d[310] :
d[311] ? d[311] :
d[312] ? d[312] :
d[313] ? d[313] :
d[314] ? d[314] :
d[315] ? d[315] :
d[316] ? d[316] :
d[317] ? d[317] :
d[318] ? d[318] :
d[319] ? d[319] :
d[320] ? d[320] :
d[321] ? d[321] :
d[322] ? d[322] :
d[323] ? d[323] :
d[324] ? d[324] :
d[325] ? d[325] :
d[326] ? d[326] :
d[327] ? d[327] :
d[328] ? d[328] :
d[329] ? d[329] :
d[330] ? d[330] :
d[331] ? d[331] :
d[332] ? d[332] :
d[333] ? d[333] :
d[334] ? d[334] :
d[335] ? d[335] :
d[336] ? d[336] :
d[337] ? d[337] :
d[338] ? d[338] :
d[339] ? d[339] :
d[340] ? d[340] :
d[341] ? d[341] :
d[342] ? d[342] :
d[343] ? d[343] :
d[344] ? d[344] :
d[345] ? d[345] :
d[346] ? d[346] :
d[347] ? d[347] :
d[348] ? d[348] :
d[349] ? d[349] :
d[350] ? d[350] :
d[351] ? d[351] :
d[352] ? d[352] :
d[353] ? d[353] :
d[354] ? d[354] :
d[355] ? d[355] :
d[356] ? d[356] :
d[357] ? d[357] :
d[358] ? d[358] :
d[359] ? d[359] :
d[360] ? d[360] :
d[361] ? d[361] :
d[362] ? d[362] :
d[363] ? d[363] :
d[364] ? d[364] :
d[365] ? d[365] :
d[366] ? d[366] :
d[367] ? d[367] :
 0;
   
//Decoder to assign correct ASCII value depending on which displayContents signal is used                        
    assign ascii =  d[0] ? a[0] :
d[1] ? a[1] :
d[2] ? a[2] :
d[3] ? a[3] :
d[4] ? a[4] :
d[5] ? a[5] :
d[6] ? a[6] :
d[7] ? a[7] :
d[8] ? a[8] :
d[9] ? a[9] :
d[10] ? a[10] :
d[11] ? a[11] :
d[12] ? a[12] :
d[13] ? a[13] :
d[14] ? a[14] :
d[15] ? a[15] :
d[16] ? a[16] :
d[17] ? a[17] :
d[18] ? a[18] :
d[19] ? a[19] :
d[20] ? a[20] :
d[21] ? a[21] :
d[22] ? a[22] :
d[23] ? a[23] :
d[24] ? a[24] :
d[25] ? a[25] :
d[26] ? a[26] :
d[27] ? a[27] :
d[28] ? a[28] :
d[29] ? a[29] :
d[30] ? a[30] :
d[31] ? a[31] :
d[32] ? a[32] :
d[33] ? a[33] :
d[34] ? a[34] :
d[35] ? a[35] :
d[36] ? a[36] :
d[37] ? a[37] :
d[38] ? a[38] :
d[39] ? a[39] :
d[40] ? a[40] :
d[41] ? a[41] :
d[42] ? a[42] :
d[43] ? a[43] :
d[44] ? a[44] :
d[45] ? a[45] :
d[46] ? a[46] :
d[47] ? a[47] :
d[48] ? a[48] :
d[49] ? a[49] :
d[50] ? a[50] :
d[51] ? a[51] :
d[52] ? a[52] :
d[53] ? a[53] :
d[54] ? a[54] :
d[55] ? a[55] :
d[56] ? a[56] :
d[57] ? a[57] :
d[58] ? a[58] :
d[59] ? a[59] :
d[60] ? a[60] :
d[61] ? a[61] :
d[62] ? a[62] :
d[63] ? a[63] :
d[64] ? a[64] :
d[65] ? a[65] :
d[66] ? a[66] :
d[67] ? a[67] :
d[68] ? a[68] :
d[69] ? a[69] :
d[70] ? a[70] :
d[71] ? a[71] :
d[72] ? a[72] :
d[73] ? a[73] :
d[74] ? a[74] :
d[75] ? a[75] :
d[76] ? a[76] :
d[77] ? a[77] :
d[78] ? a[78] :
d[79] ? a[79] :
d[80] ? a[80] :
d[81] ? a[81] :
d[82] ? a[82] :
d[83] ? a[83] :
d[84] ? a[84] :
d[85] ? a[85] :
d[86] ? a[86] :
d[87] ? a[87] :
d[88] ? a[88] :
d[89] ? a[89] :
d[90] ? a[90] :
d[91] ? a[91] :
d[92] ? a[92] :
d[93] ? a[93] :
d[94] ? a[94] :
d[95] ? a[95] :
d[96] ? a[96] :
d[97] ? a[97] :
d[98] ? a[98] :
d[99] ? a[99] :
d[100] ? a[100] :
d[101] ? a[101] :
d[102] ? a[102] :
d[103] ? a[103] :
d[104] ? a[104] :
d[105] ? a[105] :
d[106] ? a[106] :
d[107] ? a[107] :
d[108] ? a[108] :
d[109] ? a[109] :
d[110] ? a[110] :
d[111] ? a[111] :
d[112] ? a[112] :
d[113] ? a[113] :
d[114] ? a[114] :
d[115] ? a[115] :
d[116] ? a[116] :
d[117] ? a[117] :
d[118] ? a[118] :
d[119] ? a[119] :
d[120] ? a[120] :
d[121] ? a[121] :
d[122] ? a[122] :
d[123] ? a[123] :
d[124] ? a[124] :
d[125] ? a[125] :
d[126] ? a[126] :
d[127] ? a[127] :
d[128] ? a[128] :
d[129] ? a[129] :
d[130] ? a[130] :
d[131] ? a[131] :
d[132] ? a[132] :
d[133] ? a[133] :
d[134] ? a[134] :
d[135] ? a[135] :
d[136] ? a[136] :
d[137] ? a[137] :
d[138] ? a[138] :
d[139] ? a[139] :
d[140] ? a[140] :
d[141] ? a[141] :
d[142] ? a[142] :
d[143] ? a[143] :
d[144] ? a[144] :
d[145] ? a[145] :
d[146] ? a[146] :
d[147] ? a[147] :
d[148] ? a[148] :
d[149] ? a[149] :
d[150] ? a[150] :
d[151] ? a[151] :
d[152] ? a[152] :
d[153] ? a[153] :
d[154] ? a[154] :
d[155] ? a[155] :
d[156] ? a[156] :
d[157] ? a[157] :
d[158] ? a[158] :
d[159] ? a[159] :
d[160] ? a[160] :
d[161] ? a[161] :
d[162] ? a[162] :
d[163] ? a[163] :
d[164] ? a[164] :
d[165] ? a[165] :
d[166] ? a[166] :
d[167] ? a[167] :
d[168] ? a[168] :
d[169] ? a[169] :
d[170] ? a[170] :
d[171] ? a[171] :
d[172] ? a[172] :
d[173] ? a[173] :
d[174] ? a[174] :
d[175] ? a[175] :
d[176] ? a[176] :
d[177] ? a[177] :
d[178] ? a[178] :
d[179] ? a[179] :
d[180] ? a[180] :
d[181] ? a[181] :
d[182] ? a[182] :
d[183] ? a[183] :
d[184] ? a[184] :
d[185] ? a[185] :
d[186] ? a[186] :
d[187] ? a[187] :
d[188] ? a[188] :
d[189] ? a[189] :
d[190] ? a[190] :
d[191] ? a[191] :
d[192] ? a[192] :
d[193] ? a[193] :
d[194] ? a[194] :
d[195] ? a[195] :
d[196] ? a[196] :
d[197] ? a[197] :
d[198] ? a[198] :
d[199] ? a[199] :
d[200] ? a[200] :
d[201] ? a[201] :
d[202] ? a[202] :
d[203] ? a[203] :
d[204] ? a[204] :
d[205] ? a[205] :
d[206] ? a[206] :
d[207] ? a[207] :
d[208] ? a[208] :
d[209] ? a[209] :
d[210] ? a[210] :
d[211] ? a[211] :
d[212] ? a[212] :
d[213] ? a[213] :
d[214] ? a[214] :
d[215] ? a[215] :
d[216] ? a[216] :
d[217] ? a[217] :
d[218] ? a[218] :
d[219] ? a[219] :
d[220] ? a[220] :
d[221] ? a[221] :
d[222] ? a[222] :
d[223] ? a[223] :
d[224] ? a[224] :
d[225] ? a[225] :
d[226] ? a[226] :
d[227] ? a[227] :
d[228] ? a[228] :
d[229] ? a[229] :
d[230] ? a[230] :
d[231] ? a[231] :
d[232] ? a[232] :
d[233] ? a[233] :
d[234] ? a[234] :
d[235] ? a[235] :
d[236] ? a[236] :
d[237] ? a[237] :
d[238] ? a[238] :
d[239] ? a[239] :
d[240] ? a[240] :
d[241] ? a[241] :
d[242] ? a[242] :
d[243] ? a[243] :
d[244] ? a[244] :
d[245] ? a[245] :
d[246] ? a[246] :
d[247] ? a[247] :
d[248] ? a[248] :
d[249] ? a[249] :
d[250] ? a[250] :
d[251] ? a[251] :
d[252] ? a[252] :
d[253] ? a[253] :
d[254] ? a[254] :
d[255] ? a[255] :
d[256] ? a[256] :
d[257] ? a[257] :
d[258] ? a[258] :
d[259] ? a[259] :
d[260] ? a[260] :
d[261] ? a[261] :
d[262] ? a[262] :
d[263] ? a[263] :
d[264] ? a[264] :
d[265] ? a[265] :
d[266] ? a[266] :
d[267] ? a[267] :
d[268] ? a[268] :
d[269] ? a[269] :
d[270] ? a[270] :
d[271] ? a[271] :
d[272] ? a[272] :
d[273] ? a[273] :
d[274] ? a[274] :
d[275] ? a[275] :
d[276] ? a[276] :
d[277] ? a[277] :
d[278] ? a[278] :
d[279] ? a[279] :
d[280] ? a[280] :
d[281] ? a[281] :
d[282] ? a[282] :
d[283] ? a[283] :
d[284] ? a[284] :
d[285] ? a[285] :
d[286] ? a[286] :
d[287] ? a[287] :
d[288] ? a[288] :
d[289] ? a[289] :
d[290] ? a[290] :
d[291] ? a[291] :
d[292] ? a[292] :
d[293] ? a[293] :
d[294] ? a[294] :
d[295] ? a[295] :
d[296] ? a[296] :
d[297] ? a[297] :
d[298] ? a[298] :
d[299] ? a[299] :
d[300] ? a[300] :
d[301] ? a[301] :
d[302] ? a[302] :
d[303] ? a[303] :
d[304] ? a[304] :
d[305] ? a[305] :
d[306] ? a[306] :
d[307] ? a[307] :
d[308] ? a[308] :
d[309] ? a[309] :
d[310] ? a[310] :
d[311] ? a[311] :
d[312] ? a[312] :
d[313] ? a[313] :
d[314] ? a[314] :
d[315] ? a[315] :
d[316] ? a[316] :
d[317] ? a[317] :
d[318] ? a[318] :
d[319] ? a[319] :
d[320] ? a[320] :
d[321] ? a[321] :
d[322] ? a[322] :
d[323] ? a[323] :
d[324] ? a[324] :
d[325] ? a[325] :
d[326] ? a[326] :
d[327] ? a[327] :
d[328] ? a[328] :
d[329] ? a[329] :
d[330] ? a[330] :
d[331] ? a[331] :
d[332] ? a[332] :
d[333] ? a[333] :
d[334] ? a[334] :
d[335] ? a[335] :
d[336] ? a[336] :
d[337] ? a[337] :
d[338] ? a[338] :
d[339] ? a[339] :
d[340] ? a[340] :
d[341] ? a[341] :
d[342] ? a[342] :
d[343] ? a[343] :
d[344] ? a[344] :
d[345] ? a[345] :
d[346] ? a[346] :
d[347] ? a[347] :
d[348] ? a[348] :
d[349] ? a[349] :
d[350] ? a[350] :
d[351] ? a[351] :
d[352] ? a[352] :
d[353] ? a[353] :
d[354] ? a[354] :
d[355] ? a[355] :
d[356] ? a[356] :
d[357] ? a[357] :
d[358] ? a[358] :
d[359] ? a[359] :
d[360] ? a[360] :
d[361] ? a[361] :
d[362] ? a[362] :
d[363] ? a[363] :
d[364] ? a[364] :
d[365] ? a[365] :
d[366] ? a[366] :
d[367] ? a[367] :
 7'h30;

 
 //ASCII_ROM////////////////////////////////////////////////////////////       
    //Connections to ascii_rom
    wire [10:0] rom_addr;
    //Handle the row of the rom
    wire [3:0] rom_row;
    //Handle the column of the rom data
    wire [2:0] rom_col;
    //Wire to connect to rom_data of ascii_rom
    wire [7:0] rom_data;
    //Bit to signal display of data
    wire rom_bit;
    ascii_rom rom1(.clk(clk), .rom_addr(rom_addr), .data(rom_data));

    //Concatenate to get 11 bit rom_addr
    assign rom_row = y[3:0];
    assign rom_addr = {ascii, rom_row};
    assign rom_col = x[2:0];
    assign rom_bit = rom_data[~rom_col]; //need to negate since it initially displays mirrored
///////////////////////////////////////////////////////////////////////////////////////////////
    
    //If video on then check
        //If rom_bit is on
            //If x and y are in the origin/end range
                //Set RGB to display whatever is in the ROM within the origin/end range
            //Else we are out of range so we should not modify anything, RGB set to blue
        //rom_bit is off display blue
    //Video_off display black
            
    assign rgb = video_on ? (rom_bit ? ((displayContents) ? 12'hFFF: 12'h8): 12'h8) : 12'b0; //blue background white text
endmodule