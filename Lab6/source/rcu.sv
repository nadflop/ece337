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
  //localparam idle = 0, clear = 1, receiving = 2, verify = 3, waiting = 4, complete = 5;
  //can do typedef enum bit[n:0] {name of states} name for enum
  typedef enum bit [2:0] {IDLE, CLEAR, RECEIVING, VERIFY, WAITING, COMPLETE} stateType;
  stateType state;
  stateType next_state;
  //stateType out
  //reg [3:0] state;
  //reg [3:0] next_state;
  reg [3:0] out;
  
  //ff for next state
  always_ff @ (posedge clk, negedge n_rst) 
    begin: STATE
        if (n_rst == 1'b0)
            state <= IDLE; //go to the initial state
        else
	    state <= next_state;
    end
  //combinational logic for next state
  always_comb
  begin: NXT
    next_state = state;
    case(state)
	IDLE:       if (start_bit_detected)	next_state = CLEAR;
		    else			next_state = IDLE;
	CLEAR:	    if (!framing_error)		next_state = RECEIVING;
		    else			next_state = CLEAR;
	RECEIVING:  if (packet_done)		next_state = VERIFY;
		    else			next_state = RECEIVING;
	VERIFY:	    next_state = WAITING;
	WAITING:    if (framing_error)		next_state = IDLE;
		    else			next_state = COMPLETE;
	COMPLETE:   next_state = IDLE;
	default:    next_state = state;
    endcase
  end

  //logic for output
  always_comb
  begin: OUT
    case(state)
	IDLE:	   out = 4'b0000;
        CLEAR:     out = 4'b0100;
	RECEIVING: out = 4'b1000;
	VERIFY:    out = 4'b0010;
	COMPLETE:  out = 4'b0001;
	default:   out = 4'b0000;
    endcase
  end

  assign enable_timer = out[3];
  assign sbc_clear = out[2];
  assign sbc_enable = out[1];
  assign load_buffer = out[0];
endmodule
