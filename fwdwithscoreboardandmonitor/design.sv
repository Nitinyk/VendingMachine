module vending_machine(input logic clk,input logic reset,input logic [1:0]in,output logic out);
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;

logic [1:0]c_state,n_state;

always@(posedge clk)
begin
if(reset==1)
begin
c_state=0;
n_state=0;
end 
else
begin
c_state=n_state;
  case(c_state)
    s0: if(in==0)
	begin
	n_state=s0;
	out=0;
	end
else if(in==2'b01)
	begin
	n_state=s1;
	out=0;
	end
else if (in==2'b10)
begin
	n_state=s2;
	out=0;
	end

 s1: if(in==0)
	begin
	n_state=s0;
	out=0;
	end
else if(in==2'b01)
	begin
	n_state=s2;
	out=0;
	end
else if (in==2'b10)
begin
	n_state=s0;
	out=1;
	end

 s2: if(in==0)
	begin
	n_state=s0;
	out=0;
	end
else if(in==2'b01)
	begin
	n_state=s0;
	out=1;
	end
else if (in==2'b10)
begin
	n_state=s0;
	out=1;
	end
endcase 
end
end

endmodule
