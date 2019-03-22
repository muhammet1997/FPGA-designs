`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:11 11/08/2018 
// Design Name: 
// Module Name:    display2 
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
module display2(clk, rst, dataIn, anode, sevenSeg);
	input clk, rst;
	input [7:0] dataIn;
	output [3:0] anode;
	output [7:0] sevenSeg;
	wire [27:0] outWithSpaces;
	
	rotatingDigits myRD(.dataIn(dataIn), .clk(clk), .rst(rst), .dataOut(outWithSpaces));
	
	SevenSegFourDig mySSFD(.clk(clk), .rst(rst), .in(outWithSpaces), .sevenSeg(sevenSeg), .anode(anode));


endmodule
