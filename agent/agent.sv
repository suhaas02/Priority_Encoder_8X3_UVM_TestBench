class agent extends uvm_agent; 
	`uvm_component_utils(agent)
	monitor monh;
	driver drvh; 
	sequencer seqrh;
	function new(string name = "agent", uvm_component parent); 
		super.new(name, parent); 
	endfunction 
	
	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		monh = monitor::type_id::create("monh", this); 	
		seqrh = sequencer::type_id::create("seqrh", this);
		drvh = driver::type_id::create("drvh", this); 
	endfunction 
	
	function void connect_phase(uvm_phase phase); 
		drvh.seq_item_port.connect(seqrh.seq_item_export); 
	endfunction 
endclass
