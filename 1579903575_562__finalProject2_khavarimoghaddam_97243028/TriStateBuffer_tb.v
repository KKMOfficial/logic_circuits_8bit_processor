module TriStateBuffer_tb;

reg a, en;
wire b;

TriStateBuffer BufferInstance(a,en,b);

initial
begin
  a = 1;
  en = 0;
  #100;
  a = 0;
  en = 0;
  #100;
  a = 1;
  en = 1;
  #100;
  a = 0;
  en = 1;
  #100;
end

endmodule