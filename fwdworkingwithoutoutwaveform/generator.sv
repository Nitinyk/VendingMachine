class generator;
	transaction trans;  //remove rand if needed 
	mailbox gen2bfm;
	int repeat_count;
	event ended;
	
	function new(mailbox gen2bfm,event ended);
		this.gen2bfm=gen2bfm;
		this.ended=ended;
	endfunction
	
	task main;
		repeat(repeat_count)begin
		trans=new();
		if(!trans.randomize()) $fatal(" randomization failed");
			gen2bfm.put(trans);
		end
		->ended;
		endtask
		
	endclass
