module Final_7seg(clk, inpt_x,an,seg );
input clk;
input [3:0]inpt_x;
output [3:0]an;
output reg [6:0] seg;
reg [3:0]digit, an;
reg [18:0]seven_seg_count = 19'h00000;

always_comb begin
   case (digit)  
   4'b0001: seg = 7'b1111001;
   4'b0010: seg = 7'b0100100;
   4'b0011: seg = 7'b0110000;
   4'b0100: seg = 7'b0011001;
   4'b0101: seg = 7'b0010010;
   4'b0110: seg = 7'b0000010;
   4'b0111: seg = 7'b1111000;
   4'b1000: seg = 7'b0000000;
   4'b1001: seg = 7'b0010000;
   4'b1010: seg = 7'b0001000;
   4'b1011: seg = 7'b0000011;
   4'b1100: seg = 7'b1000110;
   4'b1101: seg = 7'b0100001;
   4'b1110: seg = 7'b0000110;
   4'b1111: seg = 7'b0001110;
   default: seg = 7'b1000000;
   endcase
end
   
always @ (posedge clk) begin
   if (seven_seg_count < 19'h 10000) begin   
      digit = inpt_x % 10;
      an = 4'b1110; 
   end
               
   else if (seven_seg_count < 19'h 20000) begin
      digit = (inpt_x/10) % 10;
      an = 4'b1101;
   end
   
   else if (seven_seg_count < 19'h 30000) begin
      digit = (inpt_x/100) % 10;
      an = 4'b1011;
   end    

   else if (seven_seg_count < 19'h 40000) begin
      digit = (inpt_x/1000) % 10; 
      an = 4'b0111;
   end

   seven_seg_count = seven_seg_count +1; 

end 

endmodule
   
