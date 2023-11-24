`define MONITOR_IF vending_machine_intf.MONITOR.monitor_cb
 class monitor;

virtual vending_machine_intf intf;
mailbox mon2scb;
function new(virtual  vending_machine_intf intf , mailbox mon2scb);

this.intf=intf;

this.mon2scb=mon2scb;

endfunction

 task main;

forever begin

transaction trans;

trans = new();

@(posedge `MONITOR_IF.clk);

wait(`MONITOR_IF.in);

if(`MONITOR_IF.in)
begin

trans.in =`MONITOR_IF.in;

trans.out= `MONITOR_IF.out;

Sdisplay("\t in= %0d \t out %0d", trans.in, trans.out);

end


mon2scb.put(trans);

end

endtask

endclass
