module EBitTriStateBuffer(data , en , out);
input [7:0] data;
input en;
output [7:0]out;
//module TriStateBuffer(a,en,b)
TriStateBuffer IN0(data[0] , en , out[0]);
TriStateBuffer IN1(data[1] , en , out[1]);
TriStateBuffer IN2(data[2] , en , out[2]);
TriStateBuffer IN3(data[3] , en , out[3]);
TriStateBuffer IN4(data[4] , en , out[4]);
TriStateBuffer IN5(data[5] , en , out[5]);
TriStateBuffer IN6(data[6] , en , out[6]);
TriStateBuffer IN7(data[7] , en , out[7]);
endmodule