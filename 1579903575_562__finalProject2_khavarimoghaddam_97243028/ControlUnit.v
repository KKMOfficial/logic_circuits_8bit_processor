module ControlUnit(FUNCTION, W, clk , Rin, Rout ,Ain, Gin, Gout, AddSub, ExternalIn, ExternalOut , Done);
input [6:0] FUNCTION;
input W,clk;
output [3:0]Rin,Rout;
output Ain,Gin,Gout,AddSub,ExternalIn,ExternalOut,Done;


wire [8:0] FRegOutput;
wire [1:0] FRIN;
wire FRin;
wire [1:0] Q;
wire [3:0] X,Y,T;
wire [4:0] I;
wire nI4;
supply1 vcc;
supply0 gnd;
wire Clear;
wire nW;

//UniversalRegister(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clr ,clk)
//Decoder2to4(Input , Output , en)
//TwoBitUpCounter(clk , clr , State)
//Decoder3to8(In, Out)
assign FRIN = {FRin , FRin};
assign I[4] = FUNCTION[6];
not nI4_not(nI4 , I[4]);
UniversalRegister FunctionRegister(, FRegOutput , FUNCTION, FRIN, gnd, Clear ,clk);
Decoder2to4 OperationDecoder(FRegOutput[5:4] , I , vcc);
Decoder2to4 OperationFstReg(FRegOutput[3:2] , X , vcc);
Decoder2to4 OperationScdReg(FRegOutput[1:0] , Y   , vcc);
Decoder2to4 ClockControlDec(Q , T   , vcc);
TwoBitUpCounter ClockControl(clk , Clear , Q);
//Counter Clear Logic
wire Clear_and_wire;
not W_not(nW , W);
and Clear_and(Clear_and_wire , nW , T[0]);
or (Clear , Clear_and_wire, Done);
//FRin Logic
and FRin_and(FRin , W , T[0]);
//ExternalIn Logic
and Extern_and(ExternalIn , I[0] , T[1] , nI4);
//ExternalOut Logic
and Store_and(ExternalOut , I[4] , T[0]);
//Done Logic
wire Done_and_1_wire , Done_and_2_wire , Done_and_3_wire , Done_and_4_wire, Done_and_5_wire;
and Done_and_1(Done_and_1_wire,I[0] , T[1] , nI4);
and Done_and_2(Done_and_2_wire,I[1] , T[1] , nI4);
and Done_and_3(Done_and_3_wire,I[2] , T[3] , nI4);
and Done_and_4(Done_and_4_wire,I[3] , T[3] , nI4);
and Done_and_5(Done_and_5_wire,I[4] , T[1] );
or  Done_or_1(Done , Done_and_1_wire , Done_and_2_wire , Done_and_3_wire , Done_and_4_wire,Done_and_5_wire);
//Ain logic
wire Ain_and_1_wire , Ain_and_2_wire;
and Ain_and_1(Ain_and_1_wire , I[2] , T[1] , nI4);
and Ain_and_2(Ain_and_2_wire , I[3] , T[1] , nI4);
or Ain_or_1(Ain , Ain_and_1_wire , Ain_and_2_wire);
//Gin Logic
wire Gin_and_1_wire , Gin_and_2_wire;
and Gin_and_1(Gin_and_1_wire , I[2] , T[2] , nI4);
and Gin_and_2(Gin_and_2_wire , I[3] , T[2] , nI4);
or Gin_or_1(Gin , Gin_and_1_wire , Gin_and_2_wire);
//Gout Logic
wire Gout_and_1_wire , Gout_and_2_wire;
and Gout_and_1(Gout_and_1_wire , I[2] , T[3] , nI4);
and Gout_and_2(Gout_and_2_wire , I[3] , T[3] , nI4);
or Gout_or_1(Gout , Gout_and_1_wire , Gout_and_2_wire);
//AddSub
and addsub_and(AddSub , I[3] , nI4);
//R0in
wire r0_or_0_wire,r0_or_1_wire,r0_or_3_wire,r0_or_4_wire;
wire r0_and_0_wire,r0_and_1_wire,r0_and_2_wire,r0_and_3_wire,r0_and_4_wire,r0_and_5_wire,r0_and_6_wire;
or r0_or_0(r0_or_0_wire , I[0] , I[1]);
and r0_and_0(r0_and_0_wire , r0_or_0_wire , T[1] , X[0] , nI4);
or r0_or_1(r0_or_1_wire , I[2] , I[3]);
and r0_and_1(r0_and_1_wire , r0_or_1_wire , T[3] , X[0] , nI4);
or r0_or_2(Rin[0] , r0_and_0_wire,r0_and_1_wire);
//R0out
and r0_and_6(r0_and_6_wire , I[4] , T[0] , X[0]);
and r0_and_2(r0_and_2_wire , I[1] , T[1] , Y[0] , nI4);
and r0_and_3(r0_and_3_wire , T[1] , X[0] , nI4);
and r0_and_4(r0_and_4_wire , T[2] , Y[0] , nI4);
or r0_or_3(r0_or_3_wire , I[2] , I[3]);
or r0_or_4(r0_or_4_wire , r0_and_3_wire , r0_and_4_wire);
and r0_and_5(r0_and_5_wire , r0_or_3_wire , r0_or_4_wire);
or r0_or_5(Rout[0] , r0_and_2_wire , r0_and_5_wire , r0_and_6_wire);

//R1in
wire r1_or_0_wire,r1_or_1_wire,r1_or_3_wire,r1_or_4_wire;
wire r1_and_0_wire,r1_and_1_wire,r1_and_2_wire,r1_and_3_wire,r1_and_4_wire,r1_and_5_wire,r1_and_6_wire;
or r1_or_0(r1_or_0_wire , I[0] , I[1]);
and r1_and_0(r1_and_0_wire , r1_or_0_wire , T[1] , X[1] , nI4);
or r1_or_1(r1_or_1_wire , I[2] , I[3]);
and r1_and_1(r1_and_1_wire , r1_or_1_wire , T[3] , X[1] , nI4);
or r1_or_2(Rin[1] , r1_and_0_wire,r1_and_1_wire);
//R1out
and r1_and_6(r1_and_6_wire , I[4] , T[0] , X[1]);
and r1_and_2(r1_and_2_wire , I[1] , T[1] , Y[1] , nI4);
and r1_and_3(r1_and_3_wire , T[1] , X[1] , nI4);
and r1_and_4(r1_and_4_wire , T[2] , Y[1] , nI4);
or r1_or_3(r1_or_3_wire , I[2] , I[3]);
or r1_or_4(r1_or_4_wire , r1_and_3_wire , r1_and_4_wire);
and r1_and_5(r1_and_5_wire , r1_or_3_wire , r1_or_4_wire);
or r1_or_5(Rout[1] , r1_and_2_wire , r1_and_5_wire,r1_and_6_wire);

//R2in
wire r2_or_0_wire,r2_or_1_wire,r2_or_3_wire,r2_or_4_wire;
wire r2_and_0_wire,r2_and_1_wire,r2_and_2_wire,r2_and_3_wire,r2_and_4_wire,r2_and_5_wire,r2_and_6_wire;
or r2_or_0(r2_or_0_wire , I[0] , I[1]);
and r2_and_0(r2_and_0_wire , r2_or_0_wire , T[1] , X[2] , nI4);
or r2_or_1(r2_or_1_wire , I[2] , I[3]);
and r2_and_1(r2_and_1_wire , r2_or_1_wire , T[3] , X[2] , nI4);
or r2_or_2(Rin[2] , r2_and_0_wire,r2_and_1_wire);
//R2out
and r2_and_6(r2_and_6_wire , I[4] , T[0] , X[2]);
and r2_and_2(r2_and_2_wire , I[1] , T[1] , Y[2] , nI4);
and r2_and_3(r2_and_3_wire , T[1] , X[2] , nI4);
and r2_and_4(r2_and_4_wire , T[2] , Y[2] , nI4);
or r2_or_3(r2_or_3_wire , I[2] , I[3]);
or r2_or_4(r2_or_4_wire , r2_and_3_wire , r2_and_4_wire);
and r2_and_5(r2_and_5_wire , r2_or_3_wire , r2_or_4_wire);
or r2_or_5(Rout[2] , r2_and_2_wire , r2_and_5_wire , r2_and_6_wire);

//R3in
wire r3_or_0_wire,r3_or_1_wire,r3_or_3_wire,r3_or_4_wire;
wire r3_and_0_wire,r3_and_1_wire,r3_and_2_wire,r3_and_3_wire,r3_and_4_wire,r3_and_5_wire,r3_and_6_wire;
or r3_or_0(r3_or_0_wire , I[0] , I[1]);
and r3_and_0(r3_and_0_wire , r3_or_0_wire , T[1] , X[3] , nI4);
or r3_or_1(r3_or_1_wire , I[2] , I[3]);
and r3_and_1(r3_and_1_wire , r3_or_1_wire , T[3] , X[3] , nI4);
or r3_or_2(Rin[3] , r3_and_0_wire,r3_and_1_wire);
//R3out
and r3_and_6(r3_and_6_wire , I[4] , T[0] , X[3]);
and r3_and_2(r3_and_2_wire , I[1] , T[1] , Y[3] , nI4);
and r3_and_3(r3_and_3_wire , T[1] , X[3] , nI4);
and r3_and_4(r3_and_4_wire , T[2] , Y[3] , nI4);
or r3_or_3(r3_or_3_wire , I[2] , I[3]);
or r3_or_4(r3_or_4_wire , r3_and_3_wire , r3_and_4_wire);
and r3_and_5(r3_and_5_wire , r3_or_3_wire , r3_or_4_wire);
or r3_or_5(Rout[3] , r3_and_2_wire , r3_and_5_wire , r3_and_6_wire);


endmodule