`timescale 1ns / 1ps
module display3_top(clk, rst, enter, dataIn, sevenSeg, anode, dataLed);

input clk, rst, enter;
input [3:0] dataIn;
output [3:0] anode;
output [3:0] dataLed;
output [7:0] sevenSeg;

wire enterDB;
wire [19:0] dataOut;

debounce mydb(.clk(clk), .rst(rst), .noisy(enter), .clean(enterDB));
SevenSegFourDigwithEnable mySSFDwE(.clk(clk), .rst(rst), .in(dataOut), .sevenSeg(sevenSeg), .anode(anode));
rotatingDigits2 myRD2(.clk(clk), .rst(rst), .vld(enterDB), .dataIn(dataIn), .dataOut(dataOut), .dataLed(dataLed));

endmodule
