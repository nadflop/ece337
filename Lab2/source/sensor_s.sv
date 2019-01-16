// $Id: $
// File name:   sensor_s.sv
// Created:     1/15/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: sensor error detector

module sensor_s(

	input wire [3:0] sensors,
	output reg error
);
	reg int_or1;
	reg int_and1;

	OR2X1 A1 (.Y(int_or1), .A(sensors[3]), .B(sensors[2]));
	AND2X1 A2 (.Y(int_and1), .A(sensors[1]), .B(int_or1));
	OR2X1 A3 (.Y(error), .A(sensors[0]), .B(int_and1));


endmodule