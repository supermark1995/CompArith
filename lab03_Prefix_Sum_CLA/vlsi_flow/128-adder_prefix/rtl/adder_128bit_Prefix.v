module adder_128bit_Prefix (A,B,enable,Sum,Cout,clk);

input	[127:0]		A;
input	[127:0]		B;
input 			enable;
input			clk;

output	[127:0]		Sum;
output			Cout;


reg	[127:0]		R_A;
reg	[127:0]		R_B;
reg			R_enable;
reg	[127:0]		Sum;
reg			Cout;

wire	[127:0]		S;
wire			Carry;


always @(posedge clk) begin
	R_A <= A;
	R_B <= B;
	R_enable <= enable;
end


Prefix_Sum_CLA_128bit Prefix_CLA(
	.X(R_A),
	.Y(R_B),
	.Cin(1'b0),
	.Sum(S),
	.Cout(Carry)
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
