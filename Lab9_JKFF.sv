`timescale 1ns / 1ps

module lab9_JKFF(
	input J, 
	input K, 
	input clk, 
	input clr,
	output reg Q,
	output reg Qbar
	);

	wire [1:0] JK;
	assign JK = {J,K};

	always_ff @ (posedge clk)
	begin

	if (clr)	
		begin Q = 1'b0; end

	else begin 
		case(JK)
			2'b10: Q = 1'b1;
			2'b01: Q = 1'b0;
			2'b11: Q = ~Q;
			default: Q = Q;
		endcase

	end

	Qbar = ~Q;

	end
endmodule