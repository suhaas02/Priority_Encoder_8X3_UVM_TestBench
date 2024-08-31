class monitor extends uvm_monitor; 
	`uvm_component_utils(monitor)

	virtual pri_enc_if.mon_mp vif; 
	tb_config tb_cfg; 
	uvm_analysis_port #(transaction) monitor_port; 
	function new(string name = "monitor", uvm_component parent); 
		super.new(name, parent); 
		monitor_port = new(name, this); 
	endfunction 

	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		assert(uvm_config_db #(tb_config)::get(this, "", "tb_config", tb_cfg)); 
	endfunction 

	function void connect_phase(uvm_phase phase); 
		//super.build_phase(phase); 
		vif = tb_cfg.vif; 
	endfunction 

	task run_phase(uvm_phase phase); 
		forever 
			collect_data(); 
	endtask 

	task collect_data(); 
	//	#10; 
		transaction xtn; 
		#10; 
		xtn = transaction::type_id::create("xtn"); 
	//	#10; 
		xtn.x = vif.x; 
		xtn.y = vif.y; 
		`uvm_info(get_type_name, $sformatf("Printing from monitor: %s", xtn.sprint()), UVM_LOW)
		monitor_port.write(xtn); 
	endtask 
endclass
