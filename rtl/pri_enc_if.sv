interface pri_enc_if; 
	logic [7:0] x; 
	logic [2:0] y; 

	modport drv_mp(output x); 
	modport mon_mp(input x, input y); 
endinterface 
