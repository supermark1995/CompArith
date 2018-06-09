module adder_128bit_CSA (A,B,enable,clk,Sum,Cout);

input	[127:0]		A;
input	[127:0]		B;
input 			enable;
input			clk;

output			Cout;
output	[127:0]		Sum;

wire			Carry;
wire	[127:0]		S;

reg			R_enable;
reg	[127:0]		R_A;
reg	[127:0]		R_B;

reg	[127:0]		Sum;
reg			Cout;



always @(posedge clk) begin
	R_A <= A;
	R_B <= B;
	R_enable <= enable;
end



CSA_128bit adder_128bit (
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
