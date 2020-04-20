// $Id: $
// File name:   rcu.sv
// Created:     2/18/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: receiver control unit block

module rcu
(
  input clk,
  input n_rst,
  input start_bit_detected,
  input packet_done,
  input framing_error,
  output sbc_clear,
  output sbc_enable,
  output load_buffer,
  output enable_timer
);
  //declaration of the states
  localparam idle = 0, clear = 1, receiving = 2, 
	     verify = 3, waiting = 4,
	     complete = 5;
  reg [3:0] state;
  reg [3:0] next_state;
  reg [3:0] out;
  
  //ff for next state
  always_ff @ (posedge clk, negedge n_rst) 
    begin: STATE
        if (n_rst == 1'b0)
            state <= idle; //go to the initial state
        else
	    state <= next_state;
    end
  //combinational logic for next state
  always_comb
  begin: NXT
    case(state)
	idle:       if (start_bit_detected)	next_state = clear;
		    else			next_state = idle;
	clear:	    if (!framing_error)		next_state = receiving;
		    else			next_state = clear;
	receiving:  if (packet_done)		next_state = verify;
		    else			next_state = receiving;
	verify:	    next_state = waiting;
	waiting:    if (framing_error)		next_state = idle;
		    else			next_state = complete;
	complete:   next_state = idle;
	default:    next_state = state;
    endcase
  end

  //logic for output
  always_comb
  begin: OUT
    case(state)
	idle:	   out = 4'b0000;
        clear:     out = 4'b0100;
	receiving: out = 4'b1000;
	verify:    out = 4'b0010;
	complete:  out = 4'b0001;
	default:   out = 4'b0000;
    endcase
  end

  assign enable_timer = out[3];
  assign sbc_clear = out[2];
  assign sbc_enable = out[1];
  assign load_buffer = out[0];
endmodule