module Full_Adder (X,Y,Cin,Cout,Sum,Prop,Gen);

input 			X;
input 			Y;
input 			Cin;
output 			Cout;
output			Sum;
output			Prop;
output			Gen;

reg 			Sum;
reg 			Cout;
reg 			Prop;
reg			Gen;

always @(*) begin
	Sum = X ^ Y ^ Cin;
	Cout = (X & Y) + (X & Cin) + (Y & Cin);
	Prop = X ^ Y;
	Gen = X & Y;
end

endmodule
