`timescale 1ns / 1ps

module FinalProjectTop(
    input clk, clr, op2, op,
    input [3:0] I,
    output reg [3:0]an, [6:0]seg
    );
    
    wire [3:0]F;
    wire Z;
    wire [3:0]DRout, ACout, ALUout, BUFFout, IREGout;
    
    
    statemach_finalproj state(.op(op), .op2(op2), .clk(clk), .clr(clr), .Q(), .Qb(), .F(F), .Z(Z));
    Lab4_RCA RCA    (.X(DRout), .Y(ACout), .ctrl(op), .sum(ALUout), .carout());
    lab8 DR         (.D(I), .clr(clr), .clk(clk), .ld(F[0]), .st(), .Q(DRout), .Qbar());
    lab8 AC         (.D(BUFFout), .clr(clr), .clk(clk), .ld(F[2]), .st(), .Q(ACout), .Qbar());
    lab8 BUFF       (.D(ALUout), .clr(clr), .clk(clk), .ld(F[1]), .st(), .Q(BUFFout), .Qbar());
    lab8 Ireg       (.D(I), .clr(clr), .clk(clk), .ld(F[0]), .st(), .Q(IREGout), .Qbar());
    Comparator newI (.Z(Z), .A(IREGout), .B(I));
    Final_7seg SevenSeg   (.clk(clk), .inpt_x(BUFFout), .an(an), .seg(seg)) ;

endmodule
