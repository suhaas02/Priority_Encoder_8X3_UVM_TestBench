class virtual_seqs extends uvm_sequence #(uvm_sequence_item); 
	`uvm_object_utils(virtual_seqs)
	
	//seqs seqh;
	virtual_seqr vseqrh;  
	sequencer seqrh; 
	function new(string name = "virtual_seqs"); 
		super.new(name); 
	endfunction 
	
	task body(); 
		assert($cast(vseqrh, m_sequencer)); 

		seqrh = vseqrh.seqrh; 
	endtask 

	
endclass

class virtual_seqs_extd extends virtual_seqs; 
	seqs seqh; 
	`uvm_object_utils(virtual_seqs_extd)
	
	function new(string name = "virtual_seqs_extd"); 
		super.new(name); 	
	endfunction 
	
	task body(); 
		super.body(); 
		seqh = seqs::type_id::create("seqh");
		repeat(100)
			seqh.start(seqrh); 
	endtask 
endclass 
	
