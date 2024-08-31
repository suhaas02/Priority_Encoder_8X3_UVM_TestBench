class test extends uvm_test; 
	`uvm_component_utils(test)
	virtual pri_enc_if vif;
	environment envh;  
	tb_config tb_cfg; 
//	seqs seqh;
	virtual_seqs_extd vseqh; 
//	virtual_seqr vseqrh; 
			
	function new(string name = "test", uvm_component parent); 
		super.new(name, parent); 
	endfunction 

	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		tb_cfg = tb_config::type_id::create("tb_cfg"); 
		assert(uvm_config_db #(virtual pri_enc_if)::get(this, "", "if0", tb_cfg.vif));
		uvm_config_db #(tb_config)::set(this, "*", "tb_config", tb_cfg);
		envh = environment::type_id::create("envh", this);  
		//seqh = seqs::type_id::create("seqh");
		vseqh = virtual_seqs_extd::type_id::create("vseqh"); 
	//	vseqrh = virtual_seqr::type_id::create("vseqrh", this);  
	endfunction 

	task run_phase(uvm_phase phase); 
		phase.raise_objection(this); 

		//seqh.start(envh.agth.seqrh);
	//	#100;
		vseqh.start(envh.vseqrh);   
		phase.drop_objection(this); 
	endtask 

endclass  


