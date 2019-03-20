// $Id: $
// File name:   sync_low.sv
// Created:     2/3/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: reset to logic low synchronizer

module sync_low
(
	input clk, //system clock
	input n_rst, //active low
	input async_in,
	output reg sync_out
);
	reg data;
		
	always_ff @ (posedge clk, negedge n_rst)
	begin : SYNCHRONIZER
	   if(n_rst == 1'b0) begin
		data <= 1'b0;
		sync_out <= 1'b0;   
	   end
	   else begin
		data <= async_in;
		sync_out <= data;
	   end
	end

endmodule
