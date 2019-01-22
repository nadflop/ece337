// $Id: $
// File name:   adder_1bit.sv
// Created:     1/16/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: 1 bit full adder module.

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);
	wire int_and1;
	wire int_and2;
	wire int_and3;
	wire int_or1;
	wire invt;
	wire int_xor1;
	/*
	OR2X1 A1(.Y(int_or1), .A(a), .B(b));
	AND2X1 A2 (.Y(int_and1), .A(carry_in), .B(int_or1));
	AND2X1 B1 (.Y(int_and2), .A(a), .B(b));
	INVX1 B2 (.Y(invt), .A(carry_in));
	AND2X1 B3 (.Y(int_and3), .A(invt), .B(int_and2));
	OR2X1 C1 (.Y(carry_out), .A(int_and1), .B(int_and3));
	XOR2X1 D1 (.Y(int_xor1), .A(a), .B(b));
	XOR2X1 D2 (.Y(sum), .A(carry_in), .B(int_xor1));
	*/
        assign {carry_out,sum}=carry_in + a + b;
   
endmodule
