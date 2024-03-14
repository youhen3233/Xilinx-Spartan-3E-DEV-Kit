`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:15:46 02/24/2017
// Design Name:   and_gate
// Module Name:   C:/Youhen/and_gate/tb_and_gate.v
// Project Name:  and_gate
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: and_gate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_and_gate;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire F;

	// Instantiate the Unit Under Test (UUT)
	and_gate uut (
		.A(A), 
		.B(B), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 0;
		B = 1;
		#100;
		
		A = 1;
		B = 0;
		#100;
		
		A = 1;
		B = 1;
		#100;

		A = 0;
		B = 0;
		#100;

	end
      
endmodule

