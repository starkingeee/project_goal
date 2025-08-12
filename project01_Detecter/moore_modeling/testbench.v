`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module detecter_tb( );
reg in,clk;
wire out;
detecter_1011 detect (in,out,clk);
initial begin 
 clk=0;
 forever #5 clk=~clk;
end
initial begin
 #12 in=1;
 #10 in = 0; 
 #10 in = 1; 
 #10 in = 0; 
 #10 in = 1; 
 #10 in = 1; 
 #10 in = 1;
 #10 in = 1;
 #10 in = 0;
 #10 in = 1;
 #10 in = 1;
 #10 in = 0;
 #10 in = 1;
 #10 in = 1;
 
 #50 $finish;
  
end 
endmodule
