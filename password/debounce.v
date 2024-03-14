`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:24 06/02/2017 
// Design Name: 
// Module Name:    debounce 
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
module debounce(clk  ,ip , op  );
	input ip,clk;
	output reg op;
	reg o,z,p;
	
	 

	always @(posedge clk )begin   //debouncer of every push and release of md
		o <= ip;
		z <= o;
		p <= o^z;
		
	end 

	always @(posedge p )begin    //make the debounce "push-release"to 1 movement
		op <= ~op;
		
		
	end 


endmodule
