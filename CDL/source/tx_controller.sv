// $Id: $
// File name:   controller.sv
// Created:     2/26/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: controller

module tx_controller
(
    input wire 	     clk,
    input wire 	     n_rst,
    ////////////////////////////////////////
    //input, outputs from the AHB Slave
    input wire [1:0] tx_packet,
    input wire [6:0] buffer_occupancy,
    input wire 	     tx_enable,
    output reg 	     tx_error,
    output reg 	     tx_transfer_active,
    output reg 	     get_tx_packet_data,
    ////////////////////////////////////////
    //inputs, outputs from the timer
    input wire 	     packet_done,
    output reg 	     enable_timer,
    output reg 	     clear_8,
    output reg       clear_64, 	     
    ///////////////////////////////////////
    //inputs, outputs from the shift register
    output reg 	     load_sync,
    output reg 	     load_pid_data,
    output reg 	     load_data,
    output reg 	     load_ack,
    output reg 	     load_nack,
    output reg 	     load_stall,
    output reg 	     load_eop,
    output reg 	     load_crc1,
    output reg 	     load_crc2,
    ///////////////////////////////////////
    //output to 16-bit generator
    output reg 	     init_crc,
    output reg       complete,
    output reg [3:0]     roll_val,
    input wire 		pause,
    input wire val
    //TODO: CHECK IF THIS INIT CRC THING IS NEEDED
);
    //declaration of the states
    typedef enum bit[4:0] {IDLE, LOAD_SYNC, SHIFT_SYNC, LOAD_ACK, SHIFT_ACK, LOAD_NACK,
               SHIFT_NACK, LOAD_STALL, SHIFT_STALL, LOAD_PID_DATA, SHIFT_PID_DATA, LOAD_DATA,
               SHIFT_DATA, LOAD_CRC1, SHIFT_CRC1, LOAD_CRC2,
               SHIFT_CRC2, ERROR, SHIFT_ERROR, LOAD_EOP, SHIFT_EOP1, SHIFT_EOP2} stateType;
    stateType state;
    stateType next_state;
    //reg flag;    
    localparam NORMAL = 2'b00;
    localparam ADDONE = 2'b01;

    reg [1:0] temp;
    reg [1:0] next_temp;
    reg [3:0] prev_roll;
    //always ff for state assignments
    always_ff @ (posedge clk, negedge n_rst)
    begin: STATE
    	if (!n_rst)
	    state <= IDLE;
	else
	    state <= next_state;
    end
    //next state logic
    always_comb
    begin: PROCESS
      next_state = state;
      case(state)
	IDLE: 	begin
		  if (tx_enable)	next_state = LOAD_SYNC;
		  else			next_state = IDLE;
		end
	LOAD_SYNC: next_state = SHIFT_SYNC;
	SHIFT_SYNC: begin
		      if (tx_packet == 2'b00 && packet_done)	  next_state = LOAD_STALL;
		      else if (tx_packet == 2'b01 && packet_done) next_state = LOAD_PID_DATA;
		      else if (tx_packet == 2'b10 && packet_done) next_state = LOAD_ACK;
		      else if (tx_packet == 2'b11 && packet_done) next_state = LOAD_NACK;
		      else 			                  next_state = SHIFT_SYNC;
		    end
	LOAD_ACK: next_state = SHIFT_ACK;
	SHIFT_ACK: begin
		     if (packet_done)		next_state = LOAD_EOP;
		     else			next_state = SHIFT_ACK;
		   end
	LOAD_NACK: next_state = SHIFT_NACK;
	SHIFT_NACK:begin
		     if (packet_done)		next_state = LOAD_EOP;
		     else			next_state = SHIFT_NACK;
		   end
	LOAD_STALL: next_state = SHIFT_STALL;
	SHIFT_STALL: begin
		       if (packet_done)		next_state = LOAD_EOP;
		       else			next_state = SHIFT_STALL;
		     end
	LOAD_PID_DATA: next_state = SHIFT_PID_DATA;
	SHIFT_PID_DATA:	begin
		     	  if (packet_done == 1'b1 && buffer_occupancy != 7'd0)
			     next_state = LOAD_DATA;
		    	  else if (packet_done == 1'b1 && buffer_occupancy == 7'd0)	
			     next_state = ERROR;
			  else
			     next_state = SHIFT_PID_DATA;
		   	end
	LOAD_DATA: next_state = SHIFT_DATA;
	SHIFT_DATA: begin
	              if (packet_done == 1'b1 && buffer_occupancy != 7'd0) 
			next_state = LOAD_DATA;
		      else if (packet_done == 1'b1 && buffer_occupancy == 7'd0)
			next_state = LOAD_CRC1;
		      else		
			next_state = SHIFT_DATA;
		     end
	LOAD_CRC1: next_state = SHIFT_CRC1;
	SHIFT_CRC1: begin
		       if (packet_done == 1'b1)	next_state = LOAD_CRC2;
		       else			next_state = SHIFT_CRC1;
		     end
	LOAD_CRC2: next_state = SHIFT_CRC2;
	SHIFT_CRC2: begin
		       if (packet_done == 1'b1)	next_state = LOAD_EOP;
		       else			next_state = SHIFT_CRC2;
		     end
	ERROR: next_state = SHIFT_ERROR; //basically shifting a nack
	SHIFT_ERROR: begin
		       if (packet_done == 1'b1)	next_state = LOAD_EOP;
		       else			next_state = SHIFT_ERROR;
		     end
	LOAD_EOP: next_state = SHIFT_EOP1;	
	SHIFT_EOP1: begin
		       if (packet_done == 1'b1)	next_state = SHIFT_EOP2;
		       else			next_state = SHIFT_EOP1;
		     end

	SHIFT_EOP2: begin
		       if (packet_done == 1'b1)	next_state = IDLE;
		       else			next_state = SHIFT_EOP1;
		     end
      endcase
    end
    
    //output logic
    always_comb
    begin: OUTPUT
     clear_8 = 1'b0;
     clear_64 = 1'b0;
     tx_error = 1'b0;
     tx_transfer_active = 1'b0;//needs a register kinda to make sure its stable all the time
     get_tx_packet_data = 1'b0;
     enable_timer = 1'b0;
     load_sync = 1'b0;
     load_pid_data = 1'b0;
     load_data = 1'b0;
     load_ack = 1'b0;
     load_nack = 1'b0;
     load_stall = 1'b0;
     load_eop = 1'b0;
     load_crc1 = 1'b0;
     load_crc2 = 1'b0;
     init_crc = 1'b0;
     complete = 1'b0;
     roll_val = 4'd8;
     case (state)
	IDLE: begin
     		roll_val = 4'd8;
		init_crc = 1'b1;
	      end
	LOAD_SYNC: begin
     		     roll_val = 4'd8;
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     tx_transfer_active = 1'b1;
		     load_sync = 1'b1;
		   end	
	SHIFT_SYNC: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		    end
	LOAD_ACK: begin
     		     roll_val = 4'd8;
                     clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     tx_transfer_active = 1'b1;
		     load_ack = 1'b1;
		  end
	SHIFT_ACK: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		   end
	LOAD_NACK: begin
     		     roll_val = 4'd8;
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     tx_transfer_active = 1'b1;
		     load_nack = 1'b1;
		   end
	SHIFT_NACK: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		    end
	LOAD_STALL: begin
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
	             roll_val = 4'd8;
		     tx_transfer_active = 1'b1;
		     load_stall = 1'b1;
		    end
	SHIFT_STALL: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		     end
	LOAD_PID_DATA: begin
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
                     tx_transfer_active = 1'b1;
		     load_pid_data = 1'b1;
     		      roll_val = 4'd8;
		    end
	SHIFT_PID_DATA:	begin
     		          roll_val = 4'd8;
			  tx_transfer_active = 1'b1;
		          enable_timer = 1'b1;			
			end
	LOAD_DATA: begin
     		      roll_val = 4'd8;
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     get_tx_packet_data = 1'b1;//check
		     tx_transfer_active = 1'b1;
		     load_data = 1'b1;
		   end
	SHIFT_DATA: begin
                      //flag = 1'b0;
                      enable_timer = 1'b1;
     		      roll_val = prev_roll;
		      tx_transfer_active = 1'b1;
                      enable_timer = 1'b1;
		    end
	LOAD_CRC1: begin
     		      roll_val = 4'd8;
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     tx_transfer_active = 1'b1;
		     load_crc1 = 1'b1;
		   end
	SHIFT_CRC1: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		    end
	LOAD_CRC2: begin
     		     roll_val = 4'd8;
	   	     clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     tx_transfer_active = 1'b1;
		     load_crc2 = 1'b1;
		   end
	SHIFT_CRC2: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		    end
	ERROR: begin
     		 roll_val = 4'd8;
	   	 clear_8 = 1'b1;
	         clear_64 = 1'b1;
		 tx_error = 1'b1;
	         tx_transfer_active = 1'b1;
		 load_nack = 1'b1;
	       end
	SHIFT_ERROR: begin
     		      roll_val = 4'd8;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		     end //basically shifting a nack
	LOAD_EOP: begin
		     load_eop = 1'b1;
	             clear_8 = 1'b1;
	             clear_64 = 1'b1;
		     tx_transfer_active = 1'b1;
		  end	
	SHIFT_EOP1: begin
		      roll_val = 4'd2;
		      load_eop = 1'b1;
		      tx_transfer_active = 1'b1;
		      enable_timer = 1'b1;
		    end
	SHIFT_EOP2: begin
	              clear_8 = 1'b1;
	              clear_64 = 1'b1;
		      roll_val = 4'd1;
		      tx_transfer_active = 1'b0;
		      enable_timer = 1'b1;
		      complete = 1'b1;
		    end

      endcase
    end


    //simple FSM for pause
    always_ff @ (posedge clk, negedge n_rst) begin
      if (!n_rst) begin
         temp <= NORMAL;
      end
      else begin
	temp <= next_temp;         
      end
    end
    
    always_comb begin
       next_temp = temp;
       case(temp)
	NORMAL: if (pause)	next_temp = ADDONE;
	        else 		next_temp = NORMAL;
        ADDONE: if (packet_done)  next_temp = NORMAL;                
		else		next_temp = ADDONE;
       endcase                
    end

    always_comb begin 
       prev_roll = 4'd8;                                             
       case(temp)
	NORMAL: prev_roll = 4'd8;
        ADDONE: prev_roll = 4'd9;
       endcase
    end

endmodule

