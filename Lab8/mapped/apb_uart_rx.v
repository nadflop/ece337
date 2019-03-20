/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar  7 22:58:16 2019
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, data_read, psel, paddr, penable, pwrite, pwdata, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \rf[6][7] , \rf[6][6] , \rf[6][5] , \rf[6][4] , \rf[6][3] ,
         \rf[6][2] , \rf[6][1] , \rf[6][0] , \rf[5][7] , \rf[5][6] ,
         \rf[5][5] , \rf[5][4] , \rf[5][3] , \rf[5][2] , \rf[5][1] ,
         \rf[5][0] , \rf[4][7] , \rf[4][6] , \rf[4][5] , \rf[4][4] ,
         \rf[4][3] , \rf[4][2] , \rf[4][1] , \rf[4][0] , \rf[3][7] ,
         \rf[3][6] , \rf[3][5] , \rf[3][4] , \rf[3][3] , \rf[3][2] ,
         \rf[3][1] , \rf[3][0] , \rf[2][7] , \rf[2][6] , \rf[2][5] ,
         \rf[2][4] , \rf[2][3] , \rf[2][2] , \rf[2][1] , \rf[2][0] ,
         \rf[1][7] , \rf[1][6] , \rf[1][5] , \rf[1][4] , \rf[1][3] ,
         \rf[1][2] , \rf[1][1] , \rf[1][0] , \rf[0][7] , \rf[0][6] ,
         \rf[0][5] , \rf[0][4] , \rf[0][3] , \rf[0][2] , \rf[0][1] ,
         \rf[0][0] , \next_rf[6][7] , \next_rf[6][6] , \next_rf[6][5] ,
         \next_rf[6][4] , \next_rf[6][3] , \next_rf[6][2] , \next_rf[6][1] ,
         \next_rf[6][0] , \next_rf[4][7] , \next_rf[4][6] , \next_rf[4][5] ,
         \next_rf[4][4] , \next_rf[4][3] , \next_rf[4][2] , \next_rf[4][1] ,
         \next_rf[4][0] , \next_rf[3][7] , \next_rf[3][6] , \next_rf[3][5] ,
         \next_rf[3][4] , \next_rf[3][3] , \next_rf[3][2] , \next_rf[3][1] ,
         \next_rf[3][0] , \next_rf[2][7] , \next_rf[2][6] , \next_rf[2][5] ,
         \next_rf[2][4] , \next_rf[2][3] , \next_rf[2][2] , \next_rf[2][1] ,
         \next_rf[2][0] , \next_rf[1][7] , \next_rf[1][6] , \next_rf[1][5] ,
         \next_rf[1][4] , \next_rf[1][3] , \next_rf[1][2] , \next_rf[1][1] ,
         \next_rf[1][0] , \next_rf[0][7] , \next_rf[0][6] , \next_rf[0][5] ,
         \next_rf[0][4] , \next_rf[0][3] , \next_rf[0][2] , \next_rf[0][1] ,
         \next_rf[0][0] , n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \bit_period_reg[7]  ( .D(\next_rf[2][7] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[7]) );
  DFFSR \bit_period_reg[6]  ( .D(\next_rf[2][6] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[6]) );
  DFFSR \bit_period_reg[5]  ( .D(\next_rf[2][5] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[5]) );
  DFFSR \bit_period_reg[4]  ( .D(\next_rf[2][4] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[4]) );
  DFFSR \bit_period_reg[3]  ( .D(\next_rf[2][3] ), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(bit_period[3]) );
  DFFSR \bit_period_reg[2]  ( .D(\next_rf[2][2] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[2]) );
  DFFSR \bit_period_reg[1]  ( .D(\next_rf[2][1] ), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(bit_period[1]) );
  DFFSR \bit_period_reg[0]  ( .D(\next_rf[2][0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[0]) );
  DFFSR \bit_period_reg[13]  ( .D(\next_rf[3][5] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[13]) );
  DFFSR \bit_period_reg[12]  ( .D(\next_rf[3][4] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[12]) );
  DFFSR \bit_period_reg[11]  ( .D(\next_rf[3][3] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[11]) );
  DFFSR \bit_period_reg[10]  ( .D(\next_rf[3][2] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[10]) );
  DFFSR \bit_period_reg[9]  ( .D(\next_rf[3][1] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_reg[8]  ( .D(\next_rf[3][0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(bit_period[8]) );
  DFFSR \rf_reg[6][7]  ( .D(\next_rf[6][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][7] ) );
  DFFSR \rf_reg[6][6]  ( .D(\next_rf[6][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][6] ) );
  DFFSR \rf_reg[6][5]  ( .D(\next_rf[6][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][5] ) );
  DFFSR \rf_reg[6][4]  ( .D(\next_rf[6][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][4] ) );
  DFFSR \rf_reg[6][3]  ( .D(\next_rf[6][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][3] ) );
  DFFSR \rf_reg[6][2]  ( .D(\next_rf[6][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][2] ) );
  DFFSR \rf_reg[6][1]  ( .D(\next_rf[6][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][1] ) );
  DFFSR \rf_reg[6][0]  ( .D(\next_rf[6][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[6][0] ) );
  DFFSR \rf_reg[5][7]  ( .D(n212), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][7] ) );
  DFFSR \rf_reg[5][6]  ( .D(n213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][6] ) );
  DFFSR \rf_reg[5][5]  ( .D(n214), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][5] ) );
  DFFSR \rf_reg[5][4]  ( .D(n215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][4] ) );
  DFFSR \rf_reg[5][3]  ( .D(n216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][3] ) );
  DFFSR \rf_reg[5][2]  ( .D(n217), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][2] ) );
  DFFSR \rf_reg[5][1]  ( .D(n218), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][1] ) );
  DFFSR \rf_reg[5][0]  ( .D(n219), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \rf[5][0] ) );
  DFFSR \rf_reg[4][7]  ( .D(\next_rf[4][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][7] ) );
  DFFSR \rf_reg[4][6]  ( .D(\next_rf[4][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][6] ) );
  DFFSR \rf_reg[4][5]  ( .D(\next_rf[4][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][5] ) );
  DFFSR \rf_reg[4][4]  ( .D(\next_rf[4][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][4] ) );
  DFFSR \rf_reg[3][7]  ( .D(\next_rf[3][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][7] ) );
  DFFSR \rf_reg[3][6]  ( .D(\next_rf[3][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][6] ) );
  DFFSR \rf_reg[3][5]  ( .D(\next_rf[3][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][5] ) );
  DFFSR \rf_reg[3][4]  ( .D(\next_rf[3][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][4] ) );
  DFFSR \rf_reg[3][3]  ( .D(\next_rf[3][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][3] ) );
  DFFSR \rf_reg[3][2]  ( .D(\next_rf[3][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][2] ) );
  DFFSR \rf_reg[3][1]  ( .D(\next_rf[3][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][1] ) );
  DFFSR \rf_reg[3][0]  ( .D(\next_rf[3][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[3][0] ) );
  DFFSR \rf_reg[2][7]  ( .D(\next_rf[2][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][7] ) );
  DFFSR \rf_reg[2][6]  ( .D(\next_rf[2][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][6] ) );
  DFFSR \rf_reg[2][5]  ( .D(\next_rf[2][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][5] ) );
  DFFSR \rf_reg[2][4]  ( .D(\next_rf[2][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][4] ) );
  DFFSR \rf_reg[2][3]  ( .D(\next_rf[2][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][3] ) );
  DFFSR \rf_reg[2][2]  ( .D(\next_rf[2][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][2] ) );
  DFFSR \rf_reg[2][1]  ( .D(\next_rf[2][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][1] ) );
  DFFSR \rf_reg[2][0]  ( .D(\next_rf[2][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[2][0] ) );
  DFFSR \rf_reg[1][7]  ( .D(\next_rf[1][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][7] ) );
  DFFSR \rf_reg[1][6]  ( .D(\next_rf[1][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][6] ) );
  DFFSR \rf_reg[1][5]  ( .D(\next_rf[1][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][5] ) );
  DFFSR \rf_reg[1][4]  ( .D(\next_rf[1][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][4] ) );
  DFFSR \rf_reg[1][3]  ( .D(\next_rf[1][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][3] ) );
  DFFSR \rf_reg[1][2]  ( .D(\next_rf[1][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][2] ) );
  DFFSR \rf_reg[1][1]  ( .D(\next_rf[1][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][1] ) );
  DFFSR \rf_reg[1][0]  ( .D(\next_rf[1][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[1][0] ) );
  DFFSR \rf_reg[0][7]  ( .D(\next_rf[0][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][7] ) );
  DFFSR \rf_reg[0][6]  ( .D(\next_rf[0][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][6] ) );
  DFFSR \rf_reg[0][5]  ( .D(\next_rf[0][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][5] ) );
  DFFSR \rf_reg[0][4]  ( .D(\next_rf[0][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][4] ) );
  DFFSR \rf_reg[0][3]  ( .D(\next_rf[0][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][3] ) );
  DFFSR \rf_reg[0][2]  ( .D(\next_rf[0][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][2] ) );
  DFFSR \rf_reg[0][1]  ( .D(\next_rf[0][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][1] ) );
  DFFSR \rf_reg[0][0]  ( .D(\next_rf[0][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[0][0] ) );
  DFFSR \data_size_reg[3]  ( .D(\next_rf[4][3] ), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(data_size[3]) );
  DFFSR \rf_reg[4][3]  ( .D(\next_rf[4][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][3] ) );
  DFFSR \data_size_reg[2]  ( .D(\next_rf[4][2] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(data_size[2]) );
  DFFSR \rf_reg[4][2]  ( .D(\next_rf[4][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][2] ) );
  DFFSR \data_size_reg[1]  ( .D(\next_rf[4][1] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(data_size[1]) );
  DFFSR \rf_reg[4][1]  ( .D(\next_rf[4][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][1] ) );
  DFFSR \data_size_reg[0]  ( .D(\next_rf[4][0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(data_size[0]) );
  DFFSR \rf_reg[4][0]  ( .D(\next_rf[4][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\rf[4][0] ) );
  NOR2X1 U79 ( .A(n77), .B(n78), .Y(pslverr) );
  NOR2X1 U80 ( .A(n79), .B(n80), .Y(next_state[1]) );
  OAI21X1 U81 ( .A(n81), .B(n82), .C(psel), .Y(n80) );
  OAI21X1 U82 ( .A(n83), .B(paddr[1]), .C(n84), .Y(n82) );
  NOR2X1 U83 ( .A(paddr[0]), .B(n85), .Y(n83) );
  INVX1 U84 ( .A(pwrite), .Y(n81) );
  NOR2X1 U85 ( .A(n79), .B(n86), .Y(next_state[0]) );
  NAND2X1 U86 ( .A(psel), .B(pwrite), .Y(n86) );
  NAND2X1 U87 ( .A(n77), .B(n78), .Y(n79) );
  INVX1 U88 ( .A(n87), .Y(\next_rf[6][7] ) );
  MUX2X1 U89 ( .B(pwdata[7]), .A(rx_data[7]), .S(n88), .Y(n87) );
  INVX1 U90 ( .A(n89), .Y(\next_rf[6][6] ) );
  MUX2X1 U91 ( .B(pwdata[6]), .A(rx_data[6]), .S(n88), .Y(n89) );
  INVX1 U92 ( .A(n90), .Y(\next_rf[6][5] ) );
  MUX2X1 U93 ( .B(pwdata[5]), .A(rx_data[5]), .S(n88), .Y(n90) );
  INVX1 U94 ( .A(n91), .Y(\next_rf[6][4] ) );
  MUX2X1 U95 ( .B(pwdata[4]), .A(rx_data[4]), .S(n88), .Y(n91) );
  INVX1 U96 ( .A(n92), .Y(\next_rf[6][3] ) );
  MUX2X1 U97 ( .B(pwdata[3]), .A(rx_data[3]), .S(n88), .Y(n92) );
  INVX1 U98 ( .A(n93), .Y(\next_rf[6][2] ) );
  MUX2X1 U99 ( .B(pwdata[2]), .A(rx_data[2]), .S(n88), .Y(n93) );
  INVX1 U100 ( .A(n94), .Y(\next_rf[6][1] ) );
  MUX2X1 U101 ( .B(pwdata[1]), .A(rx_data[1]), .S(n88), .Y(n94) );
  INVX1 U102 ( .A(n95), .Y(\next_rf[6][0] ) );
  MUX2X1 U103 ( .B(pwdata[0]), .A(rx_data[0]), .S(n88), .Y(n95) );
  NAND3X1 U104 ( .A(n96), .B(n97), .C(n98), .Y(n88) );
  NOR2X1 U105 ( .A(n99), .B(n100), .Y(\next_rf[4][7] ) );
  NOR2X1 U106 ( .A(n101), .B(n100), .Y(\next_rf[4][6] ) );
  NOR2X1 U107 ( .A(n102), .B(n100), .Y(\next_rf[4][5] ) );
  NOR2X1 U108 ( .A(n103), .B(n100), .Y(\next_rf[4][4] ) );
  INVX1 U109 ( .A(n104), .Y(\next_rf[4][3] ) );
  MUX2X1 U110 ( .B(pwdata[3]), .A(data_size[3]), .S(n100), .Y(n104) );
  INVX1 U111 ( .A(n105), .Y(\next_rf[4][2] ) );
  MUX2X1 U112 ( .B(pwdata[2]), .A(data_size[2]), .S(n100), .Y(n105) );
  INVX1 U113 ( .A(n106), .Y(\next_rf[4][1] ) );
  MUX2X1 U114 ( .B(pwdata[1]), .A(data_size[1]), .S(n100), .Y(n106) );
  INVX1 U115 ( .A(n107), .Y(\next_rf[4][0] ) );
  MUX2X1 U116 ( .B(pwdata[0]), .A(data_size[0]), .S(n100), .Y(n107) );
  NAND2X1 U117 ( .A(n108), .B(n96), .Y(n100) );
  NOR2X1 U118 ( .A(n99), .B(n109), .Y(\next_rf[3][7] ) );
  NOR2X1 U119 ( .A(n101), .B(n109), .Y(\next_rf[3][6] ) );
  INVX1 U120 ( .A(n110), .Y(\next_rf[3][5] ) );
  MUX2X1 U121 ( .B(pwdata[5]), .A(bit_period[13]), .S(n109), .Y(n110) );
  INVX1 U122 ( .A(n111), .Y(\next_rf[3][4] ) );
  MUX2X1 U123 ( .B(pwdata[4]), .A(bit_period[12]), .S(n109), .Y(n111) );
  INVX1 U124 ( .A(n112), .Y(\next_rf[3][3] ) );
  MUX2X1 U125 ( .B(pwdata[3]), .A(bit_period[11]), .S(n109), .Y(n112) );
  INVX1 U126 ( .A(n113), .Y(\next_rf[3][2] ) );
  MUX2X1 U127 ( .B(pwdata[2]), .A(bit_period[10]), .S(n109), .Y(n113) );
  INVX1 U128 ( .A(n114), .Y(\next_rf[3][1] ) );
  MUX2X1 U129 ( .B(pwdata[1]), .A(bit_period[9]), .S(n109), .Y(n114) );
  INVX1 U130 ( .A(n115), .Y(\next_rf[3][0] ) );
  MUX2X1 U131 ( .B(pwdata[0]), .A(bit_period[8]), .S(n109), .Y(n115) );
  NAND3X1 U132 ( .A(n96), .B(n85), .C(n116), .Y(n109) );
  INVX1 U133 ( .A(n117), .Y(\next_rf[2][7] ) );
  MUX2X1 U134 ( .B(bit_period[7]), .A(pwdata[7]), .S(n118), .Y(n117) );
  INVX1 U135 ( .A(n119), .Y(\next_rf[2][6] ) );
  MUX2X1 U136 ( .B(bit_period[6]), .A(pwdata[6]), .S(n118), .Y(n119) );
  INVX1 U137 ( .A(n120), .Y(\next_rf[2][5] ) );
  MUX2X1 U138 ( .B(bit_period[5]), .A(pwdata[5]), .S(n118), .Y(n120) );
  INVX1 U139 ( .A(n121), .Y(\next_rf[2][4] ) );
  MUX2X1 U140 ( .B(bit_period[4]), .A(pwdata[4]), .S(n118), .Y(n121) );
  INVX1 U141 ( .A(n122), .Y(\next_rf[2][3] ) );
  MUX2X1 U142 ( .B(bit_period[3]), .A(pwdata[3]), .S(n118), .Y(n122) );
  INVX1 U143 ( .A(n123), .Y(\next_rf[2][2] ) );
  MUX2X1 U144 ( .B(bit_period[2]), .A(pwdata[2]), .S(n118), .Y(n123) );
  INVX1 U145 ( .A(n124), .Y(\next_rf[2][1] ) );
  MUX2X1 U146 ( .B(bit_period[1]), .A(pwdata[1]), .S(n118), .Y(n124) );
  INVX1 U147 ( .A(n125), .Y(\next_rf[2][0] ) );
  MUX2X1 U148 ( .B(bit_period[0]), .A(pwdata[0]), .S(n118), .Y(n125) );
  AND2X1 U149 ( .A(n126), .B(n96), .Y(n118) );
  NOR2X1 U150 ( .A(n99), .B(n127), .Y(\next_rf[1][7] ) );
  NOR2X1 U151 ( .A(n101), .B(n127), .Y(\next_rf[1][6] ) );
  NOR2X1 U152 ( .A(n102), .B(n127), .Y(\next_rf[1][5] ) );
  NOR2X1 U153 ( .A(n103), .B(n127), .Y(\next_rf[1][4] ) );
  NOR2X1 U154 ( .A(n128), .B(n127), .Y(\next_rf[1][3] ) );
  NOR2X1 U155 ( .A(n129), .B(n127), .Y(\next_rf[1][2] ) );
  MUX2X1 U156 ( .B(n130), .A(n131), .S(n127), .Y(\next_rf[1][1] ) );
  NAND2X1 U157 ( .A(overrun_error), .B(n132), .Y(n131) );
  MUX2X1 U158 ( .B(n133), .A(n132), .S(n127), .Y(\next_rf[1][0] ) );
  NAND2X1 U159 ( .A(n134), .B(n96), .Y(n127) );
  INVX1 U160 ( .A(framing_error), .Y(n132) );
  INVX1 U161 ( .A(pwdata[0]), .Y(n133) );
  NOR2X1 U162 ( .A(n99), .B(n135), .Y(\next_rf[0][7] ) );
  INVX1 U163 ( .A(pwdata[7]), .Y(n99) );
  NOR2X1 U164 ( .A(n101), .B(n135), .Y(\next_rf[0][6] ) );
  INVX1 U165 ( .A(pwdata[6]), .Y(n101) );
  NOR2X1 U166 ( .A(n102), .B(n135), .Y(\next_rf[0][5] ) );
  INVX1 U167 ( .A(pwdata[5]), .Y(n102) );
  NOR2X1 U168 ( .A(n103), .B(n135), .Y(\next_rf[0][4] ) );
  INVX1 U169 ( .A(pwdata[4]), .Y(n103) );
  NOR2X1 U170 ( .A(n128), .B(n135), .Y(\next_rf[0][3] ) );
  INVX1 U171 ( .A(pwdata[3]), .Y(n128) );
  NOR2X1 U172 ( .A(n129), .B(n135), .Y(\next_rf[0][2] ) );
  INVX1 U173 ( .A(pwdata[2]), .Y(n129) );
  NOR2X1 U174 ( .A(n130), .B(n135), .Y(\next_rf[0][1] ) );
  INVX1 U175 ( .A(pwdata[1]), .Y(n130) );
  INVX1 U176 ( .A(n136), .Y(\next_rf[0][0] ) );
  MUX2X1 U177 ( .B(pwdata[0]), .A(data_ready), .S(n135), .Y(n136) );
  NAND2X1 U178 ( .A(n137), .B(n96), .Y(n135) );
  INVX1 U179 ( .A(n138), .Y(n212) );
  MUX2X1 U180 ( .B(pwdata[7]), .A(\rf[5][7] ), .S(n139), .Y(n138) );
  INVX1 U181 ( .A(n140), .Y(n213) );
  MUX2X1 U182 ( .B(pwdata[6]), .A(\rf[5][6] ), .S(n139), .Y(n140) );
  INVX1 U183 ( .A(n141), .Y(n214) );
  MUX2X1 U184 ( .B(pwdata[5]), .A(\rf[5][5] ), .S(n139), .Y(n141) );
  INVX1 U185 ( .A(n142), .Y(n215) );
  MUX2X1 U186 ( .B(pwdata[4]), .A(\rf[5][4] ), .S(n139), .Y(n142) );
  INVX1 U187 ( .A(n143), .Y(n216) );
  MUX2X1 U188 ( .B(pwdata[3]), .A(\rf[5][3] ), .S(n139), .Y(n143) );
  INVX1 U189 ( .A(n144), .Y(n217) );
  MUX2X1 U190 ( .B(pwdata[2]), .A(\rf[5][2] ), .S(n139), .Y(n144) );
  INVX1 U191 ( .A(n145), .Y(n218) );
  MUX2X1 U192 ( .B(pwdata[1]), .A(\rf[5][1] ), .S(n139), .Y(n145) );
  INVX1 U193 ( .A(n146), .Y(n219) );
  MUX2X1 U194 ( .B(pwdata[0]), .A(\rf[5][0] ), .S(n139), .Y(n146) );
  NAND3X1 U195 ( .A(n96), .B(n147), .C(n148), .Y(n139) );
  NOR2X1 U196 ( .A(n77), .B(state[1]), .Y(n96) );
  INVX1 U197 ( .A(state[0]), .Y(n77) );
  INVX1 U198 ( .A(n149), .Y(prdata[0]) );
  OAI21X1 U199 ( .A(n150), .B(n151), .C(n152), .Y(n149) );
  OAI21X1 U200 ( .A(n84), .B(n153), .C(n154), .Y(n151) );
  AOI22X1 U201 ( .A(\rf[2][0] ), .B(n126), .C(\rf[4][0] ), .D(n108), .Y(n154)
         );
  INVX1 U202 ( .A(\rf[6][0] ), .Y(n153) );
  NAND2X1 U203 ( .A(n155), .B(n156), .Y(n150) );
  AOI22X1 U204 ( .A(\rf[0][0] ), .B(n137), .C(\rf[1][0] ), .D(n134), .Y(n156)
         );
  AOI22X1 U205 ( .A(\rf[3][0] ), .B(n116), .C(\rf[5][0] ), .D(n148), .Y(n155)
         );
  INVX1 U206 ( .A(n157), .Y(prdata[1]) );
  OAI21X1 U207 ( .A(n158), .B(n159), .C(n152), .Y(n157) );
  OAI21X1 U208 ( .A(n84), .B(n160), .C(n161), .Y(n159) );
  AOI22X1 U209 ( .A(\rf[2][1] ), .B(n126), .C(\rf[4][1] ), .D(n108), .Y(n161)
         );
  INVX1 U210 ( .A(\rf[6][1] ), .Y(n160) );
  NAND2X1 U211 ( .A(n162), .B(n163), .Y(n158) );
  AOI22X1 U212 ( .A(\rf[0][1] ), .B(n137), .C(\rf[1][1] ), .D(n134), .Y(n163)
         );
  AOI22X1 U213 ( .A(\rf[3][1] ), .B(n116), .C(\rf[5][1] ), .D(n148), .Y(n162)
         );
  INVX1 U214 ( .A(n164), .Y(prdata[2]) );
  OAI21X1 U215 ( .A(n165), .B(n166), .C(n152), .Y(n164) );
  OAI21X1 U216 ( .A(n84), .B(n167), .C(n168), .Y(n166) );
  AOI22X1 U217 ( .A(\rf[2][2] ), .B(n126), .C(\rf[4][2] ), .D(n108), .Y(n168)
         );
  INVX1 U218 ( .A(\rf[6][2] ), .Y(n167) );
  NAND2X1 U219 ( .A(n169), .B(n170), .Y(n165) );
  AOI22X1 U220 ( .A(\rf[0][2] ), .B(n137), .C(\rf[1][2] ), .D(n134), .Y(n170)
         );
  AOI22X1 U221 ( .A(\rf[3][2] ), .B(n116), .C(\rf[5][2] ), .D(n148), .Y(n169)
         );
  INVX1 U222 ( .A(n171), .Y(prdata[3]) );
  OAI21X1 U223 ( .A(n172), .B(n173), .C(n152), .Y(n171) );
  OAI21X1 U224 ( .A(n84), .B(n174), .C(n175), .Y(n173) );
  AOI22X1 U225 ( .A(\rf[2][3] ), .B(n126), .C(\rf[4][3] ), .D(n108), .Y(n175)
         );
  INVX1 U226 ( .A(\rf[6][3] ), .Y(n174) );
  NAND2X1 U227 ( .A(n176), .B(n177), .Y(n172) );
  AOI22X1 U228 ( .A(\rf[0][3] ), .B(n137), .C(\rf[1][3] ), .D(n134), .Y(n177)
         );
  AOI22X1 U229 ( .A(\rf[3][3] ), .B(n116), .C(\rf[5][3] ), .D(n148), .Y(n176)
         );
  INVX1 U230 ( .A(n178), .Y(prdata[4]) );
  OAI21X1 U231 ( .A(n179), .B(n180), .C(n152), .Y(n178) );
  OAI21X1 U232 ( .A(n84), .B(n181), .C(n182), .Y(n180) );
  AOI22X1 U233 ( .A(\rf[2][4] ), .B(n126), .C(\rf[4][4] ), .D(n108), .Y(n182)
         );
  INVX1 U234 ( .A(\rf[6][4] ), .Y(n181) );
  NAND2X1 U235 ( .A(n183), .B(n184), .Y(n179) );
  AOI22X1 U236 ( .A(\rf[0][4] ), .B(n137), .C(\rf[1][4] ), .D(n134), .Y(n184)
         );
  AOI22X1 U237 ( .A(\rf[3][4] ), .B(n116), .C(\rf[5][4] ), .D(n148), .Y(n183)
         );
  INVX1 U238 ( .A(n185), .Y(prdata[5]) );
  OAI21X1 U239 ( .A(n186), .B(n187), .C(n152), .Y(n185) );
  OAI21X1 U240 ( .A(n84), .B(n188), .C(n189), .Y(n187) );
  AOI22X1 U241 ( .A(\rf[2][5] ), .B(n126), .C(\rf[4][5] ), .D(n108), .Y(n189)
         );
  INVX1 U242 ( .A(\rf[6][5] ), .Y(n188) );
  NAND2X1 U243 ( .A(n190), .B(n191), .Y(n186) );
  AOI22X1 U244 ( .A(\rf[0][5] ), .B(n137), .C(\rf[1][5] ), .D(n134), .Y(n191)
         );
  AOI22X1 U245 ( .A(\rf[3][5] ), .B(n116), .C(\rf[5][5] ), .D(n148), .Y(n190)
         );
  INVX1 U246 ( .A(n192), .Y(prdata[6]) );
  OAI21X1 U247 ( .A(n193), .B(n194), .C(n152), .Y(n192) );
  OAI21X1 U248 ( .A(n84), .B(n195), .C(n196), .Y(n194) );
  AOI22X1 U249 ( .A(\rf[2][6] ), .B(n126), .C(\rf[4][6] ), .D(n108), .Y(n196)
         );
  INVX1 U250 ( .A(\rf[6][6] ), .Y(n195) );
  NAND2X1 U251 ( .A(n197), .B(n198), .Y(n193) );
  AOI22X1 U252 ( .A(\rf[0][6] ), .B(n137), .C(\rf[1][6] ), .D(n134), .Y(n198)
         );
  AOI22X1 U253 ( .A(\rf[3][6] ), .B(n116), .C(\rf[5][6] ), .D(n148), .Y(n197)
         );
  INVX1 U254 ( .A(n199), .Y(prdata[7]) );
  OAI21X1 U255 ( .A(n200), .B(n201), .C(n152), .Y(n199) );
  OAI21X1 U256 ( .A(n84), .B(n202), .C(n203), .Y(n201) );
  AOI22X1 U257 ( .A(\rf[2][7] ), .B(n126), .C(\rf[4][7] ), .D(n108), .Y(n203)
         );
  INVX1 U258 ( .A(n204), .Y(n108) );
  NAND3X1 U259 ( .A(n97), .B(n147), .C(paddr[2]), .Y(n204) );
  INVX1 U260 ( .A(n205), .Y(n126) );
  NAND3X1 U261 ( .A(n97), .B(n85), .C(paddr[1]), .Y(n205) );
  INVX1 U262 ( .A(\rf[6][7] ), .Y(n202) );
  INVX1 U263 ( .A(n98), .Y(n84) );
  NAND2X1 U264 ( .A(n206), .B(n207), .Y(n200) );
  AOI22X1 U265 ( .A(\rf[0][7] ), .B(n137), .C(\rf[1][7] ), .D(n134), .Y(n207)
         );
  INVX1 U266 ( .A(n208), .Y(n134) );
  NAND3X1 U267 ( .A(n147), .B(n85), .C(paddr[0]), .Y(n208) );
  INVX1 U268 ( .A(n209), .Y(n137) );
  NAND3X1 U269 ( .A(n147), .B(n85), .C(n97), .Y(n209) );
  AOI22X1 U270 ( .A(\rf[3][7] ), .B(n116), .C(\rf[5][7] ), .D(n148), .Y(n206)
         );
  NOR2X1 U271 ( .A(n97), .B(n85), .Y(n148) );
  NOR2X1 U272 ( .A(n97), .B(n147), .Y(n116) );
  NOR2X1 U273 ( .A(n210), .B(n211), .Y(data_read) );
  NAND2X1 U274 ( .A(n98), .B(n97), .Y(n211) );
  INVX1 U275 ( .A(paddr[0]), .Y(n97) );
  NOR2X1 U276 ( .A(n85), .B(n147), .Y(n98) );
  INVX1 U277 ( .A(paddr[1]), .Y(n147) );
  INVX1 U278 ( .A(paddr[2]), .Y(n85) );
  INVX1 U279 ( .A(n152), .Y(n210) );
  NOR2X1 U280 ( .A(n78), .B(state[0]), .Y(n152) );
  INVX1 U281 ( .A(state[1]), .Y(n78) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

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
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_1 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;

  wire   [14:2] carry;

  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(SUM[14]), .YS(SUM[13]) );
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
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n116, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n3, n4, n5, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115;

  DFFSR \count_out_reg[0]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n116)
         );
  DFFSR \count_out_reg[1]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[10]  ( .D(n78), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[11]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[12]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[13]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 add_40_aco ( .A({N82, N81, N80, N79, 
        N78, N77, N76, N75, N74, N73, N72, N71, N70, N69}), .SUM({N18, N17, 
        N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5}) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_1 add_43 ( .A({1'b0, count_out}), .SUM(
        {N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, 
        N19}) );
  INVX2 U4 ( .A(n115), .Y(n3) );
  INVX2 U20 ( .A(n22), .Y(rollover_flag) );
  OAI21X1 U21 ( .A(n3), .B(n4), .C(n5), .Y(n89) );
  NAND2X1 U22 ( .A(N5), .B(n21), .Y(n5) );
  OAI21X1 U23 ( .A(n3), .B(n22), .C(n23), .Y(n88) );
  NAND2X1 U24 ( .A(n21), .B(n24), .Y(n23) );
  OAI21X1 U25 ( .A(n25), .B(n26), .C(n27), .Y(n24) );
  NAND2X1 U26 ( .A(n28), .B(n29), .Y(n27) );
  NOR2X1 U27 ( .A(n30), .B(n31), .Y(n29) );
  NAND3X1 U28 ( .A(n32), .B(n33), .C(n34), .Y(n31) );
  NOR2X1 U29 ( .A(n35), .B(n36), .Y(n34) );
  XOR2X1 U30 ( .A(rollover_val[11]), .B(N30), .Y(n36) );
  XOR2X1 U31 ( .A(rollover_val[10]), .B(N29), .Y(n35) );
  XOR2X1 U32 ( .A(n37), .B(N31), .Y(n33) );
  XOR2X1 U33 ( .A(n38), .B(N32), .Y(n32) );
  NAND3X1 U34 ( .A(n39), .B(n40), .C(n41), .Y(n30) );
  NOR2X1 U35 ( .A(N33), .B(n42), .Y(n41) );
  XOR2X1 U36 ( .A(rollover_val[7]), .B(N26), .Y(n42) );
  XNOR2X1 U37 ( .A(rollover_val[8]), .B(N27), .Y(n40) );
  XNOR2X1 U38 ( .A(rollover_val[9]), .B(N28), .Y(n39) );
  NOR2X1 U39 ( .A(n43), .B(n44), .Y(n28) );
  NAND3X1 U40 ( .A(n45), .B(n46), .C(n47), .Y(n44) );
  XNOR2X1 U41 ( .A(rollover_val[5]), .B(N24), .Y(n47) );
  XOR2X1 U42 ( .A(n48), .B(N25), .Y(n46) );
  XNOR2X1 U43 ( .A(rollover_val[4]), .B(N23), .Y(n45) );
  NAND3X1 U44 ( .A(n49), .B(n50), .C(n51), .Y(n43) );
  NOR2X1 U45 ( .A(n52), .B(n53), .Y(n51) );
  XOR2X1 U46 ( .A(rollover_val[1]), .B(N20), .Y(n53) );
  XOR2X1 U47 ( .A(rollover_val[0]), .B(N19), .Y(n52) );
  XNOR2X1 U48 ( .A(rollover_val[2]), .B(N21), .Y(n50) );
  XNOR2X1 U49 ( .A(rollover_val[3]), .B(N22), .Y(n49) );
  NAND2X1 U50 ( .A(n54), .B(n55), .Y(n26) );
  NOR2X1 U51 ( .A(n56), .B(n57), .Y(n55) );
  NAND3X1 U52 ( .A(n58), .B(n59), .C(n60), .Y(n57) );
  NAND3X1 U53 ( .A(n61), .B(n62), .C(n63), .Y(n56) );
  NOR2X1 U54 ( .A(count_out[8]), .B(count_out[7]), .Y(n63) );
  NOR2X1 U55 ( .A(n64), .B(n65), .Y(n54) );
  NAND3X1 U56 ( .A(count_out[0]), .B(n66), .C(rollover_val[0]), .Y(n65) );
  NAND3X1 U57 ( .A(n67), .B(n68), .C(n69), .Y(n64) );
  NOR2X1 U58 ( .A(count_out[1]), .B(count_out[13]), .Y(n69) );
  NAND2X1 U59 ( .A(n70), .B(n71), .Y(n25) );
  NOR2X1 U60 ( .A(n72), .B(n73), .Y(n71) );
  INVX1 U61 ( .A(n74), .Y(n73) );
  NOR3X1 U62 ( .A(rollover_val[4]), .B(rollover_val[5]), .C(rollover_val[3]), 
        .Y(n74) );
  NAND3X1 U63 ( .A(n48), .B(n90), .C(n91), .Y(n72) );
  NOR2X1 U64 ( .A(rollover_val[9]), .B(rollover_val[8]), .Y(n91) );
  INVX1 U65 ( .A(rollover_val[7]), .Y(n90) );
  INVX1 U66 ( .A(rollover_val[6]), .Y(n48) );
  NOR2X1 U67 ( .A(n92), .B(n93), .Y(n70) );
  NAND3X1 U68 ( .A(n94), .B(n95), .C(n96), .Y(n93) );
  INVX1 U69 ( .A(rollover_val[11]), .Y(n95) );
  INVX1 U70 ( .A(rollover_val[10]), .Y(n94) );
  NAND3X1 U71 ( .A(n37), .B(n38), .C(n97), .Y(n92) );
  NOR2X1 U72 ( .A(rollover_val[2]), .B(rollover_val[1]), .Y(n97) );
  INVX1 U73 ( .A(rollover_val[13]), .Y(n38) );
  INVX1 U74 ( .A(rollover_val[12]), .Y(n37) );
  INVX1 U75 ( .A(n116), .Y(n22) );
  OAI21X1 U76 ( .A(n3), .B(n98), .C(n99), .Y(n87) );
  NAND2X1 U77 ( .A(N6), .B(n21), .Y(n99) );
  OAI21X1 U78 ( .A(n3), .B(n60), .C(n100), .Y(n86) );
  NAND2X1 U79 ( .A(N7), .B(n21), .Y(n100) );
  OAI21X1 U80 ( .A(n3), .B(n58), .C(n101), .Y(n85) );
  NAND2X1 U81 ( .A(N8), .B(n21), .Y(n101) );
  OAI21X1 U82 ( .A(n3), .B(n59), .C(n102), .Y(n84) );
  NAND2X1 U83 ( .A(N9), .B(n21), .Y(n102) );
  OAI21X1 U84 ( .A(n3), .B(n61), .C(n103), .Y(n83) );
  NAND2X1 U85 ( .A(N10), .B(n21), .Y(n103) );
  OAI21X1 U86 ( .A(n3), .B(n62), .C(n104), .Y(n82) );
  NAND2X1 U87 ( .A(N11), .B(n21), .Y(n104) );
  OAI21X1 U88 ( .A(n3), .B(n105), .C(n106), .Y(n81) );
  NAND2X1 U89 ( .A(N12), .B(n21), .Y(n106) );
  OAI21X1 U90 ( .A(n3), .B(n107), .C(n108), .Y(n80) );
  NAND2X1 U91 ( .A(N13), .B(n21), .Y(n108) );
  OAI21X1 U92 ( .A(n3), .B(n96), .C(n109), .Y(n79) );
  NAND2X1 U93 ( .A(N14), .B(n21), .Y(n109) );
  OAI21X1 U94 ( .A(n3), .B(n66), .C(n110), .Y(n78) );
  NAND2X1 U95 ( .A(N15), .B(n21), .Y(n110) );
  OAI21X1 U96 ( .A(n3), .B(n67), .C(n111), .Y(n77) );
  NAND2X1 U97 ( .A(N16), .B(n21), .Y(n111) );
  OAI21X1 U98 ( .A(n3), .B(n68), .C(n112), .Y(n76) );
  NAND2X1 U99 ( .A(N17), .B(n21), .Y(n112) );
  OAI21X1 U100 ( .A(n3), .B(n113), .C(n114), .Y(n75) );
  NAND2X1 U101 ( .A(N18), .B(n21), .Y(n114) );
  NOR2X1 U102 ( .A(n115), .B(clear), .Y(n21) );
  NOR2X1 U103 ( .A(count_enable), .B(clear), .Y(n115) );
  NOR2X1 U104 ( .A(n116), .B(n113), .Y(N82) );
  INVX1 U105 ( .A(count_out[13]), .Y(n113) );
  NOR2X1 U106 ( .A(n116), .B(n68), .Y(N81) );
  INVX1 U107 ( .A(count_out[12]), .Y(n68) );
  NOR2X1 U108 ( .A(n116), .B(n67), .Y(N80) );
  INVX1 U109 ( .A(count_out[11]), .Y(n67) );
  NOR2X1 U110 ( .A(n116), .B(n66), .Y(N79) );
  INVX1 U111 ( .A(count_out[10]), .Y(n66) );
  NOR2X1 U112 ( .A(n116), .B(n96), .Y(N78) );
  INVX1 U113 ( .A(count_out[9]), .Y(n96) );
  NOR2X1 U114 ( .A(n116), .B(n107), .Y(N77) );
  INVX1 U115 ( .A(count_out[8]), .Y(n107) );
  NOR2X1 U116 ( .A(n116), .B(n105), .Y(N76) );
  INVX1 U117 ( .A(count_out[7]), .Y(n105) );
  NOR2X1 U118 ( .A(n116), .B(n62), .Y(N75) );
  INVX1 U119 ( .A(count_out[6]), .Y(n62) );
  NOR2X1 U120 ( .A(n116), .B(n61), .Y(N74) );
  INVX1 U121 ( .A(count_out[5]), .Y(n61) );
  NOR2X1 U122 ( .A(n116), .B(n59), .Y(N73) );
  INVX1 U123 ( .A(count_out[4]), .Y(n59) );
  NOR2X1 U124 ( .A(n116), .B(n58), .Y(N72) );
  INVX1 U125 ( .A(count_out[3]), .Y(n58) );
  NOR2X1 U126 ( .A(n116), .B(n60), .Y(N71) );
  INVX1 U127 ( .A(count_out[2]), .Y(n60) );
  NOR2X1 U128 ( .A(n116), .B(n98), .Y(N70) );
  INVX1 U129 ( .A(count_out[1]), .Y(n98) );
  NOR2X1 U130 ( .A(n116), .B(n4), .Y(N69) );
  INVX1 U131 ( .A(count_out[0]), .Y(n4) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n32, n33, n34, n35, n36, n1, n2, n3, n4, n5, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49;

  DFFSR \count_out_reg[0]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U4 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n36) );
  OAI21X1 U5 ( .A(n2), .B(n5), .C(n11), .Y(n35) );
  NAND2X1 U10 ( .A(n12), .B(n13), .Y(n11) );
  MUX2X1 U11 ( .B(n14), .A(n15), .S(n16), .Y(n12) );
  NOR2X1 U12 ( .A(n1), .B(n17), .Y(n16) );
  OR2X1 U13 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n17) );
  NAND3X1 U14 ( .A(n18), .B(n19), .C(n20), .Y(n15) );
  AND2X1 U15 ( .A(n21), .B(rollover_val[0]), .Y(n20) );
  NOR2X1 U16 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n18) );
  NAND3X1 U17 ( .A(n22), .B(n23), .C(n24), .Y(n14) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(n24) );
  OAI21X1 U19 ( .A(n27), .B(n19), .C(n28), .Y(n26) );
  XOR2X1 U20 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n28) );
  XOR2X1 U21 ( .A(n29), .B(n30), .Y(n25) );
  XOR2X1 U22 ( .A(rollover_val[2]), .B(n21), .Y(n30) );
  XNOR2X1 U23 ( .A(n31), .B(n27), .Y(n23) );
  NAND2X1 U24 ( .A(count_out[2]), .B(n37), .Y(n27) );
  INVX1 U25 ( .A(n29), .Y(n37) );
  XOR2X1 U26 ( .A(rollover_val[3]), .B(n19), .Y(n31) );
  MUX2X1 U27 ( .B(n38), .A(n39), .S(rollover_val[1]), .Y(n22) );
  OAI21X1 U28 ( .A(count_out[1]), .B(count_out[0]), .C(n29), .Y(n39) );
  NAND2X1 U29 ( .A(count_out[1]), .B(count_out[0]), .Y(n29) );
  NOR2X1 U30 ( .A(count_out[0]), .B(n40), .Y(n38) );
  INVX1 U31 ( .A(rollover_flag), .Y(n5) );
  OAI22X1 U32 ( .A(n2), .B(n40), .C(n41), .D(n4), .Y(n34) );
  XNOR2X1 U33 ( .A(n42), .B(n3), .Y(n41) );
  OAI22X1 U34 ( .A(n2), .B(n21), .C(n43), .D(n4), .Y(n33) );
  XNOR2X1 U35 ( .A(n44), .B(n45), .Y(n43) );
  OAI22X1 U36 ( .A(n2), .B(n19), .C(n46), .D(n4), .Y(n32) );
  INVX1 U37 ( .A(n13), .Y(n4) );
  NOR2X1 U38 ( .A(n47), .B(clear), .Y(n13) );
  XOR2X1 U39 ( .A(n48), .B(n49), .Y(n46) );
  NOR2X1 U40 ( .A(rollover_flag), .B(n19), .Y(n49) );
  NAND2X1 U41 ( .A(n45), .B(n44), .Y(n48) );
  AND2X1 U42 ( .A(n42), .B(n3), .Y(n44) );
  NOR2X1 U43 ( .A(n1), .B(rollover_flag), .Y(n3) );
  INVX1 U44 ( .A(count_out[0]), .Y(n1) );
  NOR2X1 U45 ( .A(n40), .B(rollover_flag), .Y(n42) );
  INVX1 U46 ( .A(count_out[1]), .Y(n40) );
  NOR2X1 U47 ( .A(n21), .B(rollover_flag), .Y(n45) );
  INVX1 U48 ( .A(count_out[2]), .Y(n21) );
  INVX1 U49 ( .A(count_out[3]), .Y(n19) );
  INVX1 U50 ( .A(n47), .Y(n2) );
  NOR2X1 U51 ( .A(count_enable), .B(clear), .Y(n47) );
endmodule


module timer ( clk, n_rst, enable_timer, data_size, bit_period, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_0_net_[3] , \_0_net_[2] , \_0_net_[1] , n1, n2, n3, n4;

  flex_counter_NUM_CNT_BITS14 SHIFT ( .clk(clk), .n_rst(n_rst), .clear(
        packet_done), .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter PCKT ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_enable), .rollover_val({\_0_net_[3] , \_0_net_[2] , 
        \_0_net_[1] , n4}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(data_size[0]), .Y(n4) );
  XOR2X1 U3 ( .A(data_size[3]), .B(n1), .Y(\_0_net_[3] ) );
  NOR2X1 U4 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U5 ( .A(n3), .B(n2), .Y(\_0_net_[2] ) );
  NAND2X1 U6 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U7 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U8 ( .A(data_size[1]), .B(data_size[0]), .Y(\_0_net_[1] ) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n28, n29, n30, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21;
  wire   [3:0] state;

  DFFSR \state_reg[0]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  NOR2X1 U3 ( .A(n4), .B(n5), .Y(sbc_enable) );
  NAND2X1 U4 ( .A(state[0]), .B(n6), .Y(n5) );
  INVX1 U8 ( .A(n7), .Y(sbc_clear) );
  OAI21X1 U9 ( .A(n7), .B(n8), .C(n9), .Y(n30) );
  MUX2X1 U10 ( .B(n10), .A(n11), .S(state[0]), .Y(n9) );
  NOR2X1 U11 ( .A(n11), .B(n12), .Y(n10) );
  AOI21X1 U12 ( .A(packet_done), .B(state[1]), .C(n13), .Y(n12) );
  MUX2X1 U13 ( .B(n14), .A(framing_error), .S(state[2]), .Y(n13) );
  NAND2X1 U14 ( .A(start_bit_detected), .B(n4), .Y(n14) );
  INVX1 U15 ( .A(framing_error), .Y(n8) );
  OAI21X1 U16 ( .A(n15), .B(n4), .C(n16), .Y(n29) );
  NAND2X1 U17 ( .A(state[2]), .B(n17), .Y(n16) );
  OAI21X1 U18 ( .A(state[0]), .B(framing_error), .C(n18), .Y(n17) );
  OAI21X1 U19 ( .A(framing_error), .B(n7), .C(n19), .Y(n28) );
  OAI21X1 U20 ( .A(n11), .B(n15), .C(state[1]), .Y(n19) );
  INVX1 U21 ( .A(n18), .Y(n11) );
  NAND2X1 U22 ( .A(state[2]), .B(state[1]), .Y(n18) );
  NAND3X1 U23 ( .A(n4), .B(n6), .C(state[0]), .Y(n7) );
  NOR2X1 U24 ( .A(n6), .B(n20), .Y(load_buffer) );
  NAND2X1 U25 ( .A(state[0]), .B(n4), .Y(n20) );
  NOR2X1 U26 ( .A(n4), .B(n21), .Y(enable_timer) );
  NAND2X1 U27 ( .A(n15), .B(n6), .Y(n21) );
  INVX1 U28 ( .A(state[2]), .Y(n6) );
  INVX1 U29 ( .A(state[0]), .Y(n15) );
  INVX1 U30 ( .A(state[1]), .Y(n4) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, data_size, packet_data, 
        stop_bit );
  input [3:0] data_size;
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;
  wire   [7:0] parallel_out;

  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, parallel_out}) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(packet_data[7]) );
  OAI22X1 U3 ( .A(n1), .B(n3), .C(n2), .D(n4), .Y(packet_data[6]) );
  INVX1 U4 ( .A(parallel_out[7]), .Y(n2) );
  OAI22X1 U5 ( .A(n1), .B(n5), .C(n4), .D(n3), .Y(packet_data[5]) );
  INVX1 U6 ( .A(parallel_out[6]), .Y(n3) );
  NAND3X1 U7 ( .A(n6), .B(n7), .C(n8), .Y(n4) );
  INVX1 U8 ( .A(n9), .Y(n8) );
  INVX1 U9 ( .A(n10), .Y(n6) );
  INVX1 U10 ( .A(parallel_out[5]), .Y(n5) );
  NAND3X1 U11 ( .A(n9), .B(n10), .C(data_size[3]), .Y(n1) );
  AOI22X1 U12 ( .A(data_size[2]), .B(data_size[1]), .C(n11), .D(data_size[0]), 
        .Y(n10) );
  XOR2X1 U13 ( .A(n12), .B(n11), .Y(n9) );
  XNOR2X1 U14 ( .A(n13), .B(data_size[2]), .Y(n11) );
  OAI21X1 U15 ( .A(n14), .B(n15), .C(n16), .Y(packet_data[4]) );
  AOI22X1 U16 ( .A(n17), .B(parallel_out[7]), .C(n18), .D(parallel_out[5]), 
        .Y(n16) );
  INVX1 U17 ( .A(parallel_out[4]), .Y(n15) );
  OAI21X1 U18 ( .A(n14), .B(n19), .C(n20), .Y(packet_data[3]) );
  AOI22X1 U19 ( .A(n17), .B(parallel_out[6]), .C(parallel_out[4]), .D(n18), 
        .Y(n20) );
  INVX1 U20 ( .A(parallel_out[3]), .Y(n19) );
  OAI21X1 U21 ( .A(n14), .B(n21), .C(n22), .Y(packet_data[2]) );
  AOI22X1 U22 ( .A(n17), .B(parallel_out[5]), .C(parallel_out[3]), .D(n18), 
        .Y(n22) );
  INVX1 U23 ( .A(parallel_out[2]), .Y(n21) );
  OAI21X1 U24 ( .A(n14), .B(n23), .C(n24), .Y(packet_data[1]) );
  AOI22X1 U25 ( .A(parallel_out[4]), .B(n17), .C(parallel_out[2]), .D(n18), 
        .Y(n24) );
  INVX1 U26 ( .A(parallel_out[1]), .Y(n23) );
  OAI21X1 U27 ( .A(n14), .B(n25), .C(n26), .Y(packet_data[0]) );
  AOI22X1 U28 ( .A(parallel_out[3]), .B(n17), .C(parallel_out[1]), .D(n18), 
        .Y(n26) );
  NOR2X1 U29 ( .A(n27), .B(n13), .Y(n18) );
  INVX1 U30 ( .A(data_size[1]), .Y(n13) );
  NOR2X1 U31 ( .A(n27), .B(data_size[1]), .Y(n17) );
  NAND3X1 U32 ( .A(data_size[2]), .B(n7), .C(data_size[0]), .Y(n27) );
  INVX1 U33 ( .A(data_size[3]), .Y(n7) );
  INVX1 U34 ( .A(parallel_out[0]), .Y(n25) );
  NAND3X1 U35 ( .A(data_size[3]), .B(n12), .C(n28), .Y(n14) );
  NOR2X1 U36 ( .A(data_size[2]), .B(data_size[1]), .Y(n28) );
  INVX1 U37 ( .A(data_size[0]), .Y(n12) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rcv_block ( clk, n_rst, data_size, bit_period, serial_in, data_read, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   start_bit, timeEN, shiftEN, pckt_done, clear, sbcEN, loadEN, stop_bit
;
  wire   [7:0] rcv_data;

  start_bit_det START ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .enable_timer(timeEN), .data_size(
        data_size), .bit_period(bit_period), .shift_enable(shiftEN), 
        .packet_done(pckt_done) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit), 
        .packet_done(pckt_done), .framing_error(framing_error), .sbc_clear(
        clear), .sbc_enable(sbcEN), .load_buffer(loadEN), .enable_timer(timeEN) );
  sr_9bit SHIFT ( .clk(clk), .n_rst(n_rst), .shift_strobe(shiftEN), 
        .serial_in(serial_in), .data_size(data_size), .packet_data(rcv_data), 
        .stop_bit(stop_bit) );
  rx_data_buff BFFR ( .clk(clk), .n_rst(n_rst), .load_buffer(loadEN), 
        .packet_data(rcv_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  stop_bit_chk STOP ( .clk(clk), .n_rst(n_rst), .sbc_clear(clear), 
        .sbc_enable(sbcEN), .stop_bit(stop_bit), .framing_error(framing_error)
         );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave CTRL ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .data_read(data_read), .psel(psel), .paddr(paddr), 
        .penable(penable), .pwrite(pwrite), .pwdata(pwdata), .prdata(prdata), 
        .pslverr(pslverr), .data_size(data_size), .bit_period(bit_period) );
  rcv_block UART ( .clk(clk), .n_rst(n_rst), .data_size(data_size), 
        .bit_period(bit_period), .serial_in(serial_in), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

