/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 23 11:43:53 2019
/////////////////////////////////////////////////////////////


module adder_16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n19, n29, n30, n31, n32, n34, n35, n36, n37, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n50, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n77, n78, n84, n85,
         n86, n87, n89, n90, n95, n96, n98, n107, n109, n111, n112, n115,
         net361, n51, n49, n48, n38, n33, n28, n27, n25, n23, n105, net574,
         net686, net673, net672, net671, net659, net644, net640, net639,
         net617, net823, net808, net780, net969, net949, net948, net1126,
         net1116, net1115, net1112, net1110, net1109, net1095, net1072,
         net1066, net1053, net645, net1065, net965, net959, net958, net670,
         n94, net904, net807, net664, net699, net660, net1132, net1101,
         net1099, n104, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212;

  OAI21X1 U3 ( .A(net574), .B(n18), .C(n19), .Y(SUM[16]) );
  NOR2X1 U6 ( .A(B[15]), .B(A[15]), .Y(n18) );
  NAND2X1 U7 ( .A(B[15]), .B(A[15]), .Y(n19) );
  XOR2X1 U8 ( .A(n29), .B(n2), .Y(SUM[14]) );
  XNOR2X1 U20 ( .A(n34), .B(n3), .Y(SUM[13]) );
  AOI21X1 U21 ( .A(n30), .B(n34), .C(n31), .Y(n29) );
  NOR2X1 U26 ( .A(B[13]), .B(A[13]), .Y(n32) );
  XOR2X1 U28 ( .A(n41), .B(n4), .Y(SUM[12]) );
  OAI21X1 U29 ( .A(n46), .B(n35), .C(n36), .Y(n34) );
  NOR2X1 U32 ( .A(n39), .B(n44), .Y(n37) );
  NAND2X1 U34 ( .A(n40), .B(n107), .Y(n4) );
  NOR2X1 U36 ( .A(B[12]), .B(A[12]), .Y(n39) );
  NAND2X1 U37 ( .A(B[12]), .B(A[12]), .Y(n40) );
  XOR2X1 U38 ( .A(n46), .B(n5), .Y(SUM[11]) );
  AOI21X1 U39 ( .A(n42), .B(n47), .C(n43), .Y(n41) );
  NAND2X1 U42 ( .A(n45), .B(n42), .Y(n5) );
  NOR2X1 U44 ( .A(B[11]), .B(A[11]), .Y(n44) );
  NAND2X1 U45 ( .A(B[11]), .B(A[11]), .Y(n45) );
  XOR2X1 U46 ( .A(n54), .B(n6), .Y(SUM[10]) );
  NOR2X1 U51 ( .A(n52), .B(n57), .Y(n50) );
  NAND2X1 U53 ( .A(n53), .B(n109), .Y(n6) );
  NOR2X1 U55 ( .A(B[10]), .B(A[10]), .Y(n52) );
  NAND2X1 U56 ( .A(B[10]), .B(A[10]), .Y(n53) );
  XNOR2X1 U57 ( .A(n59), .B(n7), .Y(SUM[9]) );
  AOI21X1 U58 ( .A(n55), .B(n59), .C(n56), .Y(n54) );
  NAND2X1 U61 ( .A(n58), .B(n55), .Y(n7) );
  NOR2X1 U63 ( .A(B[9]), .B(A[9]), .Y(n57) );
  NAND2X1 U64 ( .A(B[9]), .B(A[9]), .Y(n58) );
  XNOR2X1 U65 ( .A(n66), .B(n8), .Y(SUM[8]) );
  OAI21X1 U66 ( .A(n69), .B(n60), .C(n61), .Y(n59) );
  NOR2X1 U69 ( .A(n64), .B(n67), .Y(n62) );
  OAI21X1 U70 ( .A(n64), .B(n68), .C(n65), .Y(n63) );
  NAND2X1 U71 ( .A(n65), .B(n111), .Y(n8) );
  NOR2X1 U73 ( .A(B[8]), .B(A[8]), .Y(n64) );
  NAND2X1 U74 ( .A(B[8]), .B(A[8]), .Y(n65) );
  XOR2X1 U75 ( .A(n69), .B(n9), .Y(SUM[7]) );
  OAI21X1 U76 ( .A(n69), .B(n67), .C(n68), .Y(n66) );
  NAND2X1 U77 ( .A(n68), .B(n112), .Y(n9) );
  NOR2X1 U79 ( .A(B[7]), .B(A[7]), .Y(n67) );
  NAND2X1 U80 ( .A(B[7]), .B(A[7]), .Y(n68) );
  XNOR2X1 U81 ( .A(n77), .B(n10), .Y(SUM[6]) );
  XOR2X1 U92 ( .A(n179), .B(n11), .Y(SUM[5]) );
  NOR2X1 U96 ( .A(B[5]), .B(A[5]), .Y(n78) );
  XOR2X1 U98 ( .A(n85), .B(n12), .Y(SUM[4]) );
  XNOR2X1 U106 ( .A(n90), .B(n13), .Y(SUM[3]) );
  XNOR2X1 U114 ( .A(n96), .B(n14), .Y(SUM[2]) );
  XOR2X1 U123 ( .A(net969), .B(n15), .Y(SUM[1]) );
  NAND2X1 U132 ( .A(n177), .B(net361), .Y(n16) );
  NAND2X1 U49 ( .A(n50), .B(n62), .Y(n48) );
  NAND2X1 U16 ( .A(n28), .B(n105), .Y(n2) );
  NAND2X1 U19 ( .A(B[14]), .B(A[14]), .Y(n28) );
  NAND2X1 U24 ( .A(n33), .B(n30), .Y(n3) );
  NAND2X1 U27 ( .A(B[13]), .B(A[13]), .Y(n33) );
  NOR2X1 U18 ( .A(B[14]), .B(A[14]), .Y(n27) );
  NOR2X1 U14 ( .A(n27), .B(n32), .Y(n25) );
  OAI21X1 U33 ( .A(n39), .B(n45), .C(n40), .Y(n38) );
  OAI21X1 U52 ( .A(n52), .B(n58), .C(n53), .Y(n51) );
  OAI21X1 U48 ( .A(n69), .B(n48), .C(n49), .Y(n47) );
  AOI21X1 U50 ( .A(n63), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U12 ( .A(n25), .B(n37), .Y(n23) );
  NAND2X1 U102 ( .A(n84), .B(n115), .Y(n12) );
  AOI21X1 U107 ( .A(n86), .B(n90), .C(n87), .Y(n85) );
  NAND2X1 U140 ( .A(B[0]), .B(A[0]), .Y(n177) );
  OR2X2 U141 ( .A(n180), .B(n191), .Y(n178) );
  AND2X2 U142 ( .A(n185), .B(n181), .Y(n179) );
  AND2X2 U143 ( .A(n198), .B(n199), .Y(n180) );
  OR2X2 U144 ( .A(net969), .B(net808), .Y(n181) );
  AND2X2 U145 ( .A(n19), .B(n104), .Y(n182) );
  AND2X2 U146 ( .A(n203), .B(n202), .Y(n183) );
  NOR2X1 U147 ( .A(n23), .B(n49), .Y(n184) );
  AND2X2 U148 ( .A(net958), .B(net959), .Y(n185) );
  NAND2X1 U149 ( .A(n195), .B(n193), .Y(n186) );
  AND2X1 U150 ( .A(net1132), .B(n178), .Y(n187) );
  NAND2X1 U151 ( .A(n188), .B(n189), .Y(n190) );
  NAND2X1 U152 ( .A(net904), .B(n187), .Y(n188) );
  NAND2X1 U153 ( .A(n178), .B(n186), .Y(n189) );
  XOR2X1 U154 ( .A(n190), .B(n182), .Y(SUM[15]) );
  INVX1 U155 ( .A(net1065), .Y(n192) );
  NOR2X1 U156 ( .A(n192), .B(n183), .Y(n191) );
  INVX1 U157 ( .A(n191), .Y(n193) );
  INVX1 U158 ( .A(net959), .Y(n194) );
  NOR2X1 U159 ( .A(n194), .B(net1101), .Y(n195) );
  INVX2 U160 ( .A(n18), .Y(n104) );
  NOR2X1 U161 ( .A(n199), .B(n201), .Y(n202) );
  NAND2X1 U162 ( .A(net948), .B(net949), .Y(n201) );
  NOR2X1 U163 ( .A(n199), .B(net1109), .Y(net1110) );
  NOR2X1 U164 ( .A(n184), .B(n197), .Y(n203) );
  INVX2 U165 ( .A(n28), .Y(n197) );
  NOR2X1 U166 ( .A(n184), .B(n197), .Y(net1112) );
  AOI21X1 U167 ( .A(n180), .B(net644), .C(net645), .Y(net574) );
  NOR2X1 U168 ( .A(n23), .B(n48), .Y(n199) );
  AND2X2 U169 ( .A(net659), .B(net660), .Y(n198) );
  INVX2 U170 ( .A(n78), .Y(net660) );
  NAND2X1 U171 ( .A(net660), .B(net659), .Y(net1053) );
  AND2X2 U172 ( .A(net807), .B(n200), .Y(net1132) );
  NOR2X1 U173 ( .A(net664), .B(n196), .Y(n200) );
  INVX2 U174 ( .A(net780), .Y(n196) );
  NOR2X1 U175 ( .A(net664), .B(net1099), .Y(net1101) );
  INVX2 U176 ( .A(net670), .Y(net1099) );
  OAI21X1 U177 ( .A(A[0]), .B(B[0]), .C(CI), .Y(n204) );
  NAND2X1 U178 ( .A(net699), .B(n204), .Y(net904) );
  OR2X1 U179 ( .A(A[0]), .B(B[0]), .Y(net361) );
  NAND2X1 U180 ( .A(B[0]), .B(A[0]), .Y(net699) );
  XNOR2X1 U181 ( .A(CI), .B(n16), .Y(SUM[0]) );
  INVX1 U182 ( .A(net904), .Y(net969) );
  OR2X1 U183 ( .A(B[2]), .B(A[2]), .Y(net807) );
  INVX2 U184 ( .A(net807), .Y(n94) );
  NAND3X1 U185 ( .A(net807), .B(net780), .C(net823), .Y(net640) );
  NAND2X1 U186 ( .A(n86), .B(n115), .Y(net664) );
  OR2X1 U187 ( .A(net1099), .B(net664), .Y(net958) );
  NOR2X1 U188 ( .A(net664), .B(n94), .Y(net1072) );
  OR2X1 U189 ( .A(B[1]), .B(A[1]), .Y(net780) );
  NAND2X1 U190 ( .A(B[2]), .B(A[2]), .Y(n95) );
  NAND2X1 U191 ( .A(n89), .B(n86), .Y(n13) );
  NAND2X1 U192 ( .A(n115), .B(net965), .Y(net959) );
  NAND2X1 U193 ( .A(B[1]), .B(A[1]), .Y(n98) );
  NAND2X1 U194 ( .A(n84), .B(n89), .Y(net965) );
  OAI21X1 U195 ( .A(n98), .B(n94), .C(n95), .Y(net670) );
  OR2X1 U196 ( .A(n94), .B(net617), .Y(n14) );
  OR2X1 U197 ( .A(n98), .B(n94), .Y(net639) );
  NAND3X1 U198 ( .A(net1116), .B(net1126), .C(net1115), .Y(net1065) );
  AND2X2 U199 ( .A(net1065), .B(net1066), .Y(net645) );
  OAI21X1 U200 ( .A(n179), .B(net1053), .C(net671), .Y(net686) );
  NAND2X1 U201 ( .A(net1072), .B(net780), .Y(net808) );
  INVX2 U202 ( .A(net948), .Y(net1095) );
  NAND2X1 U203 ( .A(net948), .B(net949), .Y(net1109) );
  NAND2X1 U204 ( .A(net949), .B(net673), .Y(n205) );
  NOR2X1 U205 ( .A(net1095), .B(n205), .Y(net1115) );
  AND2X2 U206 ( .A(n28), .B(net672), .Y(net1116) );
  NAND2X1 U207 ( .A(net1112), .B(net1110), .Y(net1066) );
  OR2X1 U208 ( .A(n23), .B(n49), .Y(net1126) );
  NAND2X1 U209 ( .A(n38), .B(n25), .Y(net948) );
  OR2X1 U210 ( .A(n27), .B(n33), .Y(net949) );
  INVX2 U211 ( .A(net969), .Y(net823) );
  NAND2X1 U212 ( .A(B[4]), .B(A[4]), .Y(n84) );
  NAND2X1 U213 ( .A(B[3]), .B(A[3]), .Y(n89) );
  AOI21X1 U214 ( .A(n98), .B(net969), .C(n196), .Y(n96) );
  NAND2X1 U215 ( .A(n98), .B(net780), .Y(n15) );
  NAND2X1 U216 ( .A(n206), .B(n207), .Y(n115) );
  NAND2X1 U217 ( .A(n208), .B(n209), .Y(n86) );
  INVX2 U218 ( .A(A[3]), .Y(n209) );
  INVX2 U219 ( .A(B[3]), .Y(n208) );
  INVX2 U220 ( .A(A[4]), .Y(n206) );
  INVX2 U221 ( .A(B[4]), .Y(n207) );
  INVX2 U222 ( .A(n89), .Y(n87) );
  NAND2X1 U223 ( .A(net660), .B(n210), .Y(n11) );
  OAI21X1 U224 ( .A(n179), .B(n78), .C(n211), .Y(n77) );
  NAND3X1 U225 ( .A(n95), .B(net639), .C(net640), .Y(n90) );
  INVX2 U226 ( .A(n95), .Y(net617) );
  NAND2X1 U227 ( .A(B[5]), .B(A[5]), .Y(n211) );
  XNOR2X1 U228 ( .A(B[6]), .B(A[6]), .Y(n10) );
  AND2X2 U229 ( .A(net672), .B(net673), .Y(net671) );
  INVX2 U230 ( .A(n211), .Y(n212) );
  OR2X1 U231 ( .A(A[6]), .B(B[6]), .Y(net659) );
  NAND2X1 U232 ( .A(B[6]), .B(A[6]), .Y(net673) );
  INVX2 U233 ( .A(net686), .Y(n69) );
  NAND2X1 U234 ( .A(B[5]), .B(A[5]), .Y(n210) );
  NAND2X1 U235 ( .A(n212), .B(net659), .Y(net672) );
  NAND2X1 U236 ( .A(n185), .B(n181), .Y(net644) );
  INVX2 U237 ( .A(n38), .Y(n36) );
  INVX2 U238 ( .A(n27), .Y(n105) );
  INVX2 U239 ( .A(n33), .Y(n31) );
  INVX2 U240 ( .A(n63), .Y(n61) );
  INVX2 U241 ( .A(n62), .Y(n60) );
  INVX2 U242 ( .A(n58), .Y(n56) );
  INVX2 U243 ( .A(n47), .Y(n46) );
  INVX2 U244 ( .A(n45), .Y(n43) );
  INVX2 U245 ( .A(n37), .Y(n35) );
  INVX2 U246 ( .A(n67), .Y(n112) );
  INVX2 U247 ( .A(n64), .Y(n111) );
  INVX2 U248 ( .A(n57), .Y(n55) );
  INVX2 U249 ( .A(n52), .Y(n109) );
  INVX2 U250 ( .A(n44), .Y(n42) );
  INVX2 U251 ( .A(n39), .Y(n107) );
  INVX2 U252 ( .A(n32), .Y(n30) );
endmodule


module adder_16 ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;


  adder_16_DW01_add_1 r304 ( .A({1'b0, a}), .B({1'b0, b}), .CI(carry_in), 
        .SUM({overflow, sum}) );
endmodule

