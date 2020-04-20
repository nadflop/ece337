// $Id: $
// File name:   ahb.sv
// Created:     4/15/2019
// Author:      Ray Yan
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: 4.1.1
module ahb
(
    input wire clk,
    input wire n_rst,

    input wire rx_error,
    input wire [3:0] rx_packet,
    input wire rx_data_ready,
    input wire rx_trans_active,
    input wire [6:0] buffer_occupancy,
    input wire [7:0] rx_data,
    input wire tx_trans_active,
    input wire tx_error,

    output reg tx_en, //set to 1 when writing to 0xC
    
    input wire hsel,
    input wire [3:0] haddr,
    input wire [1:0] hsize, //0 is one byte, 1 is two bytes, 2 is four bytes
    input wire [1:0] htrans,
    input wire hwrite,
    input wire [31:0] hwdata,

    output reg [31:0] hrdata,
    output reg hresp,
    output reg hready,

    output reg d_mode,
    output reg get_rx_data,
    output reg store_tx_data,
    output reg [7:0] tx_data,
    output reg clear,
    output reg [1:0] tx_packet
);

typedef enum bit [2:0] {IDLE, READ, WRITE, WAIT} stateType;
typedef enum bit [3:0] {STARTR, ONEBYTER, TWOB1R, TWOB2R, FOURB1R, FOURB2R, FOURB3R, FOURB4R} rbState;
typedef enum bit [3:0] {STARTW, ONEBYTEW, TWOB1W, TWOB2W, FOURB1W, FOURB2W, FOURB3W, FOURB4W} wbState;

rbState rstate;
rbState nextrstate;
wbState wstate;
wbState nextwstate;

reg [4:0] waitvar; //variable for controlling buffer
reg [1:0] prevhsize;
reg [3:0] prevhaddr;

stateType state;
stateType nextstate;
reg [14:0][7:0] storage;
reg [14:0][7:0] newstorage;
reg [1:0] signal; //0 is not buffer 1 is read 2 is write
always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
	prevhsize <= '0;
	prevhaddr <= '0;
	//hrdata <= '0;
        state <= IDLE;
        rstate <= STARTR;
        wstate <= STARTW;
        storage[0] <= '0; //data buffer
        storage[1] <= '0;
        storage[2] <= '0;
        storage[3] <= '0;
        storage[4] <= '0; // rx packet 0-4
        storage[5] <= '0; // rx tranfer 8 tx trans active 9
        storage[6] <= '0; // rx error 0
        storage[7] <= '0; // tx error 8
        storage[8] <= '0; //buffer occupancy
        storage[9] <= '0; //---
        storage[10] <= '0;
        storage[11] <= '0;
        storage[12] <= '0;//---
        storage[13] <= '0; //tx packet control reg 1/2/3/4
        storage[14] <= '0; //clear
    end
    else begin
	prevhsize <= hsize;
	prevhaddr <= haddr;
        state <= nextstate;
        storage <= newstorage;
        rstate <= nextrstate;
        wstate <= nextwstate;
    end
end

always_comb begin
    nextstate = state;
    case(state)
        IDLE: begin
            if (hsel) begin
                if (htrans == 2'b10) begin
                    if (hwrite) begin
			if (haddr == 4'd0 || haddr == 4'd1 || haddr == 4'd2 || haddr == 4'd3 || haddr == 4'd12 || haddr == 4'd13) begin
                        	nextstate = WRITE;
			end
			else begin
				nextstate = WAIT;
			end
                    end
                    else begin
			if (haddr == 4'd9 || haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd14 || haddr == 4'd15) begin
                        	nextstate = WAIT;
			end
			else begin
				nextstate = READ;
			end
                    end
                end
            end
        end
        READ: begin
            if (hsel) begin
                if (htrans == 2'b10) begin
                    if (hwrite) begin
			if (haddr == 4'd0 || haddr == 4'd1 || haddr == 4'd2 || haddr == 4'd3 || haddr == 4'd12 || haddr == 4'd13) begin
                        	nextstate = WRITE;
			end
			else begin
				nextstate = WAIT;
			end
                    end
                    else begin
			if (haddr == 4'd9 || haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd14 || haddr == 4'd15) begin
                        	nextstate = WAIT;
			end
			else begin
				nextstate = READ;
			end
                    end
                end
                if (htrans == 0) begin
                    nextstate = IDLE;
                end
            end
        end
        WRITE: begin
            if (hsel) begin
                if (htrans == 2'b10) begin
                    if (hwrite) begin
			if (haddr == 4'd0 || haddr == 4'd1 || haddr == 4'd2 || haddr == 4'd3 || haddr == 4'd12 || haddr == 4'd13) begin
                        	nextstate = WRITE;
			end
			else begin
				nextstate = WAIT;
			end
                    end
                    else begin
			if (haddr == 4'd9 || haddr == 4'd10 || haddr == 4'd11 || haddr == 4'd14 || haddr == 4'd15) begin
				nextstate = WAIT;
			end
			else begin
                        	nextstate = READ;
			end
                    end
                end
                if (htrans == 0) begin
                    nextstate = IDLE;
                end
            end

        end
	WAIT: begin
            if (hsel) begin
                if (htrans == 2'b10) begin
                    if (hwrite) begin
                        nextstate = WRITE;
                    end
                    else begin
                        nextstate = READ;
                    end
                end
                if (htrans == 0) begin
                    nextstate = IDLE;
                end
            end
	end

    endcase
end

always_comb begin
	    hrdata = 32'd0;
    //nextstate = state;
    newstorage = storage;
    newstorage[4][0] = rx_data_ready;
    newstorage[4][4:1] = '0;
	if (rx_packet == 4'b1001) begin
		newstorage[4][1] = 1;
	end
	else if (rx_packet == 4'b0001) begin
		newstorage[4][2] = 1;
	end
	else if (rx_packet == 4'b0010) begin
		newstorage[4][3] = 1;
	end
	else if (rx_packet == 4'b1010) begin
		newstorage[4][4] = 1;
	end
	//else if (rx_packet == 4'b0011 || rx_packet == 4'b1011) begin
	//	newstorage[5][0] = 1;
	//end 
    newstorage[5][0] = rx_trans_active;
    newstorage[5][1] = tx_trans_active;
    newstorage[6][0] = rx_error;
    newstorage[7][0] = tx_error;
    newstorage[8] = buffer_occupancy;
    waitvar = 0; //neutral no data buffer
    //nextrstate = rstate;
    //nextwstate = wstate;
    d_mode = 0; //if rx trans then 0 if tx trans then 1
    tx_en = 0;
    clear = 0;
    hresp = 0;
    hready = 0;
    tx_packet = newstorage[13][1:0];

    get_rx_data = 0;
    store_tx_data = 0;
    if (rx_trans_active) begin
        d_mode = 0;
        get_rx_data = 1;
    end
    if (tx_trans_active) begin
        d_mode = 1;
        store_tx_data = 1;
    end

    //tx_data = 0;
    case(state)
        IDLE: begin
		hresp = 1;
        end
        READ: begin
		hready = 1;
            if (haddr == 4'd0 || haddr == 4'd1 || haddr == 4'd2 || haddr == 4'd3) begin
                hrdata = {newstorage[3], newstorage[2], newstorage[1], newstorage[0]};

                if (prevhsize == 2'd0) begin
                    //nextrstate = ONEBYTER;
                    hrdata = {24'd0, newstorage[0]};
		    waitvar = 4'd1;
                end
                if (prevhsize == 2'd1) begin
                    //nextrstate = TWOB1R;
                    hrdata = {16'd0, newstorage[1], newstorage[0]};
		    waitvar = 4'd2;
                end
                if (prevhsize == 2'd2) begin
                    //nextrstate = FOURB1R;   
		    waitvar = 4'd3;         
                    hrdata = {newstorage[3], newstorage[2], newstorage[1], newstorage[0]};    
                end
            end
            else if (haddr == 4'd4 || haddr == 4'd5) begin
		if (prevhsize == 2'd1) begin
                	hrdata = {16'd0, newstorage[5], newstorage[4]};
		end
		else if (haddr == 4'd4 && prevhsize == 2'd0) begin
			hrdata = {24'd0, newstorage[4]};
		end
		else if (haddr == 4'd5 && prevhsize == 2'd0) begin
			hrdata = {16'd0, newstorage[5], 8'd0};
		end
            end
            else if (haddr == 4'd6 || haddr == 4'd7) begin
		if (prevhsize == 2'd1) begin
                	hrdata = {16'd0, newstorage[7], newstorage[6]};
		end
		else if (haddr == 4'd6 && prevhsize == 2'd0) begin
			hrdata = {24'd0, newstorage[6]};
		end
		else if (haddr == 4'd7 && prevhsize == 2'd0) begin
			hrdata = {16'd0, newstorage[7], 8'd0};
		end
            end
            else if (haddr == 4'd8) begin
                hrdata = {24'd0, newstorage[8]};
            end
            else if (haddr == 4'd13) begin
                //tx_packet = newstorage[13][1:0];
                hrdata = {16'd0, newstorage[13], 8'd0};
            end
            else if (haddr == 4'd14) begin
                clear = newstorage[14][0];
                hrdata = {24'd0, newstorage[14]};
            end
	    else begin
		hresp = 1;
	    end
        end
        WRITE: begin
		hready = 1;
            if (haddr == 4'd0 || haddr == 4'd1 || haddr == 4'd2 || haddr == 4'd3) begin
                if (prevhsize == 2'd0) begin
                    //nextwstate = ONEBYTEW;
		    waitvar = 4'd4;
                    newstorage[0] = hwdata[7:0];
                end
                if (prevhsize == 2'd1) begin
                    //extwstate = TWOB1W;
		    waitvar = 4'd5;
                    newstorage[0] = hwdata[7:0];
	 	    newstorage[1] = hwdata[15:8];
                end
                if (prevhsize == 2'd2) begin
                    //nextwstate = FOURB1W;
		    waitvar = 4'd6;
                    newstorage[3:0] = hwdata;
                end
            end
            else if (haddr == 4'd4 || haddr == 4'd5 || haddr == 4'd6 || haddr == 4'd7 || haddr == 4'd8) begin
                hresp = 1;
                hready = 0;
            end
            else if (haddr == 4'd13) begin
                newstorage[13] = hwdata[7:0];
                tx_en = 1;
            end
            else if (haddr == 4'd14) begin
                newstorage[14] = hwdata[7:0];
            end
	    else begin
		hresp = 1;
		hready = 0;
	    end

        end
	WAIT: begin
		hresp = 1;
		hready = 0;
	end

    endcase

end
/*
typedef enum bit [4:0] {STARTR, ONEBYTER, TWOB1R, TWOB2R, FOURB1R, FOURB2R, FOURB3R, FOURB4R} rbState;
typedef enum bit [4:0] {STARTW, ONEBYTEW, TWOB1W, TWOB2W, FOURB1W, FOURB2W, FOURB3W, FOURB4W} wbState;
*/

//get other signals from rx and tx

always_comb begin
	nextrstate = rstate;
	//nextwstate = wstate;
    case(rstate)
        STARTR: begin
		if (waitvar == 1) begin
			nextrstate = ONEBYTER;
		end
		if (waitvar == 2) begin
			nextrstate = TWOB1R;
		end
		if (waitvar == 3) begin
			nextrstate = FOURB1R;
		end

        end
        ONEBYTER: begin
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
            nextrstate = STARTR;
        end
        TWOB1R: begin
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
            nextrstate = TWOB2R;
        end
        TWOB2R: begin
            nextrstate = STARTR;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB1R: begin
            nextrstate = FOURB2R;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB2R: begin
            nextrstate = FOURB3R;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB3R: begin
            nextrstate = FOURB4R;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB4R: begin
            nextrstate = STARTR;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
    endcase
end

always_comb begin
    tx_data = 0;
    nextwstate = wstate;
    case(wstate)
        STARTW: begin
            if (waitvar == 4'd4) begin
		nextwstate = ONEBYTEW;
	    end
	    if (waitvar == 4'd5) begin
		nextwstate = TWOB1W;
	    end
	    if (waitvar == 4'd6) begin
		nextwstate = FOURB1W;
	    end
        end
        ONEBYTEW: begin
            nextwstate = STARTW;
            tx_data = storage[0];
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        TWOB1W: begin
            nextwstate = TWOB2W;
            tx_data = storage[0];
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        TWOB2W: begin
            tx_data = storage[1];
            nextwstate = STARTW;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB1W: begin
            tx_data = storage[0];
            nextwstate = FOURB2W;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB2W: begin
            tx_data = storage[1];
            nextwstate = FOURB3W;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB3W: begin
            tx_data = storage[2];
            nextwstate = FOURB4W;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
        FOURB4W: begin
            tx_data = storage[3];
            nextwstate = STARTW;
            //databuffer data(.clk(), .n_rst(), .store_rx_packet(), .store_tx_data(), .get_rx_data(), .get_tx_packet(), .rx_packet_data(), .tx_data(), .flush(), .clear(), .tx_packet_data(), .rx_data(), .buffer_occupancy());
        end
    endcase
end


endmodule

