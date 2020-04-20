// $Id: $
// File name:   tx_encoder.sv
// Created:     2/26/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: encoder for tx

module tx_encoder
(
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire serial_out,
    input wire crc_out,
    input wire load_eop,
    input wire load_crc1,
    input wire load_crc2,
    input wire pause,
    input wire complete,
    output reg dplus_out,//no need to synchronize
    output reg dminus_out//no need to synchronize
);
    reg next_dplus, next_dminus;

    always_ff @ (posedge clk, negedge n_rst)
    begin: STATE
    	if (!n_rst) begin
	    dplus_out <= 1'b1;
	    dminus_out <= 1'b0;
	end
        /*else if (complete) begin
	    dplus_out <= 1'b1;
	    dminus_out <= 1'b0;			
	end*/
	else begin
	    dplus_out <= next_dplus;
	    dminus_out <= next_dminus;
    	end
    end

    always_comb
    begin
	next_dplus = dplus_out;
	next_dminus = dminus_out;
	if (load_eop) begin
	  if (shift_enable) begin
	    next_dplus = 1'b0;
	    next_dminus = 1'b0;
	  end
	  else begin
	    next_dplus = dplus_out;
	    next_dminus = dminus_out;
	  end
	end
	else if (complete) begin
	  if (shift_enable) begin
	    next_dplus = 1'b1;
	    next_dminus = 1'b0;
	  end
	  else begin
	    next_dplus = dplus_out;
	    next_dminus = dminus_out;
	  end	
	end
	else if (pause) begin
	  if (shift_enable) begin
	    next_dplus = !dplus_out;
	    next_dminus = !dminus_out;
	  end
	  else begin
	    next_dplus = dplus_out;
	    next_dminus = dminus_out;
	  end
	end
	else if (load_crc1 || load_crc2) begin
	  if (shift_enable) begin
	    if (!crc_out) begin
		next_dplus = !dplus_out;
		next_dminus = !dminus_out;
	    end
	    else begin
		next_dplus = dplus_out;
		next_dminus = dminus_out;
	    end
	  end
	  else begin
	    next_dplus = dplus_out;
	    next_dminus = dminus_out;
	  end	
	end
	else if (!load_eop) begin
	  if (shift_enable) begin
	    if (!serial_out) begin
		next_dplus = !dplus_out;
		next_dminus = !dminus_out;
	    end
	    else begin
		next_dplus = dplus_out;
		next_dminus = dminus_out;
	    end
	  end
	  else begin
	    next_dplus = dplus_out;
	    next_dminus = dminus_out;
	  end	
	end
    end

endmodule

