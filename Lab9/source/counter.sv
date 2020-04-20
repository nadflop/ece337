// $Id: $
// File name:   counter.sv
// Created:     2/26/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: counter

module counter
(
    input wire clk,
    input wire n_rst,
    input wire cnt_up,
    input wire clear,
    output reg one_k_samples
);

    wire [9:0] o;
    flex_counter #(
    	.NUM_CNT_BITS(10)
    )
    CORE (
	.clk(clk),
	.n_rst(n_rst),
	.clear(clear),
	.count_enable(cnt_up),
	.rollover_val(10'd1000),
	.count_out(o),
	.rollover_flag(one_k_samples)
    );



endmodule
