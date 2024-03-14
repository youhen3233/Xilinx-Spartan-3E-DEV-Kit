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
module enhance_3( clk, rst,sun,seven   );
	input clk;	
	input rst;
	output reg [3:0]sun;
	output  [7:0]seven;		
	reg [28:0] cn, cn2;
	reg [3:0]a,b,c;
	reg [4:0]opr;
	reg w_a,w_b,w_c;
	decoderrrrr a1(opr, seven);
	
	always @(posedge clk )begin    ///devider make the 0.8s and made a plus one
		
		if (cn < 4000000)    
			begin 
				cn <= cn +1;
			end 
		else if (cn > 3999999) 
			begin
				cn <= 0;
				if(rst == 0)begin
						if(a < 9) begin
							a <= a + 1;
							w_a <= 1;
						end
						else begin						
							a <= 0 ;	
							if(b < 9)  begin
								b <= b + 1;
								w_b <= 1;
							end
							else  begin   
								b <= 0 ;
								if(c < 9) begin
									c <= c + 1;
									w_c <= 1;
								end
								else begin   
									c <= 0;
									w_a <= 0;
									w_b <= 0;
									w_c <= 0;
								end 
							end
						end 
							
				end 
				else	begin
					a <= 0;
					b <= 0;
					c <= 0;
					w_a <= 0;
					w_b <= 0;
					w_c <= 0;
				end
			end 
	end 
	
	
	
	
	always @(posedge clk )begin 		//devider make the 0.016s/60Hz shining signal "sta"
		
		if (cn2 < 200000)
			begin 
				cn2 <= cn2 +1;
				//
				if(w_a == 1)begin
					sun <= 4'b 1110;
					opr <= a;//neg of sta make sun as 1101 and show the charactor b 
				end
				else
					sun <= 4'b 1111;
				//
			end 
		else if 	(cn2> 199999 & cn2< 400000)
			begin
				cn2 <= cn2 +1;
				//
				if(w_b == 1)begin
				sun <= 4'b 1101;
				opr <= b;//pos of sta make sun as 1101 and show the charactor b 
				end
				else 
					sun <= 4'b 1111;
				//
			end 
		else if (cn2 > 399999 & cn2 <600000) 
			begin
				cn2 <= cn2+1;
				//
				if(w_c == 1)begin
				sun <= 4'b 1011;
				opr <= c;//pos of sta make sun as 1101 and show the charactor b 
				end
				else 
					sun <= 4'b 1111;
				//
			end 
		else if (cn2 > 599999)		cn2 <= 0;
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

