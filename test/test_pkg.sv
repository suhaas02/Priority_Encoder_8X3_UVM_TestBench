package test_pkg; 
	import uvm_pkg::*; 

	`include "uvm_macros.svh"
	
	`include "tb_config.sv"
	`include "transaction.sv"
	`include "sequencer.sv"
	`include "driver.sv"
	`include "monitor.sv"
	`include "agent.sv"
		`include "seqs.sv"
		`include "virtual_seqr.sv"

	`include "virtual_seqs.sv"
	`include "scoreboard.sv"
	`include "environment.sv"

	`include "test.sv"
endpackage 
