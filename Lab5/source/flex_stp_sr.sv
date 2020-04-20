// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/10/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: Flexible and scalable Serial to Parallel Shift Register Design

module flex_stp_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input clk,
    input n_rst,
    input shift_enable,
    input serial_in,
    output reg [NUM_BITS-1:0] parallel_out
);
    reg [NUM_BITS-1:0] next_data;
    reg [NUM_BITS-1:0] data;
    int i;

    always_comb
    begin: SHIFT 
	if (shift_enable == 1'b1) begin
	    if (SHIFT_MSB == 1'b1)
		next_data = {data[NUM_BITS-2:0], serial_in};
	    else
		next_data = {serial_in, data[NUM_BITS-1:1]};
	end
	else
	    next_data = data;
    end

    always_ff @ (posedge clk, negedge n_rst) 
    begin: REG
	if (n_rst == 1'b0) begin
	    for (i = 0; i < NUM_BITS; i++)
		data[i] <= 1;
	   //or can do sth like data <= '1;
	end
	else begin
	    data <= next_data;
	end
    end

    assign parallel_out = data;

endmodule
    
