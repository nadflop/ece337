// $Id: $
// File name:   fir_filter.sv
// Created:     2/26/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: FIR filter


module fir_filter
(
  input wire clk,
  input wire n_reset,
  input wire [15:0] sample_data,
  input wire [15:0] fir_coefficient,
  input wire load_coeff,
  input wire data_ready,
  output reg one_k_samples,
  output reg modwait,
  output reg [15:0] fir_out,
  output reg err
);
  wire dr, lc, clear, cnt_up, overflow;
  wire [2:0] op;
  wire [3:0] src1;
  wire [3:0] src2;
  wire [3:0] dest;
  wire [16:0] outreg_data;

  sync_low SYNC_DR
    (
	.clk(clk),
	.n_rst(n_reset),
	.async_in(data_ready),
	.sync_out(dr)
    );
  sync_low SYNC_LC
    (
	.clk(clk),
	.n_rst(n_reset),
	.async_in(load_coeff),
	.sync_out(lc)
    );
  controller CTRL
    (
	.clk(clk),
	.n_rst(n_reset),
	.dr(dr),
	.lc(lc),
	.overflow(overflow),
	.cnt_up(cnt_up),
	.clear(clear),
	.modwait(modwait),
	.op(op),
	.src1(src1),
	.src2(src2),
	.dest(dest),
	.err(err)
    );
  counter COUNTER
    (
	.clk(clk),
	.n_rst(n_reset),
	.cnt_up(cnt_up),
	.clear(clear),
	.one_k_samples(one_k_samples)
    );
  magnitude MGNTD
    (
	.in(outreg_data),
	.out(fir_out)
    );
  datapath DTPATH
    (
	.clk(clk),
	.n_reset(n_reset),
	.op(op),
	.src1(src1),
	.src2(src2),
	.dest(dest),
	.ext_data1(sample_data),
	.ext_data2(fir_coefficient),
	.outreg_data(outreg_data),
	.overflow(overflow)
    );
    


endmodule
