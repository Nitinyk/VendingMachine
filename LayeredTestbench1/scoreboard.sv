class scoreboard;

mailbox mon2scb;

int no_trans;

bit[1:0]in ;

function new(mailbox mon2scb);

this.mon2scb = mon2scb;
end

endfunction
task main;

forever begin
transaction trans;
#50
mon2scb.get(trans);
/*
if(trans.in)
begin
$display ("yup")
end
*/
no_trans++;
end
endtask

endclass
