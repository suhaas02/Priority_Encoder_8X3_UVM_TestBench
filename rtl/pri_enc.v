module pri_enc(x,y); 
	input [7:0] x; 
	output reg [2:0] y; 

	always@(*)
		begin 
			case(1'b1)
				x[7] : y = 7; 
				x[6] : y = 6; 
				x[5] : y = 5; 
				x[4] : y = 4; 
				x[3] : y = 3; 
				x[2] : y = 2; 
				x[1] : y = 1; 
				x[0] : y = 0;	
				default: y = 3'bx; 

			endcase
		end 
endmodule  
				
		
