`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:39 03/24/2017 
// Design Name: 
// Module Name:    adder_2bit 
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
module adder_2bit(a,b,ci,s,co    );

	input [1:0]a,b;
	input ci;
	
	output [1:0]s;
	output co;
	wire x;
	
	adder a1 (a[0],b[0],ci,s[0],x);
	adder a2 (a[1],b[1],x,s[1],co);

	

endmodule

	
module adder( x,y,z,s,c    );
	input x ,y, z;
	output s,c;


	assign  s =x^y^z;
	assign  c =(x&y) | (y&z) | (x&z);


endmodule
