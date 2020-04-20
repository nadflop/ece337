// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/10/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: parallel to serial shift register design for usb tx

module tx_flex_pts_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input wire 		       clk,
    input wire 		       n_rst,
    input wire 		       shift_enable,
    input wire 		       load_sync,
    input wire 		       load_pid_data,
    input wire 		       load_data,
    input wire 		       load_ack,
    input wire 		       load_nack,
    input wire 		       load_stall,
    input wire 		       load_eop,
    input wire 		       load_crc1,
    input wire		       load_crc2,
    input wire [NUM_BITS-1:0]  tx_packet_data,
    input wire		       pause,
    //input wire   crc_out,
    output wire 	       serial_out
    //output wire [NUM_BITS-1:0] crc_data
);
    reg [NUM_BITS-1:0] next_data;
    reg [NUM_BITS-1:0] data;
    int i;
    reg out;
   
    always_comb
      begin: SHIFT
	//crc_data = 16'd0; 
	if (load_sync == 1'b1) begin
	    next_data = 8'b10000000;
	end       
	else if (load_pid_data == 1'b1) begin  //TODO: toggle data0 data1, fix at the end of the project
	    next_data = 8'b00111100;
	    //crc_data =  {8'b10000000, 8'b00111100};
	end
	else if (load_data == 1'b1) begin
	    next_data = tx_packet_data;
	    //crc_data = {tx_packet, 8'd0};
	end
	else if (load_ack == 1'b1) begin
	    next_data = 8'b10110100;
	end
	else if (load_nack == 1'b1)
	    next_data = 8'b10100101;
	else if (load_stall == 1'b1)
	    next_data = 8'b10000111;
	else if (load_eop == 1'b1)
	    next_data = 8'b00000000;
	else if (load_crc1 == 1'b1) //TODO: get value from the crc generator
	  next_data = 8'd0;
	else if (load_crc2 == 1'b1) //TODO: get value from the crc generator
	  next_data = 8'd0;
	else if (shift_enable == 1'b1) begin
	    if (SHIFT_MSB == 1'b1)
		next_data = {data[NUM_BITS-2:0], 1'b0}; //it was n_rst
	    else
		next_data = {1'b0, data[NUM_BITS-1:1]};//it was n_rst
	end
	else
	    next_data = data;
    end

    always_ff @ (posedge clk, negedge n_rst) 
    begin: REG
	if (n_rst == 1'b0) begin
	    for (i = 0; i < NUM_BITS; i++)
		data[i] <= 1;
	end
	else begin
	    data <= next_data;
	end
    end

    always_comb
    begin: OUT
	if (SHIFT_MSB == 1'b1) 
    	        out = data[NUM_BITS-1];
    	else 
	       out = data[0];
    end
    assign serial_out = out;

endmodule
    
