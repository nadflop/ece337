// $Id: $
// File name:   timer.sv
// Created:     2/18/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: timer block for uart receiver

module timer
(
  input wire clk,
  input wire n_rst,
  input wire enable_timer,
  input wire [3:0] data_size,
  input wire [13:0] bit_period,
  output reg shift_enable,
  output reg packet_done 
);
  reg [13:0] clock_count;
  reg [3:0] bit_count;

  flex_counter #(
    .NUM_CNT_BITS(14)
  )
  SHIFT
  (
    .clk(clk),
    .n_rst(n_rst),
    .clear(packet_done),
    .count_enable(enable_timer),
    .rollover_val(bit_period),
    .count_out(clock_count),
    .rollover_flag(shift_enable)
  );


  flex_counter 
  PCKT(
    .clk(clk),
    .n_rst(n_rst),
    .clear(packet_done),
    .count_enable(shift_enable),
    .rollover_val(data_size+1'b1),
    .count_out(bit_count),
    .rollover_flag(packet_done)
  );

endmodule
