class vending_machine_bfm;

	virtual vending_machine_intf intf;
	mailbox gen2bfm;
	int no_transactions;
	
	function new(virtual vending_machine_intf intf ,mailbox gen2bfm);
	this.intf=intf;
	this.gen2bfm=gen2bfm;
	endfunction
	
	task reset;
		wait(intf.reset);
		$display("Resetting is on");
		intf.bfm_cb.in<=0;
		//intf.bfm_cb.db<=0;
		wait(!intf.reset);
		$display("Reset done");
	endtask
	
	task main;
		forever begin
		transaction trans;
		gen2bfm.get(trans);
		$display("Transaction no=%0d",no_transactions);
		intf.bfm_cb.in<=trans.in;
		repeat(2)@(posedge intf.clk);
		trans.out=intf.bfm_cb.out;
		trans.display();
		no_transactions++;
		end 
	endtask
endclass 
