`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:25 05/26/2017 
// Design Name: 
// Module Name:    road 
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
module road( clk, rst , sign , sun, seven  );
	input clk, rst;
	output reg [2:0]sign;//traffic light 
	output reg [3:0]sun;
	output  [7:0]seven;
	reg wv_s,z;
	reg [25:0] cn1,cn2;
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
	reg [1:0] p_s, n_s;	reg	[3:0] sh0,sh1,opr;
	reg [1:0]x;
	
	decoder b1(opr, seven);
	
	always @(posedge clk or posedge rst) begin
		if (rst)begin 
			p_s <= S0;
		end 
		else p_s <= n_s;
	end

	always @(p_s or x) begin
		case (p_s)
			S0: begin 
				if (x == 2'b01) begin 
					n_s <= S1;
					sign <= 3'b010;
				end
				else begin 
					n_s <= S0;
					sign <= 3'b001; 
				end
			end
			
			S1: begin 
				if (x == 2'b10) begin 
					n_s <= S2;
					sign <= 3'b100; 
				end
				else begin 
					n_s <= S1;
					sign <= 3'b010; 
				end
			end
			
			S2: begin 
				if (x == 2'b11) begin 
					n_s <= S0;
					sign <= 3'b001; 
				end
				else begin 
					n_s <= S2;
					sign <= 3'b100; 
				end
			end
		endcase
	end
	always @(posedge wv_s or posedge rst) begin
		if(rst)begin
			sh1<=1;
			sh0<=0;
			x<=0;
			z<=0;	
		end
		else begin
			if(p_s == S0)begin   //green light
				if(sh1 == 0 && sh0 == 0 && z ==0)begin	
					sh1 <= 4'b0001;
					z <= 1;
				end
				else if (sh1 == 4'b0001 && sh0 == 0)begin
					sh1 <= 0 ;
					sh0 <= 4'b1001 ;
					z <= 1;
				end		
				else if (sh0 > 0) begin
					sh0 <= sh0 - 1'b1;
					z <= 1;
				end
				else begin
					x <= 2'b01;
					z <= 0;
				end
			end
			if(p_s == S1)begin   //yellow light
				if (sh1 == 0 && sh0 == 0 && z==0)begin
					sh0 <= 1;
					z <= 1;
				end		
				else if (sh0 > 0) begin
					sh0 <= sh0 - 1;
					z <=1;
				end
				else begin
					x <= 2'b10;
					z <= 0;
				end
			end
			
			if(p_s == S2)begin   //red light
				if(sh1 == 0 && sh0 == 0 && z==0)begin
					sh1 <= 1;
					z <=1;
				end
				else if (sh1 == 1 && sh0 == 0)begin
					sh1 <= 0 ;
					sh0 <= 8 ;	
					z <= 1;
				end		
				else if (sh0 > 0) begin
					sh0 <= sh0 - 1;
					z <= 1;
				end
				else begin
					x <= 2'b11;
					sh1<=1;
					sh0<=0;
					z <= 0;
				end
			end
			
		end	
		
	end
	
////////////////////////////////////////////////////////////////////	
	always @(posedge clk )begin    //make the 1s   waveform 
	
		if (cn1 < 1)begin 
				
			cn1 <= cn1 + 1;
			wv_s <= 1;
		end 
		else if (cn1 < 50000000   &   cn1 > 0)begin
			cn1 <= cn1+1;
			wv_s <= 0;
		end 
		
		else   begin
			cn1 <= 0;
			wv_s <=0;		
		end
	end 
//////////////////////////////////////////////////////////////////////
	always @(posedge clk )begin 	//devider make the 20000*20ns  shine a character
		if(sign == 3'b001)begin
			if (cn2 < 20000)begin 
					cn2 <= cn2 +1;
					//	
					sun <= 4'b 1110;
					opr <= sh0;
					//
			end 
			else if (cn2> 19999 & cn2< 40000)	begin
					cn2 <= cn2 +1;
					//
					sun <= 4'b 1101;
					opr <= sh1;
					//
			end 	
			else		cn2 <= 0;
		
		end
		
		
		else sun<= 4'b 1111;
	end 

endmodule
