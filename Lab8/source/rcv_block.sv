// $Id: $
// File name:   rcv_block.sv
// Created:     2/18/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: receiving block for uart receiver

module rcv_block
(
  input wire clk,
  input wire n_rst,
  input logic [3:0] data_size,
  input logic [13:0] bit_period,
  input wire serial_in,
  input wire data_read,
  output wire [7:0] rx_data,
  output wire data_ready,
  output wire overrun_error,
  output wire framing_error
);
  wire start_bit, timeEN, shiftEN, sbcEN, loadEN, clear, pckt_done, stop_bit;
  wire [7:0] rcv_data;

  //wait for start bit
  start_bit_det START
    (
	.clk(clk), 
	.n_rst(n_rst), 
	.serial_in(serial_in), 
	.start_bit_detected(start_bit)
    );
  //timer
  timer TIMER
    (
	.clk(clk), 
	.n_rst(n_rst), 
	.enable_timer(timeEN),
	.data_size(data_size),
	.bit_period(bit_period), 
	.shift_enable(shiftEN), 
	.packet_done(pckt_done)
    );
  //rcu
  rcu RCU
    (
	.clk(clk), 
	.n_rst(n_rst), 
	.start_bit_detected(start_bit), 
	.packet_done(pckt_done), 
	.framing_error(framing_error),
	.sbc_clear(clear), 
	.sbc_enable(sbcEN), 
	.load_buffer(loadEN), 
	.enable_timer(timeEN)
    );
  //9 bit shift register
  sr_9bit SHIFT
    (
	.clk(clk), 
	.n_rst(n_rst), 
	.shift_strobe(shiftEN), 
	.serial_in(serial_in), 
	.data_size(data_size),
	.packet_data(rcv_data), 
	.stop_bit(stop_bit)
    );
  //RX data buffer
  rx_data_buff BFFR
    (
	.clk(clk), 
	.n_rst(n_rst), 
	.load_buffer(loadEN), 
	.packet_data(rcv_data), 
	.data_read(data_read), 
        .rx_data(rx_data), 
	.data_ready(data_ready), 
	.overrun_error(overrun_error)
    );
  //stop bit checker
  stop_bit_chk STOP
    (
	.clk(clk), 
	.n_rst(n_rst), 
	.sbc_clear(clear), 
	.sbc_enable(sbcEN), 
	.stop_bit(stop_bit), 
	.framing_error(framing_error)
    );

endmodule