module Multiplexer4to1(O,S,I0,I1,I2,I3);
output O;
input [1:0]S;
input I0,I1,I2,I3;
wire w_0,w_1,w_2,w_3;
wire [1:0]nS;
not not_1(nS[0], S[0]);
not not_2(nS[1], S[1]);
and and_1(w_0,I0,nS[0],nS[1]);
and and_2(w_1,I1,S[0],nS[1]);
and and_3(w_2,I2,nS[0],S[1]);
and and_4(w_3,I3,S[0],S[1]);
or or_1(O, w_0,w_1,w_2,w_3);
endmodule