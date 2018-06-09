module Prefix_Sum_CLG_128bit (P,G,Cin,Cout);

input	[127:0]		P;
input	[127:0]		G;
input 			Cin;
output	[128:1]		Cout;

wire	[127:0]		P_out;
wire	[127:0]		G_out;


Kogge_Stone_128bit KS128(
	.P(P),
	.G(G),
	.Pout(P_out),
	.Gout(G_out)
);


Carry_Recur_Gen # (.size(128)) 
CRG(
	.P_in(P_out),
	.G_in(G_out),
	.Cin(Cin),
	.Cout(Cout)
);


endmodule
