`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:55 03/24/2017
// Design Name:   adder_2bit
// Module Name:   C:/Youhen/adder_2bit/tb_adder_2bit.v
// Project Name:  adder_2bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder_2bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_adder_2bit;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;
	reg ci;

	// Outputs
	wire [1:0] s;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	adder_2bit uut (
		.a(a), 
		.b(b), 
		.ci(ci), 
		.s(s), 
		.co(co)
	);
	integer i ,j;
	initial begin
		// Initialize Inputs
		/*for (i = 0 ;i<=3;i=i+1)
		for (j = 0;j<=3;j=j+1)begin
		
		
	
		// Wait 100 ns for global reset to finish
		#100;*/
        
		// Add stimulus here

	end
      
endmodule

