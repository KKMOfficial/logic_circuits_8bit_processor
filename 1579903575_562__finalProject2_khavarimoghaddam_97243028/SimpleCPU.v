module SimpleCPU(Data, DataOut , Finish,W,clk,FUNCTION);
wire [7:0] BUS;
wire [7:0] RegisterOutput0,RegisterOutput1,RegisterOutput2,RegisterOutput3;
wire [7:0] ARegOutput ;
wire [7:0] GRegOutput , GRegInput;
wire [3:0] RIn,ROut;
wire [1:0]RIN0,RIN1,RIN2,RIN3;
wire [1:0] AIn,GIn;
wire Ain,Gin;
wire GOut;
wire add_sub;
input [7:0] Data;
input W,clk;
output Finish;
input [6:0]FUNCTION;
wire ExternIn,ExternalOut;
output [7:0] DataOut;

supply0 gnd;

//UniversalRegister(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clr ,clk)
    //Register Mode Information
    //mode 00 ---> parraller register without shift
    //mode 01 ---> right shift register 
    //mode 10 ---> increase register data by 1
    //mode 11 ---> load data in register
//ALU2(add_sub , X , Y , Z, ofs)
//EBitTriStateBuffer(data , en , out)
//ControlUnit(FUNCTION, W, clk , Rin, Rout ,Ain, Gin, Gout, AddSub, ExternIn, Finish)
assign RIN0 = {RIn[0] , RIn[0]};
assign RIN1 = {RIn[1] , RIn[1]};
assign RIN2 = {RIn[2] , RIn[2]};
assign RIN3 = {RIn[3] , RIn[3]};
UniversalRegister Register0(, RegisterOutput0 , BUS, RIN0, gnd, gnd ,clk);
UniversalRegister Register1(, RegisterOutput1 , BUS, RIN1, gnd, gnd ,clk);
UniversalRegister Register2(, RegisterOutput2 , BUS, RIN2, gnd, gnd ,clk);
UniversalRegister Register3(, RegisterOutput3 , BUS, RIN3, gnd, gnd ,clk);
EBitTriStateBuffer Register0Buffer(RegisterOutput0 , ROut[0] , BUS);
EBitTriStateBuffer Register1Buffer(RegisterOutput1 , ROut[1] , BUS);
EBitTriStateBuffer Register2Buffer(RegisterOutput2 , ROut[2] , BUS);
EBitTriStateBuffer Register3Buffer(RegisterOutput3 , ROut[3] , BUS);
EBitTriStateBuffer GRegisterBuffer(GRegOutput , GOut , BUS);
EBitTriStateBuffer ExternalDataBuffer(Data , ExternIn , BUS);
EBitTriStateBuffer StoreDataBuffer(BUS , ExternalOut , DataOut);
assign AIn = {Ain , Ain};
assign GIn = {Gin , Gin};
UniversalRegister AReg(, ARegOutput , BUS      , AIn, gnd , gnd ,clk);
UniversalRegister GReg(, GRegOutput , GRegInput, GIn, gnd , gnd ,clk);
ALU2 ALUInstance(add_sub , ARegOutput , BUS , GRegInput, );
//ControlUnit(FUNCTION, W, clk , Rin, Rout ,Ain, Gin, Gout, AddSub, ExternalIn, ExternalOut , Done)
ControlUnit RegControlUnit(FUNCTION, W, clk , RIn, ROut ,Ain, Gin, GOut, add_sub, ExternIn, ExternalOut, Finish);
endmodule