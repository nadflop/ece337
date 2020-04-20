module sync_low
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output wire sync_out
);
reg [1:0] data;

always_ff @ (posedge clk, negedge n_rst) 
begin : ff_1
	if(n_rst == 1'b0)
	begin
		data <= 2'b0;
	end
	else
	begin
		data[1] <= async_in;
		data[0] <= data[1];
	end
end
assign sync_out = data[0];

endmodule
