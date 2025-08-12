`timescale 1ns / 1ps
// detecter bassed on mealy 
module detecter_1011(in,out,clk);
 input in,clk;
 output reg out;
 reg [1:0] ps,ns;
 parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
 
 always @(posedge clk)
  begin 
   ps <= ns;
   case(ns)
   s0:ns <= (in)? s1:s0; 
   s1:ns <= (in)? s1:s2; 
   s2:ns <= (in)? s3:s0;
   s3:ns <= (in)? s1:s2;
   default:begin ps <= s0; ns <= s0; end 
    endcase
  end 

   always @(*)
  begin
   case(ps)
   s0: out = (in)?0:0;  
   s1: out = (in)?0:0;  
   s2: out = (in)?0:0;  
   s3: begin if( ps == s3 && ns == s1)  out=1; 
             else out = 0;
        end 
   default: out = 0;
   endcase 
  end
endmodule
  
  
