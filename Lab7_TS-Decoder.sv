`timescale 1ns / 1ps

module Lab7_TSDecoder(
    input [1:0] I,
    output [3:0] D,
    input C
    );
    
    wire s0,s1,s2,s3;
    //a not gate, named inverter1, output named I0bar, takes input from the 0th value in I bus
    not inv1 (I0bar, I[0]);
    not inv2 (I1bar, I[1]);
    
    and A1(s0, I0bar, I1bar);
    
    and A2(s1, I[0], I1bar);
    and A3(s2, I0bar, I[1]);
    and A4(s3, I[0], I[1]);
    
    bufif1 (D[0], s0, C);
    bufif1 (D[1], s1, C);
    bufif1 (D[2], s2, C);
    bufif1 (D[3], s3, C);
    
endmodule
