module HalfAdder(s,c,x,y);
    input x,y;
    output s,c;
    xor xor_1(s , x, y);
    and and_1(c , x, y);
endmodule