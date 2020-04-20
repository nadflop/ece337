// $Id: $
// File name:   controller.sv
// Created:     2/26/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: controller

module controller
(
    input wire clk,
    input wire n_rst,
    input wire dr,
    input wire lc,
    input wire overflow,
    output reg cnt_up,
    output reg clear,
    output reg modwait,
    output reg [2:0] op,
    output reg [3:0] src1,
    output reg [3:0] src2,
    output reg [3:0] dest,
    output reg err
);
    //declaration of the states
    typedef enum bit[4:0] {IDLE,  LOAD1, WAIT1, LOAD2, WAIT2, LOAD3,
               WAIT3, LOAD4, STORE, ZERO, SORT1, SORT2,
               SORT3, SORT4, MUL1, ADD1, MUL2, SUB1,
               MUL3, ADD2, MUL4, SUB2, EIDLE} stateType;
    stateType state;
    stateType next_state;
  
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
	IDLE:begin
	      begin
		if (dr)	next_state = STORE;
	      end 
	      begin
		if (lc)	next_state = LOAD1;
	      end
	     end
	LOAD1:	next_state = WAIT1;
	WAIT1:	if (lc)	next_state = LOAD2;
		else next_state = WAIT1;
	LOAD2:	next_state = WAIT2;
	WAIT2:	if (lc)	next_state = LOAD3;
		else next_state = WAIT2;
	LOAD3:	next_state = WAIT3;
	WAIT3:	if (lc)	next_state = LOAD4;
		else next_state = WAIT3;
	LOAD4:	next_state = IDLE;
	STORE:	if (!dr) next_state = EIDLE;
		else next_state = ZERO;
	ZERO:	next_state = SORT1;
	SORT1:	next_state = SORT2;
	SORT2:	next_state = SORT3;
	SORT3:	next_state = SORT4;
	SORT4:	next_state = MUL1;
	MUL1:	next_state = ADD1;
	ADD1:  if (overflow) next_state = EIDLE;
	       else next_state = MUL2;
	MUL2: next_state = SUB1;
	SUB1: if (overflow) next_state = EIDLE;
	      else next_state = MUL3;
	MUL3: next_state = ADD2;
	ADD2:   if (overflow) next_state = EIDLE;
	        else next_state = MUL4;
	MUL4:	next_state = SUB2;
	SUB2:	if (overflow) next_state = EIDLE;
		else	next_state = IDLE;
	EIDLE: begin
	        // begin
		  if (dr)	next_state = STORE;
		  else next_state = EIDLE;
	        // end 
	    /*  begin
		if (lc)	next_state = LOAD1;
		else next_state = EIDLE;
	      end*/
	     end
      endcase
    end
    //output logic
    always_comb
    begin: OUTPUT
      cnt_up = 1'b0;
      clear = 1'b0;
      modwait = 1'b1;
      op = 3'b000;
      src1 = 4'b0000;
      src2 = 4'b0000;
      dest = 4'b0000;
      err = 1'b0;
      case(state)
	IDLE: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b0;
		op = 3'b000;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'b0000;
		err = 1'b0;
	      end
	LOAD1: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b1;
		op = 3'b011;
		src1 = 4'd0;
		src2 = 4'd0;
		dest = 4'd9;
		err = 1'b0;
	      end
	WAIT1: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b0;
		op = 3'b000;
		src1 = 4'd0;
		src2 = 4'd0;
		dest = 4'd0;
		err = 1'b0;
	      end
	LOAD2: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b1;
		op = 3'b011;
		src1 = 4'd0;
		src2 = 4'd0;
		dest = 4'd8;
		err = 1'b0;
	      end
	WAIT2: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b0;
		op = 3'b000;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'b0000;
		err = 1'b0;
	       end
	LOAD3: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b1;
		op = 3'b011;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'd7;
		err = 1'b0;
	       end
	WAIT3: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b0;
		op = 3'b000;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'b0000;
		err = 1'b0;
	       end
	LOAD4: begin
		cnt_up = 1'b0;
		clear = 1'b1;
		modwait = 1'b1;
		op = 3'b011;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'd6;
		err = 1'b0;
	       end
	STORE: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b010;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'd5;
		err = 1'b0;
	      end
	ZERO: begin
		cnt_up = 1'b1;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b101;
		src1 = 4'd5;
		src2 = 4'd5;
		dest = 4'b0000;
		err = 1'b0;
	      end
	SORT1: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b001;
		src1 = 4'd2;
		src2 = 4'b0000;
		dest = 4'd1;
		err = 1'b0;
	      end
	SORT2: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b001;
		src1 = 4'd3;
		src2 = 4'b0000;
		dest = 4'd2;
		err = 1'b0;
	      end
	SORT3: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b001;
		src1 = 4'd4;
		src2 = 4'b0000;
		dest = 4'd3;
		err = 1'b0;
	      end
	SORT4: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b001;
		src1 = 4'd5;
		src2 = 4'b0000;
		dest = 4'd4;
		err = 1'b0;
	      end
	MUL1: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b110;
		src1 = 4'd1;
		src2 = 4'd6;
		dest = 4'd10;
		err = 1'b0;
	      end
	ADD1: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b100;
		src1 = 4'd0;
		src2 = 4'd10;
		dest = 4'd0;
		err = 1'b0;
	      end
	MUL2: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b110;
		src1 = 4'd2;
		src2 = 4'd7;
		dest = 4'd10;
		err = 1'b0;
	      end
	SUB1: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b101;
		src1 = 4'd0;
		src2 = 4'd10;
		dest = 4'd0;
		err = 1'b0;
	      end
	MUL3: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b110;
		src1 = 4'd3;
		src2 = 4'd8;
		dest = 4'd10;
		err = 1'b0;
	      end
	ADD2: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b100;
		src1 = 4'd0;
		src2 = 4'd10;
		dest = 4'd0;
		err = 1'b0;
	      end
	MUL4: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b110;
		src1 = 4'd4;
		src2 = 4'd9;
		dest = 4'd10;
		err = 1'b0;
	      end
	SUB2: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b1;
		op = 3'b101;
		src1 = 4'd0;
		src2 = 4'd10;
		dest = 4'd0;
		err = 1'b0;
	      end
	EIDLE: begin
		cnt_up = 1'b0;
		clear = 1'b0;
		modwait = 1'b0;
		op = 3'b000;
		src1 = 4'b0000;
		src2 = 4'b0000;
		dest = 4'b0000;
		err = 1'b1;
	      end
		 
      endcase
    end



endmodule
