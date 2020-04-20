/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb 10 21:23:00 2019
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n50, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90;

  DFFSR \count_reg[0]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR flag_reg ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rollover_flag)
         );
  DFFSR \count_reg[1]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_reg[2]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_reg[3]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  MUX2X1 U55 ( .B(n56), .A(n57), .S(n58), .Y(n55) );
  OAI21X1 U56 ( .A(rollover_flag), .B(n57), .C(n59), .Y(n56) );
  MUX2X1 U57 ( .B(n60), .A(n61), .S(count_out[1]), .Y(n54) );
  AOI21X1 U58 ( .A(n62), .B(n57), .C(n58), .Y(n61) );
  INVX1 U59 ( .A(count_out[0]), .Y(n57) );
  NAND2X1 U60 ( .A(n63), .B(count_out[0]), .Y(n60) );
  MUX2X1 U61 ( .B(n64), .A(n65), .S(count_out[2]), .Y(n53) );
  AOI21X1 U62 ( .A(n62), .B(n66), .C(n58), .Y(n65) );
  NAND2X1 U63 ( .A(n67), .B(n63), .Y(n64) );
  MUX2X1 U64 ( .B(n68), .A(n69), .S(count_out[3]), .Y(n52) );
  AOI21X1 U65 ( .A(n62), .B(n70), .C(n58), .Y(n69) );
  NAND2X1 U66 ( .A(n71), .B(n63), .Y(n68) );
  NOR2X1 U67 ( .A(n72), .B(n58), .Y(n63) );
  NOR2X1 U68 ( .A(clear), .B(count_enable), .Y(n58) );
  INVX1 U69 ( .A(n62), .Y(n72) );
  NOR2X1 U70 ( .A(clear), .B(rollover_flag), .Y(n62) );
  MUX2X1 U71 ( .B(n73), .A(n74), .S(n75), .Y(n50) );
  AND2X1 U72 ( .A(n59), .B(count_enable), .Y(n75) );
  INVX1 U73 ( .A(clear), .Y(n59) );
  NAND3X1 U74 ( .A(n76), .B(n77), .C(n78), .Y(n74) );
  AOI21X1 U75 ( .A(n79), .B(n80), .C(n81), .Y(n78) );
  MUX2X1 U76 ( .B(n82), .A(n83), .S(n67), .Y(n81) );
  NAND2X1 U77 ( .A(rollover_val[2]), .B(n84), .Y(n82) );
  XOR2X1 U78 ( .A(n84), .B(n66), .Y(n79) );
  INVX1 U79 ( .A(count_out[2]), .Y(n84) );
  MUX2X1 U80 ( .B(n85), .A(n86), .S(n71), .Y(n77) );
  INVX1 U81 ( .A(n70), .Y(n71) );
  NAND2X1 U82 ( .A(count_out[2]), .B(n67), .Y(n70) );
  INVX1 U83 ( .A(n66), .Y(n67) );
  NAND2X1 U84 ( .A(count_out[1]), .B(count_out[0]), .Y(n66) );
  NAND2X1 U85 ( .A(n85), .B(n80), .Y(n86) );
  INVX1 U86 ( .A(rollover_val[2]), .Y(n80) );
  XOR2X1 U87 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n85) );
  MUX2X1 U88 ( .B(n87), .A(n88), .S(count_out[0]), .Y(n76) );
  OAI21X1 U89 ( .A(rollover_val[1]), .B(count_out[1]), .C(n89), .Y(n88) );
  INVX1 U90 ( .A(rollover_val[0]), .Y(n89) );
  NAND2X1 U91 ( .A(n90), .B(rollover_val[0]), .Y(n87) );
  XOR2X1 U92 ( .A(n83), .B(count_out[1]), .Y(n90) );
  INVX1 U93 ( .A(rollover_val[1]), .Y(n83) );
  INVX1 U94 ( .A(rollover_flag), .Y(n73) );
endmodule

