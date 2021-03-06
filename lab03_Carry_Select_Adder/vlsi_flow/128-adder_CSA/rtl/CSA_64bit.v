module CSA_64bit (X,Y,Cin,Cout,Sum);

input 	[63:0]		X;
input 	[63:0]		Y;
input 			Cin;
output 			Cout;
output	[63:0]		Sum;



wire	[31:0]		S_C1;
wire	[31:0]		S_C0;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire			Cin_select;



CSA_32bit CSA_32bit_LSB(
	.X(X[31:0]),
	.Y(Y[31:0]),
	.Cin(Cin),
	.Cout(Cin_select),
	.Sum(Sum[31:0])
);

CSA_32bit CSA_32bit_MSB_C0(
	.X(X[63:32]),
	.Y(Y[63:32]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.Sum(S_C0)
);


CSA_32bit CSA_32bit_MSB_C1(
	.X(X[63:32]),
	.Y(Y[63:32]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.Sum(S_C1)
);


assign Sum[63:32] = (Cin_select)? S_C1 : S_C0;
assign Cout = (Cin_select)? Carry_out_C1 : Carry_out_C0; 

endmodule	
