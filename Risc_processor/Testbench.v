`timescale 1ns / 1ps
module tb();
  reg clk1, clk2;
  integer k;
  mips32 mips(clk1, clk2);
 
  initial begin 
    clk1 = 0; clk2 = 0;
    repeat(30) begin
      #5 clk1 = 1; #5 clk1 = 0;
      #5 clk2 = 1; #5 clk2 = 0; 
    end
  end 

  // Program & Register Initialization
  initial begin 
    for (k = 0; k < 32; k = k + 1)
      mips.MEM[k] = 0;

    
    // Load constants
    mips.MEM[0] = 32'h28010005;  // R1 = 5
    mips.MEM[1] = 32'h28020003;  // R2 = 3
    mips.MEM[2] = 32'h0cd73800;  // dummy

    // Arithmetic and Logic operations
    mips.MEM[3] = 32'h00221800;  // ADD  R3 = R1 + R2
    mips.MEM[4] = 32'h04222000;  // SUB  R4 = R1 - R2
    mips.MEM[5] = 32'h14222800;  // MUL  R5 = R1 * R2
    mips.MEM[6] = 32'h08223000;  // AND  R6 = R1 & R2
    mips.MEM[7] = 32'h0C223800;  // OR   R7 = R1 | R2
    mips.MEM[8] = 32'hfc000000;  // HLT

    mips.HALTED = 0;
    mips.PC = 0;
    mips.TAKEN_BRANCH = 0;

    #350
    $display("Operation Results:");
    $display("R1=%2d, R2=%2d", mips.REGBANK[1], mips.REGBANK[2]);
    $display("Addition of two number in R3 = %2d", mips.REGBANK[3]);
    $display("Subtraction of two number in R4 = %2d", mips.REGBANK[4]);
    $display("Multiplication of two number in R5 (MUL) = %2d", mips.REGBANK[5]);
    $display("bitwise and result in R6  = %2d", mips.REGBANK[6]);
    $display(" Bitwise or result in R7   = %2d", mips.REGBANK[7]);

    #10
    for (k = 0; k <= 7; k = k + 1)
      $display("R%1d = %2d", k, mips.REGBANK[k]);
      
      #500 $finish;
  end


 

endmodule


