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
  input wire [3:0] data_size,
  output reg [7:0] packet_data,
  output wire stop_bit
);
  
  reg [7:0] parallel_out;

  flex_stp_sr #(
    .NUM_BITS(9), .SHIFT_MSB(0)
  ) 
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .shift_enable(shift_strobe),
    .serial_in(serial_in),
    .parallel_out({stop_bit,parallel_out})
  );
  
  always_comb 
  begin: OUT
    packet_data = '0;
    case(data_size)
	4'd5: packet_data = {1'b0,1'b0,1'b0,parallel_out[7:3]};
	4'd7: packet_data = {1'b0,parallel_out[7:1]};
	4'd8: packet_data = parallel_out;
    endcase
  end

endmodule