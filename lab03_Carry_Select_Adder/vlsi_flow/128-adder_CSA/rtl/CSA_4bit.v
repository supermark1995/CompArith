module CSA_4bit (X,Y,Cin,Cout,Sum);

input 	[3:0]		X;
input 	[3:0]		Y;
input 			Cin;
output 			Cout;
output	[3:0]		Sum;



wire	[1:0]		S_C1;
wire	[1:0]		S_C0;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire			Cin_select;



CSA_2bit CSA_2bit_LSB(
	.X(X[1:0]),
	.Y(Y[1:0]),
	.Cin(Cin),
	.Cout(Cin_select),
	.Sum(Sum[1:0])
);

CSA_2bit CSA_2bit_MSB_C0(
	.X(X[3:2]),
	.Y(Y[3:2]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.Sum(S_C0)
);


CSA_2bit CSA_2bit_MSB_C1(
	.X(X[3:2]),
	.Y(Y[3:2]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.Sum(S_C1)
);


assign Sum[3:2] = (Cin_select)? S_C1 : S_C0;
assign Cout = (Cin_select)? Carry_out_C1 : Carry_out_C0; 

endmodule	















