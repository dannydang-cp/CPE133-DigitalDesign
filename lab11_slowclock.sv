`timescale 1ns / 1ns
module lab11_slowclock(clk, cnt);
    parameter N = 23; //very long counter to slow down the clock from 10 MHz to mhz
    input clk;  
    output reg cnt;
    reg [N:0]s;
    
    initial begin s= 0; end
    always_ff @ (posedge clk)begin
        ++s;
        $display ("value of s = %b", s);//if you want to display the value of s; if not take it out
        cnt <= s[N];    //This is Non-blocking statement (<=), the execution depends on event and concurrent, 
                        //same as VHDL; you can use = here instead of <=; = will be blocking.  See class notes
    end
endmodule
