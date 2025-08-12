`timescale 1ns / 1ps

module detecter_1011(in,out,clk);
 input in,clk;
 output out;
 reg [2:0] state;
 parameter s0=3'b000, s1=3'b001, s2=3'b010,s3=3'b011,  s4=3'b100;
 assign out = (state == s4);
 always @(posedge clk)
 begin 
  case(state)
  s0: state <= (in)?s1:s0;
  s1: state <= (in)?s1:s2;
  s2: state <= (in)?s3:s0;
  s3: state <= (in)?s4:s2;
  s4: state <= (in)?s1:s2;
  default: state <= s0; 
   endcase
 end
endmodule
