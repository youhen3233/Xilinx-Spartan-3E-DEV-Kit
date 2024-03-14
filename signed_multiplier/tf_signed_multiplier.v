`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:56 03/17/2017
// Design Name:   signed_multiplier
// Module Name:   C:/Youhen/signed_multiplier/tf_signed_multiplier.v
// Project Name:  signed_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signed_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_signed_multiplier;

	// Inputs
	reg [4:0] mi1;
	reg [4:0] mi2;

	// Outputs
	wire [8:0] P;

	// Instantiate the Unit Under Test (UUT)
	signed_multiplier uut (
		.mi1(mi1), 
		.mi2(mi2), 
		.P(P)
	);
	integer i,j;
	initial begin
		// Initialize Inputs
		for (i = 0; i <= 15; i=i+1)
		for (j = 0; j <= 15; j=j+1)begin
		
		#20
		mi1 = 16+i;
		mi2 = j;
		
		
		// Wait 100 ns for global reset to finish
		end
        
		// Add stimulus here

	end
      
endmodule

