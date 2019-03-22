`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:59 10/22/2018 
// Design Name: 
// Module Name:    display1 
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
module display1(clk, rst, dataIn, anode, sevenSeg);
	input clk, rst;
	input [7:0] dataIn;
	output [3:0] anode;
	output [7:0] sevenSeg;
	reg [15:0] temp;

	SevenSegFourDig myMod(.clk(clk), .rst(rst), .in(temp), .sevenSeg(sevenSeg), .anode(anode));
	
	always @(*) begin
		temp [3:0] = {2'b00,dataIn[1:0]};
		temp [7:4] = {2'b00,dataIn[3:2]};
		temp [11:8] = {2'b00,dataIn[5:4]};
		temp [15:12] = {2'b00,dataIn[7:6]};
	end

endmodule
