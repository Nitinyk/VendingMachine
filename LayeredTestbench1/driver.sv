`define DRIVER_IF vending_machine_intf.DRIVER.driver_cb
class driver;

int no_trans;

virtual vending_machine_intf intf;
 mailbox gen2drv;
function new(virtual  vending_machine_intf intf, mailbox gen2drv);

this.intf= intf;

this.gen2drv =gen2drv;

endfunction

task reset;

$display("resetting");

wait(intf.rst);
`DRIVER_IF.in <= 0;
 wait(!intf.rst);
Sdisplay("done resetting");
endtask
task drive;

forever begin

transaction trans;
`DRIVER_IF.in <=0;
gen2drv.get(trans);

Sdisplay("no: of transactions",no_trans);

@(posedge `DRIVER_IF.clk);
if(trans.in)
begin

`DRIVER_IF.in <=trans.in;
trans.out=`DRIVER_IF.out;

$display("\t in %0d ",trans.in);
 end
if(trans.in)
 begin `DRIVER_IF.in <=trans.in;

@(posedge `DRIVER_IF.clk);

trans.out=`DRIVER_IF.out;
Sdisplay("\t out %0d",trans.out);
 end

no_trans++;

end

endtask

task main;

forever begin

fork
 begin

wait(intf.rst);
end
begin
drive();
end

join_any
 disable fork;

end

endtask

endclass
