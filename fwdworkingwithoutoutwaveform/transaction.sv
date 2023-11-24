class transaction;
	rand bit in;
	bit out;
	
	function void display();
	$display("#################@@@@@@@@@################");
	$display("\t in=%0b",in);
	$display("\t out=%0b",out);
	$display("#################@@@@@@@@@################");
	endfunction
	
endclass 
