module TwoBitUpCounter(clk , clr , State);
output [1:0]State;
wire [1:0]nState;
wire [1:0]d;
wire nclr;
wire and_1_wire,and_2_wire;
input clk,clr;
supply0 gnd;
//RisingEdge_DFlipFlop(q,q1,d,c,clr)
not not_0(nclr , clr);
and and_0(d[0] , nState[0] , nclr);
and and_1(and_1_wire , nState[0] ,State[1] ,nclr);
and and_2(and_2_wire , nState[1] ,State[0] ,nclr);
or or_0(d[1] , and_1_wire , and_2_wire);
RisingEdge_DFlipFlop S0(State[0],nState[0],d[0],clk,gnd);
RisingEdge_DFlipFlop S1(State[1],nState[1],d[1],clk,gnd);
endmodule