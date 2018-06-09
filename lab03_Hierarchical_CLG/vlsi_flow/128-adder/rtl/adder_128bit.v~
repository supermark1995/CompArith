module adder_128bit (A,B,Sum,Cout,enable,clk);

input 	[127:0] 	A;
input	[127:0]		B;
input 			enable;
input 			clk;
output	[127:0]		Sum;
output			Cout;

reg	[127:0]		R_A;
reg	[127:0]		R_B;
reg			R_enable;
reg	[127:0]		Sum;
reg			Cout;

wire			Carry;
wire			Carry_select;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire	[127:0]		S;
wire	[127:64]	S_C0;
wire	[127:64]	S_C1;


CLA_64bit CLA_LSB (
	.X(R_A[63:0]),
	.Y(R_B[63:0]),
	.Cin(1'b0),
	.Cout(Carry_select),
	.S(S[63:0]),
	.G(),
	.P()	
);

CLA_64bit CLA_MSB_C0 (
	.X(R_A[127:64]),
	.Y(R_B[127:64]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.S(S_C0),
	.G(),
	.P()	
);

CLA_64bit CLA_LSB_C1 (
	.X(R_A[127:64]),
	.Y(R_B[127:64]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.S(S_C1),
	.G(),
	.P()	
);

always @(posedge clk) begin
	R_A <= A;
	R_B <= B;
	R_enable <= enable;
end

assign S[127:64] = (Carry_select)?S_C1:S_C0;
assign Carry = (Carry_select)?Carry_out_C1:Carry_out_C0;
/*always @(*) begin
	case(Carry_select)
		0: begin
			S[127:64] = S_C0;
			Carry = Carry_out_C0;
		end
		1: begin
			S[127:64] = S_C1;
			Carry = Carry_out_C1;
		end
	endcase
end*///


always @(posedge clk) begin
	if(R_enable) begin
		Sum <= S;
		Cout <= Carry;
	end
	else begin
		Sum <= Sum;
		Cout <= Cout;
	end
end


endmodule
