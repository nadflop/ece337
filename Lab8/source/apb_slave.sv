// $Id: $
// File name:   apb_slave.sv
// Created:     3/4/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: APB-Slave Interface

module apb_slave(
  input wire clk,
  input wire n_rst,
  input wire [7:0] rx_data,
  input wire data_ready,
  input wire overrun_error,
  input wire framing_error,
  output reg data_read,
  input wire psel,
  input wire [2:0] paddr,
  input wire penable,
  input wire pwrite,
  input wire [7:0] pwdata,
  output logic [7:0] prdata,
  output reg pslverr,
  output reg [3:0] data_size,
  output reg [13:0] bit_period
);

//state transmitting logic
  typedef enum bit[1:0] {IDLE, WRITE, READ, ERROR} stateType;
  stateType state;
  stateType next_state;
//register file
  reg [6:0][7:0] rf;
  reg [6:0][7:0] next_rf; 

  always_ff @ (posedge clk, negedge n_rst)
  begin: STATE
    if (!n_rst) begin
      state <= IDLE;
      rf[0] <= '0;
      rf[1] <= '0;
      rf[2] <= '0;
      rf[3] <= '0;
      rf[4] <= '0;
      rf[5] <= '0;
      rf[6] <= '0;
      data_size <= 4'd8;
      bit_period <= 14'd10;
    end
    else begin
      state <= next_state;
      rf <= next_rf;
      bit_period <= {next_rf[3],next_rf[2]};
      data_size <= next_rf[4][3:0];
    end
  end

  //next state logic
  always_comb
  begin: LOGIC
    next_state = state;
    pslverr = 1'b0;
    case(state)
      IDLE: begin 
	     if (psel && pwrite) begin
		if (paddr == 3'd2 || paddr == 3'd3 || paddr == 3'd4)
		  next_state = WRITE;
		else
		  next_state = ERROR;
	     end
	     else if (psel && !pwrite)
		next_state = READ;
	     else
		next_state = IDLE;
	    end
      WRITE: next_state = IDLE;
      READ:  next_state = IDLE;
      ERROR: begin
		pslverr = 1'b1;
		next_state = IDLE;
	     end
    endcase 
  end

//register file
  always_comb
  begin: OUTPUT
    next_rf = rf;
    data_read = 1'b0;
    prdata = '0;
    next_rf[0] = data_ready;
    next_rf[2] = bit_period[7:0];
    next_rf[3] = {2'b00,bit_period[13:8]};
    next_rf[4] = {4'b0000,data_size};
    next_rf[5] = rf[5];
    next_rf[6] = rx_data;
    if (framing_error) next_rf[1] = 8'd1;
    else if (overrun_error) next_rf[1] = 8'd2;
    else next_rf[1] = 8'd0;

    case(state)
      WRITE: next_rf [paddr] = pwdata;
      READ: begin
	      prdata = rf[paddr];
	      if (paddr == 3'd6) data_read = 1'b1;
            end
    endcase 

  end 

endmodule
