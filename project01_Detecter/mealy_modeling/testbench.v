`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 17:30:45
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 16:39:25
// Design Name: 
// Module Name: detecter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb( );
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

