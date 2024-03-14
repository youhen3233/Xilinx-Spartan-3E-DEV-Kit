`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:16 06/02/2017 
// Design Name: 
// Module Name:    password 
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
module password(	clk, enh , ofl , setting  , ent ,sun,seven    );
	input clk,enh,ofl,ent,setting;
	output reg [3:0]sun;
	output  [7:0]seven;
	reg [25:0]cn2,cn1;	
	reg wv_s;
	reg [3:0]sh0,sh1,sh2,sh3;
	reg	[3:0]va0,va1,va2,va3;
	reg enho,oflo,ento;
	reg [3:0]p3,p2,p1,p0;
	reg [1:0]bitchoose,bitchoose2;
	reg [3:0]opr;
	
	
	reg o,z,p ,ot,zt,pt;
	
	
	
	decoder a1 (opr,seven);
 


	always@(posedge oflo)begin
		if(setting ==1) begin
			if(bitchoose2 < 3)		bitchoose2 <= bitchoose2 +1;
			else bitchoose2 <= 0;	
		end
		else if(ent == 0)begin
			if(bitchoose < 3)		bitchoose <= bitchoose +1;
			else bitchoose <= 0;			
		end
	end
	
	
	always@(posedge enho )begin
		if(setting == 1)begin
			if(bitchoose2 == 0)begin
					if(p0 < 9)begin
						p0 <= p0+1 ;
					end
					else p0 <= 0;
				
				end 
				if(bitchoose2 == 1)begin
					if(p1 < 9)begin
						p1 <= p1 +1 ;
					end
					else p1 <=0;
				
				
				end 
				if(bitchoose2 == 2)begin
					if(p2 < 9)begin
						p2 <= p2 +1 ;
					end
					else p2 <=0;
				
				
				end 
				if(bitchoose2 == 3)begin
					if(p3 < 9)begin
						p3 <= p3 +1 ;
					end
					else p3 <=0;
				
				
				end 
		
		
		end
		else begin
			if(ent == 0)begin					//

				if(bitchoose == 0)begin
					if(va0 < 9)begin
						va0 <= va0 +1 ;
					end
					else va0 <=0;
				
				end 
				if(bitchoose == 1)begin
					if(va1 < 9)begin
						va1 <= va1 +1 ;
					end
					else va1 <=0;
				
				
				end 
				if(bitchoose == 2)begin
					if(va2 < 9)begin
						va2 <= va2 +1 ;
					end
					else va2 <=0;
				
				
				end 
				if(bitchoose == 3)begin
					if(va3 < 9)begin
						va3 <= va3 +1 ;
					end
					else va3 <=0;
				
				
				end 
			end
			
			else begin
				if(va3 == p3 && va2 == p2 && va1 == p1 && va0 == p0)begin
					sh3 <= 4'hC;	
					sh2 <= 4'hA;
					sh1	<= 4'h5;				
					sh0	<= 4'h5;
				end		
				else begin
					sh3 <= 4'h1;
					sh2 <= 4'hE;
					sh1	<= 4'hB;				
					sh0	<= 4'hB;		
				
				end
				
			
			end
			
		end
	end 

	 

	always @(posedge clk )begin   //debouncer of every push and release of md
		o <= enh;
		z <= o;
		p <= o^z;
		
	end 

	always @(posedge p )begin    //make the debounce "push-release"to 1 movement
		enho <= ~enho;
		
		
	end 
	
	always @(posedge clk )begin   //debouncer of every push and release of md
		ot <= ofl;
		zt <= ot;
		pt <= ot^zt;
		
	end 

	always @(posedge pt )begin    //make the debounce "push-release"to 1 movement
		oflo <= ~oflo;
		
		
	end 







	always @(posedge clk )begin 	//devider make the 20000*20ns  shine 4 character
	
		if (cn2 < 20000)begin 
				cn2 <= cn2 +1;
				//	
				sun <= 4'b 1110;
				if(setting ==1)begin
					opr <= p0;
				end
				else begin
					if(ent == 0)		opr <= va0;
					else begin
						if(va3 == p3 && va2 == p2 && va1 == p1 && va0 == p0)	opr <= 	4'h5;
						else opr <= 4'hB;
					end
				end
				//
		end 
		else if (cn2> 19999 & cn2< 40000)	begin
				cn2 <= cn2 +1;
				//
				sun <= 4'b 1101;
				if(setting ==1)begin
					opr <= p1;
				end
				else begin
					if(ent == 0)		opr <= va1;
					else begin
						if(va3 == p3 && va2 == p2 && va1 == p1 && va0 == p0)	opr <= 	4'h5;
						else opr <= 4'hB;
					end
				end
				//
		end 	
		else if (cn2 >39999 & cn2 <60000)begin
		
				cn2 <= cn2 +1;
				//
				sun <= 4'b 1011;
				if(setting ==1)begin
					opr <= p2;
				end
				else begin
					if(ent == 0)		opr <= va2;
					else begin
						if(va3 == p3 && va2 == p2 && va1 == p1 && va0 == p0)	opr <= 	4'hA;
						else opr <= 4'hE;
					end
				end
		end	
		else if (cn2 >59999 & cn2 <80000)begin
		
				cn2 <= cn2 +1;
				//
				sun <= 4'b 0111;
				if(setting ==1)begin
					opr <= p3;
				end
				else begin
					if(ent == 0)		opr <= va3;
					else begin
						if(va3 == p3 && va2 == p2 && va1 == p1 && va0 == p0)	opr <= 	4'hC;
						else opr <= 4'h1;
					end
				end
		end	
		else cn2 <= 0;
		
		
	end 
endmodule
