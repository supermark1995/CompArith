module adder_4bit_CSA (A,B,enable,clk,Sum,Cout);

input	[3:0]		A;
input	[3:0]		B;
input 			enable;
input			clk;

output			Cout;
output	[3:0]		Sum;

wire			Carry;
wire	[3:0]		S;

reg			R_enable;
reg	[3:0]		R_A;
reg	[3:0]		R_B;

reg	[3:0]		Sum;
reg			Cout;



always @(posedge clk) begin
	R_A <= A;
	R_B <= B;
	R_enable <= enable;
end



CSA_4bit adder_4bit (
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
