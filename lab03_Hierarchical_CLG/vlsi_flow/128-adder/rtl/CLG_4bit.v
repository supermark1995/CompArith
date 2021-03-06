module CLG_4bit (P,G,Cin,Cout,P_out,G_out);

input 	[3:0] 		P;
input	[3:0]		G;
input			Cin;
output	[4:1]		Cout;
output			P_out;
output			G_out;

reg	[4:1]		Cout;
reg			P_out;
reg			G_out;



always @(*) begin
	Cout[1] = G[0] | (P[0] & Cin);
	Cout[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
	Cout[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
	Cout[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | 
		(P[3] & P[2] & P[1] & P[0] & Cin);

	P_out = P[3] & P[2] & P[1] & P[0];
	G_out = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
end
endmodule


