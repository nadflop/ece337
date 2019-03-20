// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/13/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite Slave Interface

module ahb_lite_slave
(
  input wire 	    clk,
  input wire 	    n_rst,
  output reg [15:0] sample_data,
  output reg 	    data_ready,
  output reg [15:0] fir_coefficient,
  output reg 	    new_coefficient_set,
  input wire [1:0]  coefficient_num,
  input wire 	    modwait, 
  input wire [15:0] fir_out,
  input wire 	    err,
 // input wire 	    load_busy,
  input wire        load_done,
  input wire 	    hsel,
  input wire [3:0]  haddr,
  input wire 	    hsize,
  input wire [1:0]  htrans,
  input wire 	    hwrite,
  input wire [15:0] hwdata,
  output reg [15:0] hrdata,
  output reg 	    hresp
);

//state transmitting logic
  typedef enum bit[1:0] {IDLE, WRITE, READ, ERROR} stateType;
  stateType state;
  stateType next_state;

//register file
  reg [14:0][7:0] rf;
  reg [14:0][7:0] next_rf;
  reg [3:0] prev_haddr;
  reg prev_hsize;
  reg [2:0] next_data_ready;

//state and register file assignments 
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
      rf[7] <= '0; 
      rf[8] <= '0;
      rf[9] <= '0; 
      rf[10] <= '0;
      rf[11] <= '0; 
      rf[12] <= '0;
      rf[13] <= '0; 
      rf[14] <= '0;
      sample_data <= '0;
      fir_coefficient <= '0;
      new_coefficient_set <= 0;
      prev_haddr <= '0;
      prev_hsize <= '0;
      next_data_ready <= '0;
       
       
    end
    else begin
      state <= next_state;
      rf <= next_rf;
      sample_data <= {next_rf[5],next_rf[4]};
      if (coefficient_num == 2'd0) fir_coefficient <= {next_rf[7],next_rf[6]};
      else if (coefficient_num == 2'd1) fir_coefficient <= {next_rf[9],next_rf[8]};
      else if (coefficient_num == 2'd2) fir_coefficient <= {next_rf[11],next_rf[10]};
      else if (coefficient_num == 2'd3) fir_coefficient <= {next_rf[13],next_rf[12]};

      if (load_done) begin
        new_coefficient_set <= 1'b0;//coefficient loading has completed
	rf[14] <= 8'd0;
      end
      else new_coefficient_set <= next_rf[14][0];//maintain the same value
      
      prev_haddr <= haddr;
      prev_hsize <= hsize;
      if (htrans == 2'd2 && hsel && hwrite && (haddr == 4'd4 || haddr == 4'd5)) 
	 next_data_ready <= 3'b011;
      else
	next_data_ready <= {next_data_ready[1:0],1'b0};     
    end
  end

//next state logic
  always_comb
  begin: LOGIC
    next_state = state;
   hresp = 1'b0;
    case(state)
      IDLE: begin 
	     if (htrans == 2'd2 && hsel && hwrite) begin
		if (haddr == 4'd4 || haddr == 4'd5 || haddr == 4'd6 || 
                    haddr == 4'd7 || haddr == 4'd8 || haddr == 4'd9 || 
                    haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd12 || 
                    haddr == 4'd13 || haddr == 4'd14)
		  next_state = WRITE;
		else begin
		  hresp = 1'b1;
                  next_state = ERROR;
		end
	     end
	     else if (htrans == 2'd2 && hsel && !hwrite) begin
	        if (haddr == 4'd15) begin
		  hresp = 1'b1;
		  next_state = ERROR;
		end
		else  
		  next_state = READ;
	     end
	     else
		next_state = IDLE;
	     
	    end
      WRITE: begin 
	     if (htrans == 2'd0)
		next_state = IDLE;
	     else if (htrans == 2'd2 && hsel && !hwrite) begin
	        if (haddr == 4'd15) begin
		  hresp = 1'b1;
                  next_state = ERROR;
		end
		else  
		  next_state = READ;
	     end
	     else if (htrans == 2'd2 && hsel && hwrite) begin
		if (haddr == 4'd4 || haddr == 4'd5 || haddr == 4'd6 || 
                    haddr == 4'd7 || haddr == 4'd8 || haddr == 4'd9 || 
                    haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd12 || 
                    haddr == 4'd13 || haddr == 4'd14)
		  next_state = WRITE;
		else begin
		  hresp = 1'b1;
		  next_state = ERROR; 
		end
	     end
	    end
      READ:  begin 
	     if (htrans == 2'd0)
		next_state = IDLE;
	     else if (htrans == 2'd2 && hsel && hwrite) begin
		if (haddr == 4'd4 || haddr == 4'd5 || haddr == 4'd6 || 
                    haddr == 4'd7 || haddr == 4'd8 || haddr == 4'd9 || 
                    haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd12 || 
                    haddr == 4'd13 || haddr == 4'd14)
		  next_state = WRITE;
		else begin
		  hresp = 1'b1;
		  next_state = ERROR; 
		end
	     end
	     else if (htrans == 2'd2 && hsel && !hwrite) begin
	        if (haddr == 4'd15) begin
		  hresp = 1'b1;
                  next_state = ERROR;
		end
		else  
		  next_state = READ;
	     end
      end // case: READ
      ERROR:  begin 
	     if (htrans == 2'd0)
		next_state = IDLE;
	     else if (htrans == 2'd2 && hsel && hwrite) begin
		if (haddr == 4'd4 || haddr == 4'd5 || haddr == 4'd6 || 
                    haddr == 4'd7 || haddr == 4'd8 || haddr == 4'd9 || 
                    haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd12 || 
                    haddr == 4'd13 || haddr == 4'd14)
		  next_state = WRITE;
		else begin
		  hresp = 1'b1;
		  next_state = ERROR; 
		end
	     end
	     else if (htrans == 2'd2 && hsel && !hwrite) begin
	        if (haddr == 4'd15) begin
		  hresp = 1'b1;
                  next_state = ERROR;
		end
		else  
		  next_state = READ;
	     end
	   end
    endcase 
  end

//register file and output logic
  always_comb
    begin: OUTPUT
    next_rf = rf;   
    hrdata ='0;
    data_ready = next_data_ready[2];
    if (new_coefficient_set)  next_rf[0] = 8'd1;
    else if (modwait)  next_rf[0] = 8'd1;
    else next_rf[0] = 8'd0; 
    next_rf[1] = {7'd0,err};
    next_rf[2] = fir_out[7:0];
    next_rf[3] = fir_out[15:8]; 
    next_rf[4] = sample_data[7:0];
    next_rf[5] = sample_data[15:8];
    next_rf[6] = rf[6];
    next_rf[7] = rf[7]; 
    next_rf[8] = rf[8];
    next_rf[9] = rf[9]; 
    next_rf[10] = rf[10];
    next_rf[11] = rf[11]; 
    next_rf[12] = rf[12];
    next_rf[13] = rf[13]; 
    next_rf[14] = {7'd0, new_coefficient_set};
   
    case(state)
      WRITE: begin
	 
	      if (prev_hsize == 1'b0)
		if (prev_haddr % 2 == 0)//even address
		  next_rf [prev_haddr] = hwdata[7:0];
	        else //odd address
		  next_rf [prev_haddr] = hwdata[15:8];
	 
	      else begin
		 if (prev_haddr == 4'he) begin
		    next_rf [prev_haddr] = hwdata[7:0];
		 end
		 else if (prev_haddr % 2 == 0) begin //even address 
	           next_rf [prev_haddr] = hwdata[7:0];
		   next_rf [prev_haddr+1'b1] = hwdata[15:8];
		 end
		 else begin //odd address
		   next_rf [prev_haddr-1'b1] = hwdata[7:0];
		   next_rf [prev_haddr] = hwdata[15:8];
		 end
	      end
	     end
      READ: begin
	      if (prev_hsize == 1'b0)
		if (prev_haddr % 2 == 0)//even address
		  hrdata = {8'd0,next_rf[prev_haddr]};
	        else //odd address
		  hrdata = {next_rf[prev_haddr],8'd0};
	      else begin
		 if (prev_haddr == 4'he)
		   hrdata = {8'd0, next_rf[prev_haddr]};
		 else if (prev_haddr % 2 == 0) //even address 
	            hrdata = {next_rf[prev_haddr+1'b1],next_rf[prev_haddr]};
		 else //odd address
		    hrdata = {next_rf[prev_haddr],next_rf[prev_haddr-1'b1]};
	      end
	     end
    endcase 

  end 

endmodule
