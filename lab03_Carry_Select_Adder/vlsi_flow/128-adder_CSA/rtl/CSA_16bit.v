module CSA_16bit (X,Y,Cin,Cout,Sum);

input 	[15:0]		X;
input 	[15:0]		Y;
input 			Cin;
output 			Cout;
output	[15:0]		Sum;



wire	[7:0]		S_C1;
wire	[7:0]		S_C0;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire			Cin_select;



CSA_8bit CSA_8bit_LSB(
	.X(X[7:0]),
	.Y(Y[7:0]),
	.Cin(Cin),
	.Cout(Cin_select),
	.Sum(Sum[7:0])
);

CSA_8bit CSA_8bit_MSB_C0(
	.X(X[15:8]),
	.Y(Y[15:8]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.Sum(S_C0)
);


CSA_8bit CSA_8bit_MSB_C1(
	.X(X[15:8]),
	.Y(Y[15:8]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.Sum(S_C1)
);


assign Sum[15:8] = (Cin_select)? S_C1 : S_C0;
assign Cout = (Cin_select)? Carry_out_C1 : Carry_out_C0; 

endmodule	
