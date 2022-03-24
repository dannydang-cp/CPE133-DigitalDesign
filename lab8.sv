`timescale 1ns / 1ps

module lab8(D, clr, clk, ld, st, Q, Qbar);
    parameter N = 3;
    input [N:0]D;
    input clr, clk, ld, st;
    output reg [N:0]Q, Qbar;
        
    DFF   DF0(.D(D[0]), .clr(clr), .clk(clk), .ld(ld), .st(st), .Q(Q[0]), .Qbar(Qbar[0]));
    DFF   DF1(.D(D[1]), .clr(clr), .clk(clk), .ld(ld), .st(st), .Q(Q[1]), .Qbar(Qbar[1]));
    DFF   DF2(.D(D[2]), .clr(clr), .clk(clk), .ld(ld), .st(st), .Q(Q[2]), .Qbar(Qbar[2]));
    DFF   DF3(.D(D[3]), .clr(clr), .clk(clk), .ld(ld), .st(st), .Q(Q[3]), .Qbar(Qbar[3]));
endmodule
