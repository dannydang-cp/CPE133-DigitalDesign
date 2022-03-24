`timescale 1ns / 1ps

module statemach_finalproj(op, op2, clk, clr, Q, Qb, F, Z);
input logic clk, op, op2, clr, Z;
output logic [1:0] Q, Qb;
output logic [3:0] F;

wire [1:0] J, K, D;
wire clkslow;
//assign J[0] = 1'b1;
//assign K[0] = 1'b1;
//buf b0(J[1], Q[0]);
//buf b1(K[1], Q[0]);

lab11_slowclock s10(.clk(clk), .cnt(clkslow));
or(D[0], ~Q[0], ~op2 && Z && Q[1]);
or(D[1], ~Q[1] && Q[0], ~op2 && Z && Q[0], Q[1] && ~Q[0]);
lab9_JKFF   JK0( .J(D[0]), .K(~D[0]), .clk(clkslow), .clr(clr), .Q(Q[0]), .Qbar(Qb[0]));
lab9_JKFF   JK1( .J(D[1]), .K(~D[1]), .clk(clkslow), .clr(clr), .Q(Q[1]), .Qbar(Qb[1]));

//and AH(H, op, Q[1], Qb[0]);

Lab7_TSDecoder D0(.I(Q), .C(1'b1), .D(F));
endmodule
