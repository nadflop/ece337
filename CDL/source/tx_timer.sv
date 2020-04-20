// $Id: $
// File name:   timer.sv
// Created:     2/18/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: timer block for tx_reciever

module tx_timer
(
  input  clk,
  input  n_rst,
  input  enable_timer,
  input  clear_8,
  input  clear_64,
  input wire [3:0] roll_val,
  output shift_enable,
  output packet_done, 
  input wire pause 
);
  reg [3:0] clock_count;
  reg [3:0] bit_count;

  flex_counter 
  SHIFT(
    .clk(clk),
    .n_rst(n_rst),
    .clear(clear_8),
    .count_enable(enable_timer),
    .rollover_val(4'd8),
    .count_out(clock_count),
    .rollover_flag(shift_enable)
  );


  flex_counter 
  PCKT(
    .clk(clk),
    .n_rst(n_rst),
    .clear(clear_64),
    .count_enable(shift_enable),
    .rollover_val(roll_val),
    .count_out(bit_count),
    .rollover_flag(packet_done)
  );
endmodule
