/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 27 02:35:35 2019
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   data;

  DFFSR data_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data) );
  DFFSR sync_out_reg ( .D(data), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   data;

  DFFSR data_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data) );
  DFFSR sync_out_reg ( .D(data), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n122, n123, n124, n125, n126, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150;
  wire   [4:0] state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(n126), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(n122), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[2]  ( .D(n123), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[4]  ( .D(n125), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  DFFSR \state_reg[1]  ( .D(n124), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  INVX1 U8 ( .A(n84), .Y(n85) );
  AND2X2 U9 ( .A(n135), .B(n127), .Y(n8) );
  BUFX2 U10 ( .A(state[0]), .Y(n40) );
  INVX2 U11 ( .A(state[2]), .Y(n25) );
  INVX1 U12 ( .A(n43), .Y(n10) );
  OR2X2 U13 ( .A(n131), .B(n130), .Y(src1[0]) );
  AND2X2 U14 ( .A(n40), .B(state[3]), .Y(n7) );
  AND2X2 U15 ( .A(n56), .B(n55), .Y(n9) );
  INVX2 U16 ( .A(n10), .Y(n11) );
  INVX2 U17 ( .A(n56), .Y(n26) );
  NAND2X1 U18 ( .A(n54), .B(n18), .Y(n12) );
  INVX2 U19 ( .A(n14), .Y(n13) );
  BUFX2 U20 ( .A(state[3]), .Y(n14) );
  AND2X1 U21 ( .A(n96), .B(n56), .Y(n27) );
  INVX1 U22 ( .A(state[4]), .Y(n15) );
  INVX1 U23 ( .A(state[4]), .Y(n30) );
  INVX2 U24 ( .A(n135), .Y(n117) );
  BUFX2 U25 ( .A(n116), .Y(n16) );
  AND2X2 U26 ( .A(n43), .B(n41), .Y(n37) );
  BUFX2 U27 ( .A(n38), .Y(n17) );
  BUFX2 U28 ( .A(n55), .Y(n18) );
  INVX2 U29 ( .A(n31), .Y(n19) );
  BUFX2 U30 ( .A(n27), .Y(n20) );
  BUFX2 U31 ( .A(n138), .Y(n21) );
  BUFX2 U32 ( .A(n137), .Y(n22) );
  INVX1 U33 ( .A(n107), .Y(n23) );
  INVX1 U34 ( .A(n23), .Y(n24) );
  INVX1 U35 ( .A(n74), .Y(n79) );
  NAND2X1 U36 ( .A(n57), .B(n9), .Y(n135) );
  INVX1 U37 ( .A(state[4]), .Y(n44) );
  AND2X1 U38 ( .A(n33), .B(n41), .Y(n39) );
  INVX2 U39 ( .A(n55), .Y(n42) );
  BUFX2 U40 ( .A(n129), .Y(n28) );
  AND2X2 U41 ( .A(n40), .B(n96), .Y(n36) );
  INVX4 U42 ( .A(n40), .Y(n56) );
  AND2X2 U43 ( .A(n132), .B(n128), .Y(n134) );
  INVX1 U44 ( .A(n128), .Y(n133) );
  INVX2 U45 ( .A(cnt_up), .Y(n29) );
  INVX1 U46 ( .A(n141), .Y(cnt_up) );
  BUFX2 U47 ( .A(n75), .Y(n31) );
  INVX2 U48 ( .A(n87), .Y(n75) );
  BUFX2 U49 ( .A(n128), .Y(n32) );
  INVX2 U50 ( .A(n30), .Y(n33) );
  OR2X1 U51 ( .A(n113), .B(n112), .Y(dest[0]) );
  AND2X2 U52 ( .A(n43), .B(n25), .Y(n35) );
  AND2X2 U53 ( .A(n14), .B(n56), .Y(n38) );
  INVX1 U54 ( .A(n132), .Y(n48) );
  BUFX4 U55 ( .A(state[2]), .Y(n41) );
  AND2X2 U56 ( .A(state[1]), .B(n15), .Y(n43) );
  INVX1 U57 ( .A(n11), .Y(n77) );
  INVX1 U58 ( .A(overflow), .Y(n106) );
  NAND2X1 U59 ( .A(n35), .B(n7), .Y(n128) );
  INVX2 U60 ( .A(state[1]), .Y(n55) );
  NAND3X1 U61 ( .A(n41), .B(n44), .C(n55), .Y(n87) );
  NAND2X1 U62 ( .A(n75), .B(n7), .Y(n129) );
  INVX2 U63 ( .A(state[3]), .Y(n96) );
  NAND2X1 U64 ( .A(n35), .B(n36), .Y(n147) );
  NAND3X1 U65 ( .A(n32), .B(n129), .C(n147), .Y(n51) );
  NAND2X1 U66 ( .A(n35), .B(n38), .Y(n132) );
  NAND3X1 U67 ( .A(n44), .B(n25), .C(n55), .Y(n45) );
  INVX2 U68 ( .A(n45), .Y(n52) );
  NAND2X1 U69 ( .A(n36), .B(n52), .Y(n146) );
  NAND2X1 U70 ( .A(n52), .B(n7), .Y(n141) );
  NAND3X1 U71 ( .A(n96), .B(n25), .C(n33), .Y(n46) );
  INVX2 U72 ( .A(n46), .Y(n57) );
  NAND3X1 U73 ( .A(n57), .B(n26), .C(n18), .Y(n84) );
  NAND3X1 U74 ( .A(n146), .B(n29), .C(n84), .Y(n47) );
  NOR2X1 U75 ( .A(n48), .B(n47), .Y(n108) );
  NAND2X1 U76 ( .A(n75), .B(n38), .Y(n116) );
  OAI21X1 U77 ( .A(n31), .B(n37), .C(n36), .Y(n150) );
  INVX2 U78 ( .A(n150), .Y(n114) );
  NAND3X1 U79 ( .A(n36), .B(n18), .C(n39), .Y(n121) );
  INVX2 U80 ( .A(n121), .Y(n142) );
  NOR2X1 U81 ( .A(n114), .B(n142), .Y(n49) );
  NAND3X1 U82 ( .A(n108), .B(n116), .C(n49), .Y(n50) );
  OR2X1 U83 ( .A(n51), .B(n50), .Y(op[0]) );
  NAND2X1 U84 ( .A(n17), .B(n52), .Y(n140) );
  INVX2 U85 ( .A(dr), .Y(n101) );
  NAND2X1 U86 ( .A(n37), .B(n7), .Y(n74) );
  NAND3X1 U87 ( .A(n42), .B(n26), .C(n57), .Y(n105) );
  NAND3X1 U88 ( .A(n140), .B(n74), .C(n105), .Y(n61) );
  NAND2X1 U89 ( .A(n27), .B(n52), .Y(n91) );
  OAI21X1 U90 ( .A(n31), .B(n11), .C(n27), .Y(n148) );
  NAND2X1 U91 ( .A(n39), .B(n27), .Y(n53) );
  INVX2 U92 ( .A(n53), .Y(n54) );
  NAND2X1 U93 ( .A(n54), .B(n42), .Y(n67) );
  NAND3X1 U94 ( .A(n91), .B(n148), .C(n67), .Y(n62) );
  INVX2 U95 ( .A(n62), .Y(modwait) );
  NAND2X1 U96 ( .A(n54), .B(n18), .Y(n138) );
  NAND3X1 U97 ( .A(n57), .B(n42), .C(n56), .Y(n136) );
  NAND3X1 U98 ( .A(n38), .B(n41), .C(n11), .Y(n127) );
  NAND3X1 U99 ( .A(n21), .B(n136), .C(n8), .Y(n58) );
  INVX2 U100 ( .A(n58), .Y(n145) );
  INVX2 U101 ( .A(op[0]), .Y(n59) );
  NAND3X1 U102 ( .A(modwait), .B(n145), .C(n59), .Y(n60) );
  OR2X1 U103 ( .A(n61), .B(n60), .Y(n95) );
  INVX2 U104 ( .A(n95), .Y(n103) );
  AOI22X1 U105 ( .A(n103), .B(n26), .C(lc), .D(n62), .Y(n63) );
  OAI21X1 U106 ( .A(n140), .B(n101), .C(n63), .Y(n65) );
  NAND3X1 U107 ( .A(n145), .B(n132), .C(n16), .Y(n64) );
  OR2X1 U108 ( .A(n65), .B(n64), .Y(n126) );
  NAND3X1 U109 ( .A(n74), .B(n84), .C(n105), .Y(n66) );
  INVX2 U110 ( .A(n66), .Y(n144) );
  NAND3X1 U111 ( .A(n144), .B(n136), .C(n21), .Y(n119) );
  INVX2 U112 ( .A(n140), .Y(n92) );
  NAND2X1 U113 ( .A(n92), .B(n101), .Y(n70) );
  NAND2X1 U114 ( .A(overflow), .B(n142), .Y(n81) );
  INVX2 U115 ( .A(n67), .Y(err) );
  INVX2 U116 ( .A(lc), .Y(n93) );
  NAND2X1 U117 ( .A(err), .B(n93), .Y(n71) );
  NAND3X1 U118 ( .A(n70), .B(n81), .C(n71), .Y(n68) );
  NOR2X1 U119 ( .A(n119), .B(n68), .Y(n69) );
  NAND3X1 U120 ( .A(n95), .B(n135), .C(n69), .Y(n125) );
  INVX2 U121 ( .A(n70), .Y(n73) );
  NAND3X1 U122 ( .A(n28), .B(n127), .C(n71), .Y(n72) );
  NOR2X1 U123 ( .A(n73), .B(n72), .Y(n82) );
  NAND2X1 U124 ( .A(n41), .B(n20), .Y(n76) );
  NAND2X1 U125 ( .A(n31), .B(n36), .Y(n111) );
  OAI21X1 U126 ( .A(n77), .B(n76), .C(n111), .Y(n78) );
  AOI21X1 U127 ( .A(overflow), .B(n79), .C(n78), .Y(n80) );
  NAND3X1 U128 ( .A(n82), .B(n81), .C(n80), .Y(n83) );
  INVX2 U129 ( .A(n83), .Y(n107) );
  AOI22X1 U130 ( .A(n85), .B(overflow), .C(n103), .D(n41), .Y(n86) );
  NAND3X1 U131 ( .A(n105), .B(n19), .C(n86), .Y(n89) );
  NAND3X1 U132 ( .A(n32), .B(n147), .C(n21), .Y(n88) );
  NOR2X1 U133 ( .A(n89), .B(n88), .Y(n90) );
  NAND2X1 U134 ( .A(n24), .B(n90), .Y(n123) );
  INVX2 U135 ( .A(n91), .Y(n94) );
  AOI21X1 U136 ( .A(n94), .B(n93), .C(n92), .Y(n102) );
  OAI21X1 U137 ( .A(n13), .B(n95), .C(n32), .Y(n99) );
  NAND3X1 U138 ( .A(n129), .B(n141), .C(n116), .Y(n97) );
  INVX2 U139 ( .A(n97), .Y(n137) );
  NAND3X1 U140 ( .A(n22), .B(n127), .C(n132), .Y(n98) );
  NOR2X1 U141 ( .A(n99), .B(n98), .Y(n100) );
  OAI21X1 U142 ( .A(n102), .B(n101), .C(n100), .Y(n122) );
  AOI22X1 U143 ( .A(n35), .B(n20), .C(n103), .D(n42), .Y(n104) );
  OAI21X1 U144 ( .A(n106), .B(n105), .C(n104), .Y(n110) );
  NAND3X1 U145 ( .A(n108), .B(n136), .C(n107), .Y(n109) );
  OR2X1 U146 ( .A(n109), .B(n110), .Y(n124) );
  NAND2X1 U147 ( .A(n16), .B(n132), .Y(n113) );
  NAND3X1 U148 ( .A(n111), .B(n146), .C(n140), .Y(n112) );
  NOR2X1 U149 ( .A(n114), .B(n133), .Y(n115) );
  NAND3X1 U150 ( .A(n145), .B(n16), .C(n115), .Y(dest[1]) );
  NAND3X1 U151 ( .A(n140), .B(n150), .C(n28), .Y(dest[2]) );
  NAND3X1 U152 ( .A(n145), .B(n147), .C(n146), .Y(dest[3]) );
  NAND3X1 U153 ( .A(n12), .B(n135), .C(n141), .Y(src2[0]) );
  NOR2X1 U154 ( .A(n117), .B(n142), .Y(n118) );
  NAND3X1 U155 ( .A(n144), .B(n127), .C(n118), .Y(src2[1]) );
  NAND2X1 U156 ( .A(n141), .B(n8), .Y(src2[2]) );
  INVX2 U157 ( .A(n119), .Y(n120) );
  NAND2X1 U158 ( .A(n121), .B(n120), .Y(src2[3]) );
  NAND2X1 U159 ( .A(n127), .B(n136), .Y(n131) );
  NAND3X1 U160 ( .A(n129), .B(n141), .C(n128), .Y(n130) );
  NAND3X1 U161 ( .A(n136), .B(n135), .C(n134), .Y(src1[1]) );
  NAND2X1 U162 ( .A(n138), .B(n137), .Y(src1[2]) );
  INVX2 U163 ( .A(dest[3]), .Y(n139) );
  NAND3X1 U164 ( .A(n140), .B(n139), .C(n150), .Y(op[1]) );
  NOR2X1 U165 ( .A(cnt_up), .B(n142), .Y(n143) );
  NAND3X1 U166 ( .A(n145), .B(n144), .C(n143), .Y(op[2]) );
  AND2X2 U167 ( .A(n147), .B(n146), .Y(n149) );
  NAND3X1 U168 ( .A(n150), .B(n149), .C(n148), .Y(clear) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(SUM[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N20, N21, N22, N23, N24, N25, n33, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53,
         \mult_add_41_aco/b , n1, n2, n4, n5, n6, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27;

  DFFSR \count_out_reg[9]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(n78), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U15 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n63) );
  OAI22X1 U31 ( .A(\mult_add_41_aco/b ), .B(n27), .C(n33), .D(n1), .Y(n77) );
  AOI22X1 U32 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n33) );
  NOR2X1 U33 ( .A(n39), .B(n40), .Y(n38) );
  NAND3X1 U34 ( .A(n41), .B(n42), .C(n43), .Y(n40) );
  XNOR2X1 U35 ( .A(rollover_val[3]), .B(N18), .Y(n43) );
  XNOR2X1 U36 ( .A(rollover_val[8]), .B(N23), .Y(n42) );
  XNOR2X1 U37 ( .A(rollover_val[5]), .B(N20), .Y(n41) );
  NAND2X1 U38 ( .A(n44), .B(n45), .Y(n39) );
  XNOR2X1 U39 ( .A(rollover_val[9]), .B(N24), .Y(n45) );
  NOR2X1 U40 ( .A(N25), .B(n46), .Y(n44) );
  XOR2X1 U41 ( .A(rollover_val[7]), .B(N22), .Y(n46) );
  NOR2X1 U42 ( .A(n47), .B(n48), .Y(n37) );
  NAND2X1 U43 ( .A(n49), .B(n50), .Y(n48) );
  XNOR2X1 U44 ( .A(rollover_val[1]), .B(N16), .Y(n50) );
  XNOR2X1 U45 ( .A(rollover_val[0]), .B(N15), .Y(n49) );
  NAND3X1 U46 ( .A(n51), .B(n52), .C(n53), .Y(n47) );
  XOR2X1 U47 ( .A(n26), .B(N17), .Y(n53) );
  XNOR2X1 U48 ( .A(rollover_val[4]), .B(N19), .Y(n52) );
  XNOR2X1 U49 ( .A(rollover_val[6]), .B(N21), .Y(n51) );
  NOR2X1 U50 ( .A(n54), .B(n55), .Y(n36) );
  NAND3X1 U51 ( .A(n56), .B(n26), .C(n57), .Y(n55) );
  NOR2X1 U52 ( .A(rollover_val[1]), .B(count_out[9]), .Y(n57) );
  NOR2X1 U53 ( .A(rollover_val[4]), .B(rollover_val[3]), .Y(n56) );
  NAND3X1 U54 ( .A(n58), .B(n25), .C(n59), .Y(n54) );
  NOR2X1 U55 ( .A(rollover_val[6]), .B(rollover_val[5]), .Y(n59) );
  NOR2X1 U56 ( .A(rollover_val[9]), .B(rollover_val[8]), .Y(n58) );
  NOR2X1 U57 ( .A(n60), .B(n61), .Y(n35) );
  NAND3X1 U58 ( .A(n62), .B(n23), .C(n63), .Y(n61) );
  NOR2X1 U59 ( .A(count_out[3]), .B(count_out[2]), .Y(n62) );
  NAND3X1 U60 ( .A(n64), .B(n18), .C(n65), .Y(n60) );
  NOR2X1 U61 ( .A(count_out[5]), .B(count_out[4]), .Y(n65) );
  NOR2X1 U62 ( .A(count_out[8]), .B(count_out[7]), .Y(n64) );
  OAI21X1 U63 ( .A(n24), .B(n27), .C(n66), .Y(n78) );
  NAND2X1 U64 ( .A(N5), .B(n2), .Y(n66) );
  OAI21X1 U65 ( .A(n27), .B(n23), .C(n67), .Y(n79) );
  NAND2X1 U66 ( .A(N6), .B(n2), .Y(n67) );
  OAI21X1 U67 ( .A(n27), .B(n22), .C(n68), .Y(n80) );
  NAND2X1 U68 ( .A(N7), .B(n2), .Y(n68) );
  OAI21X1 U69 ( .A(n27), .B(n21), .C(n69), .Y(n81) );
  NAND2X1 U70 ( .A(N8), .B(n2), .Y(n69) );
  OAI21X1 U71 ( .A(n27), .B(n20), .C(n70), .Y(n82) );
  NAND2X1 U72 ( .A(N9), .B(n2), .Y(n70) );
  OAI21X1 U73 ( .A(n27), .B(n19), .C(n71), .Y(n83) );
  NAND2X1 U74 ( .A(N10), .B(n2), .Y(n71) );
  OAI21X1 U75 ( .A(n27), .B(n18), .C(n72), .Y(n84) );
  NAND2X1 U76 ( .A(N11), .B(n2), .Y(n72) );
  OAI21X1 U77 ( .A(n27), .B(n6), .C(n73), .Y(n85) );
  NAND2X1 U78 ( .A(N12), .B(n2), .Y(n73) );
  OAI21X1 U79 ( .A(n27), .B(n5), .C(n74), .Y(n86) );
  NAND2X1 U80 ( .A(N13), .B(n2), .Y(n74) );
  OAI21X1 U81 ( .A(n27), .B(n4), .C(n75), .Y(n87) );
  NAND2X1 U82 ( .A(N14), .B(n2), .Y(n75) );
  NOR2X1 U84 ( .A(clear), .B(count_enable), .Y(n76) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_44 ( .A({1'b0, count_out}), .SUM(
        {N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15}) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_1 add_41_aco ( .A({N62, N61, N60, N59, 
        N58, N57, N56, N55, N54, N53}), .SUM({N14, N13, N12, N11, N10, N9, N8, 
        N7, N6, N5}) );
  OR2X2 U16 ( .A(n76), .B(clear), .Y(n1) );
  INVX2 U17 ( .A(n76), .Y(n27) );
  INVX2 U18 ( .A(n1), .Y(n2) );
  INVX2 U19 ( .A(rollover_flag), .Y(\mult_add_41_aco/b ) );
  AND2X1 U20 ( .A(count_out[0]), .B(\mult_add_41_aco/b ), .Y(N53) );
  AND2X1 U21 ( .A(count_out[1]), .B(\mult_add_41_aco/b ), .Y(N54) );
  AND2X1 U22 ( .A(count_out[2]), .B(\mult_add_41_aco/b ), .Y(N55) );
  AND2X1 U23 ( .A(count_out[3]), .B(\mult_add_41_aco/b ), .Y(N56) );
  AND2X1 U24 ( .A(count_out[4]), .B(\mult_add_41_aco/b ), .Y(N57) );
  AND2X1 U25 ( .A(count_out[5]), .B(\mult_add_41_aco/b ), .Y(N58) );
  AND2X1 U26 ( .A(count_out[6]), .B(\mult_add_41_aco/b ), .Y(N59) );
  AND2X1 U27 ( .A(count_out[7]), .B(\mult_add_41_aco/b ), .Y(N60) );
  AND2X1 U28 ( .A(count_out[8]), .B(\mult_add_41_aco/b ), .Y(N61) );
  AND2X1 U29 ( .A(\mult_add_41_aco/b ), .B(count_out[9]), .Y(N62) );
  INVX2 U30 ( .A(count_out[9]), .Y(n4) );
  INVX2 U83 ( .A(count_out[8]), .Y(n5) );
  INVX2 U85 ( .A(count_out[7]), .Y(n6) );
  INVX2 U86 ( .A(count_out[6]), .Y(n18) );
  INVX2 U87 ( .A(count_out[5]), .Y(n19) );
  INVX2 U88 ( .A(count_out[4]), .Y(n20) );
  INVX2 U89 ( .A(count_out[3]), .Y(n21) );
  INVX2 U90 ( .A(count_out[2]), .Y(n22) );
  INVX2 U91 ( .A(count_out[1]), .Y(n23) );
  INVX2 U92 ( .A(count_out[0]), .Y(n24) );
  INVX2 U93 ( .A(rollover_val[7]), .Y(n25) );
  INVX2 U94 ( .A(rollover_val[2]), .Y(n26) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 CORE ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n33, n34;

  OAI21X1 U18 ( .A(n1), .B(n9), .C(n17), .Y(out[9]) );
  NAND2X1 U19 ( .A(in[16]), .B(N27), .Y(n17) );
  OAI21X1 U20 ( .A(n1), .B(n10), .C(n18), .Y(out[8]) );
  NAND2X1 U21 ( .A(N26), .B(in[16]), .Y(n18) );
  OAI21X1 U22 ( .A(n1), .B(n11), .C(n19), .Y(out[7]) );
  NAND2X1 U23 ( .A(N25), .B(in[16]), .Y(n19) );
  OAI21X1 U24 ( .A(n1), .B(n12), .C(n20), .Y(out[6]) );
  NAND2X1 U25 ( .A(N24), .B(in[16]), .Y(n20) );
  OAI21X1 U26 ( .A(n1), .B(n13), .C(n21), .Y(out[5]) );
  NAND2X1 U27 ( .A(N23), .B(in[16]), .Y(n21) );
  OAI21X1 U28 ( .A(n1), .B(n14), .C(n22), .Y(out[4]) );
  NAND2X1 U29 ( .A(N22), .B(in[16]), .Y(n22) );
  OAI21X1 U30 ( .A(n1), .B(n15), .C(n23), .Y(out[3]) );
  NAND2X1 U31 ( .A(N21), .B(in[16]), .Y(n23) );
  OAI21X1 U32 ( .A(n1), .B(n16), .C(n24), .Y(out[2]) );
  NAND2X1 U33 ( .A(N20), .B(n1), .Y(n24) );
  OAI21X1 U34 ( .A(n1), .B(n33), .C(n25), .Y(out[1]) );
  NAND2X1 U35 ( .A(N19), .B(n1), .Y(n25) );
  OAI21X1 U36 ( .A(n1), .B(n3), .C(n26), .Y(out[15]) );
  NAND2X1 U37 ( .A(N33), .B(in[16]), .Y(n26) );
  OAI21X1 U38 ( .A(n1), .B(n4), .C(n27), .Y(out[14]) );
  NAND2X1 U39 ( .A(N32), .B(n1), .Y(n27) );
  OAI21X1 U40 ( .A(n1), .B(n5), .C(n28), .Y(out[13]) );
  NAND2X1 U41 ( .A(N31), .B(in[16]), .Y(n28) );
  OAI21X1 U42 ( .A(n1), .B(n6), .C(n29), .Y(out[12]) );
  NAND2X1 U43 ( .A(N30), .B(in[16]), .Y(n29) );
  OAI21X1 U44 ( .A(in[16]), .B(n7), .C(n30), .Y(out[11]) );
  NAND2X1 U45 ( .A(N29), .B(in[16]), .Y(n30) );
  OAI21X1 U46 ( .A(in[16]), .B(n8), .C(n31), .Y(out[10]) );
  NAND2X1 U47 ( .A(N28), .B(in[16]), .Y(n31) );
  OAI21X1 U48 ( .A(in[16]), .B(n34), .C(n32), .Y(out[0]) );
  NAND2X1 U49 ( .A(N18), .B(in[16]), .Y(n32) );
  magnitude_DW01_inc_0 add_18 ( .A({n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, 
        n13, n14, n15, n16, n33, n34}), .SUM({N33, N32, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18}) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(in[16]), .Y(n2) );
  INVX2 U4 ( .A(in[15]), .Y(n3) );
  INVX2 U5 ( .A(in[14]), .Y(n4) );
  INVX2 U6 ( .A(in[13]), .Y(n5) );
  INVX2 U7 ( .A(in[12]), .Y(n6) );
  INVX2 U8 ( .A(in[11]), .Y(n7) );
  INVX2 U9 ( .A(in[10]), .Y(n8) );
  INVX2 U10 ( .A(in[9]), .Y(n9) );
  INVX2 U11 ( .A(in[8]), .Y(n10) );
  INVX2 U12 ( .A(in[7]), .Y(n11) );
  INVX2 U13 ( .A(in[6]), .Y(n12) );
  INVX2 U14 ( .A(in[5]), .Y(n13) );
  INVX2 U15 ( .A(in[4]), .Y(n14) );
  INVX2 U16 ( .A(in[3]), .Y(n15) );
  INVX2 U17 ( .A(in[2]), .Y(n16) );
  INVX2 U50 ( .A(in[1]), .Y(n33) );
  INVX2 U51 ( .A(in[0]), .Y(n34) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n1), .B(n2), .C(n3), .Y(w_en) );
  NOR2X1 U7 ( .A(n3), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n2), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n2), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n1), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n3), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n2), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[1]), .Y(n1) );
  INVX2 U4 ( .A(op[2]), .Y(n2) );
  INVX2 U5 ( .A(op[0]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175;

  FAX1 U2 ( .A(n103), .B(B[16]), .C(n16), .YC(n15), .YS(DIFF[16]) );
  FAX1 U3 ( .A(A[15]), .B(n87), .C(n17), .YC(n16), .YS(DIFF[15]) );
  XOR2X1 U4 ( .A(n163), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n166), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n174), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n174), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n28), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n167), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n173), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n173), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n165), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n171), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n171), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n170), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n170), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n168), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n172), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n172), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n60), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n169), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n175), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(A[0]), .B(n175), .Y(n72) );
  INVX2 U123 ( .A(B[3]), .Y(n99) );
  INVX1 U124 ( .A(B[14]), .Y(n88) );
  INVX1 U125 ( .A(B[13]), .Y(n89) );
  INVX1 U126 ( .A(B[6]), .Y(n96) );
  INVX1 U127 ( .A(B[5]), .Y(n97) );
  INVX2 U128 ( .A(B[0]), .Y(n175) );
  INVX1 U129 ( .A(B[4]), .Y(n98) );
  INVX1 U130 ( .A(n20), .Y(n162) );
  INVX2 U131 ( .A(n162), .Y(n163) );
  INVX1 U132 ( .A(n36), .Y(n164) );
  INVX2 U133 ( .A(n164), .Y(n165) );
  BUFX2 U134 ( .A(n25), .Y(n166) );
  INVX1 U135 ( .A(B[7]), .Y(n95) );
  BUFX2 U136 ( .A(n33), .Y(n167) );
  BUFX2 U137 ( .A(n57), .Y(n168) );
  INVX1 U138 ( .A(B[15]), .Y(n87) );
  NOR2X1 U139 ( .A(A[0]), .B(n175), .Y(n169) );
  OR2X2 U140 ( .A(A[5]), .B(n97), .Y(n172) );
  OR2X2 U141 ( .A(A[7]), .B(n95), .Y(n170) );
  OR2X2 U142 ( .A(A[9]), .B(n93), .Y(n171) );
  OR2X2 U143 ( .A(A[11]), .B(n91), .Y(n173) );
  OR2X2 U144 ( .A(A[13]), .B(n89), .Y(n174) );
  INVX2 U145 ( .A(B[8]), .Y(n94) );
  INVX2 U146 ( .A(B[9]), .Y(n93) );
  INVX2 U147 ( .A(B[10]), .Y(n92) );
  INVX2 U148 ( .A(B[11]), .Y(n91) );
  INVX2 U149 ( .A(B[12]), .Y(n90) );
  INVX2 U150 ( .A(n70), .Y(n86) );
  INVX2 U151 ( .A(n66), .Y(n85) );
  INVX2 U152 ( .A(n63), .Y(n84) );
  INVX2 U153 ( .A(n58), .Y(n83) );
  INVX2 U154 ( .A(n50), .Y(n81) );
  INVX2 U155 ( .A(n42), .Y(n79) );
  INVX2 U156 ( .A(n34), .Y(n77) );
  INVX2 U157 ( .A(n26), .Y(n75) );
  INVX2 U158 ( .A(n18), .Y(n73) );
  INVX2 U159 ( .A(n69), .Y(n68) );
  INVX2 U160 ( .A(n56), .Y(n54) );
  INVX2 U161 ( .A(n48), .Y(n46) );
  INVX2 U162 ( .A(n40), .Y(n38) );
  INVX2 U163 ( .A(n32), .Y(n30) );
  INVX2 U164 ( .A(n24), .Y(n22) );
  INVX2 U165 ( .A(A[17]), .Y(n103) );
  INVX2 U166 ( .A(B[1]), .Y(n101) );
  INVX2 U167 ( .A(B[2]), .Y(n100) );
  INVX2 U168 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n19, n20, n21, n23, n25, n26, n27, n28, n29, n31, n33, n34, n35,
         n36, n37, n39, n41, n42, n43, n44, n45, n47, n49, n50, n51, n52, n53,
         n55, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n74, n75, n77, n79, n81, n83, n85, n86, n87, n88, n90,
         n91, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163;

  FAX1 U2 ( .A(n90), .B(n91), .C(n17), .YC(n16), .YS(SUM[16]) );
  FAX1 U3 ( .A(A[15]), .B(B[15]), .C(n18), .YC(n17), .YS(SUM[15]) );
  XOR2X1 U4 ( .A(n21), .B(n1), .Y(SUM[14]) );
  OAI21X1 U5 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U6 ( .A(n20), .B(n75), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(B[14]), .Y(n19) );
  NAND2X1 U9 ( .A(A[14]), .B(B[14]), .Y(n20) );
  XNOR2X1 U10 ( .A(n26), .B(n2), .Y(SUM[13]) );
  AOI21X1 U11 ( .A(n162), .B(n26), .C(n23), .Y(n21) );
  NAND2X1 U14 ( .A(n25), .B(n162), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XOR2X1 U18 ( .A(n157), .B(n3), .Y(SUM[12]) );
  OAI21X1 U19 ( .A(n29), .B(n27), .C(n28), .Y(n26) );
  NAND2X1 U20 ( .A(n28), .B(n77), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(B[12]), .Y(n27) );
  NAND2X1 U23 ( .A(A[12]), .B(B[12]), .Y(n28) );
  XNOR2X1 U24 ( .A(n156), .B(n4), .Y(SUM[11]) );
  AOI21X1 U25 ( .A(n163), .B(n34), .C(n31), .Y(n29) );
  NAND2X1 U28 ( .A(n33), .B(n163), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XOR2X1 U32 ( .A(n37), .B(n5), .Y(SUM[10]) );
  OAI21X1 U33 ( .A(n37), .B(n35), .C(n36), .Y(n34) );
  NAND2X1 U34 ( .A(n36), .B(n79), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(B[10]), .Y(n35) );
  NAND2X1 U37 ( .A(A[10]), .B(B[10]), .Y(n36) );
  XNOR2X1 U38 ( .A(n42), .B(n6), .Y(SUM[9]) );
  AOI21X1 U39 ( .A(n161), .B(n42), .C(n39), .Y(n37) );
  NAND2X1 U42 ( .A(n41), .B(n161), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n41) );
  XOR2X1 U46 ( .A(n45), .B(n7), .Y(SUM[8]) );
  OAI21X1 U47 ( .A(n45), .B(n43), .C(n44), .Y(n42) );
  NAND2X1 U48 ( .A(n44), .B(n81), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(B[8]), .Y(n43) );
  NAND2X1 U51 ( .A(A[8]), .B(B[8]), .Y(n44) );
  XNOR2X1 U52 ( .A(n50), .B(n8), .Y(SUM[7]) );
  AOI21X1 U53 ( .A(n160), .B(n50), .C(n47), .Y(n45) );
  NAND2X1 U56 ( .A(n49), .B(n160), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n49) );
  XOR2X1 U60 ( .A(n152), .B(n9), .Y(SUM[6]) );
  OAI21X1 U61 ( .A(n53), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U62 ( .A(n52), .B(n83), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(B[6]), .Y(n51) );
  NAND2X1 U65 ( .A(A[6]), .B(B[6]), .Y(n52) );
  XNOR2X1 U66 ( .A(n154), .B(n10), .Y(SUM[5]) );
  AOI21X1 U67 ( .A(n159), .B(n58), .C(n55), .Y(n53) );
  NAND2X1 U70 ( .A(n57), .B(n159), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XOR2X1 U74 ( .A(n158), .B(n11), .Y(SUM[4]) );
  OAI21X1 U75 ( .A(n61), .B(n59), .C(n60), .Y(n58) );
  NAND2X1 U76 ( .A(n60), .B(n85), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(B[4]), .Y(n59) );
  NAND2X1 U79 ( .A(A[4]), .B(B[4]), .Y(n60) );
  XNOR2X1 U80 ( .A(n66), .B(n12), .Y(SUM[3]) );
  AOI21X1 U81 ( .A(n70), .B(n62), .C(n63), .Y(n61) );
  NOR2X1 U82 ( .A(n64), .B(n67), .Y(n62) );
  OAI21X1 U83 ( .A(n64), .B(n68), .C(n65), .Y(n63) );
  NAND2X1 U84 ( .A(n65), .B(n86), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XOR2X1 U88 ( .A(n69), .B(n13), .Y(SUM[2]) );
  OAI21X1 U89 ( .A(n69), .B(n67), .C(n68), .Y(n66) );
  NAND2X1 U90 ( .A(n68), .B(n87), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(B[2]), .Y(n67) );
  NAND2X1 U93 ( .A(A[2]), .B(B[2]), .Y(n68) );
  XOR2X1 U94 ( .A(n14), .B(n74), .Y(SUM[1]) );
  OAI21X1 U96 ( .A(n71), .B(n74), .C(n72), .Y(n70) );
  NAND2X1 U97 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(B[1]), .Y(n71) );
  NAND2X1 U100 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U105 ( .A(A[0]), .B(B[0]), .Y(n74) );
  OR2X2 U111 ( .A(A[5]), .B(B[5]), .Y(n159) );
  OR2X2 U112 ( .A(A[0]), .B(B[0]), .Y(n150) );
  INVX1 U113 ( .A(n67), .Y(n87) );
  INVX1 U114 ( .A(n71), .Y(n88) );
  INVX1 U115 ( .A(n53), .Y(n151) );
  INVX2 U116 ( .A(n151), .Y(n152) );
  INVX1 U117 ( .A(n58), .Y(n153) );
  INVX2 U118 ( .A(n153), .Y(n154) );
  INVX1 U119 ( .A(n34), .Y(n155) );
  INVX2 U120 ( .A(n155), .Y(n156) );
  BUFX2 U121 ( .A(n29), .Y(n157) );
  BUFX2 U122 ( .A(n61), .Y(n158) );
  OR2X2 U123 ( .A(A[7]), .B(B[7]), .Y(n160) );
  OR2X2 U124 ( .A(A[9]), .B(B[9]), .Y(n161) );
  OR2X2 U125 ( .A(A[11]), .B(B[11]), .Y(n163) );
  OR2X2 U126 ( .A(A[13]), .B(B[13]), .Y(n162) );
  AND2X1 U127 ( .A(n74), .B(n150), .Y(SUM[0]) );
  INVX2 U128 ( .A(A[17]), .Y(n91) );
  INVX2 U129 ( .A(B[17]), .Y(n90) );
  INVX2 U130 ( .A(n64), .Y(n86) );
  INVX2 U131 ( .A(n59), .Y(n85) );
  INVX2 U132 ( .A(n51), .Y(n83) );
  INVX2 U133 ( .A(n43), .Y(n81) );
  INVX2 U134 ( .A(n35), .Y(n79) );
  INVX2 U135 ( .A(n27), .Y(n77) );
  INVX2 U136 ( .A(n19), .Y(n75) );
  INVX2 U137 ( .A(n70), .Y(n69) );
  INVX2 U138 ( .A(n57), .Y(n55) );
  INVX2 U139 ( .A(n49), .Y(n47) );
  INVX2 U140 ( .A(n41), .Y(n39) );
  INVX2 U141 ( .A(n33), .Y(n31) );
  INVX2 U142 ( .A(n25), .Y(n23) );
  INVX2 U143 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n12, n13, n18, n19, n22, n24, n25, n28, n31, n36, n37,
         n42, n49, n51, n52, n53, n55, n56, n58, n59, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n109,
         n111, n112, n113, n114, n115, n116, n120, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n133, n134, n135, n136, n137, n140,
         n142, n144, n145, n146, n147, n148, n149, n151, n154, n155, n156,
         n159, n160, n161, n162, n163, n164, n165, n166, n169, n170, n171,
         n172, n173, n174, n177, n178, n179, n181, n182, n183, n185, n186,
         n187, n188, n190, n191, n192, n193, n194, n197, n198, n199, n200,
         n201, n202, n205, n206, n207, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n248,
         n249, n250, n251, n256, n257, n258, n259, n264, n265, n266, n267,
         n275, n279, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n545, n546,
         n548, n551, n554, n557, n560, n561, n563, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n728, n736, n738, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n893, n895, n897, n898, n900, n917, n918, n995,
         n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005,
         n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015,
         n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045,
         n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055,
         n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065,
         n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075,
         n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085,
         n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095,
         n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105,
         n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115,
         n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135,
         n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145,
         n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155,
         n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165,
         n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175,
         n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185,
         n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
         n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
         n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
         n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225,
         n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235,
         n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245,
         n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255,
         n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265,
         n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275,
         n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285,
         n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295,
         n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  XOR2X1 U59 ( .A(n86), .B(n55), .Y(product[45]) );
  AOI21X1 U60 ( .A(n1254), .B(n74), .C(n75), .Y(n73) );
  OAI21X1 U62 ( .A(n52), .B(n1186), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1069), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1214), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n52), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1069), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1214), .Y(n96) );
  OAI21X1 U90 ( .A(n1215), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1190), .B(n1045), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1190), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1069), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1214), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1215), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1045), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1045), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1045), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1068), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1214), .Y(n124) );
  OAI21X1 U124 ( .A(n1098), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1068), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n137), .B(n1214), .Y(n135) );
  OAI21X1 U138 ( .A(n52), .B(n137), .C(n140), .Y(n136) );
  AOI21X1 U142 ( .A(n151), .B(n1187), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1069), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1214), .Y(n146) );
  OAI21X1 U152 ( .A(n1098), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n281), .Y(n61) );
  NOR2X1 U159 ( .A(n339), .B(n330), .Y(n148) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n155), .B(n1069), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1068), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n166), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n166), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1069), .B(n171), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1068), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n1068), .B(n285), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n187), .B(n200), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n1161), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1049), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1089), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n1123), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n1125), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1193), .B(n1188), .Y(n223) );
  AOI21X1 U258 ( .A(n1192), .B(n1188), .C(n1189), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1191), .B(n248), .C(n1194), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1197), .C(n1199), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1195), .C(n1200), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1201), .B(n1196), .C(n1198), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n586), .C(n602), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n587), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n588), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n604), .C(n620), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n621), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n605), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U330 ( .A(n606), .B(n590), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n622), .C(n638), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n353), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n639), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n591), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n623), .YC(n347), .YS(n348) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U340 ( .A(n371), .B(n997), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n592), .B(n608), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n1163), .B(n624), .C(n656), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U345 ( .A(n995), .B(n379), .C(n377), .YC(n363), .YS(n364) );
  FAX1 U347 ( .A(n625), .B(n657), .C(n372), .YC(n367), .YS(n368) );
  FAX1 U348 ( .A(n609), .B(n593), .C(n673), .YC(n369), .YS(n370) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n395), .B(n384), .C(n382), .YC(n377), .YS(n378) );
  FAX1 U354 ( .A(n658), .B(n594), .C(n626), .YC(n381), .YS(n382) );
  FAX1 U360 ( .A(n413), .B(n411), .C(n409), .YC(n393), .YS(n394) );
  FAX1 U361 ( .A(n659), .B(n675), .C(n709), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n627), .B(n691), .C(n611), .YC(n397), .YS(n398) );
  FAX1 U364 ( .A(n417), .B(n406), .C(n404), .YC(n401), .YS(n402) );
  FAX1 U366 ( .A(n423), .B(n410), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U367 ( .A(n427), .B(n414), .C(n425), .YC(n407), .YS(n408) );
  FAX1 U368 ( .A(n676), .B(n612), .C(n660), .YC(n409), .YS(n410) );
  FAX1 U371 ( .A(n420), .B(n431), .C(n418), .YC(n415), .YS(n416) );
  FAX1 U374 ( .A(n428), .B(n441), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U375 ( .A(n661), .B(n613), .C(n677), .YC(n423), .YS(n424) );
  FAX1 U376 ( .A(n629), .B(n597), .C(n693), .YC(n425), .YS(n426) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U379 ( .A(n449), .B(n436), .C(n447), .YC(n431), .YS(n432) );
  FAX1 U382 ( .A(n678), .B(n662), .C(n646), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n694), .B(n614), .C(n630), .YC(n439), .YS(n440) );
  FAX1 U384 ( .A(n710), .B(n582), .C(n598), .YC(n441), .YS(n442) );
  FAX1 U390 ( .A(n631), .B(n695), .C(n599), .YC(n453), .YS(n454) );
  HAX1 U391 ( .A(n663), .B(n711), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n466), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U395 ( .A(n680), .B(n664), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n696), .B(n632), .C(n648), .YC(n465), .YS(n466) );
  FAX1 U398 ( .A(n474), .B(n483), .C(n472), .YC(n469), .YS(n470) );
  FAX1 U399 ( .A(n476), .B(n478), .C(n485), .YC(n471), .YS(n472) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n488), .B(n490), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n698), .B(n650), .C(n666), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n714), .B(n634), .C(n618), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n683), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U414 ( .A(n508), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n506), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n700), .B(n668), .C(n684), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n716), .B(n652), .C(n636), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n702), .B(n686), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n718), .B(n670), .C(n654), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n720), .B(n688), .C(n672), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n722), .B(n706), .C(n690), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n726), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1281), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n728), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1277), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n1275), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n1273), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1271), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1269), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1267), .Y(n577) );
  NOR2X1 U443 ( .A(n918), .B(n1265), .Y(n359) );
  NOR2X1 U444 ( .A(n918), .B(n736), .Y(n578) );
  NOR2X1 U445 ( .A(n918), .B(n1261), .Y(n385) );
  NOR2X1 U446 ( .A(n918), .B(n738), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n1257), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1255), .Y(n581) );
  OAI22X1 U466 ( .A(n918), .B(n1252), .C(n1119), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1119), .C(n1252), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n742), .B(n1252), .C(n1041), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1041), .B(n742), .C(n743), .D(n1252), .Y(n586) );
  OAI22X1 U472 ( .A(n1041), .B(n743), .C(n744), .D(n1252), .Y(n587) );
  OAI22X1 U473 ( .A(n1119), .B(n744), .C(n745), .D(n1252), .Y(n588) );
  OAI22X1 U474 ( .A(n1119), .B(n745), .C(n746), .D(n1252), .Y(n589) );
  OAI22X1 U475 ( .A(n1119), .B(n746), .C(n747), .D(n1252), .Y(n590) );
  OAI22X1 U476 ( .A(n1041), .B(n747), .C(n748), .D(n1252), .Y(n591) );
  OAI22X1 U477 ( .A(n1119), .B(n748), .C(n749), .D(n1252), .Y(n592) );
  OAI22X1 U478 ( .A(n1040), .B(n749), .C(n750), .D(n1252), .Y(n593) );
  OAI22X1 U479 ( .A(n1040), .B(n750), .C(n751), .D(n1252), .Y(n594) );
  OAI22X1 U480 ( .A(n1119), .B(n751), .C(n752), .D(n1251), .Y(n595) );
  OAI22X1 U481 ( .A(n1041), .B(n752), .C(n753), .D(n1252), .Y(n596) );
  OAI22X1 U482 ( .A(n1119), .B(n753), .C(n754), .D(n1252), .Y(n597) );
  OAI22X1 U483 ( .A(n1119), .B(n754), .C(n755), .D(n1252), .Y(n598) );
  OAI22X1 U484 ( .A(n1040), .B(n755), .C(n1251), .D(n756), .Y(n599) );
  XNOR2X1 U487 ( .A(n877), .B(n1285), .Y(n741) );
  XNOR2X1 U488 ( .A(n1282), .B(n1285), .Y(n742) );
  XNOR2X1 U489 ( .A(n1280), .B(n1285), .Y(n743) );
  XNOR2X1 U490 ( .A(n1278), .B(n1285), .Y(n744) );
  XNOR2X1 U491 ( .A(n1276), .B(n1285), .Y(n745) );
  XNOR2X1 U492 ( .A(n1274), .B(n1285), .Y(n746) );
  XNOR2X1 U493 ( .A(n1272), .B(n1285), .Y(n747) );
  XNOR2X1 U494 ( .A(n1270), .B(n1284), .Y(n748) );
  XNOR2X1 U495 ( .A(n1268), .B(n1284), .Y(n749) );
  XNOR2X1 U496 ( .A(n1266), .B(n1284), .Y(n750) );
  XNOR2X1 U497 ( .A(n1264), .B(n1284), .Y(n751) );
  XNOR2X1 U498 ( .A(n1262), .B(n1284), .Y(n752) );
  XNOR2X1 U499 ( .A(n1260), .B(n1284), .Y(n753) );
  XNOR2X1 U500 ( .A(n1258), .B(n1284), .Y(n754) );
  XNOR2X1 U501 ( .A(n891), .B(n1284), .Y(n755) );
  XNOR2X1 U502 ( .A(n1286), .B(n1284), .Y(n756) );
  OR2X1 U503 ( .A(n1286), .B(n918), .Y(n757) );
  OAI22X1 U505 ( .A(n1304), .B(n1179), .C(n1247), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1304), .B(n1247), .C(n1180), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n759), .B(n1249), .C(n1246), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1246), .B(n759), .C(n760), .D(n1179), .Y(n604) );
  OAI22X1 U511 ( .A(n1247), .B(n760), .C(n761), .D(n1249), .Y(n605) );
  OAI22X1 U512 ( .A(n1246), .B(n761), .C(n762), .D(n1249), .Y(n606) );
  OAI22X1 U513 ( .A(n1247), .B(n762), .C(n763), .D(n1179), .Y(n607) );
  OAI22X1 U514 ( .A(n1246), .B(n763), .C(n764), .D(n1249), .Y(n608) );
  OAI22X1 U515 ( .A(n1247), .B(n764), .C(n765), .D(n1180), .Y(n609) );
  OAI22X1 U516 ( .A(n1246), .B(n765), .C(n766), .D(n1249), .Y(n610) );
  OAI22X1 U517 ( .A(n1247), .B(n766), .C(n767), .D(n1180), .Y(n611) );
  OAI22X1 U518 ( .A(n1246), .B(n767), .C(n768), .D(n1180), .Y(n612) );
  OAI22X1 U519 ( .A(n1247), .B(n768), .C(n769), .D(n1180), .Y(n613) );
  OAI22X1 U520 ( .A(n1246), .B(n769), .C(n770), .D(n1249), .Y(n614) );
  OAI22X1 U521 ( .A(n1247), .B(n770), .C(n771), .D(n1180), .Y(n615) );
  OAI22X1 U523 ( .A(n1247), .B(n772), .C(n1249), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1287), .B(n546), .Y(n618) );
  XNOR2X1 U527 ( .A(n1282), .B(n37), .Y(n759) );
  XNOR2X1 U528 ( .A(n1280), .B(n37), .Y(n760) );
  XNOR2X1 U529 ( .A(n1278), .B(n1183), .Y(n761) );
  XNOR2X1 U530 ( .A(n1276), .B(n1184), .Y(n762) );
  XNOR2X1 U531 ( .A(n1274), .B(n1183), .Y(n763) );
  XNOR2X1 U532 ( .A(n1272), .B(n1183), .Y(n764) );
  XNOR2X1 U533 ( .A(n1270), .B(n1183), .Y(n765) );
  XNOR2X1 U534 ( .A(n1268), .B(n1184), .Y(n766) );
  XNOR2X1 U535 ( .A(n1266), .B(n1184), .Y(n767) );
  XNOR2X1 U536 ( .A(n1264), .B(n1183), .Y(n768) );
  XNOR2X1 U537 ( .A(n1262), .B(n1184), .Y(n769) );
  XNOR2X1 U538 ( .A(n1260), .B(n1183), .Y(n770) );
  XNOR2X1 U539 ( .A(n1258), .B(n1183), .Y(n771) );
  XNOR2X1 U540 ( .A(n891), .B(n1183), .Y(n772) );
  XNOR2X1 U541 ( .A(n1286), .B(n1184), .Y(n773) );
  OR2X1 U542 ( .A(n1286), .B(n1304), .Y(n774) );
  OAI22X1 U544 ( .A(n1176), .B(n1070), .C(n1218), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1176), .B(n1218), .C(n1146), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n776), .B(n1070), .C(n1243), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1243), .B(n776), .C(n777), .D(n1245), .Y(n622) );
  OAI22X1 U550 ( .A(n1218), .B(n777), .C(n778), .D(n1245), .Y(n623) );
  OAI22X1 U552 ( .A(n1218), .B(n779), .C(n780), .D(n1070), .Y(n625) );
  OAI22X1 U553 ( .A(n1243), .B(n780), .C(n781), .D(n1245), .Y(n626) );
  OAI22X1 U554 ( .A(n1218), .B(n781), .C(n782), .D(n1245), .Y(n627) );
  OAI22X1 U555 ( .A(n1243), .B(n782), .C(n783), .D(n1245), .Y(n628) );
  OAI22X1 U556 ( .A(n1218), .B(n783), .C(n784), .D(n1245), .Y(n629) );
  OAI22X1 U557 ( .A(n1243), .B(n784), .C(n785), .D(n1070), .Y(n630) );
  OAI22X1 U558 ( .A(n1218), .B(n785), .C(n786), .D(n1245), .Y(n631) );
  OAI22X1 U559 ( .A(n1243), .B(n786), .C(n787), .D(n1245), .Y(n632) );
  OAI22X1 U560 ( .A(n1218), .B(n787), .C(n788), .D(n1070), .Y(n633) );
  OAI22X1 U561 ( .A(n1243), .B(n788), .C(n789), .D(n1245), .Y(n634) );
  OAI22X1 U562 ( .A(n1218), .B(n789), .C(n1245), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1287), .B(n1202), .Y(n636) );
  XNOR2X1 U565 ( .A(n877), .B(n1217), .Y(n775) );
  XNOR2X1 U566 ( .A(n1282), .B(n1217), .Y(n776) );
  XNOR2X1 U567 ( .A(n1280), .B(n1217), .Y(n777) );
  XNOR2X1 U570 ( .A(n1274), .B(n1181), .Y(n780) );
  XNOR2X1 U571 ( .A(n1272), .B(n1302), .Y(n781) );
  XNOR2X1 U572 ( .A(n1270), .B(n1302), .Y(n782) );
  XNOR2X1 U573 ( .A(n1268), .B(n1181), .Y(n783) );
  XNOR2X1 U574 ( .A(n1266), .B(n1181), .Y(n784) );
  XNOR2X1 U575 ( .A(n1264), .B(n1302), .Y(n785) );
  XNOR2X1 U576 ( .A(n1262), .B(n1302), .Y(n786) );
  XNOR2X1 U577 ( .A(n1260), .B(n1181), .Y(n787) );
  XNOR2X1 U578 ( .A(n1258), .B(n1181), .Y(n788) );
  XNOR2X1 U579 ( .A(n891), .B(n1181), .Y(n789) );
  XNOR2X1 U580 ( .A(n1286), .B(n1181), .Y(n790) );
  OR2X1 U581 ( .A(n1286), .B(n1077), .Y(n791) );
  OAI22X1 U583 ( .A(n1221), .B(n1208), .C(n1240), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1221), .B(n1240), .C(n1208), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n793), .B(n1208), .C(n1240), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1240), .B(n793), .C(n794), .D(n1208), .Y(n640) );
  OAI22X1 U589 ( .A(n1240), .B(n794), .C(n795), .D(n1242), .Y(n641) );
  OAI22X1 U590 ( .A(n1240), .B(n795), .C(n796), .D(n1242), .Y(n642) );
  OAI22X1 U591 ( .A(n1240), .B(n796), .C(n797), .D(n1241), .Y(n643) );
  OAI22X1 U592 ( .A(n1240), .B(n797), .C(n798), .D(n1242), .Y(n644) );
  OAI22X1 U593 ( .A(n1240), .B(n798), .C(n799), .D(n1242), .Y(n645) );
  OAI22X1 U594 ( .A(n1240), .B(n799), .C(n800), .D(n1242), .Y(n646) );
  OAI22X1 U595 ( .A(n1240), .B(n800), .C(n801), .D(n1208), .Y(n647) );
  OAI22X1 U596 ( .A(n1240), .B(n801), .C(n802), .D(n1208), .Y(n648) );
  OAI22X1 U597 ( .A(n1240), .B(n802), .C(n803), .D(n1208), .Y(n649) );
  OAI22X1 U598 ( .A(n1240), .B(n803), .C(n804), .D(n1208), .Y(n650) );
  OAI22X1 U599 ( .A(n1240), .B(n804), .C(n805), .D(n1208), .Y(n651) );
  OAI22X1 U600 ( .A(n1240), .B(n805), .C(n806), .D(n1208), .Y(n652) );
  OAI22X1 U601 ( .A(n1240), .B(n806), .C(n1208), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1287), .B(n1239), .Y(n654) );
  XNOR2X1 U604 ( .A(n877), .B(n1299), .Y(n792) );
  XNOR2X1 U605 ( .A(n1282), .B(n1299), .Y(n793) );
  XNOR2X1 U606 ( .A(n1280), .B(n1299), .Y(n794) );
  XNOR2X1 U607 ( .A(n1278), .B(n1299), .Y(n795) );
  XNOR2X1 U608 ( .A(n1276), .B(n1299), .Y(n796) );
  XNOR2X1 U609 ( .A(n1274), .B(n1300), .Y(n797) );
  XNOR2X1 U610 ( .A(n1272), .B(n1300), .Y(n798) );
  XNOR2X1 U611 ( .A(n1270), .B(n1300), .Y(n799) );
  XNOR2X1 U612 ( .A(n1268), .B(n1299), .Y(n800) );
  XNOR2X1 U613 ( .A(n1266), .B(n1299), .Y(n801) );
  XNOR2X1 U614 ( .A(n1264), .B(n1299), .Y(n802) );
  XNOR2X1 U615 ( .A(n1262), .B(n1299), .Y(n803) );
  XNOR2X1 U616 ( .A(n1260), .B(n1299), .Y(n804) );
  XNOR2X1 U617 ( .A(n1258), .B(n1299), .Y(n805) );
  XNOR2X1 U618 ( .A(n891), .B(n1299), .Y(n806) );
  XNOR2X1 U619 ( .A(n1286), .B(n1299), .Y(n807) );
  OAI22X1 U622 ( .A(n1216), .B(n1238), .C(n1235), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1216), .B(n1235), .C(n1237), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n810), .B(n1238), .C(n1235), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1235), .B(n810), .C(n811), .D(n1237), .Y(n658) );
  OAI22X1 U628 ( .A(n1235), .B(n811), .C(n812), .D(n1237), .Y(n659) );
  OAI22X1 U629 ( .A(n1235), .B(n812), .C(n813), .D(n1237), .Y(n660) );
  OAI22X1 U630 ( .A(n1235), .B(n813), .C(n814), .D(n1237), .Y(n661) );
  OAI22X1 U631 ( .A(n1235), .B(n814), .C(n815), .D(n1237), .Y(n662) );
  OAI22X1 U632 ( .A(n1235), .B(n815), .C(n816), .D(n1237), .Y(n663) );
  OAI22X1 U633 ( .A(n1235), .B(n816), .C(n817), .D(n1238), .Y(n664) );
  OAI22X1 U634 ( .A(n1235), .B(n817), .C(n818), .D(n1238), .Y(n665) );
  OAI22X1 U635 ( .A(n1235), .B(n818), .C(n819), .D(n1238), .Y(n666) );
  OAI22X1 U636 ( .A(n1235), .B(n819), .C(n820), .D(n1237), .Y(n667) );
  OAI22X1 U637 ( .A(n1235), .B(n820), .C(n821), .D(n1238), .Y(n668) );
  OAI22X1 U638 ( .A(n1235), .B(n821), .C(n822), .D(n1238), .Y(n669) );
  OAI22X1 U639 ( .A(n1235), .B(n822), .C(n823), .D(n1238), .Y(n670) );
  OAI22X1 U640 ( .A(n1235), .B(n823), .C(n1238), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1287), .B(n1234), .Y(n672) );
  XNOR2X1 U643 ( .A(n877), .B(n1297), .Y(n809) );
  XNOR2X1 U644 ( .A(n1282), .B(n1297), .Y(n810) );
  XNOR2X1 U645 ( .A(n1280), .B(n1297), .Y(n811) );
  XNOR2X1 U646 ( .A(n1278), .B(n1296), .Y(n812) );
  XNOR2X1 U647 ( .A(n1276), .B(n1296), .Y(n813) );
  XNOR2X1 U648 ( .A(n1274), .B(n1296), .Y(n814) );
  XNOR2X1 U649 ( .A(n1272), .B(n1296), .Y(n815) );
  XNOR2X1 U650 ( .A(n1270), .B(n1296), .Y(n816) );
  XNOR2X1 U651 ( .A(n1268), .B(n1296), .Y(n817) );
  XNOR2X1 U652 ( .A(n1266), .B(n1296), .Y(n818) );
  XNOR2X1 U653 ( .A(n1264), .B(n1296), .Y(n819) );
  XNOR2X1 U654 ( .A(n1262), .B(n1296), .Y(n820) );
  XNOR2X1 U655 ( .A(n1260), .B(n1296), .Y(n821) );
  XNOR2X1 U656 ( .A(n1258), .B(n1296), .Y(n822) );
  XNOR2X1 U657 ( .A(n1256), .B(n1296), .Y(n823) );
  XNOR2X1 U658 ( .A(n1286), .B(n1296), .Y(n824) );
  OR2X1 U659 ( .A(n1286), .B(n1216), .Y(n825) );
  OAI22X1 U661 ( .A(n1295), .B(n1232), .C(n1230), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1295), .B(n1230), .C(n1233), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n827), .B(n1233), .C(n1230), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1230), .B(n827), .C(n828), .D(n1233), .Y(n676) );
  OAI22X1 U667 ( .A(n1230), .B(n828), .C(n829), .D(n1233), .Y(n677) );
  OAI22X1 U668 ( .A(n1230), .B(n829), .C(n830), .D(n1233), .Y(n678) );
  OAI22X1 U669 ( .A(n1230), .B(n830), .C(n831), .D(n1233), .Y(n679) );
  OAI22X1 U670 ( .A(n1230), .B(n831), .C(n832), .D(n1232), .Y(n680) );
  OAI22X1 U671 ( .A(n1230), .B(n832), .C(n833), .D(n1233), .Y(n681) );
  OAI22X1 U672 ( .A(n1230), .B(n833), .C(n834), .D(n1232), .Y(n682) );
  OAI22X1 U673 ( .A(n1230), .B(n834), .C(n835), .D(n1232), .Y(n683) );
  OAI22X1 U674 ( .A(n1230), .B(n835), .C(n836), .D(n1233), .Y(n684) );
  OAI22X1 U675 ( .A(n1230), .B(n836), .C(n837), .D(n1233), .Y(n685) );
  OAI22X1 U676 ( .A(n1230), .B(n837), .C(n838), .D(n1232), .Y(n686) );
  OAI22X1 U677 ( .A(n1230), .B(n838), .C(n839), .D(n1232), .Y(n687) );
  OAI22X1 U678 ( .A(n1230), .B(n839), .C(n840), .D(n1233), .Y(n688) );
  OAI22X1 U679 ( .A(n1230), .B(n840), .C(n1232), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1287), .B(n1204), .Y(n690) );
  XNOR2X1 U682 ( .A(n877), .B(n1294), .Y(n826) );
  XNOR2X1 U683 ( .A(n1282), .B(n1294), .Y(n827) );
  XNOR2X1 U684 ( .A(n1280), .B(n1294), .Y(n828) );
  XNOR2X1 U685 ( .A(n1278), .B(n1294), .Y(n829) );
  XNOR2X1 U686 ( .A(n1276), .B(n1294), .Y(n830) );
  XNOR2X1 U687 ( .A(n1274), .B(n1294), .Y(n831) );
  XNOR2X1 U688 ( .A(n1272), .B(n1294), .Y(n832) );
  XNOR2X1 U689 ( .A(n1270), .B(n1294), .Y(n833) );
  XNOR2X1 U690 ( .A(n1268), .B(n1294), .Y(n834) );
  XNOR2X1 U691 ( .A(n1266), .B(n1294), .Y(n835) );
  XNOR2X1 U692 ( .A(n1264), .B(n1294), .Y(n836) );
  XNOR2X1 U693 ( .A(n1262), .B(n1294), .Y(n837) );
  XNOR2X1 U694 ( .A(n1260), .B(n1294), .Y(n838) );
  XNOR2X1 U695 ( .A(n1258), .B(n1294), .Y(n839) );
  XNOR2X1 U696 ( .A(n1256), .B(n1294), .Y(n840) );
  XNOR2X1 U697 ( .A(n1286), .B(n1294), .Y(n841) );
  OAI22X1 U700 ( .A(n1120), .B(n1229), .C(n1226), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1120), .B(n1227), .C(n1071), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n844), .B(n1229), .C(n1227), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1226), .B(n844), .C(n845), .D(n1229), .Y(n694) );
  OAI22X1 U706 ( .A(n1227), .B(n845), .C(n1220), .D(n846), .Y(n695) );
  OAI22X1 U707 ( .A(n1226), .B(n846), .C(n847), .D(n1229), .Y(n696) );
  OAI22X1 U708 ( .A(n1227), .B(n847), .C(n848), .D(n1229), .Y(n697) );
  OAI22X1 U709 ( .A(n1226), .B(n848), .C(n849), .D(n1229), .Y(n698) );
  OAI22X1 U710 ( .A(n1227), .B(n849), .C(n850), .D(n1229), .Y(n699) );
  OAI22X1 U711 ( .A(n1226), .B(n850), .C(n851), .D(n1229), .Y(n700) );
  OAI22X1 U712 ( .A(n1227), .B(n851), .C(n852), .D(n1229), .Y(n701) );
  OAI22X1 U713 ( .A(n1226), .B(n852), .C(n853), .D(n1229), .Y(n702) );
  OAI22X1 U714 ( .A(n1227), .B(n853), .C(n854), .D(n1229), .Y(n703) );
  OAI22X1 U715 ( .A(n1226), .B(n854), .C(n855), .D(n1229), .Y(n704) );
  OAI22X1 U716 ( .A(n1227), .B(n855), .C(n856), .D(n1229), .Y(n705) );
  OAI22X1 U717 ( .A(n1226), .B(n856), .C(n857), .D(n1229), .Y(n706) );
  OAI22X1 U718 ( .A(n1227), .B(n857), .C(n1229), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1287), .B(n561), .Y(n708) );
  XNOR2X1 U721 ( .A(n877), .B(n1057), .Y(n843) );
  XNOR2X1 U722 ( .A(n1282), .B(n1058), .Y(n844) );
  XNOR2X1 U723 ( .A(n1280), .B(n1291), .Y(n845) );
  XNOR2X1 U725 ( .A(n1276), .B(n1058), .Y(n847) );
  XNOR2X1 U726 ( .A(n1274), .B(n1058), .Y(n848) );
  XNOR2X1 U727 ( .A(n1272), .B(n1057), .Y(n849) );
  XNOR2X1 U728 ( .A(n1270), .B(n1057), .Y(n850) );
  XNOR2X1 U729 ( .A(n1268), .B(n1058), .Y(n851) );
  XNOR2X1 U730 ( .A(n1266), .B(n1057), .Y(n852) );
  XNOR2X1 U731 ( .A(n1264), .B(n1058), .Y(n853) );
  XNOR2X1 U732 ( .A(n1262), .B(n1057), .Y(n854) );
  XNOR2X1 U733 ( .A(n1260), .B(n1058), .Y(n855) );
  XNOR2X1 U734 ( .A(n1258), .B(n1057), .Y(n856) );
  XNOR2X1 U735 ( .A(n1256), .B(n1058), .Y(n857) );
  XNOR2X1 U736 ( .A(n1286), .B(n1057), .Y(n858) );
  OR2X1 U737 ( .A(n1286), .B(n1120), .Y(n859) );
  OAI22X1 U739 ( .A(n1290), .B(n1154), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1290), .C(n1051), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1225), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n917), .B(n861), .C(n1225), .D(n862), .Y(n712) );
  OAI22X1 U745 ( .A(n917), .B(n862), .C(n1225), .D(n863), .Y(n713) );
  OAI22X1 U746 ( .A(n917), .B(n863), .C(n1225), .D(n864), .Y(n714) );
  OAI22X1 U747 ( .A(n917), .B(n864), .C(n1225), .D(n865), .Y(n715) );
  OAI22X1 U748 ( .A(n917), .B(n865), .C(n1225), .D(n866), .Y(n716) );
  OAI22X1 U749 ( .A(n917), .B(n866), .C(n1067), .D(n867), .Y(n717) );
  OAI22X1 U750 ( .A(n917), .B(n867), .C(n1067), .D(n868), .Y(n718) );
  OAI22X1 U751 ( .A(n917), .B(n868), .C(n1067), .D(n869), .Y(n719) );
  OAI22X1 U752 ( .A(n917), .B(n869), .C(n1225), .D(n870), .Y(n720) );
  OAI22X1 U753 ( .A(n917), .B(n870), .C(n1067), .D(n871), .Y(n721) );
  OAI22X1 U754 ( .A(n917), .B(n871), .C(n1067), .D(n872), .Y(n722) );
  OAI22X1 U755 ( .A(n917), .B(n872), .C(n1067), .D(n873), .Y(n723) );
  OAI22X1 U756 ( .A(n917), .B(n873), .C(n1154), .D(n874), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1154), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n877), .B(n1289), .Y(n860) );
  XNOR2X1 U759 ( .A(n1282), .B(n1212), .Y(n861) );
  XNOR2X1 U760 ( .A(n1280), .B(n1213), .Y(n862) );
  XNOR2X1 U761 ( .A(n1278), .B(n1211), .Y(n863) );
  XNOR2X1 U762 ( .A(n1276), .B(n1211), .Y(n864) );
  XNOR2X1 U763 ( .A(n1274), .B(n1211), .Y(n865) );
  XNOR2X1 U764 ( .A(n1272), .B(n1213), .Y(n866) );
  XNOR2X1 U765 ( .A(n1270), .B(n1212), .Y(n867) );
  XNOR2X1 U766 ( .A(n1268), .B(n1213), .Y(n868) );
  XNOR2X1 U767 ( .A(n1266), .B(n1212), .Y(n869) );
  XNOR2X1 U768 ( .A(n1264), .B(n1213), .Y(n870) );
  XNOR2X1 U769 ( .A(n1262), .B(n1212), .Y(n871) );
  XNOR2X1 U770 ( .A(n1260), .B(n1213), .Y(n872) );
  XNOR2X1 U771 ( .A(n1258), .B(n1212), .Y(n873) );
  XNOR2X1 U772 ( .A(n1256), .B(n1213), .Y(n874) );
  XNOR2X1 U773 ( .A(n1286), .B(n1212), .Y(n875) );
  NAND2X1 U807 ( .A(n895), .B(n1103), .Y(n36) );
  NAND2X1 U813 ( .A(n897), .B(n22), .Y(n24) );
  XOR2X1 U814 ( .A(n1297), .B(a[21]), .Y(n897) );
  NAND2X1 U816 ( .A(n898), .B(n1109), .Y(n18) );
  XOR2X1 U817 ( .A(n1050), .B(a[19]), .Y(n898) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  XOR2X1 U823 ( .A(n1), .B(a[15]), .Y(n900) );
  INVX2 U828 ( .A(n24), .Y(n1236) );
  BUFX4 U829 ( .A(n368), .Y(n995) );
  INVX4 U830 ( .A(n1248), .Y(n1249) );
  BUFX4 U831 ( .A(n453), .Y(n996) );
  INVX4 U832 ( .A(n1202), .Y(n1218) );
  INVX8 U833 ( .A(n1259), .Y(n1260) );
  BUFX4 U834 ( .A(n1245), .Y(n1070) );
  BUFX4 U835 ( .A(n369), .Y(n997) );
  INVX2 U836 ( .A(n1264), .Y(n736) );
  INVX4 U837 ( .A(n1291), .Y(n1056) );
  AND2X2 U838 ( .A(n1287), .B(n1285), .Y(n582) );
  INVX8 U839 ( .A(n1176), .Y(n1181) );
  INVX8 U840 ( .A(n1204), .Y(n1230) );
  INVX4 U841 ( .A(n1304), .Y(n1184) );
  INVX8 U842 ( .A(n1275), .Y(n1276) );
  INVX8 U843 ( .A(n1277), .Y(n1278) );
  INVX4 U844 ( .A(n880), .Y(n1277) );
  INVX4 U845 ( .A(n1304), .Y(n1183) );
  INVX8 U846 ( .A(n37), .Y(n1304) );
  INVX2 U847 ( .A(n1053), .Y(n1302) );
  INVX2 U848 ( .A(n36), .Y(n1244) );
  INVX4 U849 ( .A(n25), .Y(n1301) );
  INVX2 U850 ( .A(n560), .Y(n691) );
  INVX4 U851 ( .A(n1236), .Y(n1237) );
  INVX4 U852 ( .A(n541), .Y(n1283) );
  BUFX2 U853 ( .A(n12), .Y(n1071) );
  INVX2 U854 ( .A(n888), .Y(n1261) );
  INVX4 U855 ( .A(n1290), .Y(n1289) );
  INVX2 U856 ( .A(n7), .Y(n1293) );
  INVX2 U857 ( .A(n49), .Y(n1288) );
  INVX2 U858 ( .A(n563), .Y(n1105) );
  INVX2 U859 ( .A(n1042), .Y(n1043) );
  BUFX2 U860 ( .A(n385), .Y(n1162) );
  INVX2 U861 ( .A(n883), .Y(n1271) );
  INVX2 U862 ( .A(n887), .Y(n1263) );
  INVX4 U863 ( .A(n1056), .Y(n1057) );
  INVX4 U864 ( .A(n1273), .Y(n1274) );
  INVX4 U865 ( .A(n1056), .Y(n1058) );
  BUFX2 U866 ( .A(n1250), .Y(n1040) );
  INVX2 U867 ( .A(n1288), .Y(n1287) );
  INVX4 U868 ( .A(n1257), .Y(n1258) );
  INVX4 U869 ( .A(n1271), .Y(n1272) );
  BUFX2 U870 ( .A(n438), .Y(n1210) );
  BUFX2 U871 ( .A(n424), .Y(n1209) );
  INVX2 U872 ( .A(n1223), .Y(n624) );
  INVX2 U873 ( .A(n881), .Y(n1275) );
  INVX2 U874 ( .A(n1236), .Y(n1238) );
  INVX2 U875 ( .A(n879), .Y(n1279) );
  BUFX2 U876 ( .A(n459), .Y(n1205) );
  INVX2 U877 ( .A(n1075), .Y(n1119) );
  INVX2 U878 ( .A(n889), .Y(n1259) );
  XOR2X1 U879 ( .A(n487), .B(n480), .Y(n998) );
  XOR2X1 U880 ( .A(n1055), .B(n998), .Y(n474) );
  NAND2X1 U881 ( .A(n1055), .B(n487), .Y(n999) );
  NAND2X1 U882 ( .A(n1055), .B(n480), .Y(n1000) );
  NAND2X1 U883 ( .A(n487), .B(n480), .Y(n1001) );
  NAND3X1 U884 ( .A(n1000), .B(n999), .C(n1001), .Y(n473) );
  INVX2 U885 ( .A(n1054), .Y(n1055) );
  NOR2X1 U886 ( .A(n1246), .B(n771), .Y(n1002) );
  NOR2X1 U887 ( .A(n772), .B(n1179), .Y(n1003) );
  OR2X2 U888 ( .A(n1002), .B(n1003), .Y(n616) );
  INVX2 U889 ( .A(n1248), .Y(n1179) );
  XOR2X1 U890 ( .A(n642), .B(n386), .Y(n1004) );
  XOR2X1 U891 ( .A(n674), .B(n1004), .Y(n384) );
  NAND2X1 U892 ( .A(n674), .B(n642), .Y(n1005) );
  NAND2X1 U893 ( .A(n674), .B(n386), .Y(n1006) );
  NAND2X1 U894 ( .A(n642), .B(n386), .Y(n1007) );
  NAND3X1 U895 ( .A(n1006), .B(n1005), .C(n1007), .Y(n383) );
  XOR2X1 U896 ( .A(n1206), .B(n454), .Y(n1008) );
  XOR2X1 U897 ( .A(n1087), .B(n1008), .Y(n448) );
  NAND2X1 U898 ( .A(n1087), .B(n1206), .Y(n1009) );
  NAND2X1 U899 ( .A(n1087), .B(n454), .Y(n1010) );
  NAND2X1 U900 ( .A(n1206), .B(n454), .Y(n1011) );
  NAND3X1 U901 ( .A(n1010), .B(n1009), .C(n1011), .Y(n447) );
  BUFX2 U902 ( .A(n465), .Y(n1206) );
  INVX2 U903 ( .A(n1086), .Y(n1087) );
  XOR2X1 U904 ( .A(n1106), .B(n581), .Y(n1012) );
  XOR2X1 U905 ( .A(n645), .B(n1012), .Y(n428) );
  NAND2X1 U906 ( .A(n645), .B(n1106), .Y(n1013) );
  NAND2X1 U907 ( .A(n645), .B(n581), .Y(n1014) );
  NAND2X1 U908 ( .A(n1106), .B(n581), .Y(n1015) );
  NAND3X1 U909 ( .A(n1014), .B(n1013), .C(n1015), .Y(n427) );
  XOR2X1 U910 ( .A(n1106), .B(n580), .Y(n1016) );
  XOR2X1 U911 ( .A(n644), .B(n1016), .Y(n414) );
  NAND2X1 U912 ( .A(n644), .B(n1106), .Y(n1017) );
  NAND2X1 U913 ( .A(n644), .B(n580), .Y(n1018) );
  NAND2X1 U914 ( .A(n1106), .B(n580), .Y(n1019) );
  NAND3X1 U915 ( .A(n1018), .B(n1017), .C(n1019), .Y(n413) );
  INVX4 U916 ( .A(n1105), .Y(n1106) );
  XOR2X1 U917 ( .A(n393), .B(n391), .Y(n1020) );
  XOR2X1 U918 ( .A(n380), .B(n1020), .Y(n376) );
  NAND2X1 U919 ( .A(n380), .B(n393), .Y(n1021) );
  NAND2X1 U920 ( .A(n380), .B(n391), .Y(n1022) );
  NAND2X1 U921 ( .A(n393), .B(n391), .Y(n1023) );
  NAND3X1 U922 ( .A(n1022), .B(n1021), .C(n1023), .Y(n375) );
  INVX4 U923 ( .A(n878), .Y(n1281) );
  XOR2X1 U924 ( .A(n579), .B(n595), .Y(n1024) );
  XOR2X1 U925 ( .A(n1024), .B(n643), .Y(n400) );
  XOR2X1 U926 ( .A(n398), .B(n396), .Y(n1025) );
  XOR2X1 U927 ( .A(n1025), .B(n400), .Y(n392) );
  NAND2X1 U928 ( .A(n579), .B(n595), .Y(n1026) );
  NAND2X1 U929 ( .A(n579), .B(n643), .Y(n1027) );
  NAND2X1 U930 ( .A(n595), .B(n643), .Y(n1028) );
  NAND3X1 U931 ( .A(n1026), .B(n1027), .C(n1028), .Y(n399) );
  NAND2X1 U932 ( .A(n398), .B(n396), .Y(n1029) );
  NAND2X1 U933 ( .A(n398), .B(n400), .Y(n1030) );
  NAND2X1 U934 ( .A(n396), .B(n400), .Y(n1031) );
  NAND3X1 U935 ( .A(n1029), .B(n1030), .C(n1031), .Y(n391) );
  XOR2X1 U936 ( .A(n679), .B(n615), .Y(n1032) );
  XOR2X1 U937 ( .A(n1032), .B(n565), .Y(n452) );
  NAND2X1 U938 ( .A(n679), .B(n615), .Y(n1033) );
  NAND2X1 U939 ( .A(n679), .B(n565), .Y(n1034) );
  NAND2X1 U940 ( .A(n615), .B(n565), .Y(n1035) );
  NAND3X1 U941 ( .A(n1033), .B(n1034), .C(n1035), .Y(n451) );
  XOR2X1 U942 ( .A(n455), .B(n996), .Y(n1036) );
  XOR2X1 U943 ( .A(n1036), .B(n451), .Y(n436) );
  NAND2X1 U944 ( .A(n455), .B(n996), .Y(n1037) );
  NAND2X1 U945 ( .A(n455), .B(n451), .Y(n1038) );
  NAND2X1 U946 ( .A(n996), .B(n451), .Y(n1039) );
  NAND3X1 U947 ( .A(n1037), .B(n1038), .C(n1039), .Y(n435) );
  INVX2 U948 ( .A(n1253), .Y(n1254) );
  BUFX2 U949 ( .A(n1250), .Y(n1041) );
  INVX2 U950 ( .A(n1075), .Y(n1250) );
  AND2X2 U951 ( .A(n1287), .B(n1075), .Y(n600) );
  INVX8 U952 ( .A(n1265), .Y(n1266) );
  INVX2 U953 ( .A(n397), .Y(n1042) );
  INVX2 U954 ( .A(n1103), .Y(n1202) );
  INVX2 U955 ( .A(n1202), .Y(n1243) );
  AND2X2 U956 ( .A(n715), .B(n651), .Y(n1044) );
  OR2X2 U957 ( .A(n308), .B(n313), .Y(n1045) );
  AND2X2 U958 ( .A(n1107), .B(n893), .Y(n1046) );
  INVX2 U959 ( .A(n1241), .Y(n1207) );
  INVX2 U960 ( .A(n890), .Y(n1257) );
  INVX4 U961 ( .A(n1269), .Y(n1270) );
  INVX2 U962 ( .A(n884), .Y(n1269) );
  INVX2 U963 ( .A(n882), .Y(n1273) );
  INVX4 U964 ( .A(n1267), .Y(n1268) );
  INVX2 U965 ( .A(n885), .Y(n1267) );
  INVX2 U966 ( .A(n399), .Y(n1128) );
  OR2X2 U967 ( .A(n292), .B(n293), .Y(n1047) );
  XNOR2X1 U968 ( .A(n145), .B(n1048), .Y(product[40]) );
  AND2X2 U969 ( .A(n144), .B(n1187), .Y(n1048) );
  INVX1 U970 ( .A(n172), .Y(n174) );
  NOR2X1 U971 ( .A(n401), .B(n388), .Y(n1049) );
  BUFX2 U972 ( .A(n13), .Y(n1050) );
  INVX1 U973 ( .A(n1224), .Y(n1051) );
  INVX2 U974 ( .A(n1224), .Y(n1225) );
  XOR2X1 U975 ( .A(n1278), .B(n1056), .Y(n846) );
  XOR2X1 U976 ( .A(n31), .B(a[27]), .Y(n1052) );
  INVX2 U977 ( .A(n1293), .Y(n1291) );
  INVX8 U978 ( .A(n1298), .Y(n1296) );
  INVX1 U979 ( .A(n31), .Y(n1053) );
  INVX1 U980 ( .A(n1226), .Y(n561) );
  INVX2 U981 ( .A(n489), .Y(n1054) );
  INVX2 U982 ( .A(n1255), .Y(n1256) );
  INVX2 U983 ( .A(n891), .Y(n1255) );
  XOR2X1 U984 ( .A(n667), .B(n635), .Y(n1059) );
  XOR2X1 U985 ( .A(n699), .B(n1059), .Y(n498) );
  NAND2X1 U986 ( .A(n667), .B(n635), .Y(n1060) );
  NAND2X1 U987 ( .A(n667), .B(n699), .Y(n1061) );
  NAND2X1 U988 ( .A(n635), .B(n699), .Y(n1062) );
  NAND3X1 U989 ( .A(n1060), .B(n1061), .C(n1062), .Y(n497) );
  XOR2X1 U990 ( .A(n682), .B(n1044), .Y(n1063) );
  XOR2X1 U991 ( .A(n1063), .B(n497), .Y(n486) );
  NAND2X1 U992 ( .A(n682), .B(n1044), .Y(n1064) );
  NAND2X1 U993 ( .A(n682), .B(n497), .Y(n1065) );
  NAND2X1 U994 ( .A(n1044), .B(n497), .Y(n1066) );
  NAND3X1 U995 ( .A(n1064), .B(n1065), .C(n1066), .Y(n485) );
  INVX2 U996 ( .A(n1231), .Y(n1232) );
  INVX1 U997 ( .A(n1224), .Y(n1067) );
  INVX2 U998 ( .A(n6), .Y(n1224) );
  INVX1 U999 ( .A(n161), .Y(n282) );
  INVX4 U1000 ( .A(n1253), .Y(n1068) );
  INVX4 U1001 ( .A(n1253), .Y(n1069) );
  BUFX2 U1002 ( .A(n12), .Y(n1220) );
  INVX4 U1003 ( .A(n13), .Y(n1295) );
  INVX2 U1004 ( .A(n1301), .Y(n1300) );
  INVX1 U1005 ( .A(n128), .Y(n126) );
  NAND2X1 U1006 ( .A(n1128), .B(n1164), .Y(n1073) );
  NAND2X1 U1007 ( .A(n399), .B(n1072), .Y(n1074) );
  NAND2X1 U1008 ( .A(n1073), .B(n1074), .Y(n380) );
  INVX2 U1009 ( .A(n1164), .Y(n1072) );
  OR2X2 U1010 ( .A(n1286), .B(n1290), .Y(n876) );
  OR2X2 U1011 ( .A(n1286), .B(n1295), .Y(n842) );
  OR2X2 U1012 ( .A(n1286), .B(n1221), .Y(n808) );
  XOR2X1 U1013 ( .A(n37), .B(a[29]), .Y(n1075) );
  BUFX2 U1014 ( .A(n1303), .Y(n1076) );
  BUFX2 U1015 ( .A(n1303), .Y(n1077) );
  XOR2X1 U1016 ( .A(n407), .B(n394), .Y(n1078) );
  XOR2X1 U1017 ( .A(n1078), .B(n405), .Y(n390) );
  XOR2X1 U1018 ( .A(n392), .B(n403), .Y(n1079) );
  XOR2X1 U1019 ( .A(n1079), .B(n390), .Y(n388) );
  NAND2X1 U1020 ( .A(n407), .B(n394), .Y(n1080) );
  NAND2X1 U1021 ( .A(n407), .B(n405), .Y(n1081) );
  NAND2X1 U1022 ( .A(n394), .B(n405), .Y(n1082) );
  NAND3X1 U1023 ( .A(n1080), .B(n1081), .C(n1082), .Y(n389) );
  NAND2X1 U1024 ( .A(n392), .B(n403), .Y(n1083) );
  NAND2X1 U1025 ( .A(n392), .B(n390), .Y(n1084) );
  NAND2X1 U1026 ( .A(n403), .B(n390), .Y(n1085) );
  NAND3X1 U1027 ( .A(n1083), .B(n1084), .C(n1085), .Y(n387) );
  INVX2 U1028 ( .A(n452), .Y(n1086) );
  INVX1 U1029 ( .A(n222), .Y(n221) );
  XNOR2X1 U1030 ( .A(n1088), .B(n419), .Y(n404) );
  XNOR2X1 U1031 ( .A(n421), .B(n408), .Y(n1088) );
  INVX2 U1032 ( .A(n287), .Y(n1089) );
  XOR2X1 U1033 ( .A(n383), .B(n381), .Y(n1090) );
  XOR2X1 U1034 ( .A(n1090), .B(n370), .Y(n366) );
  NAND2X1 U1035 ( .A(n383), .B(n381), .Y(n1091) );
  NAND2X1 U1036 ( .A(n383), .B(n370), .Y(n1092) );
  NAND2X1 U1037 ( .A(n381), .B(n370), .Y(n1093) );
  NAND3X1 U1038 ( .A(n1091), .B(n1092), .C(n1093), .Y(n365) );
  XOR2X1 U1039 ( .A(n356), .B(n367), .Y(n1094) );
  XOR2X1 U1040 ( .A(n1094), .B(n365), .Y(n352) );
  NAND2X1 U1041 ( .A(n356), .B(n367), .Y(n1095) );
  NAND2X1 U1042 ( .A(n356), .B(n365), .Y(n1096) );
  NAND2X1 U1043 ( .A(n367), .B(n365), .Y(n1097) );
  NAND3X1 U1044 ( .A(n1095), .B(n1096), .C(n1097), .Y(n351) );
  AND2X2 U1045 ( .A(n1177), .B(n1178), .Y(n1098) );
  XOR2X1 U1046 ( .A(n1162), .B(n578), .Y(n1099) );
  XOR2X1 U1047 ( .A(n1099), .B(n641), .Y(n372) );
  NAND2X1 U1048 ( .A(n641), .B(n1162), .Y(n1100) );
  NAND2X1 U1049 ( .A(n641), .B(n578), .Y(n1101) );
  NAND2X1 U1050 ( .A(n1162), .B(n578), .Y(n1102) );
  NAND3X1 U1051 ( .A(n1101), .B(n1100), .C(n1102), .Y(n371) );
  XNOR2X1 U1052 ( .A(n25), .B(a[25]), .Y(n1103) );
  INVX1 U1053 ( .A(n1301), .Y(n1104) );
  INVX4 U1054 ( .A(n1), .Y(n1290) );
  XNOR2X1 U1055 ( .A(n1301), .B(a[23]), .Y(n1121) );
  XNOR2X1 U1056 ( .A(n37), .B(a[29]), .Y(n1107) );
  INVX2 U1057 ( .A(n1293), .Y(n1126) );
  XNOR2X1 U1058 ( .A(n1283), .B(a[29]), .Y(n893) );
  INVX1 U1059 ( .A(n1260), .Y(n738) );
  INVX4 U1060 ( .A(n1239), .Y(n1240) );
  INVX2 U1061 ( .A(n1109), .Y(n1204) );
  XNOR2X1 U1062 ( .A(n1303), .B(a[25]), .Y(n895) );
  BUFX2 U1063 ( .A(n31), .Y(n1217) );
  INVX4 U1064 ( .A(n31), .Y(n1303) );
  INVX2 U1065 ( .A(n1293), .Y(n1292) );
  INVX2 U1066 ( .A(n22), .Y(n1234) );
  INVX1 U1067 ( .A(n1187), .Y(n1118) );
  INVX8 U1068 ( .A(n1298), .Y(n1297) );
  INVX8 U1069 ( .A(n1285), .Y(n918) );
  INVX4 U1070 ( .A(n1248), .Y(n1180) );
  BUFX2 U1071 ( .A(n1244), .Y(n1108) );
  XNOR2X1 U1072 ( .A(n1126), .B(a[19]), .Y(n1109) );
  XOR2X1 U1073 ( .A(n1210), .B(n442), .Y(n1110) );
  XOR2X1 U1074 ( .A(n1110), .B(n440), .Y(n434) );
  NAND2X1 U1075 ( .A(n1210), .B(n442), .Y(n1111) );
  NAND2X1 U1076 ( .A(n1210), .B(n440), .Y(n1112) );
  NAND2X1 U1077 ( .A(n442), .B(n440), .Y(n1113) );
  NAND3X1 U1078 ( .A(n1111), .B(n1112), .C(n1113), .Y(n433) );
  XOR2X1 U1079 ( .A(n422), .B(n435), .Y(n1114) );
  XOR2X1 U1080 ( .A(n1114), .B(n433), .Y(n418) );
  NAND2X1 U1081 ( .A(n422), .B(n435), .Y(n1115) );
  NAND2X1 U1082 ( .A(n422), .B(n433), .Y(n1116) );
  NAND2X1 U1083 ( .A(n435), .B(n433), .Y(n1117) );
  NAND3X1 U1084 ( .A(n1115), .B(n1116), .C(n1117), .Y(n417) );
  OR2X2 U1085 ( .A(n148), .B(n1118), .Y(n137) );
  INVX1 U1086 ( .A(n148), .Y(n281) );
  INVX4 U1087 ( .A(n1234), .Y(n1235) );
  INVX8 U1088 ( .A(n1301), .Y(n1299) );
  INVX1 U1089 ( .A(n1126), .Y(n1120) );
  AND2X2 U1090 ( .A(n1121), .B(n28), .Y(n1155) );
  INVX2 U1091 ( .A(n28), .Y(n1239) );
  XNOR2X1 U1092 ( .A(n112), .B(n1122), .Y(product[43]) );
  AND2X2 U1093 ( .A(n111), .B(n1190), .Y(n1122) );
  INVX1 U1094 ( .A(n100), .Y(n98) );
  INVX1 U1095 ( .A(n202), .Y(n1123) );
  INVX1 U1096 ( .A(n216), .Y(n290) );
  INVX1 U1097 ( .A(n210), .Y(n289) );
  INVX1 U1098 ( .A(n416), .Y(n1124) );
  INVX1 U1099 ( .A(n1124), .Y(n1125) );
  OR2X2 U1100 ( .A(n1052), .B(n1127), .Y(n42) );
  XNOR2X1 U1101 ( .A(n37), .B(a[27]), .Y(n1127) );
  INVX2 U1102 ( .A(n1052), .Y(n1247) );
  XNOR2X1 U1103 ( .A(n73), .B(n1129), .Y(product[46]) );
  AND2X2 U1104 ( .A(n72), .B(n1047), .Y(n1129) );
  XOR2X1 U1105 ( .A(n463), .B(n450), .Y(n1130) );
  XOR2X1 U1106 ( .A(n1130), .B(n461), .Y(n446) );
  XOR2X1 U1107 ( .A(n448), .B(n1205), .Y(n1131) );
  XOR2X1 U1108 ( .A(n1131), .B(n446), .Y(n444) );
  NAND2X1 U1109 ( .A(n463), .B(n450), .Y(n1132) );
  NAND2X1 U1110 ( .A(n463), .B(n461), .Y(n1133) );
  NAND2X1 U1111 ( .A(n450), .B(n461), .Y(n1134) );
  NAND3X1 U1112 ( .A(n1132), .B(n1133), .C(n1134), .Y(n445) );
  NAND2X1 U1113 ( .A(n448), .B(n1205), .Y(n1135) );
  NAND2X1 U1114 ( .A(n448), .B(n446), .Y(n1136) );
  NAND2X1 U1115 ( .A(n1205), .B(n446), .Y(n1137) );
  NAND3X1 U1116 ( .A(n1135), .B(n1136), .C(n1137), .Y(n443) );
  XOR2X1 U1117 ( .A(n712), .B(n616), .Y(n1138) );
  XOR2X1 U1118 ( .A(n1138), .B(n600), .Y(n468) );
  NAND2X1 U1119 ( .A(n712), .B(n616), .Y(n1139) );
  NAND2X1 U1120 ( .A(n712), .B(n600), .Y(n1140) );
  NAND2X1 U1121 ( .A(n616), .B(n600), .Y(n1141) );
  NAND3X1 U1122 ( .A(n1139), .B(n1140), .C(n1141), .Y(n467) );
  XOR2X1 U1123 ( .A(n647), .B(n456), .Y(n1142) );
  XOR2X1 U1124 ( .A(n1142), .B(n467), .Y(n450) );
  NAND2X1 U1125 ( .A(n647), .B(n456), .Y(n1143) );
  NAND2X1 U1126 ( .A(n647), .B(n467), .Y(n1144) );
  NAND2X1 U1127 ( .A(n456), .B(n467), .Y(n1145) );
  NAND3X1 U1128 ( .A(n1143), .B(n1144), .C(n1145), .Y(n449) );
  BUFX2 U1129 ( .A(n1070), .Y(n1146) );
  INVX4 U1130 ( .A(n42), .Y(n1248) );
  XOR2X1 U1131 ( .A(n439), .B(n1209), .Y(n1147) );
  XOR2X1 U1132 ( .A(n1147), .B(n426), .Y(n420) );
  NAND2X1 U1133 ( .A(n439), .B(n1209), .Y(n1148) );
  NAND2X1 U1134 ( .A(n439), .B(n426), .Y(n1149) );
  NAND2X1 U1135 ( .A(n1209), .B(n426), .Y(n1150) );
  NAND3X1 U1136 ( .A(n1148), .B(n1149), .C(n1150), .Y(n419) );
  NAND2X1 U1137 ( .A(n421), .B(n408), .Y(n1151) );
  NAND2X1 U1138 ( .A(n419), .B(n421), .Y(n1152) );
  NAND2X1 U1139 ( .A(n408), .B(n419), .Y(n1153) );
  NAND3X1 U1140 ( .A(n1151), .B(n1152), .C(n1153), .Y(n403) );
  INVX2 U1141 ( .A(n1046), .Y(n1251) );
  BUFX2 U1142 ( .A(n1067), .Y(n1154) );
  OR2X2 U1143 ( .A(n1203), .B(n1156), .Y(n12) );
  XNOR2X1 U1144 ( .A(n1292), .B(a[17]), .Y(n1156) );
  INVX2 U1145 ( .A(n1203), .Y(n1227) );
  XOR2X1 U1146 ( .A(n596), .B(n628), .Y(n1157) );
  XOR2X1 U1147 ( .A(n692), .B(n1157), .Y(n412) );
  NAND2X1 U1148 ( .A(n692), .B(n596), .Y(n1158) );
  NAND2X1 U1149 ( .A(n692), .B(n628), .Y(n1159) );
  NAND2X1 U1150 ( .A(n596), .B(n628), .Y(n1160) );
  NAND3X1 U1151 ( .A(n1159), .B(n1158), .C(n1160), .Y(n411) );
  NOR2X1 U1152 ( .A(n401), .B(n388), .Y(n1161) );
  XNOR2X1 U1153 ( .A(n19), .B(a[23]), .Y(n28) );
  OR2X2 U1154 ( .A(n918), .B(n1265), .Y(n1163) );
  XOR2X1 U1155 ( .A(n715), .B(n651), .Y(n500) );
  XOR2X1 U1156 ( .A(n1043), .B(n610), .Y(n1164) );
  NAND2X1 U1157 ( .A(n399), .B(n1043), .Y(n1165) );
  NAND2X1 U1158 ( .A(n399), .B(n610), .Y(n1166) );
  NAND2X1 U1159 ( .A(n1043), .B(n610), .Y(n1167) );
  NAND3X1 U1160 ( .A(n1166), .B(n1165), .C(n1167), .Y(n379) );
  XOR2X1 U1161 ( .A(n649), .B(n665), .Y(n1168) );
  XOR2X1 U1162 ( .A(n1168), .B(n566), .Y(n476) );
  NAND2X1 U1163 ( .A(n665), .B(n649), .Y(n1169) );
  NAND2X1 U1164 ( .A(n665), .B(n566), .Y(n1170) );
  NAND2X1 U1165 ( .A(n649), .B(n566), .Y(n1171) );
  NAND3X1 U1166 ( .A(n1169), .B(n1170), .C(n1171), .Y(n475) );
  XOR2X1 U1167 ( .A(n477), .B(n468), .Y(n1172) );
  XOR2X1 U1168 ( .A(n1172), .B(n475), .Y(n462) );
  NAND2X1 U1169 ( .A(n477), .B(n468), .Y(n1173) );
  NAND2X1 U1170 ( .A(n477), .B(n475), .Y(n1174) );
  NAND2X1 U1171 ( .A(n468), .B(n475), .Y(n1175) );
  NAND3X1 U1172 ( .A(n1173), .B(n1174), .C(n1175), .Y(n461) );
  BUFX4 U1173 ( .A(n1303), .Y(n1176) );
  NAND2X1 U1174 ( .A(n172), .B(n159), .Y(n1177) );
  INVX1 U1175 ( .A(n160), .Y(n1178) );
  AND2X2 U1176 ( .A(n1177), .B(n1178), .Y(n1215) );
  INVX8 U1177 ( .A(n1288), .Y(n1286) );
  INVX2 U1178 ( .A(n1155), .Y(n1242) );
  OR2X2 U1179 ( .A(n322), .B(n329), .Y(n1187) );
  OR2X2 U1180 ( .A(n481), .B(n470), .Y(n1188) );
  OR2X2 U1181 ( .A(n302), .B(n307), .Y(n1190) );
  INVX4 U1182 ( .A(n1207), .Y(n1208) );
  AND2X1 U1183 ( .A(n572), .B(n725), .Y(n1201) );
  NOR2X1 U1184 ( .A(n137), .B(n80), .Y(n1182) );
  INVX1 U1185 ( .A(n1182), .Y(n1186) );
  AND2X2 U1186 ( .A(n1182), .B(n1185), .Y(n74) );
  INVX1 U1187 ( .A(n53), .Y(n1185) );
  AND2X2 U1188 ( .A(n481), .B(n470), .Y(n1189) );
  OR2X1 U1189 ( .A(n523), .B(n518), .Y(n1191) );
  AND2X2 U1190 ( .A(n491), .B(n482), .Y(n1192) );
  OR2X1 U1191 ( .A(n491), .B(n482), .Y(n1193) );
  AND2X2 U1192 ( .A(n523), .B(n518), .Y(n1194) );
  INVX2 U1193 ( .A(n554), .Y(n655) );
  INVX2 U1194 ( .A(n551), .Y(n637) );
  OR2X1 U1195 ( .A(n539), .B(n538), .Y(n1195) );
  OR2X1 U1196 ( .A(n724), .B(n708), .Y(n1196) );
  OR2X1 U1197 ( .A(n533), .B(n530), .Y(n1197) );
  AND2X2 U1198 ( .A(n724), .B(n708), .Y(n1198) );
  AND2X2 U1199 ( .A(n533), .B(n530), .Y(n1199) );
  AND2X2 U1200 ( .A(n539), .B(n538), .Y(n1200) );
  XNOR2X1 U1201 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1202 ( .A(n548), .Y(n619) );
  XOR2X1 U1203 ( .A(n877), .B(n1304), .Y(n758) );
  INVX4 U1204 ( .A(n1283), .Y(n1284) );
  INVX2 U1205 ( .A(n545), .Y(n601) );
  INVX2 U1206 ( .A(n1155), .Y(n1241) );
  INVX4 U1207 ( .A(n886), .Y(n1265) );
  XOR2X1 U1208 ( .A(n1), .B(a[17]), .Y(n1203) );
  INVX8 U1209 ( .A(n1046), .Y(n1252) );
  INVX2 U1210 ( .A(n1203), .Y(n1226) );
  INVX1 U1211 ( .A(n1161), .Y(n286) );
  INVX1 U1212 ( .A(n213), .Y(n212) );
  BUFX2 U1213 ( .A(n1289), .Y(n1211) );
  BUFX4 U1214 ( .A(n1289), .Y(n1212) );
  BUFX4 U1215 ( .A(n1289), .Y(n1213) );
  INVX8 U1216 ( .A(n1228), .Y(n1229) );
  BUFX4 U1217 ( .A(n53), .Y(n1214) );
  INVX1 U1218 ( .A(n1296), .Y(n1216) );
  XOR2X1 U1219 ( .A(n1275), .B(n1076), .Y(n1219) );
  INVX1 U1220 ( .A(n1219), .Y(n779) );
  INVX2 U1221 ( .A(n12), .Y(n1228) );
  INVX1 U1222 ( .A(n1104), .Y(n1221) );
  XOR2X1 U1223 ( .A(n1277), .B(n1077), .Y(n1222) );
  INVX1 U1224 ( .A(n1222), .Y(n778) );
  INVX4 U1225 ( .A(n51), .Y(n1253) );
  INVX1 U1226 ( .A(n200), .Y(n202) );
  XNOR2X1 U1227 ( .A(n13), .B(a[21]), .Y(n22) );
  INVX1 U1228 ( .A(n199), .Y(n201) );
  INVX1 U1229 ( .A(n166), .Y(n283) );
  INVX2 U1230 ( .A(n1052), .Y(n1246) );
  INVX1 U1231 ( .A(n205), .Y(n288) );
  INVX2 U1232 ( .A(n1106), .Y(n709) );
  AOI22X1 U1233 ( .A(n1202), .B(n1222), .C(n1108), .D(n1219), .Y(n1223) );
  INVX2 U1234 ( .A(n557), .Y(n673) );
  INVX1 U1235 ( .A(n177), .Y(n284) );
  INVX1 U1236 ( .A(n171), .Y(n173) );
  INVX1 U1237 ( .A(n194), .Y(n287) );
  INVX4 U1238 ( .A(n18), .Y(n1231) );
  INVX1 U1239 ( .A(n1098), .Y(n156) );
  INVX1 U1240 ( .A(n1214), .Y(n155) );
  INVX8 U1241 ( .A(a[15]), .Y(n917) );
  INVX8 U1242 ( .A(n1231), .Y(n1233) );
  INVX8 U1243 ( .A(n1244), .Y(n1245) );
  INVX8 U1244 ( .A(n1261), .Y(n1262) );
  INVX8 U1245 ( .A(n1263), .Y(n1264) );
  INVX8 U1246 ( .A(n1279), .Y(n1280) );
  INVX8 U1247 ( .A(n1281), .Y(n1282) );
  INVX8 U1248 ( .A(n1283), .Y(n1285) );
  INVX8 U1249 ( .A(n1295), .Y(n1294) );
  INVX8 U1250 ( .A(n19), .Y(n1298) );
  INVX2 U1251 ( .A(n101), .Y(n99) );
  INVX2 U1252 ( .A(n94), .Y(n92) );
  INVX2 U1253 ( .A(n79), .Y(n77) );
  INVX2 U1254 ( .A(n1280), .Y(n728) );
  INVX2 U1255 ( .A(n877), .Y(n726) );
  OAI22X1 U1256 ( .A(n917), .B(n1290), .C(n6), .D(n1290), .Y(n563) );
  OAI22X1 U1257 ( .A(n1226), .B(n1120), .C(n1120), .D(n1071), .Y(n560) );
  OAI22X1 U1258 ( .A(n1230), .B(n1295), .C(n1233), .D(n1295), .Y(n557) );
  OAI22X1 U1259 ( .A(n1235), .B(n1216), .C(n1238), .D(n1216), .Y(n554) );
  OAI22X1 U1260 ( .A(n1240), .B(n1221), .C(n1208), .D(n1221), .Y(n551) );
  OAI22X1 U1261 ( .A(n1243), .B(n1077), .C(n1146), .D(n1076), .Y(n548) );
  INVX2 U1262 ( .A(n1246), .Y(n546) );
  OAI22X1 U1263 ( .A(n1246), .B(n1304), .C(n1249), .D(n1304), .Y(n545) );
  OAI22X1 U1264 ( .A(n1041), .B(n918), .C(n1252), .D(n918), .Y(n542) );
  INVX2 U1265 ( .A(n385), .Y(n386) );
  INVX2 U1266 ( .A(n337), .Y(n338) );
  INVX2 U1267 ( .A(n319), .Y(n320) );
  INVX2 U1268 ( .A(n305), .Y(n306) );
  INVX2 U1269 ( .A(n295), .Y(n296) );
  INVX2 U1270 ( .A(n130), .Y(n279) );
  INVX2 U1271 ( .A(n93), .Y(n91) );
  INVX2 U1272 ( .A(n84), .Y(n275) );
  INVX2 U1273 ( .A(n211), .Y(n209) );
  INVX2 U1274 ( .A(n183), .Y(n181) );
  INVX2 U1275 ( .A(n182), .Y(n285) );
  INVX2 U1276 ( .A(n149), .Y(n151) );
  INVX2 U1277 ( .A(n144), .Y(n142) );
  INVX2 U1278 ( .A(n129), .Y(n127) );
  INVX2 U1279 ( .A(n122), .Y(n120) );
  INVX2 U1280 ( .A(n111), .Y(n109) );
  INVX2 U1281 ( .A(n105), .Y(n103) );
  INVX2 U1282 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n24, src1_data[14], 
        n33, n18, n22, n14, n20, n4, n9, n3, src1_data[5:4], n12, n8, 
        src1_data[1:0]}), .B({src2_data[16], src2_data[16:13], n11, n6, n17, 
        n16, n7, n1, src2_data[6:1], n31}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n24, src1_data[14], 
        n33, n18, n22, n14, n20, n4, n9, n3, src1_data[5:4], n12, n8, 
        src1_data[1:0]}), .B({src2_data[16], src2_data[16:13], n11, n6, n17, 
        n16, n7, n1, src2_data[6:5], n2, src2_data[3], n5, n23, n31}), .CI(
        1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b({src2_data[15:2], n23, n31}), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  BUFX2 U3 ( .A(src2_data[7]), .Y(n1) );
  BUFX2 U4 ( .A(src2_data[4]), .Y(n2) );
  BUFX2 U6 ( .A(src1_data[6]), .Y(n3) );
  BUFX2 U7 ( .A(src1_data[8]), .Y(n4) );
  BUFX2 U9 ( .A(src2_data[2]), .Y(n5) );
  BUFX2 U10 ( .A(src2_data[11]), .Y(n6) );
  BUFX2 U11 ( .A(src2_data[8]), .Y(n7) );
  BUFX2 U12 ( .A(src1_data[2]), .Y(n8) );
  BUFX2 U13 ( .A(src1_data[7]), .Y(n9) );
  INVX1 U14 ( .A(src2_data[12]), .Y(n10) );
  INVX2 U15 ( .A(n10), .Y(n11) );
  BUFX2 U16 ( .A(src1_data[3]), .Y(n12) );
  INVX1 U17 ( .A(src1_data[10]), .Y(n13) );
  INVX2 U18 ( .A(n13), .Y(n14) );
  INVX1 U19 ( .A(src2_data[9]), .Y(n15) );
  INVX2 U20 ( .A(n15), .Y(n16) );
  BUFX2 U21 ( .A(src2_data[10]), .Y(n17) );
  BUFX2 U22 ( .A(src1_data[12]), .Y(n18) );
  INVX1 U23 ( .A(src1_data[9]), .Y(n19) );
  INVX2 U24 ( .A(n19), .Y(n20) );
  INVX1 U25 ( .A(src1_data[13]), .Y(n34) );
  INVX1 U26 ( .A(src1_data[11]), .Y(n21) );
  INVX2 U27 ( .A(n21), .Y(n22) );
  BUFX4 U28 ( .A(src2_data[1]), .Y(n23) );
  INVX4 U29 ( .A(n32), .Y(n31) );
  INVX2 U30 ( .A(n34), .Y(n33) );
  BUFX2 U31 ( .A(src1_data[15]), .Y(n24) );
  OR2X1 U32 ( .A(n37), .B(n75), .Y(n25) );
  NAND2X1 U33 ( .A(n25), .B(n36), .Y(overflow) );
  INVX2 U34 ( .A(n75), .Y(n70) );
  AND2X2 U35 ( .A(n39), .B(n38), .Y(n26) );
  AND2X2 U36 ( .A(alu_op[1]), .B(n38), .Y(n29) );
  AND2X2 U37 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n30) );
  INVX2 U38 ( .A(src2_data[0]), .Y(n32) );
  INVX2 U39 ( .A(large_sum[16]), .Y(n74) );
  XOR2X1 U40 ( .A(n74), .B(large_sum[17]), .Y(n37) );
  INVX2 U41 ( .A(alu_op[1]), .Y(n39) );
  NAND2X1 U42 ( .A(alu_op[0]), .B(n39), .Y(n75) );
  INVX2 U43 ( .A(alu_op[0]), .Y(n38) );
  XOR2X1 U44 ( .A(large_dif[16]), .B(large_dif[17]), .Y(n35) );
  AOI22X1 U45 ( .A(N26), .B(n30), .C(n35), .D(n29), .Y(n36) );
  AOI22X1 U46 ( .A(src1_data[0]), .B(n26), .C(full_mult[30]), .D(n30), .Y(n41)
         );
  AOI22X1 U47 ( .A(large_dif[0]), .B(n29), .C(large_sum[0]), .D(n70), .Y(n40)
         );
  NAND2X1 U48 ( .A(n41), .B(n40), .Y(result[0]) );
  AOI22X1 U49 ( .A(src1_data[1]), .B(n26), .C(full_mult[31]), .D(n30), .Y(n43)
         );
  AOI22X1 U50 ( .A(large_dif[1]), .B(n29), .C(large_sum[1]), .D(n70), .Y(n42)
         );
  NAND2X1 U51 ( .A(n43), .B(n42), .Y(result[1]) );
  AOI22X1 U52 ( .A(n8), .B(n26), .C(full_mult[32]), .D(n30), .Y(n45) );
  AOI22X1 U53 ( .A(large_dif[2]), .B(n29), .C(large_sum[2]), .D(n70), .Y(n44)
         );
  NAND2X1 U54 ( .A(n45), .B(n44), .Y(result[2]) );
  AOI22X1 U55 ( .A(n12), .B(n26), .C(full_mult[33]), .D(n30), .Y(n47) );
  AOI22X1 U56 ( .A(large_dif[3]), .B(n29), .C(large_sum[3]), .D(n70), .Y(n46)
         );
  NAND2X1 U57 ( .A(n47), .B(n46), .Y(result[3]) );
  AOI22X1 U58 ( .A(src1_data[4]), .B(n26), .C(full_mult[34]), .D(n30), .Y(n49)
         );
  AOI22X1 U59 ( .A(large_dif[4]), .B(n29), .C(large_sum[4]), .D(n70), .Y(n48)
         );
  NAND2X1 U60 ( .A(n49), .B(n48), .Y(result[4]) );
  AOI22X1 U61 ( .A(src1_data[5]), .B(n26), .C(full_mult[35]), .D(n30), .Y(n51)
         );
  AOI22X1 U62 ( .A(large_dif[5]), .B(n29), .C(large_sum[5]), .D(n70), .Y(n50)
         );
  NAND2X1 U63 ( .A(n51), .B(n50), .Y(result[5]) );
  AOI22X1 U64 ( .A(n3), .B(n26), .C(full_mult[36]), .D(n30), .Y(n53) );
  AOI22X1 U65 ( .A(large_dif[6]), .B(n29), .C(large_sum[6]), .D(n70), .Y(n52)
         );
  NAND2X1 U66 ( .A(n53), .B(n52), .Y(result[6]) );
  AOI22X1 U67 ( .A(n9), .B(n26), .C(full_mult[37]), .D(n30), .Y(n55) );
  AOI22X1 U68 ( .A(large_dif[7]), .B(n29), .C(large_sum[7]), .D(n70), .Y(n54)
         );
  NAND2X1 U69 ( .A(n55), .B(n54), .Y(result[7]) );
  AOI22X1 U70 ( .A(n4), .B(n26), .C(full_mult[38]), .D(n30), .Y(n57) );
  AOI22X1 U71 ( .A(large_dif[8]), .B(n29), .C(large_sum[8]), .D(n70), .Y(n56)
         );
  NAND2X1 U72 ( .A(n57), .B(n56), .Y(result[8]) );
  AOI22X1 U73 ( .A(n20), .B(n26), .C(full_mult[39]), .D(n30), .Y(n59) );
  AOI22X1 U74 ( .A(large_dif[9]), .B(n29), .C(large_sum[9]), .D(n70), .Y(n58)
         );
  NAND2X1 U75 ( .A(n59), .B(n58), .Y(result[9]) );
  AOI22X1 U76 ( .A(n14), .B(n26), .C(full_mult[40]), .D(n30), .Y(n61) );
  AOI22X1 U77 ( .A(large_dif[10]), .B(n29), .C(large_sum[10]), .D(n70), .Y(n60) );
  NAND2X1 U78 ( .A(n60), .B(n61), .Y(result[10]) );
  AOI22X1 U79 ( .A(n22), .B(n26), .C(full_mult[41]), .D(n30), .Y(n63) );
  AOI22X1 U80 ( .A(large_dif[11]), .B(n29), .C(large_sum[11]), .D(n70), .Y(n62) );
  NAND2X1 U81 ( .A(n63), .B(n62), .Y(result[11]) );
  AOI22X1 U82 ( .A(n18), .B(n26), .C(full_mult[42]), .D(n30), .Y(n65) );
  AOI22X1 U83 ( .A(large_dif[12]), .B(n29), .C(large_sum[12]), .D(n70), .Y(n64) );
  NAND2X1 U84 ( .A(n65), .B(n64), .Y(result[12]) );
  AOI22X1 U85 ( .A(n33), .B(n26), .C(full_mult[43]), .D(n30), .Y(n67) );
  AOI22X1 U86 ( .A(large_dif[13]), .B(n29), .C(large_sum[13]), .D(n70), .Y(n66) );
  NAND2X1 U87 ( .A(n66), .B(n67), .Y(result[13]) );
  AOI22X1 U88 ( .A(src1_data[14]), .B(n26), .C(full_mult[44]), .D(n30), .Y(n69) );
  AOI22X1 U89 ( .A(large_dif[14]), .B(n29), .C(large_sum[14]), .D(n70), .Y(n68) );
  NAND2X1 U90 ( .A(n69), .B(n68), .Y(result[14]) );
  AOI22X1 U91 ( .A(n24), .B(n26), .C(full_mult[45]), .D(n30), .Y(n72) );
  AOI22X1 U92 ( .A(large_dif[15]), .B(n29), .C(large_sum[15]), .D(n70), .Y(n71) );
  NAND2X1 U93 ( .A(n72), .B(n71), .Y(result[15]) );
  AOI22X1 U94 ( .A(src1_data[16]), .B(n26), .C(large_dif[16]), .D(n29), .Y(n73) );
  OAI21X1 U95 ( .A(n75), .B(n74), .C(n73), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n745, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n742), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n741), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n744), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n742), .Y(n10) );
  NOR2X1 U29 ( .A(n743), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n741), .B(n744), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n740), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n730, n728, 
        n726, n724, n722, n719, n717, n714, n711, n708, n705, n702, n699, n696, 
        n693, n690}), .current_value({n745, outreg_data[15:0]}) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n733), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n730, n57, 
        n726, n55, n53, n719, n51, n47, n49, n45, n704, n701, n698, n695, n692, 
        n690}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n733), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n730, n728, 
        n726, n724, n722, n719, n717, n714, n711, n708, n705, n702, n699, n696, 
        n693, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n734), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n730, n728, 
        n726, n724, n721, n719, n716, n713, n710, n707, n704, n701, n698, n695, 
        n692, n690}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n734), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n730, n728, 
        n726, n724, n722, n719, n717, n714, n711, n708, n705, n702, n699, n696, 
        n693, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n735), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n730, n58, 
        n726, n56, n54, n719, n52, n48, n50, n46, n704, n701, n698, n695, n692, 
        n690}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n735), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n730, n728, 
        n726, n724, n722, n719, n717, n714, n711, n708, n705, n702, n699, n696, 
        n693, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n736), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n730, n57, 
        n726, n55, n53, n719, n51, n47, n49, n45, n704, n701, n698, n695, n692, 
        n690}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n736), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n730, n58, 
        n726, n56, n54, n719, n52, n48, n50, n46, n705, n702, n699, n696, n693, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n737), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n730, n57, 
        n726, n55, n721, n719, n716, n713, n710, n707, n704, n701, n698, n695, 
        n692, n690}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n737), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n730, n57, 
        n726, n55, n53, n719, n51, n47, n49, n45, n705, n702, n699, n696, n693, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n738), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n730, n58, 
        n726, n56, n54, n719, n52, n48, n50, n46, n704, n701, n698, n695, n692, 
        n690}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n738), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n730, n58, 
        n726, n56, n721, n719, n716, n713, n710, n707, n705, n702, n699, n696, 
        n693, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n739), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n730, n57, 
        n726, n55, n53, n719, n51, n47, n49, n45, n704, n701, n698, n695, n692, 
        n690}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n739), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n730, n58, 
        n726, n56, n54, n719, n52, n48, n50, n46, n705, n702, n699, n696, n693, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n740), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n730, n58, 
        n726, n56, n721, n719, n716, n713, n710, n707, n704, n701, n698, n695, 
        n692, n690}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  INVX8 U2 ( .A(n655), .Y(n660) );
  INVX4 U3 ( .A(n84), .Y(n372) );
  INVX4 U4 ( .A(w_data[11]), .Y(n720) );
  INVX4 U5 ( .A(w_data[8]), .Y(n712) );
  INVX4 U31 ( .A(w_data[6]), .Y(n706) );
  BUFX2 U32 ( .A(n62), .Y(n18) );
  INVX4 U33 ( .A(n656), .Y(n659) );
  BUFX2 U34 ( .A(n654), .Y(n656) );
  INVX2 U35 ( .A(n421), .Y(n679) );
  INVX2 U36 ( .A(n422), .Y(n682) );
  INVX2 U37 ( .A(n417), .Y(n670) );
  INVX2 U38 ( .A(n416), .Y(n666) );
  INVX2 U39 ( .A(n420), .Y(n676) );
  BUFX2 U40 ( .A(n654), .Y(n655) );
  INVX4 U41 ( .A(n657), .Y(n658) );
  INVX2 U42 ( .A(n120), .Y(r1_data[2]) );
  INVX2 U43 ( .A(n188), .Y(r1_data[6]) );
  INVX2 U44 ( .A(n222), .Y(r1_data[8]) );
  INVX2 U45 ( .A(n239), .Y(r1_data[9]) );
  INVX2 U46 ( .A(n273), .Y(r1_data[11]) );
  INVX2 U47 ( .A(n290), .Y(r1_data[12]) );
  INVX2 U48 ( .A(n17), .Y(r2_data[14]) );
  INVX2 U49 ( .A(n85), .Y(n375) );
  INVX2 U50 ( .A(n688), .Y(n686) );
  INVX2 U51 ( .A(n154), .Y(r1_data[4]) );
  INVX2 U52 ( .A(n256), .Y(r1_data[10]) );
  INVX2 U53 ( .A(n341), .Y(r1_data[15]) );
  INVX2 U54 ( .A(w_data[10]), .Y(n718) );
  INVX2 U55 ( .A(w_data[13]), .Y(n725) );
  NAND2X1 U56 ( .A(n457), .B(n1), .Y(n2) );
  NAND2X1 U57 ( .A(n458), .B(n687), .Y(n3) );
  NAND2X1 U58 ( .A(n2), .B(n3), .Y(n4) );
  INVX1 U59 ( .A(n687), .Y(n1) );
  INVX2 U60 ( .A(n4), .Y(r2_data[3]) );
  NAND2X1 U61 ( .A(n611), .B(n14), .Y(n15) );
  NAND2X1 U62 ( .A(n612), .B(n686), .Y(n16) );
  NAND2X1 U63 ( .A(n15), .B(n16), .Y(n17) );
  INVX1 U64 ( .A(n686), .Y(n14) );
  BUFX4 U65 ( .A(n62), .Y(n19) );
  BUFX2 U66 ( .A(n397), .Y(n20) );
  BUFX4 U67 ( .A(n397), .Y(n21) );
  BUFX2 U68 ( .A(n63), .Y(n22) );
  BUFX4 U69 ( .A(n63), .Y(n23) );
  INVX2 U70 ( .A(n389), .Y(n390) );
  INVX2 U71 ( .A(n377), .Y(n33) );
  INVX2 U72 ( .A(n372), .Y(n61) );
  INVX8 U73 ( .A(n718), .Y(n719) );
  INVX4 U74 ( .A(n307), .Y(r1_data[13]) );
  INVX4 U75 ( .A(n38), .Y(r2_data[15]) );
  BUFX2 U76 ( .A(N10), .Y(n24) );
  BUFX2 U77 ( .A(n398), .Y(n35) );
  INVX2 U78 ( .A(n64), .Y(n25) );
  NAND3X1 U79 ( .A(n41), .B(n647), .C(N14), .Y(n26) );
  NAND2X1 U80 ( .A(n27), .B(n28), .Y(n29) );
  NAND2X1 U81 ( .A(n29), .B(n282), .Y(n281) );
  INVX2 U82 ( .A(\regs_matrix[3][11] ), .Y(n27) );
  INVX2 U83 ( .A(n395), .Y(n28) );
  INVX4 U84 ( .A(n670), .Y(n671) );
  INVX2 U85 ( .A(n386), .Y(n30) );
  INVX1 U86 ( .A(n386), .Y(n31) );
  INVX4 U87 ( .A(n676), .Y(n677) );
  INVX8 U88 ( .A(n676), .Y(n678) );
  INVX1 U89 ( .A(n375), .Y(n32) );
  BUFX2 U90 ( .A(n383), .Y(n386) );
  INVX8 U91 ( .A(n729), .Y(n730) );
  INVX8 U92 ( .A(n725), .Y(n726) );
  INVX2 U93 ( .A(n137), .Y(r1_data[3]) );
  INVX4 U94 ( .A(n377), .Y(n34) );
  BUFX4 U95 ( .A(n398), .Y(n36) );
  INVX2 U96 ( .A(n358), .Y(n398) );
  INVX4 U97 ( .A(n670), .Y(n672) );
  INVX4 U98 ( .A(n205), .Y(r1_data[7]) );
  INVX1 U99 ( .A(n89), .Y(n379) );
  INVX4 U100 ( .A(n171), .Y(r1_data[5]) );
  BUFX2 U101 ( .A(N11), .Y(n37) );
  INVX2 U102 ( .A(N15), .Y(n647) );
  INVX4 U103 ( .A(n670), .Y(n673) );
  INVX2 U104 ( .A(n66), .Y(n38) );
  INVX4 U105 ( .A(n682), .Y(n683) );
  INVX2 U106 ( .A(n358), .Y(n397) );
  BUFX4 U107 ( .A(n654), .Y(n657) );
  INVX2 U108 ( .A(N11), .Y(n40) );
  INVX4 U109 ( .A(n324), .Y(r1_data[14]) );
  BUFX4 U110 ( .A(N16), .Y(n41) );
  AND2X2 U111 ( .A(n70), .B(n368), .Y(n42) );
  INVX2 U112 ( .A(n42), .Y(n102) );
  BUFX2 U113 ( .A(n64), .Y(n43) );
  INVX4 U114 ( .A(n103), .Y(r1_data[1]) );
  INVX4 U115 ( .A(n69), .Y(n675) );
  INVX4 U116 ( .A(n682), .Y(n684) );
  INVX4 U117 ( .A(n666), .Y(n667) );
  INVX4 U118 ( .A(n666), .Y(n668) );
  INVX4 U119 ( .A(n666), .Y(n669) );
  INVX4 U120 ( .A(n682), .Y(n685) );
  BUFX2 U121 ( .A(n32), .Y(n44) );
  INVX2 U122 ( .A(n706), .Y(n45) );
  INVX2 U123 ( .A(n706), .Y(n46) );
  INVX2 U124 ( .A(n712), .Y(n47) );
  INVX2 U125 ( .A(n712), .Y(n48) );
  INVX2 U126 ( .A(n709), .Y(n49) );
  INVX2 U127 ( .A(n709), .Y(n50) );
  INVX4 U128 ( .A(w_data[7]), .Y(n709) );
  INVX2 U129 ( .A(n715), .Y(n51) );
  INVX2 U130 ( .A(n715), .Y(n52) );
  INVX4 U131 ( .A(w_data[9]), .Y(n715) );
  INVX4 U132 ( .A(w_data[15]), .Y(n729) );
  INVX2 U133 ( .A(n720), .Y(n53) );
  INVX2 U134 ( .A(n720), .Y(n54) );
  INVX2 U135 ( .A(n723), .Y(n55) );
  INVX2 U136 ( .A(n723), .Y(n56) );
  INVX4 U137 ( .A(w_data[12]), .Y(n723) );
  INVX2 U138 ( .A(n727), .Y(n57) );
  INVX2 U139 ( .A(n727), .Y(n58) );
  INVX4 U140 ( .A(w_data[14]), .Y(n727) );
  NAND2X1 U141 ( .A(n70), .B(n368), .Y(n59) );
  INVX2 U142 ( .A(n372), .Y(n60) );
  INVX2 U143 ( .A(n679), .Y(n62) );
  INVX2 U144 ( .A(n679), .Y(n63) );
  INVX1 U145 ( .A(n384), .Y(n64) );
  INVX2 U146 ( .A(n372), .Y(n65) );
  INVX8 U147 ( .A(n69), .Y(n674) );
  INVX4 U148 ( .A(n663), .Y(n664) );
  INVX8 U149 ( .A(n662), .Y(n665) );
  INVX2 U150 ( .A(N17), .Y(n688) );
  MUX2X1 U151 ( .B(n67), .A(n68), .S(n687), .Y(n66) );
  NAND2X1 U152 ( .A(n631), .B(n632), .Y(n67) );
  NAND2X1 U153 ( .A(n625), .B(n626), .Y(n68) );
  INVX2 U154 ( .A(w_data[4]), .Y(n700) );
  INVX2 U155 ( .A(w_data[3]), .Y(n697) );
  INVX2 U156 ( .A(w_data[2]), .Y(n694) );
  INVX2 U157 ( .A(w_data[5]), .Y(n703) );
  INVX2 U158 ( .A(w_data[1]), .Y(n691) );
  INVX2 U159 ( .A(w_data[0]), .Y(n689) );
  AND2X2 U160 ( .A(n652), .B(n648), .Y(n69) );
  INVX2 U161 ( .A(n679), .Y(n681) );
  INVX2 U162 ( .A(n679), .Y(n680) );
  INVX2 U163 ( .A(n372), .Y(n374) );
  BUFX2 U164 ( .A(n661), .Y(n663) );
  INVX2 U165 ( .A(n372), .Y(n373) );
  BUFX2 U166 ( .A(n661), .Y(n662) );
  INVX2 U167 ( .A(n414), .Y(n654) );
  INVX2 U168 ( .A(N12), .Y(n368) );
  AND2X2 U169 ( .A(N10), .B(N11), .Y(n70) );
  INVX2 U170 ( .A(n415), .Y(n661) );
  INVX2 U171 ( .A(n688), .Y(n687) );
  INVX2 U172 ( .A(n720), .Y(n722) );
  INVX2 U173 ( .A(n720), .Y(n721) );
  INVX2 U174 ( .A(n723), .Y(n724) );
  INVX2 U175 ( .A(n727), .Y(n728) );
  INVX2 U176 ( .A(n715), .Y(n717) );
  INVX2 U177 ( .A(n715), .Y(n716) );
  INVX2 U178 ( .A(n709), .Y(n711) );
  INVX2 U179 ( .A(n709), .Y(n710) );
  INVX2 U180 ( .A(n712), .Y(n714) );
  INVX2 U181 ( .A(n706), .Y(n708) );
  INVX2 U182 ( .A(n712), .Y(n713) );
  INVX2 U183 ( .A(n706), .Y(n707) );
  INVX2 U184 ( .A(n700), .Y(n702) );
  INVX2 U185 ( .A(n700), .Y(n701) );
  INVX2 U186 ( .A(n697), .Y(n699) );
  INVX2 U187 ( .A(n694), .Y(n696) );
  INVX2 U188 ( .A(n697), .Y(n698) );
  INVX2 U189 ( .A(n694), .Y(n695) );
  INVX2 U190 ( .A(n703), .Y(n705) );
  INVX2 U191 ( .A(n703), .Y(n704) );
  INVX2 U192 ( .A(n691), .Y(n693) );
  INVX2 U193 ( .A(n691), .Y(n692) );
  INVX2 U194 ( .A(n689), .Y(n690) );
  INVX2 U195 ( .A(n732), .Y(outreg_data[16]) );
  INVX2 U196 ( .A(n745), .Y(n732) );
  BUFX2 U197 ( .A(n_reset), .Y(n733) );
  BUFX2 U198 ( .A(n_reset), .Y(n734) );
  BUFX2 U199 ( .A(n_reset), .Y(n735) );
  BUFX2 U200 ( .A(n_reset), .Y(n736) );
  BUFX2 U201 ( .A(n_reset), .Y(n737) );
  BUFX2 U202 ( .A(n_reset), .Y(n738) );
  BUFX2 U203 ( .A(n_reset), .Y(n739) );
  BUFX2 U204 ( .A(n_reset), .Y(n740) );
  AOI22X1 U205 ( .A(n74), .B(n73), .C(n72), .D(n71), .Y(n75) );
  INVX2 U206 ( .A(N13), .Y(n76) );
  INVX2 U207 ( .A(n75), .Y(r1_data[16]) );
  AOI22X1 U208 ( .A(n78), .B(n79), .C(n80), .D(n81), .Y(n77) );
  NOR2X1 U209 ( .A(n83), .B(n82), .Y(n81) );
  OAI22X1 U210 ( .A(\regs_matrix[6][0] ), .B(n60), .C(outreg_data[0]), .D(n376), .Y(n83) );
  OAI21X1 U211 ( .A(\regs_matrix[4][0] ), .B(n378), .C(n76), .Y(n82) );
  NOR2X1 U212 ( .A(n88), .B(n87), .Y(n80) );
  OAI21X1 U213 ( .A(\regs_matrix[7][0] ), .B(n399), .C(n90), .Y(n88) );
  AOI22X1 U214 ( .A(n398), .B(n91), .C(n42), .D(n92), .Y(n90) );
  INVX2 U215 ( .A(\regs_matrix[3][0] ), .Y(n92) );
  INVX2 U216 ( .A(\regs_matrix[1][0] ), .Y(n91) );
  OAI22X1 U217 ( .A(\regs_matrix[2][0] ), .B(n30), .C(\regs_matrix[5][0] ), 
        .D(n391), .Y(n87) );
  NOR2X1 U218 ( .A(n95), .B(n96), .Y(n79) );
  OAI22X1 U219 ( .A(\regs_matrix[14][0] ), .B(n61), .C(\regs_matrix[8][0] ), 
        .D(n376), .Y(n96) );
  OAI21X1 U220 ( .A(\regs_matrix[12][0] ), .B(n33), .C(N13), .Y(n95) );
  NOR2X1 U221 ( .A(n97), .B(n98), .Y(n78) );
  OAI21X1 U222 ( .A(\regs_matrix[15][0] ), .B(n380), .C(n99), .Y(n98) );
  AOI22X1 U223 ( .A(n382), .B(n100), .C(n392), .D(n101), .Y(n99) );
  INVX2 U224 ( .A(\regs_matrix[11][0] ), .Y(n101) );
  INVX2 U225 ( .A(\regs_matrix[9][0] ), .Y(n100) );
  OAI22X1 U226 ( .A(\regs_matrix[10][0] ), .B(n64), .C(\regs_matrix[13][0] ), 
        .D(n390), .Y(n97) );
  AOI22X1 U227 ( .A(n104), .B(n105), .C(n106), .D(n107), .Y(n103) );
  NOR2X1 U228 ( .A(n108), .B(n109), .Y(n107) );
  OAI22X1 U229 ( .A(outreg_data[1]), .B(n376), .C(\regs_matrix[2][1] ), .D(
        n388), .Y(n109) );
  OAI22X1 U230 ( .A(\regs_matrix[4][1] ), .B(n34), .C(\regs_matrix[6][1] ), 
        .D(n65), .Y(n108) );
  NOR2X1 U231 ( .A(n110), .B(n111), .Y(n106) );
  OAI21X1 U232 ( .A(\regs_matrix[3][1] ), .B(n395), .C(n112), .Y(n111) );
  AOI21X1 U233 ( .A(n20), .B(n113), .C(N13), .Y(n112) );
  INVX2 U234 ( .A(\regs_matrix[1][1] ), .Y(n113) );
  OAI22X1 U235 ( .A(\regs_matrix[5][1] ), .B(n391), .C(\regs_matrix[7][1] ), 
        .D(n400), .Y(n110) );
  NOR2X1 U236 ( .A(n114), .B(n115), .Y(n105) );
  OAI22X1 U237 ( .A(\regs_matrix[8][1] ), .B(n44), .C(\regs_matrix[10][1] ), 
        .D(n43), .Y(n115) );
  OAI22X1 U238 ( .A(\regs_matrix[12][1] ), .B(n33), .C(\regs_matrix[14][1] ), 
        .D(n61), .Y(n114) );
  NOR2X1 U239 ( .A(n116), .B(n117), .Y(n104) );
  OAI21X1 U240 ( .A(\regs_matrix[11][1] ), .B(n393), .C(n118), .Y(n117) );
  AOI21X1 U241 ( .A(n382), .B(n119), .C(n76), .Y(n118) );
  INVX2 U242 ( .A(\regs_matrix[9][1] ), .Y(n119) );
  OAI22X1 U243 ( .A(\regs_matrix[13][1] ), .B(n390), .C(\regs_matrix[15][1] ), 
        .D(n380), .Y(n116) );
  AOI22X1 U244 ( .A(n121), .B(n122), .C(n123), .D(n124), .Y(n120) );
  NOR2X1 U245 ( .A(n125), .B(n126), .Y(n124) );
  OAI22X1 U246 ( .A(outreg_data[2]), .B(n376), .C(\regs_matrix[2][2] ), .D(
        n388), .Y(n126) );
  OAI22X1 U247 ( .A(\regs_matrix[4][2] ), .B(n378), .C(\regs_matrix[6][2] ), 
        .D(n374), .Y(n125) );
  NOR2X1 U248 ( .A(n127), .B(n128), .Y(n123) );
  OAI21X1 U249 ( .A(\regs_matrix[3][2] ), .B(n102), .C(n129), .Y(n128) );
  AOI21X1 U250 ( .A(n21), .B(n130), .C(N13), .Y(n129) );
  INVX2 U251 ( .A(\regs_matrix[1][2] ), .Y(n130) );
  OAI22X1 U252 ( .A(\regs_matrix[5][2] ), .B(n391), .C(\regs_matrix[7][2] ), 
        .D(n402), .Y(n127) );
  NOR2X1 U253 ( .A(n131), .B(n132), .Y(n122) );
  OAI22X1 U254 ( .A(\regs_matrix[8][2] ), .B(n44), .C(\regs_matrix[10][2] ), 
        .D(n43), .Y(n132) );
  OAI22X1 U255 ( .A(\regs_matrix[12][2] ), .B(n33), .C(\regs_matrix[14][2] ), 
        .D(n61), .Y(n131) );
  NOR2X1 U256 ( .A(n133), .B(n134), .Y(n121) );
  OAI21X1 U257 ( .A(\regs_matrix[11][2] ), .B(n393), .C(n135), .Y(n134) );
  AOI21X1 U258 ( .A(n382), .B(n136), .C(n76), .Y(n135) );
  INVX2 U259 ( .A(\regs_matrix[9][2] ), .Y(n136) );
  OAI22X1 U260 ( .A(\regs_matrix[13][2] ), .B(n390), .C(\regs_matrix[15][2] ), 
        .D(n380), .Y(n133) );
  AOI22X1 U261 ( .A(n138), .B(n139), .C(n140), .D(n141), .Y(n137) );
  NOR2X1 U262 ( .A(n142), .B(n143), .Y(n141) );
  OAI22X1 U263 ( .A(outreg_data[3]), .B(n376), .C(\regs_matrix[2][3] ), .D(
        n388), .Y(n143) );
  OAI22X1 U264 ( .A(\regs_matrix[4][3] ), .B(n378), .C(\regs_matrix[6][3] ), 
        .D(n374), .Y(n142) );
  NOR2X1 U265 ( .A(n145), .B(n144), .Y(n140) );
  OAI21X1 U266 ( .A(\regs_matrix[3][3] ), .B(n395), .C(n146), .Y(n145) );
  AOI21X1 U267 ( .A(n20), .B(n147), .C(N13), .Y(n146) );
  INVX2 U268 ( .A(\regs_matrix[1][3] ), .Y(n147) );
  OAI22X1 U269 ( .A(\regs_matrix[5][3] ), .B(n391), .C(\regs_matrix[7][3] ), 
        .D(n402), .Y(n144) );
  NOR2X1 U270 ( .A(n148), .B(n149), .Y(n139) );
  OAI22X1 U271 ( .A(\regs_matrix[8][3] ), .B(n44), .C(\regs_matrix[10][3] ), 
        .D(n43), .Y(n149) );
  OAI22X1 U272 ( .A(\regs_matrix[12][3] ), .B(n33), .C(\regs_matrix[14][3] ), 
        .D(n61), .Y(n148) );
  NOR2X1 U273 ( .A(n150), .B(n151), .Y(n138) );
  OAI21X1 U274 ( .A(\regs_matrix[11][3] ), .B(n393), .C(n152), .Y(n151) );
  AOI21X1 U275 ( .A(n382), .B(n153), .C(n76), .Y(n152) );
  INVX2 U276 ( .A(\regs_matrix[9][3] ), .Y(n153) );
  OAI22X1 U277 ( .A(\regs_matrix[13][3] ), .B(n390), .C(\regs_matrix[15][3] ), 
        .D(n380), .Y(n150) );
  AOI22X1 U278 ( .A(n155), .B(n156), .C(n157), .D(n158), .Y(n154) );
  NOR2X1 U279 ( .A(n159), .B(n160), .Y(n158) );
  OAI22X1 U280 ( .A(outreg_data[4]), .B(n376), .C(\regs_matrix[2][4] ), .D(
        n387), .Y(n160) );
  OAI22X1 U281 ( .A(\regs_matrix[4][4] ), .B(n34), .C(\regs_matrix[6][4] ), 
        .D(n65), .Y(n159) );
  NOR2X1 U282 ( .A(n161), .B(n162), .Y(n157) );
  OAI21X1 U283 ( .A(\regs_matrix[3][4] ), .B(n396), .C(n163), .Y(n162) );
  AOI21X1 U284 ( .A(n36), .B(n164), .C(N13), .Y(n163) );
  INVX2 U285 ( .A(\regs_matrix[1][4] ), .Y(n164) );
  OAI22X1 U286 ( .A(\regs_matrix[5][4] ), .B(n391), .C(\regs_matrix[7][4] ), 
        .D(n400), .Y(n161) );
  NOR2X1 U287 ( .A(n165), .B(n166), .Y(n156) );
  OAI22X1 U288 ( .A(\regs_matrix[8][4] ), .B(n32), .C(\regs_matrix[10][4] ), 
        .D(n43), .Y(n166) );
  OAI22X1 U289 ( .A(\regs_matrix[12][4] ), .B(n33), .C(\regs_matrix[14][4] ), 
        .D(n61), .Y(n165) );
  NOR2X1 U290 ( .A(n167), .B(n168), .Y(n155) );
  OAI21X1 U291 ( .A(\regs_matrix[11][4] ), .B(n393), .C(n169), .Y(n168) );
  AOI21X1 U292 ( .A(n382), .B(n170), .C(n76), .Y(n169) );
  INVX2 U293 ( .A(\regs_matrix[9][4] ), .Y(n170) );
  OAI22X1 U294 ( .A(\regs_matrix[13][4] ), .B(n390), .C(\regs_matrix[15][4] ), 
        .D(n380), .Y(n167) );
  AOI22X1 U295 ( .A(n172), .B(n173), .C(n174), .D(n175), .Y(n171) );
  NOR2X1 U296 ( .A(n176), .B(n177), .Y(n175) );
  OAI22X1 U297 ( .A(outreg_data[5]), .B(n376), .C(\regs_matrix[2][5] ), .D(
        n388), .Y(n177) );
  OAI22X1 U298 ( .A(\regs_matrix[4][5] ), .B(n378), .C(\regs_matrix[6][5] ), 
        .D(n60), .Y(n176) );
  NOR2X1 U299 ( .A(n178), .B(n179), .Y(n174) );
  OAI21X1 U300 ( .A(\regs_matrix[3][5] ), .B(n59), .C(n180), .Y(n179) );
  AOI21X1 U301 ( .A(n21), .B(n181), .C(N13), .Y(n180) );
  INVX2 U302 ( .A(\regs_matrix[1][5] ), .Y(n181) );
  OAI22X1 U303 ( .A(\regs_matrix[5][5] ), .B(n391), .C(\regs_matrix[7][5] ), 
        .D(n401), .Y(n178) );
  NOR2X1 U304 ( .A(n182), .B(n183), .Y(n173) );
  OAI22X1 U305 ( .A(\regs_matrix[8][5] ), .B(n44), .C(\regs_matrix[10][5] ), 
        .D(n43), .Y(n183) );
  OAI22X1 U306 ( .A(\regs_matrix[12][5] ), .B(n33), .C(\regs_matrix[14][5] ), 
        .D(n61), .Y(n182) );
  NOR2X1 U307 ( .A(n184), .B(n185), .Y(n172) );
  OAI21X1 U308 ( .A(\regs_matrix[11][5] ), .B(n393), .C(n186), .Y(n185) );
  AOI21X1 U309 ( .A(n382), .B(n187), .C(n76), .Y(n186) );
  INVX2 U310 ( .A(\regs_matrix[9][5] ), .Y(n187) );
  OAI22X1 U311 ( .A(\regs_matrix[13][5] ), .B(n390), .C(\regs_matrix[15][5] ), 
        .D(n380), .Y(n184) );
  AOI22X1 U312 ( .A(n189), .B(n190), .C(n191), .D(n192), .Y(n188) );
  NOR2X1 U313 ( .A(n193), .B(n194), .Y(n192) );
  OAI22X1 U314 ( .A(outreg_data[6]), .B(n376), .C(\regs_matrix[2][6] ), .D(
        n388), .Y(n194) );
  OAI22X1 U315 ( .A(\regs_matrix[4][6] ), .B(n378), .C(\regs_matrix[6][6] ), 
        .D(n373), .Y(n193) );
  NOR2X1 U316 ( .A(n195), .B(n196), .Y(n191) );
  OAI21X1 U317 ( .A(\regs_matrix[3][6] ), .B(n396), .C(n197), .Y(n196) );
  AOI21X1 U318 ( .A(n21), .B(n198), .C(N13), .Y(n197) );
  INVX2 U319 ( .A(\regs_matrix[1][6] ), .Y(n198) );
  OAI22X1 U320 ( .A(\regs_matrix[5][6] ), .B(n391), .C(\regs_matrix[7][6] ), 
        .D(n401), .Y(n195) );
  NOR2X1 U321 ( .A(n199), .B(n200), .Y(n190) );
  OAI22X1 U322 ( .A(\regs_matrix[8][6] ), .B(n44), .C(\regs_matrix[10][6] ), 
        .D(n43), .Y(n200) );
  OAI22X1 U323 ( .A(\regs_matrix[12][6] ), .B(n33), .C(\regs_matrix[14][6] ), 
        .D(n61), .Y(n199) );
  NOR2X1 U324 ( .A(n201), .B(n202), .Y(n189) );
  OAI21X1 U325 ( .A(\regs_matrix[11][6] ), .B(n393), .C(n203), .Y(n202) );
  AOI21X1 U326 ( .A(n382), .B(n204), .C(n76), .Y(n203) );
  INVX2 U327 ( .A(\regs_matrix[9][6] ), .Y(n204) );
  OAI22X1 U328 ( .A(\regs_matrix[13][6] ), .B(n390), .C(\regs_matrix[15][6] ), 
        .D(n380), .Y(n201) );
  AOI22X1 U329 ( .A(n206), .B(n207), .C(n208), .D(n209), .Y(n205) );
  NOR2X1 U330 ( .A(n210), .B(n211), .Y(n209) );
  OAI22X1 U331 ( .A(outreg_data[7]), .B(n376), .C(\regs_matrix[2][7] ), .D(
        n388), .Y(n211) );
  OAI22X1 U332 ( .A(\regs_matrix[4][7] ), .B(n378), .C(\regs_matrix[6][7] ), 
        .D(n60), .Y(n210) );
  NOR2X1 U333 ( .A(n212), .B(n213), .Y(n208) );
  OAI21X1 U334 ( .A(\regs_matrix[3][7] ), .B(n102), .C(n214), .Y(n213) );
  AOI21X1 U335 ( .A(n21), .B(n215), .C(N13), .Y(n214) );
  INVX2 U336 ( .A(\regs_matrix[1][7] ), .Y(n215) );
  OAI22X1 U337 ( .A(\regs_matrix[5][7] ), .B(n391), .C(\regs_matrix[7][7] ), 
        .D(n401), .Y(n212) );
  NOR2X1 U338 ( .A(n216), .B(n217), .Y(n207) );
  OAI22X1 U339 ( .A(\regs_matrix[8][7] ), .B(n44), .C(\regs_matrix[10][7] ), 
        .D(n64), .Y(n217) );
  OAI22X1 U340 ( .A(\regs_matrix[12][7] ), .B(n33), .C(\regs_matrix[14][7] ), 
        .D(n61), .Y(n216) );
  NOR2X1 U341 ( .A(n218), .B(n219), .Y(n206) );
  OAI21X1 U342 ( .A(\regs_matrix[11][7] ), .B(n393), .C(n220), .Y(n219) );
  AOI21X1 U343 ( .A(n382), .B(n221), .C(n76), .Y(n220) );
  INVX2 U344 ( .A(\regs_matrix[9][7] ), .Y(n221) );
  OAI22X1 U345 ( .A(\regs_matrix[13][7] ), .B(n390), .C(\regs_matrix[15][7] ), 
        .D(n380), .Y(n218) );
  AOI22X1 U346 ( .A(n223), .B(n224), .C(n225), .D(n226), .Y(n222) );
  NOR2X1 U347 ( .A(n227), .B(n228), .Y(n226) );
  OAI22X1 U348 ( .A(outreg_data[8]), .B(n376), .C(\regs_matrix[2][8] ), .D(
        n387), .Y(n228) );
  OAI22X1 U349 ( .A(\regs_matrix[4][8] ), .B(n34), .C(\regs_matrix[6][8] ), 
        .D(n65), .Y(n227) );
  NOR2X1 U350 ( .A(n229), .B(n230), .Y(n225) );
  OAI21X1 U351 ( .A(\regs_matrix[3][8] ), .B(n396), .C(n231), .Y(n230) );
  AOI21X1 U352 ( .A(n35), .B(n232), .C(N13), .Y(n231) );
  INVX2 U353 ( .A(\regs_matrix[1][8] ), .Y(n232) );
  OAI22X1 U354 ( .A(\regs_matrix[5][8] ), .B(n391), .C(\regs_matrix[7][8] ), 
        .D(n89), .Y(n229) );
  NOR2X1 U355 ( .A(n233), .B(n234), .Y(n224) );
  OAI22X1 U356 ( .A(\regs_matrix[8][8] ), .B(n44), .C(\regs_matrix[10][8] ), 
        .D(n64), .Y(n234) );
  OAI22X1 U357 ( .A(\regs_matrix[12][8] ), .B(n33), .C(\regs_matrix[14][8] ), 
        .D(n61), .Y(n233) );
  NOR2X1 U358 ( .A(n235), .B(n236), .Y(n223) );
  OAI21X1 U359 ( .A(\regs_matrix[11][8] ), .B(n393), .C(n237), .Y(n236) );
  AOI21X1 U360 ( .A(n382), .B(n238), .C(n76), .Y(n237) );
  INVX2 U361 ( .A(\regs_matrix[9][8] ), .Y(n238) );
  OAI22X1 U362 ( .A(\regs_matrix[13][8] ), .B(n390), .C(\regs_matrix[15][8] ), 
        .D(n380), .Y(n235) );
  AOI22X1 U363 ( .A(n240), .B(n241), .C(n242), .D(n243), .Y(n239) );
  NOR2X1 U364 ( .A(n244), .B(n245), .Y(n243) );
  OAI22X1 U365 ( .A(outreg_data[9]), .B(n376), .C(\regs_matrix[2][9] ), .D(
        n387), .Y(n245) );
  OAI22X1 U366 ( .A(\regs_matrix[4][9] ), .B(n378), .C(\regs_matrix[6][9] ), 
        .D(n373), .Y(n244) );
  NOR2X1 U367 ( .A(n246), .B(n247), .Y(n242) );
  OAI21X1 U368 ( .A(\regs_matrix[3][9] ), .B(n59), .C(n248), .Y(n247) );
  AOI21X1 U369 ( .A(n35), .B(n249), .C(N13), .Y(n248) );
  INVX2 U370 ( .A(\regs_matrix[1][9] ), .Y(n249) );
  OAI22X1 U371 ( .A(\regs_matrix[5][9] ), .B(n391), .C(\regs_matrix[7][9] ), 
        .D(n402), .Y(n246) );
  NOR2X1 U372 ( .A(n250), .B(n251), .Y(n241) );
  OAI22X1 U373 ( .A(\regs_matrix[8][9] ), .B(n44), .C(\regs_matrix[10][9] ), 
        .D(n64), .Y(n251) );
  OAI22X1 U374 ( .A(\regs_matrix[12][9] ), .B(n33), .C(\regs_matrix[14][9] ), 
        .D(n61), .Y(n250) );
  NOR2X1 U375 ( .A(n252), .B(n253), .Y(n240) );
  OAI21X1 U376 ( .A(\regs_matrix[11][9] ), .B(n393), .C(n254), .Y(n253) );
  AOI21X1 U377 ( .A(n382), .B(n255), .C(n76), .Y(n254) );
  INVX2 U378 ( .A(\regs_matrix[9][9] ), .Y(n255) );
  OAI22X1 U379 ( .A(\regs_matrix[13][9] ), .B(n390), .C(\regs_matrix[15][9] ), 
        .D(n380), .Y(n252) );
  AOI22X1 U380 ( .A(n257), .B(n258), .C(n259), .D(n260), .Y(n256) );
  NOR2X1 U381 ( .A(n261), .B(n262), .Y(n260) );
  OAI22X1 U382 ( .A(outreg_data[10]), .B(n376), .C(\regs_matrix[2][10] ), .D(
        n387), .Y(n262) );
  OAI22X1 U383 ( .A(\regs_matrix[4][10] ), .B(n34), .C(\regs_matrix[6][10] ), 
        .D(n374), .Y(n261) );
  NOR2X1 U384 ( .A(n263), .B(n264), .Y(n259) );
  OAI21X1 U385 ( .A(\regs_matrix[3][10] ), .B(n59), .C(n265), .Y(n264) );
  AOI21X1 U386 ( .A(n36), .B(n266), .C(N13), .Y(n265) );
  INVX2 U387 ( .A(\regs_matrix[1][10] ), .Y(n266) );
  OAI22X1 U388 ( .A(\regs_matrix[5][10] ), .B(n391), .C(\regs_matrix[7][10] ), 
        .D(n399), .Y(n263) );
  NOR2X1 U389 ( .A(n267), .B(n268), .Y(n258) );
  OAI22X1 U390 ( .A(\regs_matrix[8][10] ), .B(n44), .C(\regs_matrix[10][10] ), 
        .D(n387), .Y(n268) );
  OAI22X1 U391 ( .A(\regs_matrix[12][10] ), .B(n33), .C(\regs_matrix[14][10] ), 
        .D(n61), .Y(n267) );
  NOR2X1 U392 ( .A(n269), .B(n270), .Y(n257) );
  OAI21X1 U393 ( .A(\regs_matrix[11][10] ), .B(n393), .C(n271), .Y(n270) );
  AOI21X1 U394 ( .A(n382), .B(n272), .C(n76), .Y(n271) );
  INVX2 U395 ( .A(\regs_matrix[9][10] ), .Y(n272) );
  OAI22X1 U396 ( .A(\regs_matrix[13][10] ), .B(n390), .C(\regs_matrix[15][10] ), .D(n380), .Y(n269) );
  AOI22X1 U397 ( .A(n274), .B(n275), .C(n276), .D(n277), .Y(n273) );
  NOR2X1 U398 ( .A(n278), .B(n279), .Y(n277) );
  OAI22X1 U399 ( .A(outreg_data[11]), .B(n376), .C(\regs_matrix[2][11] ), .D(
        n387), .Y(n279) );
  OAI22X1 U400 ( .A(\regs_matrix[4][11] ), .B(n378), .C(\regs_matrix[6][11] ), 
        .D(n373), .Y(n278) );
  NOR2X1 U401 ( .A(n280), .B(n281), .Y(n276) );
  AOI21X1 U402 ( .A(n36), .B(n283), .C(N13), .Y(n282) );
  INVX2 U403 ( .A(\regs_matrix[1][11] ), .Y(n283) );
  OAI22X1 U404 ( .A(\regs_matrix[5][11] ), .B(n391), .C(\regs_matrix[7][11] ), 
        .D(n400), .Y(n280) );
  NOR2X1 U405 ( .A(n284), .B(n285), .Y(n275) );
  OAI22X1 U406 ( .A(\regs_matrix[8][11] ), .B(n32), .C(\regs_matrix[10][11] ), 
        .D(n387), .Y(n285) );
  OAI22X1 U407 ( .A(\regs_matrix[12][11] ), .B(n33), .C(\regs_matrix[14][11] ), 
        .D(n61), .Y(n284) );
  NOR2X1 U408 ( .A(n286), .B(n287), .Y(n274) );
  OAI21X1 U409 ( .A(\regs_matrix[11][11] ), .B(n393), .C(n288), .Y(n287) );
  AOI21X1 U410 ( .A(n382), .B(n289), .C(n76), .Y(n288) );
  INVX2 U411 ( .A(\regs_matrix[9][11] ), .Y(n289) );
  OAI22X1 U412 ( .A(\regs_matrix[13][11] ), .B(n390), .C(\regs_matrix[15][11] ), .D(n380), .Y(n286) );
  AOI22X1 U413 ( .A(n291), .B(n292), .C(n293), .D(n294), .Y(n290) );
  NOR2X1 U414 ( .A(n295), .B(n296), .Y(n294) );
  OAI22X1 U415 ( .A(outreg_data[12]), .B(n376), .C(\regs_matrix[2][12] ), .D(
        n387), .Y(n296) );
  OAI22X1 U416 ( .A(\regs_matrix[4][12] ), .B(n378), .C(\regs_matrix[6][12] ), 
        .D(n373), .Y(n295) );
  NOR2X1 U417 ( .A(n297), .B(n298), .Y(n293) );
  OAI21X1 U418 ( .A(\regs_matrix[3][12] ), .B(n59), .C(n299), .Y(n298) );
  AOI21X1 U419 ( .A(n35), .B(n300), .C(N13), .Y(n299) );
  INVX2 U420 ( .A(\regs_matrix[1][12] ), .Y(n300) );
  OAI22X1 U421 ( .A(\regs_matrix[5][12] ), .B(n391), .C(\regs_matrix[7][12] ), 
        .D(n89), .Y(n297) );
  NOR2X1 U422 ( .A(n301), .B(n302), .Y(n292) );
  OAI22X1 U423 ( .A(\regs_matrix[8][12] ), .B(n44), .C(\regs_matrix[10][12] ), 
        .D(n387), .Y(n302) );
  OAI22X1 U424 ( .A(\regs_matrix[12][12] ), .B(n33), .C(\regs_matrix[14][12] ), 
        .D(n61), .Y(n301) );
  NOR2X1 U425 ( .A(n303), .B(n304), .Y(n291) );
  OAI21X1 U426 ( .A(\regs_matrix[11][12] ), .B(n393), .C(n305), .Y(n304) );
  AOI21X1 U427 ( .A(n382), .B(n306), .C(n76), .Y(n305) );
  INVX2 U428 ( .A(\regs_matrix[9][12] ), .Y(n306) );
  OAI22X1 U429 ( .A(\regs_matrix[13][12] ), .B(n390), .C(\regs_matrix[15][12] ), .D(n380), .Y(n303) );
  AOI22X1 U430 ( .A(n308), .B(n309), .C(n310), .D(n311), .Y(n307) );
  NOR2X1 U431 ( .A(n312), .B(n313), .Y(n311) );
  OAI22X1 U432 ( .A(outreg_data[13]), .B(n376), .C(\regs_matrix[2][13] ), .D(
        n30), .Y(n313) );
  OAI22X1 U433 ( .A(\regs_matrix[4][13] ), .B(n378), .C(\regs_matrix[6][13] ), 
        .D(n374), .Y(n312) );
  NOR2X1 U434 ( .A(n314), .B(n315), .Y(n310) );
  OAI21X1 U435 ( .A(\regs_matrix[3][13] ), .B(n396), .C(n316), .Y(n315) );
  AOI21X1 U436 ( .A(n21), .B(n317), .C(N13), .Y(n316) );
  INVX2 U437 ( .A(\regs_matrix[1][13] ), .Y(n317) );
  OAI22X1 U438 ( .A(\regs_matrix[5][13] ), .B(n391), .C(\regs_matrix[7][13] ), 
        .D(n89), .Y(n314) );
  NOR2X1 U439 ( .A(n318), .B(n319), .Y(n309) );
  OAI22X1 U440 ( .A(\regs_matrix[8][13] ), .B(n32), .C(\regs_matrix[10][13] ), 
        .D(n64), .Y(n319) );
  OAI22X1 U441 ( .A(\regs_matrix[12][13] ), .B(n33), .C(\regs_matrix[14][13] ), 
        .D(n61), .Y(n318) );
  NOR2X1 U442 ( .A(n320), .B(n321), .Y(n308) );
  OAI21X1 U443 ( .A(\regs_matrix[11][13] ), .B(n393), .C(n322), .Y(n321) );
  AOI21X1 U444 ( .A(n382), .B(n323), .C(n76), .Y(n322) );
  INVX2 U445 ( .A(\regs_matrix[9][13] ), .Y(n323) );
  OAI22X1 U446 ( .A(\regs_matrix[13][13] ), .B(n390), .C(\regs_matrix[15][13] ), .D(n380), .Y(n320) );
  AOI22X1 U447 ( .A(n325), .B(n326), .C(n327), .D(n328), .Y(n324) );
  NOR2X1 U448 ( .A(n329), .B(n330), .Y(n328) );
  OAI22X1 U449 ( .A(outreg_data[14]), .B(n376), .C(\regs_matrix[2][14] ), .D(
        n31), .Y(n330) );
  OAI22X1 U450 ( .A(\regs_matrix[4][14] ), .B(n378), .C(\regs_matrix[6][14] ), 
        .D(n60), .Y(n329) );
  NOR2X1 U451 ( .A(n331), .B(n332), .Y(n327) );
  OAI21X1 U452 ( .A(\regs_matrix[3][14] ), .B(n102), .C(n333), .Y(n332) );
  AOI21X1 U453 ( .A(n36), .B(n334), .C(N13), .Y(n333) );
  INVX2 U454 ( .A(\regs_matrix[1][14] ), .Y(n334) );
  OAI22X1 U455 ( .A(\regs_matrix[5][14] ), .B(n391), .C(\regs_matrix[7][14] ), 
        .D(n399), .Y(n331) );
  NOR2X1 U456 ( .A(n335), .B(n336), .Y(n326) );
  OAI22X1 U457 ( .A(\regs_matrix[8][14] ), .B(n32), .C(\regs_matrix[10][14] ), 
        .D(n64), .Y(n336) );
  OAI22X1 U458 ( .A(\regs_matrix[12][14] ), .B(n33), .C(\regs_matrix[14][14] ), 
        .D(n61), .Y(n335) );
  NOR2X1 U459 ( .A(n337), .B(n338), .Y(n325) );
  OAI21X1 U460 ( .A(\regs_matrix[11][14] ), .B(n393), .C(n339), .Y(n338) );
  AOI21X1 U461 ( .A(n382), .B(n340), .C(n76), .Y(n339) );
  INVX2 U462 ( .A(\regs_matrix[9][14] ), .Y(n340) );
  OAI22X1 U463 ( .A(\regs_matrix[13][14] ), .B(n390), .C(\regs_matrix[15][14] ), .D(n380), .Y(n337) );
  AOI22X1 U464 ( .A(n342), .B(n343), .C(n344), .D(n345), .Y(n341) );
  NOR2X1 U465 ( .A(n346), .B(n347), .Y(n345) );
  OAI22X1 U466 ( .A(outreg_data[15]), .B(n376), .C(\regs_matrix[2][15] ), .D(
        n30), .Y(n347) );
  OAI22X1 U467 ( .A(\regs_matrix[4][15] ), .B(n378), .C(\regs_matrix[6][15] ), 
        .D(n373), .Y(n346) );
  NOR2X1 U468 ( .A(n348), .B(n349), .Y(n344) );
  OAI21X1 U469 ( .A(\regs_matrix[3][15] ), .B(n396), .C(n350), .Y(n349) );
  AOI21X1 U470 ( .A(n36), .B(n351), .C(N13), .Y(n350) );
  INVX2 U471 ( .A(\regs_matrix[1][15] ), .Y(n351) );
  OAI22X1 U472 ( .A(\regs_matrix[5][15] ), .B(n391), .C(\regs_matrix[7][15] ), 
        .D(n399), .Y(n348) );
  NOR2X1 U473 ( .A(n352), .B(n353), .Y(n343) );
  OAI22X1 U474 ( .A(\regs_matrix[8][15] ), .B(n44), .C(\regs_matrix[10][15] ), 
        .D(n64), .Y(n353) );
  OAI22X1 U475 ( .A(\regs_matrix[12][15] ), .B(n33), .C(\regs_matrix[14][15] ), 
        .D(n61), .Y(n352) );
  NOR2X1 U476 ( .A(n354), .B(n355), .Y(n342) );
  OAI21X1 U477 ( .A(\regs_matrix[11][15] ), .B(n393), .C(n356), .Y(n355) );
  AOI21X1 U478 ( .A(n382), .B(n357), .C(n76), .Y(n356) );
  INVX2 U479 ( .A(\regs_matrix[9][15] ), .Y(n357) );
  OAI22X1 U480 ( .A(\regs_matrix[13][15] ), .B(n390), .C(\regs_matrix[15][15] ), .D(n380), .Y(n354) );
  NOR2X1 U481 ( .A(n359), .B(n360), .Y(n71) );
  OAI21X1 U482 ( .A(outreg_data[16]), .B(n376), .C(n361), .Y(n360) );
  AOI21X1 U483 ( .A(n25), .B(n362), .C(N13), .Y(n361) );
  INVX2 U484 ( .A(\regs_matrix[2][16] ), .Y(n362) );
  OAI22X1 U485 ( .A(\regs_matrix[4][16] ), .B(n34), .C(\regs_matrix[6][16] ), 
        .D(n61), .Y(n359) );
  NOR2X1 U486 ( .A(n363), .B(n364), .Y(n72) );
  OAI22X1 U487 ( .A(\regs_matrix[3][16] ), .B(n393), .C(\regs_matrix[1][16] ), 
        .D(n381), .Y(n364) );
  OAI22X1 U488 ( .A(\regs_matrix[5][16] ), .B(n391), .C(\regs_matrix[7][16] ), 
        .D(n380), .Y(n363) );
  NOR3X1 U489 ( .A(n365), .B(n366), .C(n367), .Y(n73) );
  OAI22X1 U490 ( .A(\regs_matrix[10][16] ), .B(n64), .C(\regs_matrix[8][16] ), 
        .D(n32), .Y(n367) );
  NAND3X1 U491 ( .A(n369), .B(n368), .C(n40), .Y(n85) );
  NAND3X1 U492 ( .A(n369), .B(n368), .C(n37), .Y(n93) );
  NOR2X1 U493 ( .A(\regs_matrix[12][16] ), .B(n33), .Y(n366) );
  NAND3X1 U494 ( .A(n394), .B(n40), .C(n369), .Y(n86) );
  OAI22X1 U495 ( .A(\regs_matrix[9][16] ), .B(n381), .C(\regs_matrix[14][16] ), 
        .D(n61), .Y(n365) );
  NAND3X1 U496 ( .A(n37), .B(n394), .C(n369), .Y(n84) );
  INVX2 U497 ( .A(N10), .Y(n369) );
  NAND3X1 U498 ( .A(N10), .B(n368), .C(n40), .Y(n358) );
  NOR2X1 U499 ( .A(n370), .B(n371), .Y(n74) );
  OAI21X1 U500 ( .A(\regs_matrix[11][16] ), .B(n393), .C(N13), .Y(n371) );
  OAI22X1 U501 ( .A(\regs_matrix[15][16] ), .B(n380), .C(\regs_matrix[13][16] ), .D(n390), .Y(n370) );
  NAND3X1 U502 ( .A(n394), .B(n40), .C(n24), .Y(n94) );
  NAND2X1 U503 ( .A(n394), .B(n70), .Y(n89) );
  INVX8 U504 ( .A(n377), .Y(n378) );
  BUFX4 U505 ( .A(n383), .Y(n384) );
  BUFX4 U506 ( .A(n383), .Y(n385) );
  INVX8 U507 ( .A(n385), .Y(n387) );
  INVX8 U508 ( .A(n384), .Y(n388) );
  INVX8 U509 ( .A(n389), .Y(n391) );
  BUFX4 U510 ( .A(N12), .Y(n394) );
  BUFX2 U511 ( .A(n28), .Y(n392) );
  INVX2 U512 ( .A(n392), .Y(n393) );
  NAND2X1 U513 ( .A(n70), .B(n368), .Y(n395) );
  NAND2X1 U514 ( .A(n70), .B(n368), .Y(n396) );
  INVX2 U515 ( .A(n381), .Y(n382) );
  NAND2X1 U516 ( .A(n394), .B(n70), .Y(n399) );
  NAND2X1 U517 ( .A(n70), .B(n394), .Y(n400) );
  INVX2 U518 ( .A(n93), .Y(n383) );
  INVX4 U519 ( .A(n94), .Y(n389) );
  INVX4 U520 ( .A(n86), .Y(n377) );
  INVX4 U521 ( .A(n77), .Y(r1_data[0]) );
  INVX1 U522 ( .A(n36), .Y(n381) );
  INVX2 U523 ( .A(n379), .Y(n380) );
  NAND2X1 U524 ( .A(n394), .B(n70), .Y(n401) );
  NAND2X1 U525 ( .A(n394), .B(n70), .Y(n402) );
  INVX8 U526 ( .A(n375), .Y(n376) );
  AOI22X1 U527 ( .A(n406), .B(n405), .C(n404), .D(n403), .Y(n407) );
  INVX2 U528 ( .A(n407), .Y(r2_data[16]) );
  MUX2X1 U529 ( .B(n408), .A(n409), .S(n686), .Y(r2_data[0]) );
  NAND2X1 U530 ( .A(n410), .B(n411), .Y(n409) );
  NOR2X1 U531 ( .A(n412), .B(n413), .Y(n411) );
  OAI22X1 U532 ( .A(\regs_matrix[8][0] ), .B(n658), .C(\regs_matrix[10][0] ), 
        .D(n664), .Y(n413) );
  OAI22X1 U533 ( .A(\regs_matrix[12][0] ), .B(n667), .C(\regs_matrix[14][0] ), 
        .D(n672), .Y(n412) );
  NOR2X1 U534 ( .A(n418), .B(n419), .Y(n410) );
  OAI22X1 U535 ( .A(\regs_matrix[11][0] ), .B(n674), .C(\regs_matrix[9][0] ), 
        .D(n678), .Y(n419) );
  OAI22X1 U536 ( .A(\regs_matrix[13][0] ), .B(n19), .C(\regs_matrix[15][0] ), 
        .D(n685), .Y(n418) );
  NAND2X1 U537 ( .A(n423), .B(n424), .Y(n408) );
  NOR2X1 U538 ( .A(n425), .B(n426), .Y(n424) );
  OAI22X1 U539 ( .A(outreg_data[0]), .B(n658), .C(\regs_matrix[2][0] ), .D(
        n664), .Y(n426) );
  OAI22X1 U540 ( .A(\regs_matrix[4][0] ), .B(n667), .C(\regs_matrix[6][0] ), 
        .D(n673), .Y(n425) );
  NOR2X1 U541 ( .A(n427), .B(n428), .Y(n423) );
  OAI22X1 U542 ( .A(\regs_matrix[3][0] ), .B(n674), .C(\regs_matrix[1][0] ), 
        .D(n678), .Y(n428) );
  OAI22X1 U543 ( .A(\regs_matrix[5][0] ), .B(n26), .C(\regs_matrix[7][0] ), 
        .D(n685), .Y(n427) );
  MUX2X1 U544 ( .B(n429), .A(n430), .S(n687), .Y(r2_data[1]) );
  NAND2X1 U545 ( .A(n431), .B(n432), .Y(n430) );
  NOR2X1 U546 ( .A(n433), .B(n434), .Y(n432) );
  OAI22X1 U547 ( .A(\regs_matrix[8][1] ), .B(n658), .C(\regs_matrix[10][1] ), 
        .D(n664), .Y(n434) );
  OAI22X1 U548 ( .A(\regs_matrix[12][1] ), .B(n667), .C(\regs_matrix[14][1] ), 
        .D(n673), .Y(n433) );
  NOR2X1 U549 ( .A(n435), .B(n436), .Y(n431) );
  OAI22X1 U550 ( .A(\regs_matrix[11][1] ), .B(n674), .C(\regs_matrix[9][1] ), 
        .D(n678), .Y(n436) );
  OAI22X1 U551 ( .A(\regs_matrix[13][1] ), .B(n26), .C(\regs_matrix[15][1] ), 
        .D(n685), .Y(n435) );
  NAND2X1 U552 ( .A(n437), .B(n438), .Y(n429) );
  NOR2X1 U553 ( .A(n439), .B(n440), .Y(n438) );
  OAI22X1 U554 ( .A(outreg_data[1]), .B(n658), .C(\regs_matrix[2][1] ), .D(
        n664), .Y(n440) );
  OAI22X1 U555 ( .A(\regs_matrix[4][1] ), .B(n667), .C(\regs_matrix[6][1] ), 
        .D(n673), .Y(n439) );
  NOR2X1 U556 ( .A(n441), .B(n442), .Y(n437) );
  OAI22X1 U557 ( .A(\regs_matrix[3][1] ), .B(n674), .C(\regs_matrix[1][1] ), 
        .D(n678), .Y(n442) );
  OAI22X1 U558 ( .A(\regs_matrix[5][1] ), .B(n26), .C(\regs_matrix[7][1] ), 
        .D(n685), .Y(n441) );
  MUX2X1 U559 ( .B(n443), .A(n444), .S(n686), .Y(r2_data[2]) );
  NAND2X1 U560 ( .A(n445), .B(n446), .Y(n444) );
  NOR2X1 U561 ( .A(n447), .B(n448), .Y(n446) );
  OAI22X1 U562 ( .A(\regs_matrix[8][2] ), .B(n658), .C(\regs_matrix[10][2] ), 
        .D(n664), .Y(n448) );
  OAI22X1 U563 ( .A(\regs_matrix[12][2] ), .B(n669), .C(\regs_matrix[14][2] ), 
        .D(n673), .Y(n447) );
  NOR2X1 U564 ( .A(n449), .B(n450), .Y(n445) );
  OAI22X1 U565 ( .A(\regs_matrix[11][2] ), .B(n675), .C(\regs_matrix[9][2] ), 
        .D(n678), .Y(n450) );
  OAI22X1 U566 ( .A(\regs_matrix[13][2] ), .B(n681), .C(\regs_matrix[15][2] ), 
        .D(n685), .Y(n449) );
  NAND2X1 U567 ( .A(n451), .B(n452), .Y(n443) );
  NOR2X1 U568 ( .A(n453), .B(n454), .Y(n452) );
  OAI22X1 U569 ( .A(outreg_data[2]), .B(n658), .C(\regs_matrix[2][2] ), .D(
        n664), .Y(n454) );
  OAI22X1 U570 ( .A(\regs_matrix[4][2] ), .B(n668), .C(\regs_matrix[6][2] ), 
        .D(n673), .Y(n453) );
  NOR2X1 U571 ( .A(n455), .B(n456), .Y(n451) );
  OAI22X1 U572 ( .A(\regs_matrix[3][2] ), .B(n675), .C(\regs_matrix[1][2] ), 
        .D(n678), .Y(n456) );
  OAI22X1 U573 ( .A(\regs_matrix[5][2] ), .B(n23), .C(\regs_matrix[7][2] ), 
        .D(n685), .Y(n455) );
  NAND2X1 U574 ( .A(n459), .B(n460), .Y(n458) );
  NOR2X1 U575 ( .A(n461), .B(n462), .Y(n460) );
  OAI22X1 U576 ( .A(\regs_matrix[8][3] ), .B(n658), .C(\regs_matrix[10][3] ), 
        .D(n664), .Y(n462) );
  OAI22X1 U577 ( .A(\regs_matrix[12][3] ), .B(n667), .C(\regs_matrix[14][3] ), 
        .D(n673), .Y(n461) );
  NOR2X1 U578 ( .A(n463), .B(n464), .Y(n459) );
  OAI22X1 U579 ( .A(\regs_matrix[11][3] ), .B(n674), .C(\regs_matrix[9][3] ), 
        .D(n678), .Y(n464) );
  OAI22X1 U580 ( .A(\regs_matrix[13][3] ), .B(n681), .C(\regs_matrix[15][3] ), 
        .D(n685), .Y(n463) );
  NAND2X1 U581 ( .A(n465), .B(n466), .Y(n457) );
  NOR2X1 U582 ( .A(n467), .B(n468), .Y(n466) );
  OAI22X1 U583 ( .A(outreg_data[3]), .B(n658), .C(\regs_matrix[2][3] ), .D(
        n664), .Y(n468) );
  OAI22X1 U584 ( .A(\regs_matrix[4][3] ), .B(n667), .C(\regs_matrix[6][3] ), 
        .D(n673), .Y(n467) );
  NOR2X1 U585 ( .A(n469), .B(n470), .Y(n465) );
  OAI22X1 U586 ( .A(\regs_matrix[3][3] ), .B(n674), .C(\regs_matrix[1][3] ), 
        .D(n678), .Y(n470) );
  OAI22X1 U587 ( .A(\regs_matrix[5][3] ), .B(n680), .C(\regs_matrix[7][3] ), 
        .D(n685), .Y(n469) );
  MUX2X1 U588 ( .B(n471), .A(n472), .S(n686), .Y(r2_data[4]) );
  NAND2X1 U589 ( .A(n474), .B(n473), .Y(n472) );
  NOR2X1 U590 ( .A(n476), .B(n475), .Y(n474) );
  OAI22X1 U591 ( .A(\regs_matrix[8][4] ), .B(n659), .C(\regs_matrix[10][4] ), 
        .D(n665), .Y(n476) );
  OAI22X1 U592 ( .A(\regs_matrix[12][4] ), .B(n668), .C(\regs_matrix[14][4] ), 
        .D(n673), .Y(n475) );
  NOR2X1 U593 ( .A(n477), .B(n478), .Y(n473) );
  OAI22X1 U594 ( .A(\regs_matrix[11][4] ), .B(n674), .C(\regs_matrix[9][4] ), 
        .D(n678), .Y(n478) );
  OAI22X1 U595 ( .A(\regs_matrix[13][4] ), .B(n23), .C(\regs_matrix[15][4] ), 
        .D(n685), .Y(n477) );
  NAND2X1 U596 ( .A(n479), .B(n480), .Y(n471) );
  NOR2X1 U597 ( .A(n481), .B(n482), .Y(n480) );
  OAI22X1 U598 ( .A(outreg_data[4]), .B(n659), .C(\regs_matrix[2][4] ), .D(
        n665), .Y(n482) );
  OAI22X1 U599 ( .A(\regs_matrix[4][4] ), .B(n669), .C(\regs_matrix[6][4] ), 
        .D(n673), .Y(n481) );
  NOR2X1 U600 ( .A(n483), .B(n484), .Y(n479) );
  OAI22X1 U601 ( .A(\regs_matrix[3][4] ), .B(n674), .C(\regs_matrix[1][4] ), 
        .D(n678), .Y(n484) );
  OAI22X1 U602 ( .A(\regs_matrix[5][4] ), .B(n26), .C(\regs_matrix[7][4] ), 
        .D(n685), .Y(n483) );
  MUX2X1 U603 ( .B(n485), .A(n486), .S(n687), .Y(r2_data[5]) );
  NAND2X1 U604 ( .A(n487), .B(n488), .Y(n486) );
  NOR2X1 U605 ( .A(n489), .B(n490), .Y(n488) );
  OAI22X1 U606 ( .A(\regs_matrix[8][5] ), .B(n659), .C(\regs_matrix[10][5] ), 
        .D(n665), .Y(n490) );
  OAI22X1 U607 ( .A(\regs_matrix[12][5] ), .B(n669), .C(\regs_matrix[14][5] ), 
        .D(n673), .Y(n489) );
  NOR2X1 U608 ( .A(n491), .B(n492), .Y(n487) );
  OAI22X1 U609 ( .A(\regs_matrix[11][5] ), .B(n674), .C(\regs_matrix[9][5] ), 
        .D(n678), .Y(n492) );
  OAI22X1 U610 ( .A(\regs_matrix[13][5] ), .B(n18), .C(\regs_matrix[15][5] ), 
        .D(n685), .Y(n491) );
  NAND2X1 U611 ( .A(n493), .B(n494), .Y(n485) );
  NOR2X1 U612 ( .A(n495), .B(n496), .Y(n494) );
  OAI22X1 U613 ( .A(outreg_data[5]), .B(n659), .C(\regs_matrix[2][5] ), .D(
        n665), .Y(n496) );
  OAI22X1 U614 ( .A(\regs_matrix[4][5] ), .B(n669), .C(\regs_matrix[6][5] ), 
        .D(n673), .Y(n495) );
  NOR2X1 U615 ( .A(n497), .B(n498), .Y(n493) );
  OAI22X1 U616 ( .A(\regs_matrix[3][5] ), .B(n674), .C(\regs_matrix[1][5] ), 
        .D(n678), .Y(n498) );
  OAI22X1 U617 ( .A(\regs_matrix[5][5] ), .B(n22), .C(\regs_matrix[7][5] ), 
        .D(n685), .Y(n497) );
  MUX2X1 U618 ( .B(n499), .A(n500), .S(n686), .Y(r2_data[6]) );
  NAND2X1 U619 ( .A(n501), .B(n502), .Y(n500) );
  NOR2X1 U620 ( .A(n503), .B(n504), .Y(n502) );
  OAI22X1 U621 ( .A(\regs_matrix[8][6] ), .B(n659), .C(\regs_matrix[10][6] ), 
        .D(n665), .Y(n504) );
  OAI22X1 U622 ( .A(\regs_matrix[12][6] ), .B(n669), .C(\regs_matrix[14][6] ), 
        .D(n672), .Y(n503) );
  NOR2X1 U623 ( .A(n505), .B(n506), .Y(n501) );
  OAI22X1 U624 ( .A(\regs_matrix[11][6] ), .B(n674), .C(\regs_matrix[9][6] ), 
        .D(n678), .Y(n506) );
  OAI22X1 U625 ( .A(\regs_matrix[13][6] ), .B(n26), .C(\regs_matrix[15][6] ), 
        .D(n684), .Y(n505) );
  NAND2X1 U626 ( .A(n507), .B(n508), .Y(n499) );
  NOR2X1 U627 ( .A(n509), .B(n510), .Y(n508) );
  OAI22X1 U628 ( .A(outreg_data[6]), .B(n659), .C(\regs_matrix[2][6] ), .D(
        n665), .Y(n510) );
  OAI22X1 U629 ( .A(\regs_matrix[4][6] ), .B(n669), .C(\regs_matrix[6][6] ), 
        .D(n672), .Y(n509) );
  NOR2X1 U630 ( .A(n511), .B(n512), .Y(n507) );
  OAI22X1 U631 ( .A(\regs_matrix[3][6] ), .B(n674), .C(\regs_matrix[1][6] ), 
        .D(n678), .Y(n512) );
  OAI22X1 U632 ( .A(\regs_matrix[5][6] ), .B(n26), .C(\regs_matrix[7][6] ), 
        .D(n684), .Y(n511) );
  MUX2X1 U633 ( .B(n513), .A(n514), .S(n687), .Y(r2_data[7]) );
  NAND2X1 U634 ( .A(n515), .B(n516), .Y(n514) );
  NOR2X1 U635 ( .A(n517), .B(n518), .Y(n516) );
  OAI22X1 U636 ( .A(\regs_matrix[8][7] ), .B(n659), .C(\regs_matrix[10][7] ), 
        .D(n665), .Y(n518) );
  OAI22X1 U637 ( .A(\regs_matrix[12][7] ), .B(n668), .C(\regs_matrix[14][7] ), 
        .D(n672), .Y(n517) );
  NOR2X1 U638 ( .A(n519), .B(n520), .Y(n515) );
  OAI22X1 U639 ( .A(\regs_matrix[11][7] ), .B(n675), .C(\regs_matrix[9][7] ), 
        .D(n678), .Y(n520) );
  OAI22X1 U640 ( .A(\regs_matrix[13][7] ), .B(n19), .C(\regs_matrix[15][7] ), 
        .D(n684), .Y(n519) );
  NAND2X1 U641 ( .A(n521), .B(n522), .Y(n513) );
  NOR2X1 U642 ( .A(n523), .B(n524), .Y(n522) );
  OAI22X1 U643 ( .A(outreg_data[7]), .B(n659), .C(\regs_matrix[2][7] ), .D(
        n665), .Y(n524) );
  OAI22X1 U644 ( .A(\regs_matrix[4][7] ), .B(n668), .C(\regs_matrix[6][7] ), 
        .D(n672), .Y(n523) );
  NOR2X1 U645 ( .A(n525), .B(n526), .Y(n521) );
  OAI22X1 U646 ( .A(\regs_matrix[3][7] ), .B(n675), .C(\regs_matrix[1][7] ), 
        .D(n678), .Y(n526) );
  OAI22X1 U647 ( .A(\regs_matrix[5][7] ), .B(n23), .C(\regs_matrix[7][7] ), 
        .D(n684), .Y(n525) );
  MUX2X1 U648 ( .B(n527), .A(n528), .S(n686), .Y(r2_data[8]) );
  NAND2X1 U649 ( .A(n529), .B(n530), .Y(n528) );
  NOR2X1 U650 ( .A(n531), .B(n532), .Y(n530) );
  OAI22X1 U651 ( .A(\regs_matrix[8][8] ), .B(n659), .C(\regs_matrix[10][8] ), 
        .D(n665), .Y(n532) );
  OAI22X1 U652 ( .A(\regs_matrix[12][8] ), .B(n668), .C(\regs_matrix[14][8] ), 
        .D(n672), .Y(n531) );
  NOR2X1 U653 ( .A(n533), .B(n534), .Y(n529) );
  OAI22X1 U654 ( .A(\regs_matrix[11][8] ), .B(n674), .C(\regs_matrix[9][8] ), 
        .D(n678), .Y(n534) );
  OAI22X1 U655 ( .A(\regs_matrix[13][8] ), .B(n681), .C(\regs_matrix[15][8] ), 
        .D(n684), .Y(n533) );
  NAND2X1 U656 ( .A(n535), .B(n536), .Y(n527) );
  NOR2X1 U657 ( .A(n537), .B(n538), .Y(n536) );
  OAI22X1 U658 ( .A(outreg_data[8]), .B(n659), .C(\regs_matrix[2][8] ), .D(
        n665), .Y(n538) );
  OAI22X1 U659 ( .A(\regs_matrix[4][8] ), .B(n668), .C(\regs_matrix[6][8] ), 
        .D(n672), .Y(n537) );
  NOR2X1 U660 ( .A(n539), .B(n540), .Y(n535) );
  OAI22X1 U661 ( .A(\regs_matrix[3][8] ), .B(n674), .C(\regs_matrix[1][8] ), 
        .D(n678), .Y(n540) );
  OAI22X1 U662 ( .A(\regs_matrix[5][8] ), .B(n18), .C(\regs_matrix[7][8] ), 
        .D(n684), .Y(n539) );
  MUX2X1 U663 ( .B(n541), .A(n542), .S(n687), .Y(r2_data[9]) );
  NAND2X1 U664 ( .A(n543), .B(n544), .Y(n542) );
  NOR2X1 U665 ( .A(n545), .B(n546), .Y(n544) );
  OAI22X1 U666 ( .A(\regs_matrix[8][9] ), .B(n659), .C(\regs_matrix[10][9] ), 
        .D(n665), .Y(n546) );
  OAI22X1 U667 ( .A(\regs_matrix[12][9] ), .B(n667), .C(\regs_matrix[14][9] ), 
        .D(n672), .Y(n545) );
  NOR2X1 U668 ( .A(n547), .B(n548), .Y(n543) );
  OAI22X1 U669 ( .A(\regs_matrix[11][9] ), .B(n675), .C(\regs_matrix[9][9] ), 
        .D(n678), .Y(n548) );
  OAI22X1 U670 ( .A(\regs_matrix[13][9] ), .B(n23), .C(\regs_matrix[15][9] ), 
        .D(n684), .Y(n547) );
  NAND2X1 U671 ( .A(n549), .B(n550), .Y(n541) );
  NOR2X1 U672 ( .A(n551), .B(n552), .Y(n550) );
  OAI22X1 U673 ( .A(outreg_data[9]), .B(n659), .C(\regs_matrix[2][9] ), .D(
        n665), .Y(n552) );
  OAI22X1 U674 ( .A(\regs_matrix[4][9] ), .B(n667), .C(\regs_matrix[6][9] ), 
        .D(n672), .Y(n551) );
  NOR2X1 U675 ( .A(n553), .B(n554), .Y(n549) );
  OAI22X1 U676 ( .A(\regs_matrix[3][9] ), .B(n675), .C(\regs_matrix[1][9] ), 
        .D(n678), .Y(n554) );
  OAI22X1 U677 ( .A(\regs_matrix[5][9] ), .B(n680), .C(\regs_matrix[7][9] ), 
        .D(n684), .Y(n553) );
  MUX2X1 U678 ( .B(n555), .A(n556), .S(n686), .Y(r2_data[10]) );
  NAND2X1 U679 ( .A(n557), .B(n558), .Y(n556) );
  NOR2X1 U680 ( .A(n559), .B(n560), .Y(n558) );
  OAI22X1 U681 ( .A(\regs_matrix[8][10] ), .B(n660), .C(\regs_matrix[10][10] ), 
        .D(n665), .Y(n560) );
  OAI22X1 U682 ( .A(\regs_matrix[12][10] ), .B(n667), .C(\regs_matrix[14][10] ), .D(n672), .Y(n559) );
  NOR2X1 U683 ( .A(n561), .B(n562), .Y(n557) );
  OAI22X1 U684 ( .A(\regs_matrix[11][10] ), .B(n675), .C(\regs_matrix[9][10] ), 
        .D(n678), .Y(n562) );
  OAI22X1 U685 ( .A(\regs_matrix[13][10] ), .B(n680), .C(\regs_matrix[15][10] ), .D(n684), .Y(n561) );
  NAND2X1 U686 ( .A(n563), .B(n564), .Y(n555) );
  NOR2X1 U687 ( .A(n565), .B(n566), .Y(n564) );
  OAI22X1 U688 ( .A(outreg_data[10]), .B(n660), .C(\regs_matrix[2][10] ), .D(
        n665), .Y(n566) );
  OAI22X1 U689 ( .A(\regs_matrix[4][10] ), .B(n667), .C(\regs_matrix[6][10] ), 
        .D(n672), .Y(n565) );
  NOR2X1 U690 ( .A(n567), .B(n568), .Y(n563) );
  OAI22X1 U691 ( .A(\regs_matrix[3][10] ), .B(n675), .C(\regs_matrix[1][10] ), 
        .D(n678), .Y(n568) );
  OAI22X1 U692 ( .A(\regs_matrix[5][10] ), .B(n19), .C(\regs_matrix[7][10] ), 
        .D(n684), .Y(n567) );
  MUX2X1 U693 ( .B(n569), .A(n570), .S(n687), .Y(r2_data[11]) );
  NAND2X1 U694 ( .A(n571), .B(n572), .Y(n570) );
  NOR2X1 U695 ( .A(n573), .B(n574), .Y(n572) );
  OAI22X1 U696 ( .A(\regs_matrix[8][11] ), .B(n660), .C(\regs_matrix[10][11] ), 
        .D(n665), .Y(n574) );
  OAI22X1 U697 ( .A(\regs_matrix[12][11] ), .B(n669), .C(\regs_matrix[14][11] ), .D(n672), .Y(n573) );
  NOR2X1 U698 ( .A(n575), .B(n576), .Y(n571) );
  OAI22X1 U699 ( .A(\regs_matrix[11][11] ), .B(n674), .C(\regs_matrix[9][11] ), 
        .D(n678), .Y(n576) );
  OAI22X1 U700 ( .A(\regs_matrix[13][11] ), .B(n26), .C(\regs_matrix[15][11] ), 
        .D(n684), .Y(n575) );
  NAND2X1 U701 ( .A(n577), .B(n578), .Y(n569) );
  NOR2X1 U702 ( .A(n579), .B(n580), .Y(n578) );
  OAI22X1 U703 ( .A(outreg_data[11]), .B(n660), .C(\regs_matrix[2][11] ), .D(
        n665), .Y(n580) );
  OAI22X1 U704 ( .A(\regs_matrix[4][11] ), .B(n668), .C(\regs_matrix[6][11] ), 
        .D(n671), .Y(n579) );
  NOR2X1 U705 ( .A(n581), .B(n582), .Y(n577) );
  OAI22X1 U706 ( .A(\regs_matrix[3][11] ), .B(n674), .C(\regs_matrix[1][11] ), 
        .D(n678), .Y(n582) );
  OAI22X1 U707 ( .A(\regs_matrix[5][11] ), .B(n680), .C(\regs_matrix[7][11] ), 
        .D(n684), .Y(n581) );
  MUX2X1 U708 ( .B(n583), .A(n584), .S(n686), .Y(r2_data[12]) );
  NAND2X1 U709 ( .A(n585), .B(n586), .Y(n584) );
  NOR2X1 U710 ( .A(n587), .B(n588), .Y(n586) );
  OAI22X1 U711 ( .A(\regs_matrix[8][12] ), .B(n660), .C(\regs_matrix[10][12] ), 
        .D(n665), .Y(n588) );
  OAI22X1 U712 ( .A(\regs_matrix[12][12] ), .B(n668), .C(\regs_matrix[14][12] ), .D(n671), .Y(n587) );
  NOR2X1 U713 ( .A(n589), .B(n590), .Y(n585) );
  OAI22X1 U714 ( .A(\regs_matrix[11][12] ), .B(n675), .C(\regs_matrix[9][12] ), 
        .D(n677), .Y(n590) );
  OAI22X1 U715 ( .A(\regs_matrix[13][12] ), .B(n23), .C(\regs_matrix[15][12] ), 
        .D(n683), .Y(n589) );
  NAND2X1 U716 ( .A(n591), .B(n592), .Y(n583) );
  NOR2X1 U717 ( .A(n593), .B(n594), .Y(n592) );
  OAI22X1 U718 ( .A(outreg_data[12]), .B(n660), .C(\regs_matrix[2][12] ), .D(
        n665), .Y(n594) );
  OAI22X1 U719 ( .A(\regs_matrix[4][12] ), .B(n669), .C(\regs_matrix[6][12] ), 
        .D(n671), .Y(n593) );
  NOR2X1 U720 ( .A(n595), .B(n596), .Y(n591) );
  OAI22X1 U721 ( .A(\regs_matrix[3][12] ), .B(n675), .C(\regs_matrix[1][12] ), 
        .D(n677), .Y(n596) );
  OAI22X1 U722 ( .A(\regs_matrix[5][12] ), .B(n19), .C(\regs_matrix[7][12] ), 
        .D(n683), .Y(n595) );
  MUX2X1 U723 ( .B(n597), .A(n598), .S(n687), .Y(r2_data[13]) );
  NAND2X1 U724 ( .A(n600), .B(n599), .Y(n598) );
  NOR2X1 U725 ( .A(n601), .B(n602), .Y(n600) );
  OAI22X1 U726 ( .A(\regs_matrix[8][13] ), .B(n660), .C(\regs_matrix[10][13] ), 
        .D(n665), .Y(n602) );
  OAI22X1 U727 ( .A(\regs_matrix[12][13] ), .B(n668), .C(\regs_matrix[14][13] ), .D(n671), .Y(n601) );
  NOR2X1 U728 ( .A(n603), .B(n604), .Y(n599) );
  OAI22X1 U729 ( .A(\regs_matrix[11][13] ), .B(n674), .C(\regs_matrix[9][13] ), 
        .D(n677), .Y(n604) );
  OAI22X1 U730 ( .A(\regs_matrix[13][13] ), .B(n681), .C(\regs_matrix[15][13] ), .D(n683), .Y(n603) );
  NAND2X1 U731 ( .A(n605), .B(n606), .Y(n597) );
  NOR2X1 U732 ( .A(n607), .B(n608), .Y(n606) );
  OAI22X1 U733 ( .A(outreg_data[13]), .B(n660), .C(\regs_matrix[2][13] ), .D(
        n665), .Y(n608) );
  OAI22X1 U734 ( .A(\regs_matrix[4][13] ), .B(n668), .C(\regs_matrix[6][13] ), 
        .D(n671), .Y(n607) );
  NOR2X1 U735 ( .A(n609), .B(n610), .Y(n605) );
  OAI22X1 U736 ( .A(\regs_matrix[3][13] ), .B(n674), .C(\regs_matrix[1][13] ), 
        .D(n677), .Y(n610) );
  OAI22X1 U737 ( .A(\regs_matrix[5][13] ), .B(n26), .C(\regs_matrix[7][13] ), 
        .D(n683), .Y(n609) );
  NAND2X1 U738 ( .A(n613), .B(n614), .Y(n612) );
  NOR2X1 U739 ( .A(n615), .B(n616), .Y(n614) );
  OAI22X1 U740 ( .A(\regs_matrix[8][14] ), .B(n660), .C(\regs_matrix[10][14] ), 
        .D(n665), .Y(n616) );
  OAI22X1 U741 ( .A(\regs_matrix[12][14] ), .B(n668), .C(\regs_matrix[14][14] ), .D(n671), .Y(n615) );
  NOR2X1 U742 ( .A(n617), .B(n618), .Y(n613) );
  OAI22X1 U743 ( .A(\regs_matrix[11][14] ), .B(n675), .C(\regs_matrix[9][14] ), 
        .D(n677), .Y(n618) );
  OAI22X1 U744 ( .A(\regs_matrix[13][14] ), .B(n26), .C(\regs_matrix[15][14] ), 
        .D(n683), .Y(n617) );
  NAND2X1 U745 ( .A(n619), .B(n620), .Y(n611) );
  NOR2X1 U746 ( .A(n621), .B(n622), .Y(n620) );
  OAI22X1 U747 ( .A(outreg_data[14]), .B(n660), .C(\regs_matrix[2][14] ), .D(
        n664), .Y(n622) );
  OAI22X1 U748 ( .A(\regs_matrix[4][14] ), .B(n669), .C(\regs_matrix[6][14] ), 
        .D(n671), .Y(n621) );
  NOR2X1 U749 ( .A(n623), .B(n624), .Y(n619) );
  OAI22X1 U750 ( .A(\regs_matrix[3][14] ), .B(n675), .C(\regs_matrix[1][14] ), 
        .D(n677), .Y(n624) );
  OAI22X1 U751 ( .A(\regs_matrix[5][14] ), .B(n681), .C(\regs_matrix[7][14] ), 
        .D(n683), .Y(n623) );
  NOR2X1 U752 ( .A(n627), .B(n628), .Y(n626) );
  OAI22X1 U753 ( .A(\regs_matrix[8][15] ), .B(n660), .C(\regs_matrix[10][15] ), 
        .D(n665), .Y(n628) );
  OAI22X1 U754 ( .A(\regs_matrix[12][15] ), .B(n669), .C(\regs_matrix[14][15] ), .D(n671), .Y(n627) );
  NOR2X1 U755 ( .A(n629), .B(n630), .Y(n625) );
  OAI22X1 U756 ( .A(\regs_matrix[11][15] ), .B(n674), .C(\regs_matrix[9][15] ), 
        .D(n677), .Y(n630) );
  OAI22X1 U757 ( .A(\regs_matrix[13][15] ), .B(n19), .C(\regs_matrix[15][15] ), 
        .D(n683), .Y(n629) );
  NOR2X1 U758 ( .A(n633), .B(n634), .Y(n632) );
  OAI22X1 U759 ( .A(outreg_data[15]), .B(n660), .C(\regs_matrix[2][15] ), .D(
        n665), .Y(n634) );
  OAI22X1 U760 ( .A(\regs_matrix[4][15] ), .B(n669), .C(\regs_matrix[6][15] ), 
        .D(n671), .Y(n633) );
  NOR2X1 U761 ( .A(n635), .B(n636), .Y(n631) );
  OAI22X1 U762 ( .A(\regs_matrix[3][15] ), .B(n674), .C(\regs_matrix[1][15] ), 
        .D(n677), .Y(n636) );
  OAI22X1 U763 ( .A(\regs_matrix[5][15] ), .B(n680), .C(\regs_matrix[7][15] ), 
        .D(n683), .Y(n635) );
  NOR2X1 U764 ( .A(n637), .B(n638), .Y(n403) );
  OAI21X1 U765 ( .A(\regs_matrix[6][16] ), .B(n671), .C(n639), .Y(n638) );
  AOI22X1 U766 ( .A(n663), .B(n362), .C(n657), .D(n732), .Y(n639) );
  OAI21X1 U767 ( .A(\regs_matrix[4][16] ), .B(n669), .C(n688), .Y(n637) );
  NOR2X1 U768 ( .A(n640), .B(n641), .Y(n404) );
  OAI22X1 U769 ( .A(\regs_matrix[3][16] ), .B(n675), .C(\regs_matrix[1][16] ), 
        .D(n677), .Y(n641) );
  OAI22X1 U770 ( .A(\regs_matrix[5][16] ), .B(n681), .C(\regs_matrix[7][16] ), 
        .D(n683), .Y(n640) );
  NOR2X1 U771 ( .A(n642), .B(n643), .Y(n405) );
  OAI21X1 U772 ( .A(\regs_matrix[12][16] ), .B(n668), .C(n644), .Y(n643) );
  AOI22X1 U773 ( .A(n663), .B(n645), .C(n657), .D(n646), .Y(n644) );
  INVX2 U774 ( .A(\regs_matrix[8][16] ), .Y(n646) );
  NAND3X1 U775 ( .A(n649), .B(n648), .C(n647), .Y(n414) );
  INVX2 U776 ( .A(\regs_matrix[10][16] ), .Y(n645) );
  NAND3X1 U777 ( .A(N15), .B(n648), .C(n649), .Y(n415) );
  NAND3X1 U778 ( .A(n41), .B(n647), .C(n649), .Y(n416) );
  OAI22X1 U779 ( .A(\regs_matrix[9][16] ), .B(n677), .C(\regs_matrix[14][16] ), 
        .D(n673), .Y(n642) );
  NAND3X1 U780 ( .A(N15), .B(n41), .C(n649), .Y(n417) );
  INVX2 U781 ( .A(N14), .Y(n649) );
  NAND3X1 U782 ( .A(N14), .B(n648), .C(n647), .Y(n420) );
  NOR2X1 U783 ( .A(n650), .B(n651), .Y(n406) );
  OAI21X1 U784 ( .A(\regs_matrix[11][16] ), .B(n675), .C(n686), .Y(n651) );
  INVX2 U785 ( .A(N16), .Y(n648) );
  OAI22X1 U786 ( .A(\regs_matrix[15][16] ), .B(n683), .C(\regs_matrix[13][16] ), .D(n23), .Y(n650) );
  NAND3X1 U787 ( .A(n41), .B(N14), .C(n647), .Y(n421) );
  NAND2X1 U788 ( .A(n41), .B(n652), .Y(n422) );
  INVX2 U789 ( .A(n653), .Y(n652) );
  NAND2X1 U790 ( .A(N15), .B(N14), .Y(n653) );
  INVX2 U791 ( .A(w_sel[1]), .Y(n741) );
  INVX2 U792 ( .A(w_sel[3]), .Y(n742) );
  INVX2 U793 ( .A(w_en), .Y(n743) );
  INVX2 U794 ( .A(w_sel[2]), .Y(n744) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U3 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   dr, lc, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 SYNC_DR ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr) );
  sync_low_0 SYNC_LC ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc) );
  controller CTRL ( .clk(clk), .n_rst(n_reset), .dr(dr), .lc(lc), .overflow(
        overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .op(op), 
        .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), .dest(dest), 
        .err(err) );
  counter COUNTER ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  magnitude MGNTD ( .in(outreg_data), .out(fir_out) );
  datapath DTPATH ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
endmodule

