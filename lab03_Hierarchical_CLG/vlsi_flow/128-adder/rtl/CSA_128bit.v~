module CSA_128bit (X,Y,Cin,Cout,Sum);

input 	[127:0]		X;
input 	[127:0]		Y;
input 			Cin;
output 			Cout;
output	[127:0]		Sum;



wire	[63:0]		S_C1;
wire	[63:0]		S_C0;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire			Cin_select;



CSA_64bit CSA_64bit_LSB(
	.X(X[63:0]),
	.Y(Y[63:0]),
	.Cin(Cin),
	.Cout(Cin_select),
	.Sum(Sum[63:0])
);

CSA_64bit CSA_64bit_MSB_C0(
	.X(X[127:64]),
	.Y(Y[127:64]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.Sum(S_C0)
);


CSA_64bit CSA_64bit_MSB_C1(
	.X(X[127:64]),
	.Y(Y[127:64]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.Sum(S_C1)
);


assign Sum[127:64] = (Cin_select)? S_C1 : S_C0;
assign Cout = (Cin_select)? Carry_out_C1 : Carry_out_C0; 

endmodule	
