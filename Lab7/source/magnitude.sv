// $Id: $
// File name:   magnitude.sv
// Created:     2/26/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: magnitude block

module magnitude
(
   input wire [16:0] in,
   output reg [15:0] out
);

   always_comb
   begin: SIGNED
   	if (in [16] == 1'b1)
	    out = (~in[15:0] + 1'b1);
   	else
	    out = in[15:0];
   end

endmodule