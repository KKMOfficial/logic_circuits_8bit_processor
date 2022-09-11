module multiplexer2to1(Out,I0, I1, S);
    input I0,I1,S;
    output Out;
    wire and_1,and_2,nS;
    not not_1_gate(nS, S);
    and and_1_gate(and_1, nS, I0);
    and and_2_gate(and_2, S , I1);
    or or_1_gate(Out, and_1, and_2);
endmodule