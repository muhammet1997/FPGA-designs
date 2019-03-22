`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:19 11/01/2018 
// Design Name: 
// Module Name:    rotatingDots 
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
module rotatingDigits(dataIn, clk, rst, dataOut);
	input [7:0] dataIn;
	input clk, rst;
	output reg [27:0] dataOut;
	reg [15:0] temp;
	reg [27:0] dataOutNext;
	reg [23:0] counter, counterNext;
	
	always @(posedge clk) begin
		dataOut <= #1 dataOutNext;
		counter <= #1 counterNext;
	end
	
	always @(*) begin
		temp [3:0]={2'b00,dataIn[1:0]};
		temp [7:4]={2'b00,dataIn[3:2]};
		temp [11:8]={2'b00,dataIn[5:4]};
		temp [15:12]={2'b00,dataIn[7:6]};
	end
	
	always @(*) begin
		counterNext=counter;
		dataOutNext=dataOut;
		if(rst) begin
			counterNext=0;
			dataOutNext={temp [15:0], 4'b0100, 4'b0100, 4'b0100};
		end else begin
			if (counter==24'b111111111111111111111111) begin
				dataOutNext={dataOut[3:0], dataOut[27:4]};
				counterNext=0;
			end else begin
				dataOutNext=dataOut;
				counterNext=counter+1;
			end
		end
	end
	
endmodule