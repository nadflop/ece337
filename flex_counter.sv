module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS-1:0]rollover_val,
	output reg [NUM_CNT_BITS-1:0]count_out,
	output reg rollover_flag
);
	reg [NUM_CNT_BITS-1:0] next_count;
	reg flag;
 	always_comb
	begin
		next_count = count_out;
		flag = rollover_flag;
		if (clear)
		begin
			next_count = 0;
			flag = 0;
		end		
		else if (count_enable)
		begin
			if (rollover_flag == 1'b1)
			begin
				next_count = 1;
			end
			else begin
				next_count = count_out + 1'b1;
			end

			if ((count_out + 1 == rollover_val) || (count_out == 1 && rollover_val == 1))
			begin
				flag = 1'b1;
			end
			else
			begin
				flag = 1'b0;
			end
		end
		
		
		
	end
	
	always_ff @(negedge n_rst, posedge clk)
	begin
		if(n_rst == 0)
		begin
			count_out <= 0;
			rollover_flag <= 1'b0;
		end
		else
		begin
			count_out <= next_count;
			rollover_flag <= flag;
		end
	end
endmodule
		
		
