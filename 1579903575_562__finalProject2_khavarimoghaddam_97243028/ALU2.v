module ALU2(add_sub , X , Y , Z, ofs);
//alu that can calculate summation of two 15 bit number
input [7:0] X,Y;
wire [7:0] YF;
output [7:0] Z;
output ofs;
input add_sub;
wire [6:0] COUT;

    xor YF0(YF[0] , add_sub , Y[0]);
    xor YF1(YF[1] , add_sub , Y[1]);
    xor YF2(YF[2] , add_sub , Y[2]);
    xor YF3(YF[3] , add_sub , Y[3]);
    xor YF4(YF[4] , add_sub , Y[4]);
    xor YF5(YF[5] , add_sub , Y[5]);
    xor YF6(YF[6] , add_sub , Y[6]);
    xor YF7(YF[7] , add_sub , Y[7]);

    //FullAdder(x,y,cin,s,cout);
    FullAdder FA0( X[0] ,YF[0] ,add_sub ,Z[0] ,COUT[0]);
    FullAdder FA1( X[1] ,YF[1] ,COUT[0] ,Z[1] ,COUT[1]);
    FullAdder FA2( X[2] ,YF[2] ,COUT[1] ,Z[2] ,COUT[2]);
    FullAdder FA3( X[3] ,YF[3] ,COUT[2] ,Z[3] ,COUT[3]);
    FullAdder FA4( X[4] ,YF[4] ,COUT[3] ,Z[4] ,COUT[4]);
    FullAdder FA5( X[5] ,YF[5] ,COUT[4] ,Z[5] ,COUT[5]);
    FullAdder FA6( X[6] ,YF[6] ,COUT[5] ,Z[6] ,COUT[6]);
    FullAdder FA7( X[7] ,YF[7] ,COUT[6] ,Z[7] ,ofs);



endmodule