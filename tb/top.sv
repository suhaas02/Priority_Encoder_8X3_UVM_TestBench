module top; 
	import uvm_pkg::*; 
		
	`include "uvm_macros.svh"
	import test_pkg::*; 	
	//bit clock; 
	//always #10 clock = ~clock; 
	pri_enc_if if0(); 
	pri_enc DUV(if0.x, if0.y); 
	initial 
		begin 
			`ifdef VCS
			$fsdbDumpvars(0, top); 
			`endif 
			uvm_config_db #(virtual pri_enc_if)::set(null, "*", "if0", if0); 
			uvm_top.enable_print_topology = 1;
			run_test(); 
		end 

endmodule 
