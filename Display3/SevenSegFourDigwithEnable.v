`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:29 11/08/2018 
// Design Name: 
// Module Name:    SevenSegFourDigwithEnable 
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
module SevenSegFourDigwithEnable(clk, rst, in, sevenSeg, anode);
	input rst, clk;
  input [19:0] in;
  output reg [7:0] sevenSeg;
  output reg [3:0] anode;
  reg [15:0] counter, counterNext;
  
  always @(posedge clk) begin
    counter <= #1 counterNext;
  end
  
  always @(*) begin
    sevenSeg = 8'b00000010;
	 anode=4'b0111;
	 counterNext=counter;
    if (rst) begin
      counterNext=0;
	 end else begin
		case (counter [15:14])
			0: begin
				case(in[19:16])
					0: anode=4'b1110;
					1: anode=4'b1101;
					2: anode=4'b1011;
					3: anode=4'b0111;
					4: anode=4'b1111;
					5: anode=4'b1111;
					6: anode=4'b1111;
					7: anode=4'b1111;
				endcase
				case(in[3:0])
					0: sevenSeg = 8'b00000010;  //0
					1: sevenSeg = 8'b10011110;  //1
					2: sevenSeg = 8'b00100100;  //2
					3: sevenSeg = 8'b00001100;  //3
					4: sevenSeg = 8'b10011000;  //4
					5: sevenSeg = 8'b01001000;  //5
					6: sevenSeg = 8'b01000000;  //6
					7: sevenSeg = 8'b00011110;  //7
					8: sevenSeg = 8'b00000000;  //8
					9: sevenSeg = 8'b00001000;  //9
					10: sevenSeg = 8'b00010000; //A
					11: sevenSeg = 8'b11000000; //b
					12: sevenSeg = 8'b01100010; //C
					13: sevenSeg = 8'b10000100; //d
					14: sevenSeg = 8'b01100000; //e
					15: sevenSeg = 8'b01110000; //f
				endcase 
			end
			1: begin
				case(in[19:16])
					0: anode=4'b1101;
					1: anode=4'b1011;
					2: anode=4'b0111;
					3: anode=4'b1111;
					4: anode=4'b1111;
					5: anode=4'b1111;
					6: anode=4'b1111;
					7: anode=4'b1110;
				endcase
				case(in[7:4])
					0: sevenSeg = 8'b00000010;  //0
					1: sevenSeg = 8'b10011110;  //1
					2: sevenSeg = 8'b00100100;  //2
					3: sevenSeg = 8'b00001100;  //3
					4: sevenSeg = 8'b10011000;  //4
					5: sevenSeg = 8'b01001000;  //5
					6: sevenSeg = 8'b01000000;  //6
					7: sevenSeg = 8'b00011110;  //7
					8: sevenSeg = 8'b00000000;  //8
					9: sevenSeg = 8'b00001000;  //9
					10: sevenSeg = 8'b00010000; //A
					11: sevenSeg = 8'b11000000; //b
					12: sevenSeg = 8'b01100010; //C
					13: sevenSeg = 8'b10000100; //d
					14: sevenSeg = 8'b01100000; //e
					15: sevenSeg = 8'b01110000; //f
				endcase
			end
			2: begin
				case(in[19:16])
					0: anode=4'b1011;
					1: anode=4'b0111;
					2: anode=4'b1111;
					3: anode=4'b0111;
					4: anode=4'b1111;
					5: anode=4'b1111;
					6: anode=4'b1110;
					7: anode=4'b1101;
				endcase
				case(in[11:8])
					0: sevenSeg = 8'b00000010;  //0
					1: sevenSeg = 8'b10011110;  //1
					2: sevenSeg = 8'b00100100;  //2
					3: sevenSeg = 8'b00001100;  //3
					4: sevenSeg = 8'b10011000;  //4
					5: sevenSeg = 8'b01001000;  //5
					6: sevenSeg = 8'b01000000;  //6
					7: sevenSeg = 8'b00011110;  //7
					8: sevenSeg = 8'b00000000;  //8
					9: sevenSeg = 8'b00001000;  //9
					10: sevenSeg = 8'b00010000; //A
					11: sevenSeg = 8'b11000000; //b
					12: sevenSeg = 8'b01100010; //C
					13: sevenSeg = 8'b10000100; //d
					14: sevenSeg = 8'b01100000; //e
					15: sevenSeg = 8'b01110000; //f
				endcase
			end
			3: begin
				case(in[19:16])
					0: anode=4'b0111;
					1: anode=4'b1111;
					2: anode=4'b1111;
					3: anode=4'b1111;
					4: anode=4'b1111;
					5: anode=4'b1110;
					6: anode=4'b1101;
					7: anode=4'b1011;
				endcase
				case(in[15:12])
					0: sevenSeg = 8'b00000010;  //0
					1: sevenSeg = 8'b10011110;  //1
					2: sevenSeg = 8'b00100100;  //2
					3: sevenSeg = 8'b00001100;  //3
					4: sevenSeg = 8'b10011000;  //4
					5: sevenSeg = 8'b01001000;  //5
					6: sevenSeg = 8'b01000000;  //6
					7: sevenSeg = 8'b00011110;  //7
					8: sevenSeg = 8'b00000000;  //8
					9: sevenSeg = 8'b00001000;  //9
					10: sevenSeg = 8'b00010000; //A
					11: sevenSeg = 8'b11000000; //b
					12: sevenSeg = 8'b01100010; //C
					13: sevenSeg = 8'b10000100; //d
					14: sevenSeg = 8'b01100000; //e
					15: sevenSeg = 8'b01110000; //f
				endcase
			end
		endcase
			if (counter == 16'b1111111111111111) begin
				counterNext = 0;
			end else begin
				counterNext = counter+1;
			end
		end
	end
	
endmodule
