// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/10/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: parallel to serial shift register design

module flex_pts_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire load_enable,
    input wire [NUM_BITS-1:0] parallel_in,
    output wire serial_out
);
    reg [NUM_BITS-1:0] next_data;
    reg [NUM_BITS-1:0] data;
    int i;
    reg out;

    always_comb
    begin: SHIFT 
	if (load_enable == 1'b1)
	    next_data = parallel_in;
	else if (shift_enable == 1'b1) begin
	    if (SHIFT_MSB == 1'b1)
		next_data = {data[NUM_BITS-2:0], n_rst};
	    else
		next_data = {n_rst, data[NUM_BITS-1:1]};
	end
	else
	    next_data = data;
    end

    always_ff @ (posedge clk, negedge n_rst) 
    begin: REG
	if (n_rst == 1'b0) begin
	    for (i = 0; i < NUM_BITS; i++)
		data[i] <= 1;
	   //or can do something like data <= '1;
	end
	else begin
	    data <= next_data;
	end
    end

    always_comb
    begin: OUT
	if (SHIFT_MSB == 1'b1)
    	    out = data[NUM_BITS-1];
    	else
	    out = data[0];
    end
    assign serial_out = out;

endmodule
    
