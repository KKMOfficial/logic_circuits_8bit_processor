module Decoder3to8(In, Out ,en);

input [2:0]In;
output [7:0]Out;
input en;

wire [2:0]nIn;
not not0(nIn[0] , In[0]);
not not1(nIn[1] , In[1]);
not not2(nIn[2] , In[2]);

and and0(Out[0], nIn[0], nIn[1], nIn[2] , en);
and and1(Out[1],  In[0], nIn[1], nIn[2] , en);
and and2(Out[2], nIn[0],  In[1], nIn[2] , en);
and and3(Out[3],  In[0],  In[1], nIn[2] , en);
and and4(Out[4], nIn[0], nIn[1],  In[2] , en);
and and5(Out[5],  In[0], nIn[1],  In[2] , en);
and and6(Out[6], nIn[0],  In[1],  In[2] , en);
and and7(Out[7],  In[0],  In[1],  In[2] , en);


endmodule