module adder_4bit (A,B,Sum,Cout,enable,clk);

input	[3:0]		A;
input	[3:0]		B;
input 			enable;
input			clk;
output	[3:0]		Sum;
output			Cout;

wire	[3:0]		S;
wire			Carry;

reg	[3:0]		R_A;
reg	[3:0]		R_B;
reg	[3:0]		Sum;
reg			Cout;
reg			R_enable;
 

CLA_4bit CLA(
	.X(R_A),
	.Y(R_B),
	.Cin(1'b0),
	.S(S),
	.Cout(Carry),
	.P(),
	.G()
);


always @(posedge clk) begin
	R_enable <= enable;
	R_A <= A;
	R_B <= B;
end

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
