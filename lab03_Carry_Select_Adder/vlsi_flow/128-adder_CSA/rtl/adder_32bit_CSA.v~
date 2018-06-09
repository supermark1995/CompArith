module adder_32bit_CSA (A,B,enable,clk,Sum,Cout);

input	[31:0]		A;
input	[31:0]		B;
input 			enable;
input			clk;

output			Cout;
output	[31:0]		Sum;

wire			Carry;
wire	[31:0]		S;

reg			R_enable;
reg	[31:0]		R_A;
reg	[31:0]		R_B;

reg	[31:0]		Sum;
reg			Cout;



always @(posedge clk) begin
	R_A <= A;
	R_B <= B;
	R_enable <= enable;
end



CSA_32bit adder_32bit (
	.X(R_A),
	.Y(R_B),
	.Cin(1'b0),
	.Cout(Carry),
	.Sum(S)
);


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
