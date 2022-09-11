module TriStateBuffer(a,en,b);

input a,en;
output b;
assign b = en? a : 'bz;

endmodule