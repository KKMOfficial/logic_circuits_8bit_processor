module Decoder2to4(Input , Output , en);
input [1:0]Input;
output [3:0]Output;
input en;
wire [1:0]nInput;
not not_0(nInput[0] , Input[0]);
not not_1(nInput[1] , Input[1]);

and and0(Output[0] , nInput[0] , nInput[1] , en);
and and1(Output[1] ,  Input[0] , nInput[1] , en);
and and2(Output[2] , nInput[0] ,  Input[1] , en);
and and3(Output[3] ,  Input[0] ,  Input[1] , en);

endmodule