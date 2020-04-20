// $Id: $
// File name:   flex_counter.sv
// Created:     2/6/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: n-bit flex counter

module flex_counter
#(
	NUM_CNT_BITS = 4
)
(
	input logic clk,
	input logic n_rst, //asynchronous, active low, reset all reg and ff to 0
	input logic clear, //active high, clear count to 0
	input logic count_enable, //active high, increment 
	input reg [NUM_CNT_BITS-1:0] rollover_val,
	output reg [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);
	reg [NUM_CNT_BITS-1:0] next_count;
	reg [NUM_CNT_BITS-1:0] count;
	reg next_flag;
	reg flag;

	always_comb
	begin: COUNTER
		next_flag = flag;
 		next_count = count;
		if (clear == 1'b1)
		   next_count = 4'b0000;
		else if (count_enable == 1'b1) begin
		   next_count = count + 1;
		   if (next_count == rollover_val)
		       next_flag = 1'b1;
		   else
		       next_flag = 1'b0;
		   if (flag == 1'b1)
		       next_count = 4'b0001;
		end
	end
	
	always_ff @ (posedge clk, negedge n_rst)
	begin: REG_LOGIC
		if (n_rst == 1'b0) begin
		   count <= 0;
		   flag <= 0;
		end
		else begin
		   count <= next_count;
		   flag <= next_flag;
		end
	end

	assign count_out = count;
	assign rollover_flag = flag;
	
endmodule
