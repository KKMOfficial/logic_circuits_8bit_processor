module SimpleCPU_tb;
reg[7:0] Data;
wire Done;
wire [7:0] DataOut;
reg clk,W;
reg[6:0] FUNCTION;
SimpleCPU SCPUInstance(Data,DataOut, Done,W,clk,FUNCTION);
always
begin
    clk = 1; #50; clk = 0; #50;
end

initial
begin
//Student ID : 97243028
//save 9 in register 0 then save 7 in register 1 and add them 
//the result will save at register 0 , doing this process until we reach number 8
//then we get 00011110 from datainput buffer save that in register 2 then substract 
//register it from register 1 data then we will send data in register output ...
//9+7+2+4+3+0+2+8=35::00100011
// 00100011-00011110=101

// 9 -> reg0 : 0
FUNCTION=7'b0000000;
W=1;
Data=8'b00001001;
#200;

W=0;
#100;

// 7 -> reg1 : 300
FUNCTION=7'b0000100;
W=1;
Data=8'b00000111;
#200;

W=0;
#100;

// 9 + 7 -> reg0 : 600
FUNCTION=7'b0100001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// 2 -> reg1 : 1000
FUNCTION=7'b0000100;
W=1;
Data=8'b00000010;
#200;

W=0;
#100;

// 16 + 2 -> reg0 : 1300
FUNCTION=7'b0100001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// 4 -> reg1 : 1700
FUNCTION=7'b0000100;
W=1;
Data=8'b00000100;
#200;

W=0;
#100;

// 18 + 4 -> reg0 : 2000
FUNCTION=7'b0100001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// 3 -> reg1 : 2400
FUNCTION=7'b0000100;
W=1;
Data=8'b00000011;
#200;

W=0;
#100;

// 22 + 3 -> reg0 : 2700
FUNCTION=7'b0100001;
W=1;
Data=8'b0100001;
#300;

W=0;
#100;

// 0 -> reg1 : 3100
FUNCTION=7'b0000100;
W=1;
Data=8'b00000000;
#200;

W=0;
#100;

// 25 + 0 -> reg0 : 3400
FUNCTION=7'b0100001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// 2 -> reg1 : 3800
FUNCTION=7'b0000100;
W=1;
Data=8'b00000010;
#200;

W=0;
#100;

// 25 + 2 -> reg0 : 4100
FUNCTION=7'b0100001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// 8 -> reg1 : 4500
FUNCTION=7'b0000100;
W=1;
Data=8'b00001000;
#200;

W=0;
#100;

// 27 + 8 -> reg0 : 4800
FUNCTION=7'b0100001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// 00011110 -> reg1 : 5200
FUNCTION=7'b0000100;
W=1;
Data=8'b00011110;
#200;

W=0;
#100;

// 100011 - 011110 = 101 -> reg0 : 5500
FUNCTION=7'b0110001;
W=1;
Data=8'b00000000;
#300;

W=0;
#100;

// show 101 in output for 1 clock : 5900
FUNCTION=7'b1000000;
W=1;
Data=8'b00000000;
#200;
//#6100
end
endmodule