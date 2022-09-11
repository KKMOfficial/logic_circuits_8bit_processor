module UniversalRegister(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clr ,clk);
input [7:0]LoadSignal;
input [1:0]RegisterMode;
input SerialInput;
input clk;
input clr;
output SerialOutput;
output [7:0]ParallelOutput;
supply1 vcc;
supply0 gnd;
wire [7:0]D;
wire [7:0]nQ;
wire [7:0]S,C;

    //RisingEdge_DFlipFlop(q,q1,d,c)
    //Multiplexer4to1(O,S,I0,I1,I2,I3)
    //HalfAdder(s,c,x,y)

    //Register Mode Information
    //mode 00 ---> parraller register without shift
    //mode 01 ---> right shift register 
    //mode 10 ---> increase register data by 1
    //mode 11 ---> load data in register

    assign SerialOutput = ParallelOutput[0];

    RisingEdge_DFlipFlop Bit0FF(ParallelOutput[0],nQ[0],D[0],clk, clr);
    RisingEdge_DFlipFlop Bit1FF(ParallelOutput[1],nQ[1],D[1],clk, clr);
    RisingEdge_DFlipFlop Bit2FF(ParallelOutput[2],nQ[2],D[2],clk, clr);
    RisingEdge_DFlipFlop Bit3FF(ParallelOutput[3],nQ[3],D[3],clk, clr);
    RisingEdge_DFlipFlop Bit4FF(ParallelOutput[4],nQ[4],D[4],clk, clr);
    RisingEdge_DFlipFlop Bit5FF(ParallelOutput[5],nQ[5],D[5],clk, clr);
    RisingEdge_DFlipFlop Bit6FF(ParallelOutput[6],nQ[6],D[6],clk, clr);
    RisingEdge_DFlipFlop Bit7FF(ParallelOutput[7],nQ[7],D[7],clk, clr);

    Multiplexer4to1 Bit0MP(D[0],RegisterMode,ParallelOutput[0],ParallelOutput[1],S[0],LoadSignal[0]);
    Multiplexer4to1 Bit1MP(D[1],RegisterMode,ParallelOutput[1],ParallelOutput[2],S[1],LoadSignal[1]);
    Multiplexer4to1 Bit2MP(D[2],RegisterMode,ParallelOutput[2],ParallelOutput[3],S[2],LoadSignal[2]);
    Multiplexer4to1 Bit3MP(D[3],RegisterMode,ParallelOutput[3],ParallelOutput[4],S[3],LoadSignal[3]);
    Multiplexer4to1 Bit4MP(D[4],RegisterMode,ParallelOutput[4],ParallelOutput[5],S[4],LoadSignal[4]);
    Multiplexer4to1 Bit5MP(D[5],RegisterMode,ParallelOutput[5],ParallelOutput[6],S[5],LoadSignal[5]);
    Multiplexer4to1 Bit6MP(D[6],RegisterMode,ParallelOutput[6],ParallelOutput[7],S[6],LoadSignal[6]);
    Multiplexer4to1 Bit7MP(D[7],RegisterMode,ParallelOutput[7],SerialInput      ,S[7],LoadSignal[7]);

    HalfAdder Bit0HA(S[0],C[0],ParallelOutput[0],vcc );
    HalfAdder Bit1HA(S[1],C[1],ParallelOutput[1],C[0]);
    HalfAdder Bit2HA(S[2],C[2],ParallelOutput[2],C[1]);
    HalfAdder Bit3HA(S[3],C[3],ParallelOutput[3],C[2]);
    HalfAdder Bit4HA(S[4],C[4],ParallelOutput[4],C[3]);
    HalfAdder Bit5HA(S[5],C[5],ParallelOutput[5],C[4]);
    HalfAdder Bit6HA(S[6],C[6],ParallelOutput[6],C[5]);
    HalfAdder Bit7HA(S[7],C[7],ParallelOutput[7],C[6]);
    

endmodule