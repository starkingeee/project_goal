`timescale 1ns / 1ps

module fifo_tb();
 reg data_in,wr,rd,rst,clk;
 wire  empty,full;
 wire data_out;
 fifo f1(data_in,data_out,wr,rd,empty,full,rst,clk);
  initial begin
   clk = 0; rst = 1; rd=0; wr=0;
     repeat(60)
     begin 
       #5 clk = 1; #5 clk=0;
       #5 clk = 0; #5 clk =0;
       end
  end 
   initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0,fifo_tb);
    $monitor("T=%2d,data_in=%b,wr=%b,rd=%b,empty=%b,full=%b,data_out=%b,wr_p=%b,rd_p=%b",$time,data_in,wr,rd,empty,full,data_out,f1.wr_p,f1.rd_p);
    #3 rst = 0; wr = 1; data_in = 1;
    #20 data_in = 0;
    #17 data_in = 1;
    #17 data_in = 1;
    #22 data_in = 0; 
    #20 data_in = 0; 
    #20 data_in = 1; 
    #20 data_in = 1; 

    #13 wr =0; rd=1;
    
   
    #300 $finish;

   end
endmodule



