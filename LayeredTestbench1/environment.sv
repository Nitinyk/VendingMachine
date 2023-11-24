class environment;

generator gen;

driver drv;
 monitor mon;

scoreboard scb;

mailbox gen2drv;
mailbox mon2scb;
event drvzgen;
virtual vending_machine_intf intf;
function new( virtual vending_machine_intf intf);
	this.intf = intf;
	gen2drv=new();
        mon2scb = new();

gen=new(gen2drv, drv2gen);

drv=new(intf,gen2drv);
 mon= new(intf,mon2scb);
scb=new(mon2scb);
endfunction
task pre_test(); 
drv.rst();
endtask

task test();
gen.main()
drv.main();
mon.main();
 scb.main();
endtask

task post_test();

wait (drv2gen.triggered);
 wait(gen.repeat_count==  drv.no_trans);
 wait(gen.repeat_count==scb.no_trans);

endtask

task run();
 pre_test();
test();
post_test();

$finish;
 endtask

endclass
