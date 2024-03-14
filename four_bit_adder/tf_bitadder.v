`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:19:42 03/17/2017
// Design Name:   bitadder
// Module Name:   C:/Youhen/four_bit_adder/tf_bitadder.v
// Project Name:  four_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bitadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_bitadder;

	// Inputs
	reg [3:0] in_1;
	reg [3:0] in_2;
	reg C0;

	// Outputs
	wire [3:0] sol;
	wire C4;

	// Instantiate the Unit Under Test (UUT)
	bitadder uut (
		.in_1(in_1), 
		.in_2(in_2), 
		.C0(C0), 
		.sol(sol), 
		.C4(C4)
	);

	initial begin
		// Initialize Inputs
		
		
		
		#100
		in_1 =2;
		in_2 =3;
		C0 = 1;
		
		#100
		in_1 = 6;
		in_2 = 12;
		C0 = 0;
			

        
		// Add stimulus here

	end
      
endmodule

