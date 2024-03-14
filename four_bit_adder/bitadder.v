`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:39 03/10/2017 
// Design Name: 
// Module Name:    bitadder 
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
module adder( x,y,z,s,c    );
	input x ,y, z;
	output s,c;


	assign #20 s =x^y^z;
	assign #30 c =(x&y) | (y&z) | (x&z);


endmodule

module bitadder(in_1, in_2, C0 ,sol ,C4  );
	
	input [3:0]in_1;
	input [3:0]in_2;
	input C0;

	
	output [3:0]sol;
	output C4;
	//output C1
	
	wire C1,C2,C3;
	
	
	
	adder  a1(in_1[0],in_2[0],C0,sol[0],C1);
	adder  a2(in_1[1],in_2[1],C1,sol[1],C2);
	adder  a3(in_1[2],in_2[2],C2,sol[2],C3);
	adder  a4(in_1[3],in_2[3],C3,sol[3],C4);
	

endmodule
/*
module multiplier(mi1,mi2 ,P);
	input [3:0]mi1,mi2;
	output [7:0]P;
	wire [3:0]ad1,ad2,ad3;
	wire cou1,cou2,cou3;
	
	assign #10  P[0] = mi1[0]*mi2[0];	
	
	bitadder a1({0,mi2[0]*mi1[2:0]},mi2[1]*mi1[3:0],0,ad1,cou1);
	assign #10 P[1] = ad1[0];
	
	bitadder a2({cou1,ad1[3:1]},mi2[2]*mi1[3:0],0,ad2,cou2);
	assign #10 P[2] = ad2[0];
	
	bitadder a3({cou2,ad2[3:1]},mi2[3]*mi1[3:0],0,ad3,cou3);
	assign #10 P[6:3] = ad3;
	assign #10 P[7]  = cou3;


endmodule
*/
