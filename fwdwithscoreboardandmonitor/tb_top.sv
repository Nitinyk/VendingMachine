module tb_top;

bit clk,rst;

always #5 clk = clk;

initial begin

rst = 1;

#10 rst = 0;

end
vending_machine_intf intf(clk,rst);
test t1(intf);
vending_machine dut(.in(intf.in),
.out(intf.out),
.clk(intf.clk),
.rst(intf.rst));
endmodule
