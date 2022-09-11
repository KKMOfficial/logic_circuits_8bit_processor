module FullAdder(x,y,cin,s,cout);
    input x,y,cin;
    output s,cout;
    wire s1,s2,s3;
    xor xor_1(s1,x,y);
    xor xor_2(s,s1,cin);
    and and_1(s2,x,y);
    and and_2(s3,s1,cin);
    or or_1(cout,s3,s2);
endmodule