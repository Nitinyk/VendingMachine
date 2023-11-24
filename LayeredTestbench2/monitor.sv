class monitor;
	//scoreboard sb;
	virtual vending_machine_intf intf;
	
	function new(virtual vending_machine_intf intf);
		this.intf=intf;
		//this.sb=sb;
	endfunction	
	/*task check();
		forever
		@(negedge intf.clk)
		if(scoreboard.out!=intf.out)
			$display("*ERROR *|DUT count is %b :: IN count is %b ",sb.out,intf.out);
		else
			$display(" DUT count is %b:: IN count is %b",sb.out,intf.out);
		endtask*/
	endclass


