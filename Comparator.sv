`timescale 1ns / 1ps

module Comparator(
    input [3:0] A, B,
    output Z);
    
    wire[3:0]G;
    xnor(G[0], A[0], B[0]);
    xnor(G[1], A[1], B[1]);
    xnor(G[2], A[2], B[2]);
    xnor(G[3], A[3], B[3]);
    and(Z, G[0], G[1], G[2], G[3]);
    
endmodule
