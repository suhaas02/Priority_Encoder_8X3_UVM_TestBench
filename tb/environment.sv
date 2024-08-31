class environment extends uvm_env; 
	`uvm_component_utils(environment)

	agent agth; 
	virtual_seqr vseqrh; 	
	scoreboard sbh; 
	function new(string name = "environment", uvm_component parent); 
		super.new(name, parent); 
	endfunction 
	
	function void build_phase(uvm_phase phase); 		
		super.build_phase(phase); 	
		agth = agent::type_id::create("agth", this);
		vseqrh = virtual_seqr::type_id::create("vseqrh", this);  
		sbh = scoreboard::type_id::create("sbh", this); 
	endfunction 

	function void connect_phase(uvm_phase phase); 
		vseqrh.seqrh = agth.seqrh;
		agth.monh.monitor_port.connect(sbh.fifoh.analysis_export);  
	endfunction 
	
endclass 
