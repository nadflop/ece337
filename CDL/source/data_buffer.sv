// $Id: $
// File name:   databuffer.sv
// Created:     4/15/2019
// Author:      Ray Yan
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: 4.1.1
module data_buffer
(
	input clk,
	input n_rst,

	input wire store_rx_packet,
	input wire store_tx_data,
	input wire get_rx_data,
	input wire get_tx_packet,

	input [7:0] rx_packet_data,
	input wire [7:0] tx_data,
	

	input wire flush,
	input wire clear,
	output reg [7:0] tx_packet_data,
	output reg [7:0] rx_data,
	output reg [6:0] buffer_occupancy
);

reg [6:0] next_buff;
reg [63:0][7:0] bufreg;
reg [63:0][7:0] nbufreg;

reg [63:0] fillreg;
reg [63:0] nfillreg;

integer i;
reg track;

always_ff @ (posedge clk, negedge n_rst) begin
	if (!n_rst) begin
		bufreg[0] <= '0;
		bufreg[1] <= '0;
		bufreg[2] <= '0;
		bufreg[3] <= '0;
		bufreg[4] <= '0;
		bufreg[5] <= '0;
		bufreg[6] <= '0;
		bufreg[7] <= '0;
		bufreg[8] <= '0;
		bufreg[9] <= '0;
		bufreg[10] <= '0;
		bufreg[11] <= '0;
		bufreg[12] <= '0;
		bufreg[13] <= '0;
		bufreg[14] <= '0;
		bufreg[15] <= '0;
		bufreg[16] <= '0;
		bufreg[17] <= '0;
		bufreg[18] <= '0;
		bufreg[19] <= '0;
		bufreg[20] <= '0;
		bufreg[21] <= '0;
		bufreg[22] <= '0;
		bufreg[23] <= '0;
		bufreg[24] <= '0;
		bufreg[25] <= '0;
		bufreg[26] <= '0;
		bufreg[27] <= '0;
		bufreg[28] <= '0;
		bufreg[29] <= '0;
		bufreg[30] <= '0;
		bufreg[31] <= '0;
		bufreg[32] <= '0;
		bufreg[33] <= '0;
		bufreg[34] <= '0;
		bufreg[35] <= '0;
		bufreg[36] <= '0;
		bufreg[37] <= '0;
		bufreg[38] <= '0;
		bufreg[39] <= '0;
		bufreg[40] <= '0;
		bufreg[41] <= '0;
		bufreg[42] <= '0;
		bufreg[43] <= '0;
		bufreg[44] <= '0;
		bufreg[45] <= '0;
		bufreg[46] <= '0;
		bufreg[47] <= '0;
		bufreg[48] <= '0;
		bufreg[49] <= '0;
		bufreg[50] <= '0;
		bufreg[51] <= '0;
		bufreg[52] <= '0;
		bufreg[53] <= '0;
		bufreg[54] <= '0;
		bufreg[55] <= '0;
		bufreg[56] <= '0;
		bufreg[57] <= '0;
		bufreg[58] <= '0;
		bufreg[59] <= '0;
		bufreg[60] <= '0;
		bufreg[61] <= '0;
		bufreg[62] <= '0;
		bufreg[63] <= '0;
		fillreg <= '0;
		buffer_occupancy <= '0;
	end
        else if (flush || clear) begin
		bufreg[0] <= '0;
		bufreg[1] <= '0;
		bufreg[2] <= '0;
		bufreg[3] <= '0;
		bufreg[4] <= '0;
		bufreg[5] <= '0;
		bufreg[6] <= '0;
		bufreg[7] <= '0;
		bufreg[8] <= '0;
		bufreg[9] <= '0;
		bufreg[10] <= '0;
		bufreg[11] <= '0;
		bufreg[12] <= '0;
		bufreg[13] <= '0;
		bufreg[14] <= '0;
		bufreg[15] <= '0;
		bufreg[16] <= '0;
		bufreg[17] <= '0;
		bufreg[18] <= '0;
		bufreg[19] <= '0;
		bufreg[20] <= '0;
		bufreg[21] <= '0;
		bufreg[22] <= '0;
		bufreg[23] <= '0;
		bufreg[24] <= '0;
		bufreg[25] <= '0;
		bufreg[26] <= '0;
		bufreg[27] <= '0;
		bufreg[28] <= '0;
		bufreg[29] <= '0;
		bufreg[30] <= '0;
		bufreg[31] <= '0;
		bufreg[32] <= '0;
		bufreg[33] <= '0;
		bufreg[34] <= '0;
		bufreg[35] <= '0;
		bufreg[36] <= '0;
		bufreg[37] <= '0;
		bufreg[38] <= '0;
		bufreg[39] <= '0;
		bufreg[40] <= '0;
		bufreg[41] <= '0;
		bufreg[42] <= '0;
		bufreg[43] <= '0;
		bufreg[44] <= '0;
		bufreg[45] <= '0;
		bufreg[46] <= '0;
		bufreg[47] <= '0;
		bufreg[48] <= '0;
		bufreg[49] <= '0;
		bufreg[50] <= '0;
		bufreg[51] <= '0;
		bufreg[52] <= '0;
		bufreg[53] <= '0;
		bufreg[54] <= '0;
		bufreg[55] <= '0;
		bufreg[56] <= '0;
		bufreg[57] <= '0;
		bufreg[58] <= '0;
		bufreg[59] <= '0;
		bufreg[60] <= '0;
		bufreg[61] <= '0;
		bufreg[62] <= '0;
		bufreg[63] <= '0;
		fillreg <= '0;
		buffer_occupancy <= '0;
	   end
	else begin
		//rxreg <= nrxreg;
		bufreg <= nbufreg;
		buffer_occupancy <= next_buff;
		fillreg <= nfillreg;
	end
end

always_comb begin
	tx_packet_data = '0;
	rx_data = '0;
	track = 0;
	nbufreg = bufreg;
	nfillreg = fillreg;
	//ntxreg = txreg;
	next_buff = buffer_occupancy;
	if (store_rx_packet) begin
		for (i = 63; i >= 0; i = i - 1) begin
			if (fillreg[i] == 0 && track == 0) begin
				nbufreg[i] = rx_packet_data;
				track = 1;
				nfillreg[i] = 1;
			end
		end
		next_buff = buffer_occupancy + 1;
	end
	else if (store_tx_data) begin
		for (i = 63; i >= 0; i = i - 1) begin
			if (fillreg[i] == 8'b00000000 && track == 0) begin
				nbufreg[i] = tx_data;
				track = 1;
				nfillreg[i] = 1;
			end
		end 
		next_buff = buffer_occupancy + 1;
	end
	else if (get_rx_data) begin
		rx_data = bufreg[63];
		for (i = 63; i > 0; i = i - 1) begin
			nbufreg[i] = bufreg[i-1];
			nfillreg[i] = fillreg[i-1];
		end
		nbufreg[0] = '0;
		nfillreg[0] = 0;
		next_buff = buffer_occupancy - 1;
	end
	else if (get_tx_packet) begin
		tx_packet_data = bufreg[63];
		for (i = 63; i > 0; i = i - 1) begin
			nbufreg[i] = bufreg[i-1];
			nfillreg[i] = fillreg[i-1];
		end
		nbufreg[0] = '0;
		nfillreg[0] = 0;
		next_buff = buffer_occupancy - 1;
	end
end

endmodule
