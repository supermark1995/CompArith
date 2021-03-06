module adder_16bit_CSA (A,B,enable,clk,Sum,Cout);

input	[15:0]		A;
input	[15:0]		B;
input 			enable;
input			clk;

output			Cout;
output	[15:0]		Sum;

wire			Carry;
wire	[15:0]		S;

reg			R_enable;
reg	[15:0]		R_A;
reg	[15:0]		R_B;

reg	[15:0]		Sum;
reg			Cout;



always @(posedge clk) begin
	R_A <= A;
	R_B <= B;
	R_enable <= enable;
end



CSA_16bit adder_16bit (
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
