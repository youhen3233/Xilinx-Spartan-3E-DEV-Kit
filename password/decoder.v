`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:57 06/02/2017 
// Design Name: 
// Module Name:    decoder 
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
module decoder(data, out);
	input [3:0]data ;
	output [7:0]out ;
	
	reg out;
	
	always@(data)
		case (data )
			4'h0 : out = {1'b1,7'b1000000};
			4'h1 : out = {1'b1,7'b1111001};
			4'h2 : out = {1'b1,7'b0100100};
			4'h3 : out = {1'b1,7'b0110000};
			4'h4 : out = {1'b1,7'b0011001};
			4'h5 : out = {1'b1,7'b0010010};
			4'h6 : out = {1'b1,7'b0000010};
			4'h7 : out = {1'b1,7'b1111000};
			4'h8 : out = {1'b1,7'b0000000};
			4'h9 : out = {1'b1,7'b0011000};
			4'hA : out = {1'b1,7'b0001000};
			4'hB : out = {1'b1,7'b0101111};		///11 turned to r
			4'hC : out = {1'b1,7'b0001100};		///12 turned to P
			4'hD : out = {1'b1,7'b0100001};
			4'hE : out = {1'b1,7'b0000110};
			4'hF : out = {1'b1,7'b0001110};
			
		endcase

endmodule
