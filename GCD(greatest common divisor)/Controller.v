 // controller ...........
module devision_controller(lda,ldb,clrp,incp,selin,lt,gt,eq,clk,data_in,start,done);
 input lt,gt,eq,clk,start;
 input [4:0] data_in;
 output reg  done; 
 output reg lda,ldb,clrp,incp,selin;
 parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
 reg [2:0] state;
 initial state = s0;
 always @(posedge clk)
 begin
  case(state)
  s0:if(start) state <= s1;
  s1: state <= s2;
  s2: begin if(lt) state <= s4;
            else  state <= s3;
    end
  s3: state <= s2; 
  s4: state <= s4; 
  endcase 
 end

 always @(state)
 begin
    lda=0;ldb=0; clrp=0; incp=0; selin=0; //  initially all  value is 0;
  case (state)
  s0:  begin done=0;   end
  s1:  begin ldb=1; clrp=1;  end 
  s2:  begin /*ldb=0; clrp=0;*/ lda=1; end  
  s3:  begin incp=1; lda=1; selin = 1; end
  s4:  begin incp=0; done =1; end 
  default: begin lda=0;ldb=0; clrp=0; incp=0; selin=0; end 
  endcase
 end 
endmodule 
