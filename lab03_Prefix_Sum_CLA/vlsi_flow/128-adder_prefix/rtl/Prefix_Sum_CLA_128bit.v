module Prefix_Sum_CLA_128bit (X,Y,Cin,Sum,Cout);

input	[127:0]		X;
input	[127:0]		Y;
input			Cin;

output	[127:0]		Sum;
output			Cout;

wire	[127:0]		P;
wire	[127:0]		G;
wire	[128:1]		Carry;



Prefix_Sum_CLG_128bit Prefix_CLG(
	.P(P),
	.G(G),
	.Cin(Cin),
	.Cout(Carry)
);


Full_Adder FA0(
	.X(X[0]),
	.Y(Y[0]),
	.Cin(Cin),
	.Cout(),
	.Sum(Sum[0]),
	.Prop(P[0]),
	.Gen(G[0])
);


genvar i;
generate 
	for(i = 1; i < 128; i = i + 1) begin: Prefix_CLA
		Full_Adder FA(
			.X(X[i]),
			.Y(Y[i]),
			.Cin(Carry[i]),
			.Cout(),
			.Sum(Sum[i]),
			.Prop(P[i]),
			.Gen(G[i])
		);	
	end
endgenerate


assign Cout = Carry[128];

endmodule







