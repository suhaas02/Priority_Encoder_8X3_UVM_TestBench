class transaction extends uvm_sequence_item; 
	//`uvm_object_utils(transaction)

	function new(string name = "trasaction");
		super.new(name);
	endfunction 
	
	rand logic [7:0] x; 
	logic [2:0] y; 

	`uvm_object_utils_begin(transaction)
		`uvm_field_int(x, UVM_ALL_ON)
		`uvm_field_int(y, UVM_ALL_ON)
	`uvm_object_utils_end

endclass
