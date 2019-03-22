`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:22 11/08/2018 
// Design Name: 
// Module Name:    rotatingDigits2 
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
module rotatingDigits2(clk, rst, vld, dataIn, dataOut, dataLed);
	input clk, rst, vld;
	input [3:0] dataIn;
	output reg [19:0] dataOut;
	output reg [3:0] dataLed;
	reg [1:0] stateGN, stateGNNext;
	reg flag, flagNext;
	reg [23:0] counter, counterNext;
	reg [2:0] stateRot, stateRotNext;
	reg [19:0] dataOutNext;
	reg [3:0] dataLedNext;
	
	always @(posedge clk) begin
		stateGN <= #1 stateGNNext;
		flag <= #1 flagNext;
		counter <= #1 counterNext;
		stateRot <= #1 stateRotNext;
		dataOut <= #1 dataOutNext;
		dataLed <= #1 dataLedNext;
	end
	
	always @(*) begin
		flagNext=flag;
		stateGNNext=stateGN;
		counterNext=counter;
		stateRotNext=stateRot;
		dataOutNext=dataOut;
		dataLedNext=dataLed;
		if(rst) begin
			flagNext=0;
			stateGNNext=0;
			counterNext=0;
			stateRotNext=0;
			dataOutNext=20'b00000000000000000000;
			dataLedNext=4'b0000;
		end else begin
			if(flag==0) begin
				case(stateGN)
					0:begin
						if(vld) begin
							dataOutNext ={dataOut[19:4],dataIn [3:0]};
							dataLedNext [3:0]=dataIn [3:0];
							stateGNNext=1;
						end else begin
							dataOutNext=dataOut;
							dataLedNext=dataLed;
							stateGNNext=0;
						end
					end
					1: begin
						if(vld) begin
							dataOutNext ={dataOut[19:8],dataIn[3:0],dataOut[3:0]};
							dataLedNext [3:0]=dataIn [3:0];
							stateGNNext=2;
						end else begin
							dataOutNext=dataOut;
							dataLedNext=dataLed;
							stateGNNext=1;
						end
					end
					2: begin
						if(vld) begin
							dataOutNext ={dataOut[19:12],dataIn [3:0],dataOut[7:0]};
							dataLedNext [3:0]=dataIn [3:0];
							stateGNNext=3;
						end else begin
							dataOutNext=dataOut;
							dataLedNext=dataLed;
							stateGNNext=2;
						end
					end
					3: begin
						if(vld) begin
							dataOutNext [15:12]={dataOut[19:16],dataIn [3:0],dataOut[12:0]};
							dataLedNext [3:0]=dataIn [3:0];
							stateGNNext=0;
							flagNext=1;
						end else begin
							dataOutNext=dataOut;
							dataLedNext=dataLed;
							stateGNNext=3;
						end
					end
				endcase
			end else begin
				if(counter==24'b111111111111111111111111) begin
					counterNext=0;
					dataOutNext =dataOut;
					case (stateRot)
						0: begin
							dataOutNext [19:16]=4'b0000;
							stateRotNext=1;
						end
						1: begin
							dataOutNext [19:16]=4'b0001;
							stateRotNext=2;
						end
						2: begin
							dataOutNext [19:16]=4'b0010;
							stateRotNext=3;
						end
						3: begin
							dataOutNext [19:16]=4'b0011;
							stateRotNext=4;
						end
						4: begin
							dataOutNext =dataOut;
							dataOutNext [19:16]=4'b0100;
							stateRotNext=5;
						end
						5: begin
							dataOutNext [19:16]=4'b0101;
							stateRotNext=6;
						end
						6: begin
							dataOutNext [19:16]=4'b0110;
							stateRotNext=7;
						end
						7: begin
							dataOutNext [19:16]=4'b0111;
							stateRotNext=0;
						end
					endcase
				end else begin
					counterNext=counter+1;
				end
			end
		end
	end
	


endmodule
