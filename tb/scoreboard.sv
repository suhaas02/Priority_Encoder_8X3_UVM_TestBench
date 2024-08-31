class scoreboard extends uvm_scoreboard; 
	`uvm_component_utils(scoreboard)
	uvm_tlm_analysis_fifo #(transaction) fifoh;
	transaction xtn, xtn_ref; 

	covergroup packet; 
		din: coverpoint xtn.x;
			/* {
				bins one = {[0:9]};
				bins two = {[10:19]}; 
				bins three = {[20:29]};
				bins four = {[30:39]}; 
				bins five = {[40:49]}; 
				bins six = {[50:59]}; 
				bins seven = {[60:63]};
			} */
		dout: coverpoint xtn.y;
	endgroup ;
 
	function new(string name = "scoreboard", uvm_component parent); 
		super.new(name, parent); 
		fifoh = new(name, this);
		packet = new;  
	endfunction 

	task run_phase(uvm_phase phase); 
		//transaction xtn; 
		forever 
			begin 
				fifoh.get(xtn); 
				assert($cast(xtn_ref, xtn.clone())); 
				data_out_ref(xtn_ref); 	
				check_data(xtn, xtn_ref); 
				packet.sample(); 
			end
	endtask 

	task data_out_ref(ref transaction xtn); 
		if(xtn.x[7] == 1)
			xtn.y = 7; 
		else if(xtn.x[6] == 1)
			xtn.y = 6;
		else if(xtn.x[5] == 1)
			xtn.y = 5; 
		else if(xtn.x[4] == 1)
			xtn.y = 4; 
		else if(xtn.x[3] == 1)
			xtn.y = 3; 
		else if(xtn.x[2] == 1)
			xtn.y = 2; 
		else if(xtn.x[1] == 1)
			xtn.y = 1;
		else if(xtn.x[0] == 1)
			xtn.y = 0; 
 		else 
			xtn.y = 3'bx;
 
	endtask 	

	task check_data(transaction xtn, transaction xtn_ref); 
		if(xtn.compare(xtn_ref))
			`uvm_info(get_type_name, "Data Match successfully", UVM_LOW)
		else 		
			`uvm_info(get_type_name, "Data Mismatch", UVM_LOW)
	endtask 
endclass 
