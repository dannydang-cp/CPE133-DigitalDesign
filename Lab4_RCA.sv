`timescale 1ns / 1ps

module Lab4_add(
    input  A,
    input B,
    input C,
    output S,
    output O
    );
    //code here
    assign S = A ^ B ^ C;
    assign O = (A & B) | (B & C) | (A & C);
endmodule

/*module Lab4_RCA(
    input [N:0] X, input [N:0] Y,
    output [N:0] sum, output carout);
    parameter N = 3;   
    wire [N:0]cr;
    Lab4_add A0(.A(X[0]), .B(Y[0]), .C(1'b0), .S(sum[0]), .O(cr[0]));
    Lab4_add A1(.A(X[1]), .B(Y[1]), .C(cr[0]), .S(sum[1]), .O(cr[1]));
    Lab4_add A2(.A(X[2]), .B(Y[2]), .C(cr[1]), .S(sum[2]), .O(cr[2]));
    Lab4_add A3(.A(X[3]), .B(Y[3]), .C(cr[2]), .S(sum[3]), .O(carout));
    
endmodule*/

module Lab4_RCA(
    input [N:0] X,
    input [N:0] Y,
    input ctrl,
    
    output [N:0] sum,
    output carout
    );
    
    
    parameter N = 3;
    wire [N:0] cr, xn;
        
    xor xn0(xn[0], X[0], ctrl);
    xor xn1(xn[1], X[1], ctrl);
    xor xn2(xn[2], X[2], ctrl);
    xor xn3(xn[3], X[3], ctrl);
    
    Lab4_add A0(.A(xn[0]), .B(Y[0]), .C(ctrl), .S(sum[0]), .O(cr[0]));
    Lab4_add A1(.A(xn[1]), .B(Y[1]), .C(cr[0]), .S(sum[1]), .O(cr[1]));
    Lab4_add A2(.A(xn[2]), .B(Y[2]), .C(cr[1]), .S(sum[2]), .O(cr[2]));
    Lab4_add A3(.A(xn[3]), .B(Y[3]), .C(cr[2]), .S(sum[3]), .O(carout));

endmodule
