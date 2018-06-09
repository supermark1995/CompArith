module CLA_64bit (X,Y,Cin,Cout,S,G,P);

input	[63:0]		X;
input	[63:0]		Y;
input			Cin;
output	[63:0]		S;
output			Cout;
output			G;
output			P;

wire	[3:0]		Gen;
wire	[3:0]		Prop;
wire 	[4:1]		C;


CLA_16bit CLA_16x0(
			.X(X[15:0]),
			.Y(Y[15:0]),
			.Cin(Cin),
			.S(S[15:0]),
			.Cout(),			
			.P(Prop[0]),
			.G(Gen[0])
);

genvar i;
generate
	for(i = 1; i < 4; i = i + 1) begin: CLA_16bit
		CLA_16bit CLA_16x (
			.X(X[16*i +: 16]),
			.Y(Y[16*i +: 16]),
			.Cin(C[i]),
			.S(S[16*i +: 16]),
			.Cout(),			
			.P(Prop[i]),
			.G(Gen[i])
		);
	end
endgenerate

CLG_4bit CLG (
	.P(Prop),
	.G(Gen),
	.Cin(Cin),
	.Cout(C),
	.P_out(P),
	.G_out(G)
);

assign Cout = C[4];

endmodule
