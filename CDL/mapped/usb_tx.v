/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Apr 28 15:30:42 2019
/////////////////////////////////////////////////////////////


module tx_controller ( clk, n_rst, tx_packet, buffer_occupancy, tx_enable, 
        tx_error, tx_transfer_active, get_tx_packet_data, packet_done, 
        enable_timer, clear_8, clear_64, load_sync, load_pid_data, load_data, 
        load_ack, load_nack, load_stall, load_eop, load_crc1, load_crc2, 
        init_crc, complete, roll_val, pause, val );
  input [1:0] tx_packet;
  input [6:0] buffer_occupancy;
  output [3:0] roll_val;
  input clk, n_rst, tx_enable, packet_done, pause, val;
  output tx_error, tx_transfer_active, get_tx_packet_data, enable_timer,
         clear_8, clear_64, load_sync, load_pid_data, load_data, load_ack,
         load_nack, load_stall, load_eop, load_crc1, load_crc2, init_crc,
         complete;
  wire   clear_8, \temp[0] , N347, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, get_tx_packet_data;
  wire   [4:0] state;
  wire   [4:0] next_state;
  assign roll_val[2] = 1'b0;
  assign clear_64 = clear_8;
  assign load_data = get_tx_packet_data;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \temp_reg[0]  ( .D(N347), .CLK(clk), .R(n_rst), .S(1'b1), .Q(\temp[0] ) );
  OAI21X1 U4 ( .A(n7), .B(n8), .C(n9), .Y(roll_val[0]) );
  NAND3X1 U10 ( .A(n10), .B(n11), .C(n12), .Y(next_state[4]) );
  NOR2X1 U11 ( .A(n13), .B(n14), .Y(n12) );
  OAI21X1 U12 ( .A(n15), .B(n16), .C(n17), .Y(n14) );
  INVX1 U13 ( .A(n18), .Y(n15) );
  OAI21X1 U14 ( .A(n19), .B(n20), .C(packet_done), .Y(n11) );
  INVX1 U15 ( .A(n21), .Y(n20) );
  NOR2X1 U16 ( .A(load_crc2), .B(n22), .Y(n10) );
  NAND3X1 U17 ( .A(n23), .B(n7), .C(n24), .Y(next_state[3]) );
  NOR2X1 U18 ( .A(n25), .B(n26), .Y(n24) );
  OAI21X1 U19 ( .A(n27), .B(n28), .C(n29), .Y(n26) );
  MUX2X1 U20 ( .B(n30), .A(n21), .S(n31), .Y(n25) );
  NAND3X1 U21 ( .A(tx_packet[0]), .B(n32), .C(n33), .Y(n30) );
  NOR2X1 U22 ( .A(load_stall), .B(get_tx_packet_data), .Y(n23) );
  OR2X1 U23 ( .A(n34), .B(n35), .Y(next_state[2]) );
  NAND3X1 U24 ( .A(n17), .B(n36), .C(n37), .Y(n35) );
  MUX2X1 U25 ( .B(n38), .A(n19), .S(n31), .Y(n37) );
  INVX1 U26 ( .A(n39), .Y(n19) );
  NOR2X1 U27 ( .A(n40), .B(n41), .Y(n38) );
  XNOR2X1 U28 ( .A(n32), .B(tx_packet[0]), .Y(n40) );
  INVX1 U29 ( .A(tx_packet[1]), .Y(n32) );
  AOI21X1 U30 ( .A(n31), .B(complete), .C(load_eop), .Y(n17) );
  NAND3X1 U31 ( .A(n42), .B(n43), .C(n44), .Y(n34) );
  INVX1 U32 ( .A(n45), .Y(n44) );
  OAI22X1 U33 ( .A(n7), .B(n46), .C(n28), .D(n47), .Y(n45) );
  INVX1 U34 ( .A(n48), .Y(n46) );
  NAND3X1 U35 ( .A(n49), .B(n50), .C(n51), .Y(next_state[1]) );
  NOR2X1 U36 ( .A(n52), .B(n53), .Y(n51) );
  OAI21X1 U37 ( .A(n54), .B(n31), .C(n55), .Y(n53) );
  OAI21X1 U38 ( .A(n31), .B(n56), .C(n33), .Y(n55) );
  INVX1 U39 ( .A(n41), .Y(n33) );
  INVX1 U40 ( .A(tx_packet[0]), .Y(n56) );
  AOI21X1 U41 ( .A(n57), .B(n58), .C(n59), .Y(n54) );
  NAND2X1 U42 ( .A(n60), .B(n61), .Y(n52) );
  AOI22X1 U43 ( .A(n62), .B(n58), .C(state[1]), .D(n13), .Y(n50) );
  OAI21X1 U44 ( .A(state[0]), .B(n63), .C(n28), .Y(n13) );
  INVX1 U45 ( .A(n64), .Y(n49) );
  OAI21X1 U46 ( .A(n48), .B(n7), .C(n29), .Y(n64) );
  NOR3X1 U47 ( .A(load_crc1), .B(load_pid_data), .C(n65), .Y(n29) );
  OAI21X1 U48 ( .A(n16), .B(n18), .C(n43), .Y(n65) );
  NOR2X1 U49 ( .A(n66), .B(n31), .Y(n18) );
  NAND2X1 U50 ( .A(packet_done), .B(n66), .Y(n48) );
  NAND3X1 U51 ( .A(n67), .B(n68), .C(n69), .Y(n66) );
  NOR2X1 U52 ( .A(buffer_occupancy[0]), .B(n70), .Y(n69) );
  OR2X1 U53 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n70) );
  NOR2X1 U54 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n68) );
  NOR2X1 U55 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n67) );
  INVX1 U56 ( .A(n71), .Y(next_state[0]) );
  AOI21X1 U57 ( .A(tx_enable), .B(init_crc), .C(n72), .Y(n71) );
  OAI21X1 U58 ( .A(n73), .B(n28), .C(n74), .Y(n72) );
  OAI21X1 U59 ( .A(roll_val[1]), .B(n75), .C(packet_done), .Y(n74) );
  INVX1 U60 ( .A(n76), .Y(n75) );
  NAND3X1 U61 ( .A(n77), .B(n78), .C(n9), .Y(n28) );
  INVX1 U62 ( .A(tx_transfer_active), .Y(n78) );
  NAND3X1 U63 ( .A(n79), .B(n80), .C(n76), .Y(tx_transfer_active) );
  INVX1 U64 ( .A(load_eop), .Y(n80) );
  NOR2X1 U65 ( .A(n81), .B(n82), .Y(load_ack) );
  INVX1 U66 ( .A(n83), .Y(load_crc2) );
  INVX1 U67 ( .A(n84), .Y(load_pid_data) );
  AND2X1 U68 ( .A(n85), .B(n86), .Y(get_tx_packet_data) );
  INVX1 U69 ( .A(n77), .Y(init_crc) );
  NAND2X1 U70 ( .A(n87), .B(n58), .Y(n77) );
  INVX1 U71 ( .A(n88), .Y(tx_error) );
  NAND2X1 U72 ( .A(n89), .B(n90), .Y(load_eop) );
  INVX1 U73 ( .A(roll_val[1]), .Y(n90) );
  NAND2X1 U74 ( .A(roll_val[3]), .B(n76), .Y(enable_timer) );
  NOR2X1 U75 ( .A(n91), .B(n92), .Y(n76) );
  NAND3X1 U76 ( .A(n7), .B(n16), .C(n93), .Y(n92) );
  INVX1 U77 ( .A(n59), .Y(n93) );
  OAI21X1 U78 ( .A(state[0]), .B(n63), .C(n21), .Y(n59) );
  NAND2X1 U79 ( .A(n87), .B(n94), .Y(n21) );
  NAND2X1 U80 ( .A(n94), .B(n86), .Y(n16) );
  NAND2X1 U81 ( .A(n57), .B(n94), .Y(n7) );
  NAND3X1 U82 ( .A(n41), .B(n39), .C(n43), .Y(n91) );
  NAND2X1 U83 ( .A(n62), .B(n94), .Y(n43) );
  NOR2X1 U84 ( .A(n27), .B(state[0]), .Y(n94) );
  OAI21X1 U85 ( .A(n62), .B(n57), .C(n58), .Y(n39) );
  NAND2X1 U86 ( .A(n86), .B(n58), .Y(n41) );
  NOR2X1 U87 ( .A(state[0]), .B(state[3]), .Y(n58) );
  NOR2X1 U88 ( .A(complete), .B(roll_val[1]), .Y(roll_val[3]) );
  NOR2X1 U89 ( .A(n95), .B(state[0]), .Y(roll_val[1]) );
  NAND3X1 U90 ( .A(n9), .B(n89), .C(n79), .Y(clear_8) );
  NOR2X1 U91 ( .A(n96), .B(n97), .Y(n79) );
  NAND3X1 U92 ( .A(n60), .B(n61), .C(n36), .Y(n97) );
  AOI21X1 U93 ( .A(state[0]), .B(n86), .C(load_crc1), .Y(n36) );
  AND2X1 U94 ( .A(n85), .B(n57), .Y(load_crc1) );
  INVX1 U95 ( .A(n81), .Y(n86) );
  NAND3X1 U96 ( .A(n47), .B(n98), .C(state[1]), .Y(n81) );
  INVX1 U97 ( .A(load_nack), .Y(n61) );
  NAND2X1 U98 ( .A(n88), .B(n42), .Y(load_nack) );
  NAND2X1 U99 ( .A(n99), .B(n57), .Y(n42) );
  INVX1 U100 ( .A(n100), .Y(n57) );
  NAND3X1 U101 ( .A(n101), .B(n98), .C(state[2]), .Y(n100) );
  NAND3X1 U102 ( .A(n22), .B(n101), .C(state[0]), .Y(n88) );
  INVX1 U103 ( .A(load_sync), .Y(n60) );
  NOR2X1 U104 ( .A(n82), .B(n102), .Y(load_sync) );
  NAND3X1 U105 ( .A(n83), .B(n103), .C(n84), .Y(n96) );
  NAND2X1 U106 ( .A(n85), .B(n87), .Y(n84) );
  INVX1 U107 ( .A(n102), .Y(n87) );
  NAND3X1 U108 ( .A(n47), .B(n98), .C(n101), .Y(n102) );
  INVX1 U109 ( .A(state[1]), .Y(n101) );
  INVX1 U110 ( .A(load_stall), .Y(n103) );
  NOR2X1 U111 ( .A(n82), .B(n104), .Y(load_stall) );
  INVX1 U112 ( .A(n99), .Y(n82) );
  NOR2X1 U113 ( .A(n73), .B(state[3]), .Y(n99) );
  NAND2X1 U114 ( .A(n85), .B(n62), .Y(n83) );
  INVX1 U115 ( .A(n104), .Y(n62) );
  NAND3X1 U116 ( .A(state[2]), .B(n98), .C(state[1]), .Y(n104) );
  INVX1 U117 ( .A(state[4]), .Y(n98) );
  NOR2X1 U118 ( .A(n27), .B(n73), .Y(n85) );
  NAND3X1 U119 ( .A(state[0]), .B(n22), .C(state[1]), .Y(n89) );
  INVX1 U120 ( .A(n63), .Y(n22) );
  NAND3X1 U121 ( .A(n47), .B(n27), .C(state[4]), .Y(n63) );
  INVX1 U122 ( .A(state[3]), .Y(n27) );
  INVX1 U123 ( .A(state[2]), .Y(n47) );
  INVX1 U124 ( .A(complete), .Y(n9) );
  NOR2X1 U125 ( .A(n73), .B(n95), .Y(complete) );
  NAND3X1 U126 ( .A(state[4]), .B(state[2]), .C(n105), .Y(n95) );
  NOR2X1 U127 ( .A(state[3]), .B(state[1]), .Y(n105) );
  INVX1 U128 ( .A(state[0]), .Y(n73) );
  INVX1 U129 ( .A(n106), .Y(N347) );
  MUX2X1 U130 ( .B(n31), .A(pause), .S(n8), .Y(n106) );
  INVX1 U131 ( .A(\temp[0] ), .Y(n8) );
  INVX1 U132 ( .A(packet_done), .Y(n31) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
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


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54;

  DFFSR \count_out_reg[0]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U4 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n50) );
  OAI21X1 U5 ( .A(n2), .B(n5), .C(n11), .Y(n51) );
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
  OAI22X1 U32 ( .A(n2), .B(n40), .C(n41), .D(n4), .Y(n52) );
  XNOR2X1 U33 ( .A(n42), .B(n3), .Y(n41) );
  OAI22X1 U34 ( .A(n2), .B(n21), .C(n43), .D(n4), .Y(n53) );
  XNOR2X1 U35 ( .A(n44), .B(n45), .Y(n43) );
  OAI22X1 U36 ( .A(n2), .B(n19), .C(n46), .D(n4), .Y(n54) );
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


module tx_timer ( clk, n_rst, enable_timer, clear_8, clear_64, roll_val, 
        shift_enable, packet_done, pause );
  input [3:0] roll_val;
  input clk, n_rst, enable_timer, clear_8, clear_64, pause;
  output shift_enable, packet_done;


  flex_counter_1 SHIFT ( .clk(clk), .n_rst(n_rst), .clear(clear_8), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .rollover_flag(shift_enable) );
  flex_counter_0 PCKT ( .clk(clk), .n_rst(n_rst), .clear(clear_64), 
        .count_enable(shift_enable), .rollover_val(roll_val), .rollover_flag(
        packet_done) );
endmodule


module flex_counter_NUM_CNT_BITS3 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [2:0] rollover_val;
  output [2:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n41, n42, n43, n44, n1, n2, n3, n4, n5, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33;

  DFFSR \count_out_reg[0]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[2]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n44) );
  OAI21X1 U8 ( .A(rollover_flag), .B(n1), .C(n4), .Y(n2) );
  MUX2X1 U9 ( .B(n5), .A(n10), .S(n3), .Y(n43) );
  NAND2X1 U10 ( .A(n11), .B(n4), .Y(n10) );
  MUX2X1 U11 ( .B(n12), .A(n13), .S(n14), .Y(n11) );
  NOR2X1 U12 ( .A(n1), .B(n15), .Y(n14) );
  NAND2X1 U13 ( .A(n16), .B(n17), .Y(n15) );
  INVX1 U14 ( .A(count_out[0]), .Y(n1) );
  NAND3X1 U15 ( .A(n18), .B(n19), .C(rollover_val[0]), .Y(n13) );
  INVX1 U16 ( .A(rollover_val[2]), .Y(n19) );
  OR2X1 U17 ( .A(n20), .B(n21), .Y(n12) );
  OAI21X1 U18 ( .A(n22), .B(n18), .C(n23), .Y(n21) );
  MUX2X1 U19 ( .B(n24), .A(n25), .S(n22), .Y(n23) );
  XOR2X1 U20 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n25) );
  NAND2X1 U21 ( .A(rollover_val[2]), .B(n17), .Y(n24) );
  OAI21X1 U22 ( .A(count_out[0]), .B(n26), .C(n27), .Y(n20) );
  XOR2X1 U23 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n27) );
  XOR2X1 U24 ( .A(n17), .B(count_out[1]), .Y(n26) );
  INVX1 U25 ( .A(rollover_val[1]), .Y(n17) );
  OAI21X1 U26 ( .A(n3), .B(n16), .C(n28), .Y(n42) );
  NAND3X1 U27 ( .A(n4), .B(n5), .C(n29), .Y(n28) );
  MUX2X1 U28 ( .B(n16), .A(n30), .S(count_out[0]), .Y(n29) );
  NAND2X1 U29 ( .A(n3), .B(n16), .Y(n30) );
  INVX1 U30 ( .A(count_out[1]), .Y(n16) );
  OAI21X1 U31 ( .A(n3), .B(n18), .C(n31), .Y(n41) );
  NAND3X1 U32 ( .A(n4), .B(n5), .C(n32), .Y(n31) );
  MUX2X1 U33 ( .B(n33), .A(n18), .S(n22), .Y(n32) );
  NAND2X1 U34 ( .A(count_out[1]), .B(count_out[0]), .Y(n22) );
  NAND2X1 U35 ( .A(count_enable), .B(n18), .Y(n33) );
  INVX1 U36 ( .A(rollover_flag), .Y(n5) );
  INVX1 U37 ( .A(clear), .Y(n4) );
  INVX1 U38 ( .A(count_out[2]), .Y(n18) );
  OR2X1 U39 ( .A(clear), .B(count_enable), .Y(n3) );
endmodule


module tx_bit_stuffer ( clk, n_rst, shift_enable, serial_out, pause );
  input clk, n_rst, shift_enable, serial_out;
  output pause;
  wire   count_enable, n1;

  flex_counter_NUM_CNT_BITS3 CORE ( .clk(clk), .n_rst(n_rst), .clear(n1), 
        .count_enable(count_enable), .rollover_val({1'b1, 1'b0, 1'b1}), 
        .rollover_flag(pause) );
  INVX1 U3 ( .A(serial_out), .Y(n1) );
  AND2X1 U4 ( .A(shift_enable), .B(serial_out), .Y(count_enable) );
endmodule


module tx_flex_pts_sr_NUM_BITS8_SHIFT_MSB0 ( clk, n_rst, shift_enable, 
        load_sync, load_pid_data, load_data, load_ack, load_nack, load_stall, 
        load_eop, load_crc1, load_crc2, tx_packet_data, pause, serial_out );
  input [7:0] tx_packet_data;
  input clk, n_rst, shift_enable, load_sync, load_pid_data, load_data,
         load_ack, load_nack, load_stall, load_eop, load_crc1, load_crc2,
         pause;
  output serial_out;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50;
  wire   [7:0] next_data;
  wire   [7:1] data;

  DFFSR \data_reg[7]  ( .D(next_data[7]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[7]) );
  DFFSR \data_reg[6]  ( .D(next_data[6]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[6]) );
  DFFSR \data_reg[5]  ( .D(next_data[5]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[5]) );
  DFFSR \data_reg[4]  ( .D(next_data[4]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[4]) );
  DFFSR \data_reg[3]  ( .D(next_data[3]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[3]) );
  DFFSR \data_reg[2]  ( .D(next_data[2]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[2]) );
  DFFSR \data_reg[1]  ( .D(next_data[1]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        data[1]) );
  DFFSR \data_reg[0]  ( .D(next_data[0]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  NAND3X1 U11 ( .A(n9), .B(n10), .C(n11), .Y(next_data[7]) );
  AOI22X1 U12 ( .A(data[7]), .B(n12), .C(tx_packet_data[7]), .D(n13), .Y(n11)
         );
  NAND3X1 U13 ( .A(n14), .B(n15), .C(load_ack), .Y(n10) );
  NOR2X1 U14 ( .A(load_sync), .B(n16), .Y(n9) );
  OAI21X1 U15 ( .A(n17), .B(n18), .C(n19), .Y(next_data[6]) );
  AOI22X1 U16 ( .A(n20), .B(data[7]), .C(data[6]), .D(n12), .Y(n19) );
  INVX1 U17 ( .A(tx_packet_data[6]), .Y(n18) );
  NAND2X1 U18 ( .A(n21), .B(n22), .Y(next_data[5]) );
  AOI21X1 U19 ( .A(data[5]), .B(n12), .C(n23), .Y(n22) );
  INVX1 U20 ( .A(n24), .Y(n23) );
  AOI21X1 U21 ( .A(n20), .B(data[6]), .C(n25), .Y(n24) );
  AOI22X1 U22 ( .A(load_nack), .B(n26), .C(tx_packet_data[5]), .D(n13), .Y(n21) );
  NAND2X1 U23 ( .A(n27), .B(n28), .Y(next_data[4]) );
  AOI21X1 U24 ( .A(data[5]), .B(n20), .C(n25), .Y(n28) );
  INVX1 U25 ( .A(n29), .Y(n25) );
  AOI22X1 U26 ( .A(data[4]), .B(n12), .C(tx_packet_data[4]), .D(n13), .Y(n27)
         );
  NAND2X1 U27 ( .A(n30), .B(n31), .Y(next_data[3]) );
  AOI22X1 U28 ( .A(data[4]), .B(n20), .C(data[3]), .D(n12), .Y(n31) );
  AOI22X1 U29 ( .A(tx_packet_data[3]), .B(n13), .C(load_pid_data), .D(n32), 
        .Y(n30) );
  NAND2X1 U30 ( .A(n33), .B(n34), .Y(next_data[2]) );
  AOI21X1 U31 ( .A(data[3]), .B(n20), .C(n35), .Y(n34) );
  NAND2X1 U32 ( .A(n29), .B(n36), .Y(n35) );
  OAI21X1 U33 ( .A(n37), .B(load_pid_data), .C(n32), .Y(n29) );
  NOR2X1 U34 ( .A(load_data), .B(n38), .Y(n37) );
  AOI22X1 U35 ( .A(data[2]), .B(n12), .C(tx_packet_data[2]), .D(n13), .Y(n33)
         );
  NAND2X1 U36 ( .A(n39), .B(n40), .Y(next_data[1]) );
  AOI22X1 U37 ( .A(n41), .B(load_stall), .C(data[2]), .D(n20), .Y(n40) );
  NOR2X1 U38 ( .A(load_nack), .B(n42), .Y(n41) );
  AOI22X1 U39 ( .A(data[1]), .B(n12), .C(tx_packet_data[1]), .D(n13), .Y(n39)
         );
  NAND2X1 U40 ( .A(n43), .B(n44), .Y(next_data[0]) );
  AOI21X1 U41 ( .A(data[1]), .B(n20), .C(n16), .Y(n44) );
  INVX1 U42 ( .A(n36), .Y(n16) );
  OAI21X1 U43 ( .A(load_nack), .B(load_stall), .C(n26), .Y(n36) );
  NOR2X1 U44 ( .A(n45), .B(n46), .Y(n20) );
  INVX1 U45 ( .A(shift_enable), .Y(n45) );
  AOI22X1 U46 ( .A(serial_out), .B(n12), .C(tx_packet_data[0]), .D(n13), .Y(
        n43) );
  INVX1 U47 ( .A(n17), .Y(n13) );
  NAND3X1 U48 ( .A(n15), .B(n32), .C(load_data), .Y(n17) );
  INVX1 U49 ( .A(load_sync), .Y(n32) );
  INVX1 U50 ( .A(load_pid_data), .Y(n15) );
  NOR2X1 U51 ( .A(n46), .B(shift_enable), .Y(n12) );
  NAND3X1 U52 ( .A(n47), .B(n26), .C(n48), .Y(n46) );
  NOR2X1 U53 ( .A(load_eop), .B(n49), .Y(n48) );
  OR2X1 U54 ( .A(load_nack), .B(load_stall), .Y(n49) );
  INVX1 U55 ( .A(n42), .Y(n26) );
  NAND3X1 U56 ( .A(n38), .B(n14), .C(n50), .Y(n42) );
  NOR2X1 U57 ( .A(load_sync), .B(load_pid_data), .Y(n50) );
  INVX1 U58 ( .A(load_data), .Y(n14) );
  INVX1 U59 ( .A(load_ack), .Y(n38) );
  NOR2X1 U60 ( .A(load_crc2), .B(load_crc1), .Y(n47) );
endmodule


module tx_encoder ( clk, n_rst, shift_enable, serial_out, crc_out, load_eop, 
        load_crc1, load_crc2, pause, complete, dplus_out, dminus_out );
  input clk, n_rst, shift_enable, serial_out, crc_out, load_eop, load_crc1,
         load_crc2, pause, complete;
  output dplus_out, dminus_out;
  wire   n17, n18, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  DFFSR dminus_out_reg ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dminus_out) );
  DFFSR dplus_out_reg ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(dplus_out)
         );
  MUX2X1 U5 ( .B(n3), .A(n4), .S(dminus_out), .Y(n18) );
  NAND3X1 U6 ( .A(n5), .B(n6), .C(n4), .Y(n3) );
  INVX1 U7 ( .A(complete), .Y(n5) );
  MUX2X1 U8 ( .B(n7), .A(n8), .S(n4), .Y(n17) );
  INVX1 U9 ( .A(n9), .Y(n4) );
  OAI21X1 U10 ( .A(n10), .B(n11), .C(shift_enable), .Y(n9) );
  OR2X1 U11 ( .A(complete), .B(n12), .Y(n11) );
  MUX2X1 U12 ( .B(crc_out), .A(serial_out), .S(n13), .Y(n12) );
  NOR2X1 U13 ( .A(load_crc1), .B(load_crc2), .Y(n13) );
  OR2X1 U14 ( .A(pause), .B(load_eop), .Y(n10) );
  OAI21X1 U15 ( .A(complete), .B(n7), .C(n6), .Y(n8) );
  INVX1 U16 ( .A(load_eop), .Y(n6) );
  INVX1 U17 ( .A(dplus_out), .Y(n7) );
endmodule


module crc_16 ( clk, n_rst, bit_out, init_crc, shift_enable, CRC );
  input clk, n_rst, bit_out, init_crc, shift_enable;
  output CRC;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, n17, n18, n19, n20;
  wire   [14:0] nextCRC;

  DFFSR \nextCRC_reg[0]  ( .D(N6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[0]) );
  DFFSR \nextCRC_reg[1]  ( .D(N7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[1]) );
  DFFSR \nextCRC_reg[2]  ( .D(N8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[2]) );
  DFFSR \nextCRC_reg[3]  ( .D(N9), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[3]) );
  DFFSR \nextCRC_reg[4]  ( .D(N10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[4]) );
  DFFSR \nextCRC_reg[5]  ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[5]) );
  DFFSR \nextCRC_reg[6]  ( .D(N12), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[6]) );
  DFFSR \nextCRC_reg[7]  ( .D(N13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[7]) );
  DFFSR \nextCRC_reg[8]  ( .D(N14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[8]) );
  DFFSR \nextCRC_reg[9]  ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[9]) );
  DFFSR \nextCRC_reg[10]  ( .D(N16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[10]) );
  DFFSR \nextCRC_reg[11]  ( .D(N17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[11]) );
  DFFSR \nextCRC_reg[12]  ( .D(N18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[12]) );
  DFFSR \nextCRC_reg[13]  ( .D(N19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[13]) );
  DFFSR \nextCRC_reg[14]  ( .D(N20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        nextCRC[14]) );
  DFFSR \nextCRC_reg[15]  ( .D(N21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(CRC)
         );
  AND2X1 U19 ( .A(nextCRC[2]), .B(n17), .Y(N9) );
  MUX2X1 U20 ( .B(n18), .A(n19), .S(nextCRC[1]), .Y(N8) );
  AND2X1 U21 ( .A(nextCRC[0]), .B(n17), .Y(N7) );
  MUX2X1 U22 ( .B(n18), .A(n19), .S(nextCRC[14]), .Y(N21) );
  NAND2X1 U23 ( .A(n20), .B(n17), .Y(n19) );
  INVX1 U24 ( .A(N6), .Y(n18) );
  NOR2X1 U25 ( .A(n20), .B(init_crc), .Y(N6) );
  XNOR2X1 U26 ( .A(bit_out), .B(CRC), .Y(n20) );
  AND2X1 U27 ( .A(nextCRC[13]), .B(n17), .Y(N20) );
  AND2X1 U28 ( .A(nextCRC[12]), .B(n17), .Y(N19) );
  AND2X1 U29 ( .A(nextCRC[11]), .B(n17), .Y(N18) );
  AND2X1 U30 ( .A(nextCRC[10]), .B(n17), .Y(N17) );
  AND2X1 U31 ( .A(nextCRC[9]), .B(n17), .Y(N16) );
  AND2X1 U32 ( .A(nextCRC[8]), .B(n17), .Y(N15) );
  AND2X1 U33 ( .A(nextCRC[7]), .B(n17), .Y(N14) );
  AND2X1 U34 ( .A(nextCRC[6]), .B(n17), .Y(N13) );
  AND2X1 U35 ( .A(nextCRC[5]), .B(n17), .Y(N12) );
  AND2X1 U36 ( .A(nextCRC[4]), .B(n17), .Y(N11) );
  AND2X1 U37 ( .A(nextCRC[3]), .B(n17), .Y(N10) );
  INVX1 U38 ( .A(init_crc), .Y(n17) );
endmodule


module usb_tx ( clk, n_rst, buffer_occupancy, tx_packet_data, 
        get_tx_packet_data, tx_packet, tx_enable, tx_error, tx_transfer_active, 
        dplus_out, dminus_out );
  input [6:0] buffer_occupancy;
  input [7:0] tx_packet_data;
  input [1:0] tx_packet;
  input clk, n_rst, tx_enable;
  output get_tx_packet_data, tx_error, tx_transfer_active, dplus_out,
         dminus_out;
  wire   packet_done, enable_timer, clear_8, clear_64, load_sync,
         load_pid_data, load_data, load_ack, load_nack, load_stall, load_eop,
         load_crc1, load_crc2, init_crc, complete, pause, shift_enable,
         serial_out, crc_out;
  wire   [3:0] roll_val;
  wire   SYNOPSYS_UNCONNECTED__0;

  tx_controller CONTROLLER ( .clk(clk), .n_rst(n_rst), .tx_packet(tx_packet), 
        .buffer_occupancy(buffer_occupancy), .tx_enable(tx_enable), .tx_error(
        tx_error), .tx_transfer_active(tx_transfer_active), 
        .get_tx_packet_data(get_tx_packet_data), .packet_done(packet_done), 
        .enable_timer(enable_timer), .clear_8(clear_8), .clear_64(clear_64), 
        .load_sync(load_sync), .load_pid_data(load_pid_data), .load_data(
        load_data), .load_ack(load_ack), .load_nack(load_nack), .load_stall(
        load_stall), .load_eop(load_eop), .load_crc1(load_crc1), .load_crc2(
        load_crc2), .init_crc(init_crc), .complete(complete), .roll_val({
        roll_val[3], SYNOPSYS_UNCONNECTED__0, roll_val[1:0]}), .pause(pause), 
        .val(1'b0) );
  tx_timer TIMER ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .clear_8(clear_8), .clear_64(clear_64), .roll_val({roll_val[3], 1'b0, 
        roll_val[1:0]}), .shift_enable(shift_enable), .packet_done(packet_done), .pause(pause) );
  tx_bit_stuffer BIT_STUFF ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .serial_out(serial_out), .pause(pause) );
  tx_flex_pts_sr_NUM_BITS8_SHIFT_MSB0 SHIFT_REG ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .load_sync(load_sync), .load_pid_data(
        load_pid_data), .load_data(load_data), .load_ack(load_ack), 
        .load_nack(load_nack), .load_stall(load_stall), .load_eop(load_eop), 
        .load_crc1(load_crc1), .load_crc2(load_crc2), .tx_packet_data(
        tx_packet_data), .pause(pause), .serial_out(serial_out) );
  tx_encoder encode ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), 
        .serial_out(serial_out), .crc_out(crc_out), .load_eop(load_eop), 
        .load_crc1(load_crc1), .load_crc2(load_crc2), .pause(pause), 
        .complete(complete), .dplus_out(dplus_out), .dminus_out(dminus_out) );
  crc_16 crc ( .clk(clk), .n_rst(n_rst), .bit_out(serial_out), .init_crc(
        init_crc), .shift_enable(shift_enable), .CRC(crc_out) );
endmodule

