// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/13/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: Coefficient Loader Module

module coefficient_loader
(
  input wire clk,
  input wire n_reset,
  input wire new_coefficient_set,
  input wire modwait,
  output reg load_coeff,
  output reg [1:0] coefficient_num,
  output reg load_done
);

//state transmitting logic
  typedef enum bit[3:0] {IDLE, LOAD1, WAIT1, LOAD2, WAIT2, LOAD3, WAIT3, LOAD4, WAIT4} stateType;
  stateType state;
  stateType next_state;

//always ff for state assignments
  always_ff @ (posedge clk, negedge n_reset)
  begin: STATE
    if (!n_reset)
      state <= IDLE;
    else
      state <= next_state;
  end

//next state logic
  always_comb
  begin: PROCESS
    next_state = state;
    case(state)
      IDLE: 	if (!modwait && new_coefficient_set)  next_state = LOAD1;
	    	else	next_state = IDLE;
      LOAD1: 	next_state = WAIT1;
      WAIT1:	if (!modwait)	next_state = LOAD2;
		else	next_state = WAIT1;
      LOAD2:	next_state = WAIT2;
      WAIT2:	if (!modwait)	next_state = LOAD3;
		else	next_state = WAIT2;
      LOAD3:	next_state = WAIT3;
      WAIT3:	if (!modwait)	next_state = LOAD4;
		else	next_state = WAIT3;
      LOAD4:	next_state = WAIT4;
      WAIT4:    next_state = IDLE;
      
    endcase
  end

//output logic
  always_comb
  begin: OUTPUT
    load_coeff = 1'b0;
    coefficient_num = 2'd0;
    load_done = 1'b0;
    case(state)
      LOAD1: begin
		load_coeff = 1'b1;
		coefficient_num = 2'd0;
      end
      WAIT1: begin
               coefficient_num = 2'd0;
	 end
      LOAD2: begin
		load_coeff = 1'b1;
		coefficient_num = 2'd1;
      end
      WAIT2: begin
               coefficient_num = 2'd1;
	    end
      LOAD3: begin
		load_coeff = 1'b1;
		coefficient_num = 2'd2;
      end
      WAIT3: begin
               coefficient_num = 2'd2;
	 end
      LOAD4: begin
		load_coeff = 1'b1;
		coefficient_num = 2'd3;
      end
      WAIT4: begin;
	        load_done = 1'b1;
                coefficient_num = 2'd3;
             end
    endcase
  end

endmodule
