interface vending_machine_intf(input logic clk,reset);
	logic [1:0] in;
	logic out;
	
	clocking bfm_cb @(posedge clk);
		default input #1 output #1;
		input out;
		output in;
	endclocking
	
	clocking monitor_cb @(posedge clk);
		default input #1 output #1;
		input in;
		input out;
	endclocking
	
	modport BFM(clocking bfm_cb,input clk,reset);
	modport MONITOR(clocking monitor_cb,input clk,reset);
	
endinterface
