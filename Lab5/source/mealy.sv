// $Id: $
// File name:   mealy.sv
// Created:     2/10/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: mealy '1101' detector design

module mealy
(
    input clk,
    input n_rst,
    input i,
    output o
);
    //declaration of the states
    localparam A = 0, B = 1, C = 2, D = 3;
    reg [1:0] state; //current state
    reg [1:0] next_state; //next state
    reg out;
    //combinational logic for next state
    always_ff @ (posedge clk) 
    begin: STATE
        if (n_rst == 1'b0)
            state <= A; //go to the initial state
        else
	    state <= next_state;
    end
    //logic for output
    always_comb
    begin: OUTPUT
	next_state = state;
	out = 1'b0;
	case (state)
	    A:  if (i == 1'b1)  next_state = B;
		else 		next_state = A;
	    B:  if (i == 1'b1)  next_state = C;
		else		next_state = A;		
	    C:  if (i == 1'b0)  next_state = D;
		else		next_state = C;
	    D:  if (i == 1'b1) begin
		next_state = B;
		out = 1'b1;
		end
		else		next_state = A;
	endcase
    end

    assign o = out;
endmodule