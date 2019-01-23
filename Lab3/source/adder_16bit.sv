// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// $Id: $
// File name:   adder_8bit.sv
// Created:     1/17/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: n-bit Full adder

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	adder_nbit #(16) B16(.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

endmodule

