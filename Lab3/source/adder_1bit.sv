// $Id: $
// File name:   adder_1bit.sv
// Created:     1/16/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: 1 bit full adder module.

`timescale 1ns / 100ps

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);
	//input value checking
	always @ (a)
	begin
		assert ((a == 1'b1) || (a == 1'b0))
		else $error("Input 'a' of component is not a digital logic value"); 
	end
	//input value checking
	always @ (b)
	begin
		assert ((b == 1'b1) || (b == 1'b0))
		else $error("Input 'b' of component is not a digital logic value"); 
	end
	//input value checking
	always @ (carry_in)
	begin
		assert ((carry_in == 1'b1) || (carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value"); 
	end
	//add the input together
        assign {carry_out,sum}=carry_in + a + b;
	//output value checking
	always @ (a, b, carry_in)
	begin
		#(2) //force assert to be delayed 2 timescale units after the input change
		assert (((a + b + carry_in) % 2) == sum)
		else $error("Output 's' of component is not correct"); 
	end
   
endmodule
