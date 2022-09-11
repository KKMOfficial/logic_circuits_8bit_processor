module ALU2_tb;
    reg [7:0] X,Y;
    wire [7:0] Z;
    reg add_sub;
    wire ofs;
    //ALUPlus(X,Y,Z,ofs);
ALU2 newALU(add_sub , X , Y , Z , ofs);

    initial
    begin
      X=8'b11111111;
      Y=8'b11100000;
      add_sub = 1;
      #100;

      X=8'b10101010;
      Y=8'b10101010;
      add_sub = 1;
      #100;

      X=8'b01101010;
      Y=8'b01101010;
      add_sub = 0;
      #100;
    end


endmodule