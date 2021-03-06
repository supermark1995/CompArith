module Carry_Recur_Gen (P_in,G_in,Cin,Cout);

parameter size = 128;

input	[size-1:0]	P_in;
input	[size-1:0]	G_in;
input 			Cin;
output	[size:1]	Cout;

genvar i;
generate
	for(i = 0; i < size ; i = i + 1) begin: C_out
		assign Cout[i+1] = G_in[i] | (Cin & P_in[i]);
	end
endgenerate

endmodule
