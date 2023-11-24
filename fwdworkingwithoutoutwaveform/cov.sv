class vending_machine_cov;
	transaction trans=new();
	
	covergroup cov_inst;
	option.per_instance=1;
	SW:coverpoint trans.in{bins sww={0,4};}
	DO:coverpoint trans.out {bins Do ={0,1};}
	endgroup
	
	function new();
		cov_inst=new;
	endfunction
	
	task main;
		cov_inst.sample();
	endtask
	
endclass 
