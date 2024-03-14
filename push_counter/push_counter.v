`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:44 04/14/2017 
// Design Name: 
// Module Name:    enhance_2 
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
module push_counter( clk, rst,sun,seven  ,pus );
	input clk;	
	input pus;
	input rst;
	output reg [3:0]sun;
	output  [7:0]seven;		
	reg [28:0] cn, cn2;
	reg [3:0]a,b;
	reg [4:0]opr;
	reg o,z,p,sclk,p_p;
	
	
	
	test a2(clk, p ,f);
	////show the word
	decoderrrrr a1(opr, seven);
	////
	always @(posedge clk )begin    ///devieder make the 0.8s and made a plus one
		o <= pus;
		z <= o;
		sclk <= o^z;
		
	end 

	always @(posedge sclk )begin    ///devieder make the 0.8s and made a plus one
		p <= ~p;

		
	end 
	
	always @(posedge p or posedge rst)begin    ///devieder make the 0.8s and made a plus one	
		if(rst)begin
			a <= 0;
			b <= 0;
		end
		else begin
			if((a == 6  && b ==1))begin
				a <= 0;
				b <= 0;
			end 

			else begin
				if(a < 9 ) begin
					a <= a + 1;
				end 
				
				else	begin
					b <= b + 1;
					a <= 0; 
				end
			end
		end
	end 
	

		
	always @(posedge clk )begin 		//devider make the 0.016s/60Hz shining signal "sta"
		
		
	
		
		if (cn2 < 200000)begin 
				cn2 <= cn2 +1;
				//
				
				sun <= 4'b 1110;
				opr <= a;//neg of sta make sun as 1101 and show the charactor b 
				
				
				//
		end 
		else if 	(cn2> 199999 & cn2< 400000)	begin
				cn2 <= cn2 +1;
				//
				
				sun <= 4'b 1101;
				opr <= b;//pos of sta make sun as 1101 and show the charactor b 
				
				//
		end 
		else if (cn2 > 399999 ) begin
				cn2 <= 0;
				
		end 
		
	end 
	

	
endmodule


module decoderrrrr(data, out);
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
			4'hB : out = {1'b1,7'b0000011};
			4'hC : out = {1'b1,7'b1000110};
			4'hD : out = {1'b1,7'b0100001};
			4'hE : out = {1'b1,7'b0000110};
			4'hF : out = {1'b1,7'b0001110};
			
		endcase
	


endmodule

