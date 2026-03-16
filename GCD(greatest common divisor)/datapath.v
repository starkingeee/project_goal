// 5 bit GCD   
module datapath(lda,ldb,clrp,incp,selin,lt,gt,eq,clk,data_in);
 input [4:0] data_in;
 input lda,ldb,clrp,incp,selin,clk;
 output lt,gt,eq;
 wire [4:0] a_out,b_out,out,bus,p;
 pipo1 A(a_out,bus,lda,clk);
 pipo2 B(b_out,bus,ldb,clk);
 pipo3 P(p,clrp,incp,clk);
 subtractor S(out,a_out,b_out);
 comparator comp(lt,gt,eq,out,b_out);
 mux m(bus,data_in,out,selin,clk);
endmodule

module pipo1(out,in,lda,clk);
 input [4:0] in;
 input clk,lda;
 output reg [4:0] out;
 always @(posedge clk)
 begin
  if(lda) out <= in; 
 end
endmodule

module pipo2(out,in,ldb,clk);
 input [4:0] in;
 input ldb,clk;
 output  reg [4:0] out;
 always @(posedge clk)
 begin
  if(ldb) out <= in;
 end
endmodule 

module pipo3(p,clrp,incp,clk);
 input incp,clrp,clk;
 output reg [4:0] p;
 always @(posedge clk)
 begin 
  if(clrp) p<=5'b00000;
  else if(incp) p <= p + 5'b00001;
 end 
endmodule


module subtractor (out,in1,in2);
 input [4:0] in1,in2;
 output reg [4:0] out;
 always @(*)
 begin 
  out <= in1-in2;
 end
endmodule 


module comparator (lt,gt,eq,in1,in2);
 input [4:0] in1,in2;
 output reg  lt,gt,eq;
 always @(*)
 begin 
  if(in1 < in2) lt = 1;
  else gt = 1;
  
 end 
endmodule 


module mux(out,in1,in2,sel,clk);
 input [4:0] in1,in2;
 input clk,sel;
 output reg [4:0] out;
 always @(posedge clk)
 begin
  if(sel) out <= in2;
  else out <= in1;
 end  
endmodule 
