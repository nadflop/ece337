// $Id: $
// File name:   sensor_d.sv
// Created:     1/15/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: dataflow style

module sensor_d
(

	input wire [3:0] sensors,
	output wire error
);
	
	assign error = sensors[0] | (sensors[1] &(sensors[2] | sensors[3]));

endmodule