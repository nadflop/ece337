// $Id: $
// File name:   sensor_b.sv
// Created:     1/15/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: behavorial

module sensor_b
(
	input [3:0] sensors,
	output reg error
);
	
	reg st1;
	reg st2;

	always_comb begin
		if (sensors[3] == 1'b1 && sensors[2] == 1'b1) 
			st1 = 1;
		else if (sensors[3] == 1'b1 && sensors[2] == 1'b0)
			st1 = 1;
		else if (sensors[3] == 1'b0 && sensors[2] == 1'b1)
			st1 = 1;
		else
			st1 = 0;
		if (st1 == 1'b1 && sensors[1] == 1'b1)
			st2 = 1;
		else
			st2 = 0;
		if (st2 == 1'b1 && sensors[0] == 1'b1) 
			error = 1;
		else if (st2 == 1'b1 && sensors[0] == 1'b0)
			error = 1;
		else if (st2 == 1'b0 && sensors[0] == 1'b1)
			error = 1;
		else
			error = 0;
	end



endmodule