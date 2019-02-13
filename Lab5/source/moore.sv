// $Id: $
// File name:   moore.sv
// Created:     2/10/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: moore '1101' detector design

module moore
(
    input clk,
    input n_rst,
    input i,
    output o
);
    //declaration of the states
    localparam A = 0, B = 1, C = 2, D = 3, E = 4;
    reg [2:0] state; //current state
    reg [2:0] next_state; //next state
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
	out = 1'b0;
	case (state)
	    A:  if (i == 1'b1)  next_state = B;
		else		next_state = A;
	    B:  if (i == 1'b1)  next_state = C;
		else		next_state = B;
	    C:  if (i == 1'b0)  next_state = D;
		else		next_state = C;
	    D:  if (i == 1'b1)  next_state = E;
		else		next_state = B;
	    E:  begin
		out = 1'b1;
		if (i == 1'b1)  next_state = C;
		else		next_state = A;
	    end
	    default: begin
		     out = 1'b0;
		     next_state = state;
	    end
	endcase
    end
    
    assign o = out;
endmodule