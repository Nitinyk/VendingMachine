 interface vending_machine_intf(input logic clk,rst);
logic [1:0] in;
logic out;
clocking driver_cb @(posedge clk);
 default input #1 output #1;
output in;
input out;
endclocking
clocking monitor_cb@(posedge clk);
default input #1 output #1;

input in;

endclocking

modport DRIVER(clocking driver_cb,input clk,rst);
 modport MONITOR(clocking monitor_cb, input clk,rst);

endinterface
