// $Id: $
// File name:   adder_nbit.sv
// Created:     1/17/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: n-bit Full adder

`timescale 1ns / 100ps

module adder_nbit
#(
	parameter BIT_WIDTH = 4	
)
(
	input wire [BIT_WIDTH-1:0] a,
	input wire [BIT_WIDTH-1:0] b,
	input wire carry_in,
	output wire [BIT_WIDTH-1:0] sum,
	output wire overflow
);
	integer i;
	//input value checking for a and b
	always_comb
	begin
		for(i = 0; i < BIT_WIDTH; i = i + 1)
		begin
			assert ((a[i] == 1'b1) || (a[i] == 1'b0))
			else $error("Input 'a[%d]' of component is not a digital logic value", i); 

			assert ((b[i] == 1'b1) || (b[i] == 1'b0))
			else $error("Input 'b[%d]' of component is not a digital logic value", i); 
		end
	end

	//input value checking for carry_in
	always @ (carry_in)
	begin
		assert ((carry_in == 1'b1) || (carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value"); 
	end

	//calculating the sum and overflow
	genvar k;
	wire [BIT_WIDTH:0] carrys;
	
	assign carrys[0] = carry_in;
	generate
	for(k = 0; k < BIT_WIDTH; k = k + 1) 
		begin
			adder_1bit IX (.a(a[k]), .b(b[k]), .carry_in(carrys[k]), .sum(sum[k]), .carry_out(carrys[k+1]));
		end
	endgenerate
	
	assign overflow = carrys[BIT_WIDTH];
	
	//output value checking
        integer j;
   
	always_comb
	begin
	for(j = 0; j < BIT_WIDTH; j = j + 1)
		begin
			//#(2) //force assert to be delayed 2 timescale units after the input change
			assert (((a[j] + b[j] + carry_in) % 2) == sum[j])
			else $error("Output 's[%d]' of component is not correct", j); 
		end
	end



endmodule
