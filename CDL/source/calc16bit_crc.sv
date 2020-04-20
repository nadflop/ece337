// ==========================================================================
// CRC Generation Unit - Linear Feedback Shift Register implementation
// (c) Kay Gorontzi, GHSi.de, distributed under the terms of LGPL
// ==========================================================================
// $Id: $
// File name:   16bitcalc.sv
// Created:     4/15/2019
// Author:      Ray Yan
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: 4.1.1
module calc16bit_crc
  (
   input wire 	 clk, 
   input wire 	 n_rst, 
   input wire 	 bit_out,
   input wire 	 init_crc,
   input wire    shift_enable,
   output reg    crc_out                    // Current output CRC value
  );
   
   reg    [15:0] CRC;                               // We need output registers
   wire          inv;
   
   assign inv = bit_out ^ CRC[15];                   // XOR required?
   
   always_ff @ (posedge clk, negedge n_rst)  begin
      if (!n_rst) begin
         CRC <= '0;                                  // Init before calculation
      end
      else if (init_crc) begin
	 CRC <= '0;
      end
      else if (shift_enable) begin
         CRC[15] <= CRC[14] ^ inv;
         CRC[14] <= CRC[13];
         CRC[13] <= CRC[12];
         CRC[12] <= CRC[11];
         CRC[11] <= CRC[10];
         CRC[10] <= CRC[9];
         CRC[9] <= CRC[8];
         CRC[8] <= CRC[7];
         CRC[7] <= CRC[6];
         CRC[6] <= CRC[5];
         CRC[5] <= CRC[4];
         CRC[4] <= CRC[3];
         CRC[3] <= CRC[2];
         CRC[2] <= CRC[1] ^ inv;
         CRC[1] <= CRC[0];
         CRC[0] <= inv;
      end // if (shift_enable)
      else begin
	 CRC <= CRC;
      end // else: !if(shift_enable)
      end

  assign crc_out = CRC[15];

endmodule
