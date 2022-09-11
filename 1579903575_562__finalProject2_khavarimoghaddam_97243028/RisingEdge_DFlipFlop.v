module RisingEdge_DFlipFlop(q,q1,d,c,clr);
output q,q1;
 input d,c;
 input clr;
 reg q,q1;
	initial 
	   begin
		   q=1'b0; q1=1'b1;
	  end
	always @ (posedge c)
	   begin 
		 q=d&(~clr);
		 q1=(~d)|clr;
	   end
endmodule