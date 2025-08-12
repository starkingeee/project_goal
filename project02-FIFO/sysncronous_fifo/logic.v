`timescale 1ns / 1ps
// syncronous fifo (first in first out)  
module fifo(data_in,data_out,wr,rd,empty,full,rst,clk);
 input data_in,wr,rd,rst,clk;
 output wire empty,full;
 output reg data_out;
 reg mem [0:7];
 reg [3:0] wr_p,rd_p; // write_pointer and read_pointer 
 assign empty = (wr_p == rd_p); // empty condition
 assign full = (rd_p == {~(wr_p[3]),wr_p[2:0]});  // full condition
 always @ (posedge clk or posedge rst)
 begin 
 if(rst) begin wr_p <= 0; rd_p <= 0; end 
 else 
 begin if(wr && !full) 
       begin  mem[wr_p] <= data_in ;
              wr_p <= wr_p + 1; 
        end 

       if(rd && !empty) 
       begin 
       data_out <= mem[rd_p]; 
       rd_p <= rd_p +1; 
       end
 end 
 end  

endmodule



