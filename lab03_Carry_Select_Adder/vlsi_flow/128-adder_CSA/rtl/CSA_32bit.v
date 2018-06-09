module CSA_32bit (X,Y,Cin,Cout,Sum);

input 	[31:0]		X;
input 	[31:0]		Y;
input 			Cin;
output 			Cout;
output	[31:0]		Sum;



wire	[15:0]		S_C1;
wire	[15:0]		S_C0;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire			Cin_select;



CSA_16bit CSA_16bit_LSB(
	.X(X[15:0]),
	.Y(Y[15:0]),
	.Cin(Cin),
	.Cout(Cin_select),
	.Sum(Sum[15:0])
);

CSA_16bit CSA_16bit_MSB_C0(
	.X(X[31:16]),
	.Y(Y[31:16]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.Sum(S_C0)
);


CSA_16bit CSA_16bit_MSB_C1(
	.X(X[31:16]),
	.Y(Y[31:16]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.Sum(S_C1)
);


assign Sum[31:16] = (Cin_select)? S_C1 : S_C0;
assign Cout = (Cin_select)? Carry_out_C1 : Carry_out_C0; 

endmodule	
