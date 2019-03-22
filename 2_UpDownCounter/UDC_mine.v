`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:47 10/08/2018 
// Design Name: 
// Module Name:    UDC_mine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UDC_mine(upDown, clk, rst, sevenSegment, anode );
	input upDown,rst,clk;
	output reg [8:0] sevenSegment;
	output reg [4:0] anode;
	reg [4:0] counter, counterNext;
	reg [25:0] scale, scaleNext;
	
	always @(posedge clk) begin
		counter <= #1 counterNext;
		scale <= #1 scaleNext;
	end
	
	always@(*)begin
	counterNext=counter;
	anode = 4'b0111;
	if(rst) begin
		scaleNext=0;
		counterNext = 0;
		sevenSegment=8'b10011111;
	end
	else begin
		if (scale==10000000) begin
			if(upDown) begin
				if (counter==9) begin
					counterNext=0;
				end
				else begin
					counterNext=counter+1;
				end
			end
			else  begin
				if (counter==0) begin
					counterNext=9;
				end
				else begin
					counterNext=counter-1;
				end
			end
			scaleNext=0;
		end
		else begin
			scaleNext=scale+1;
		end
			if (counter==0) begin
				sevenSegment=8'b00001000;
			end
			else if (counter==1) begin
				sevenSegment=8'b00000000;
			end
			else if (counter==2) begin
				sevenSegment=8'b00011110;
			end
			else if (counter==3) begin
				sevenSegment=8'b01000000;
			end
			else if (counter==4) begin
				sevenSegment=8'b01001000;
			end
			else if (counter==5) begin
				sevenSegment=8'b10011000;
			end
			else if (counter==6) begin
				sevenSegment=8'b00001100;
			end
			else if (counter==7) begin
				sevenSegment=8'b00100100;
			end
			else if (counter==8) begin
				sevenSegment=8'b10011110;
			end
			else if (counter==9) begin
				sevenSegment=8'b00000010;
			end
			else begin
				sevenSegment=8'b00100100;
			end
		end
	end
endmodule
