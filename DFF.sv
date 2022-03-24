`timescale 1ns / 1ps

module DFF(D, clr, clk, ld, st, Q, Qbar);

    input D, clr, clk, st, ld;
    output reg Q, Qbar;
        
    always_ff @(posedge clk)
    //always ff is a procedure for describing edge triggered clk
    // the stuff in the parentheses is called the sensitivity
    // the always procedure will be activated if sensitivity changes, otherwise it will not do the always clk
    // posedge is built into verilog and means positive edge of the clock (rising edge)
    begin
    
    if(clr) begin   Q = 1'b0; end
        else if(st) begin   Q = 1'b1; end
        else if(ld) begin   Q = D; end
    
    else begin
        Q <= Q; end //<= is an assignmnet operator - it is unblocking
    
    Qbar <= ~Q;     
    end
endmodule