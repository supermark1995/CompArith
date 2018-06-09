module CLA_4bit (X,Y,Cin,P,G,S,Cout);

input	[3:0]		X;
input	[3:0]		Y;
input			Cin;
output	[3:0]		S;
output			Cout;
output			P;
output			G;

wire	[4:1]		C;
wire	[3:0]		Gen;
wire	[3:0]		Prop;



Full_Adder FA0(
	.X(X[0]),
	.Y(Y[0]),
	.Cin(Cin),
	.Cout(),
	.Sum(S[0]),
	.Prop(Prop[0]),
	.Gen(Gen[0])
);

genvar i;
generate
	for(i = 1; i < 4; i = i + 1) begin: CLA_4bit
		Full_Adder FA(
			.X(X[i]),
			.Y(Y[i]),
			.Cin(C[i]),
			.Cout(),
			.Sum(S[i]),
			.Prop(Prop[i]),
			.Gen(Gen[i])
		);		
	end
endgenerate

CLG_4bit CLG(
	.P(Prop),
	.G(Gen),
	.Cin(Cin),
	.Cout(C[4:1]),
	.P_out(P),
	.G_out(G)
);


assign Cout = C[4]; 

endmodule




