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
    output logic [NUM_BITS-1:0] parallel_out
);
    reg [NUM_BITS-1:0] next_data;

    always_comb
    begin: SHIFT 
	if (shift_enable == 1'b1) begin
	    if (SHIFT_MSB == 1'b1)
		next_data = {parallel_out[NUM_BITS-2:0], serial_in};
	    else
		next_data = {serial_in, parallel_out[NUM_BITS-1:1]};
	end
	else
	    next_data = parallel_out;
    end

    always_ff @ (posedge clk, negedge n_rst) 
    begin: REG
	if (n_rst == 1'b0) 
	    parallel_out <= '1;
	else 
	    parallel_out <= next_data;
    end


endmodule
    