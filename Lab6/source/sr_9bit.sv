// $Id: $
// File name:   sr_9bit.sv
// Created:     2/18/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: 9 bit shift register

module sr_9bit
(
  input wire clk,
  input wire n_rst,  //asynchronous, active low
  input wire shift_strobe, //active high
  input wire serial_in,    //active high
  output wire [7:0] packet_data,
  output wire stop_bit
);
  
  //reg [8:0] parallel_out;

  flex_stp_sr #(
    .NUM_BITS(9), .SHIFT_MSB(1)
  ) 
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .shift_enable(shift_strobe),
    .serial_in(serial_in),
    .parallel_out({packet_data[0],packet_data[1],packet_data[2],packet_data[3],packet_data[4],packet_data[5],packet_data[6],packet_data[7],stop_bit})
  );
  

endmodule