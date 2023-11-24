module testbench_top;

	bit clk;
	bit reset;

	vending_machine_intf intf(clk,reset);
	test t1(intf);
	vending_machine dut(.clk(intf.clk),.reset(intf.reset),.in(intf.in),.out(intf.out));
	//assert_debounce adebounce(intf);
	always #10 clk=~clk;
	
	initial begin 
	reset=1;
	#10 reset=0;
	end 
	

	
endmodule 
