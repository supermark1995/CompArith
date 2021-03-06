module CSA_8bit (X,Y,Cin,Cout,Sum);

input 	[7:0]		X;
input 	[7:0]		Y;
input 			Cin;
output 			Cout;
output	[7:0]		Sum;



wire	[3:0]		S_C1;
wire	[3:0]		S_C0;
wire			Carry_out_C0;
wire			Carry_out_C1;
wire			Cin_select;



CSA_4bit CSA_4bit_LSB(
	.X(X[3:0]),
	.Y(Y[3:0]),
	.Cin(Cin),
	.Cout(Cin_select),
	.Sum(Sum[3:0])
);

CSA_4bit CSA_4bit_MSB_C0(
	.X(X[7:4]),
	.Y(Y[7:4]),
	.Cin(1'b0),
	.Cout(Carry_out_C0),
	.Sum(S_C0)
);


CSA_4bit CSA_4bit_MSB_C1(
	.X(X[7:4]),
	.Y(Y[7:4]),
	.Cin(1'b1),
	.Cout(Carry_out_C1),
	.Sum(S_C1)
);


assign Sum[7:4] = (Cin_select)? S_C1 : S_C0;
assign Cout = (Cin_select)? Carry_out_C1 : Carry_out_C0; 

endmodule	
