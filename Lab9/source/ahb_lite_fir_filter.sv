// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/13/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite FIR Filter Accelerator

module ahb_lite_fir_filter
(
  input wire clk,
  input wire n_rst,
  input wire hsel,
  input wire [3:0] haddr,
  input wire hsize,
  input wire [1:0] htrans,
  input wire hwrite,
  input wire [15:0] hwdata,
  output reg [15:0] hrdata,
  output reg hresp
);

  wire data_ready, new_coefficient_set, modwait, err, load_coeff, load_done;
  wire [15:0] fir_coefficient;
  wire [15:0] fir_out;
  wire [15:0] sample_data; 
  wire [1:0] coefficient_num;

  ahb_lite_slave CTRL
  (
    .clk(clk),
    .n_rst(n_rst),
    .sample_data(sample_data),
    .data_ready(data_ready),
    .fir_coefficient(fir_coefficient),
    .new_coefficient_set(new_coefficient_set),
    .coefficient_num(coefficient_num),
    .modwait(modwait), 
    .fir_out(fir_out),
    .err(err),
    .load_done(load_done),
    .hsel(hsel),
    .haddr(haddr),
    .hsize(hsize),
    .htrans(htrans),
    .hwrite(hwrite),
    .hwdata(hwdata),
    .hrdata(hrdata),
    .hresp(hresp)
  );

  coefficient_loader LOADER
  (
    .clk(clk),
    .n_reset(n_rst),
    .new_coefficient_set(new_coefficient_set),
    .modwait(modwait),
    .load_coeff(load_coeff),
    .coefficient_num(coefficient_num),
    .load_done(load_done)
  );

  fir_filter FILTER
  (
    .clk(clk),
    .n_reset(n_rst),
    .sample_data(sample_data),
    .fir_coefficient(fir_coefficient),
    .load_coeff(load_coeff),
    .data_ready(data_ready),
    .one_k_samples(),
    .modwait(modwait),
    .fir_out(fir_out),
    .err(err)
  );

endmodule
