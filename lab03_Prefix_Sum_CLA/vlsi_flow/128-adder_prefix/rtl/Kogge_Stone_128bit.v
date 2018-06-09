module Kogge_Stone_128bit (P,G,Pout,Gout);

input 	[127:0]		P;
input	[127:0]		G;
output	[127:0]		Pout;
output	[127:0]		Gout;

reg	[127:0]		P_lv1;
reg	[127:0]		P_lv2;
reg	[127:0]		P_lv3;
reg	[127:0]		P_lv4;
reg	[127:0]		P_lv5;
reg	[127:0]		P_lv6;
reg	[127:0]		P_lv7;

reg	[127:0]		G_lv1;
reg	[127:0]		G_lv2;
reg	[127:0]		G_lv3;
reg	[127:0]		G_lv4;
reg	[127:0]		G_lv5;
reg	[127:0]		G_lv6;
reg	[127:0]		G_lv7;


integer i;

always @(*) begin

	//level 1 init
	P_lv1[0] = P[0];
	G_lv1[0] = G[0];

	//level 1 kogge-stone
	for(i = 1; i < 128; i = i + 1) begin
		P_lv1[i] = P[i] & P[i-1];
		G_lv1[i] = G[i] | (G[i-1] & P[i]);	
	end





	//level 2 init
	for(i = 0; i < 2; i = i + 1) begin
		P_lv2[i] = P_lv1[i];
		G_lv2[i] = G_lv1[i];
	end
	
	//level 2 kogge-stone
	for(i = 2; i < 128; i = i + 1) begin
		P_lv2[i] = P_lv1[i] & P_lv1[i-2];
		G_lv2[i] = G_lv1[i] | (G_lv1[i-2] & P_lv1[i]);
	end
	




	//level 3 init
	for(i = 0; i < 4; i = i + 1) begin
		P_lv3[i] = P_lv2[i];
		G_lv3[i] = G_lv2[i];
	end

	//level 3 kogge-stone
	for(i = 4; i < 128; i = i + 1) begin
		P_lv3[i] = P_lv2[i] & P_lv2[i-4];
		G_lv3[i] = G_lv2[i] | (G_lv2[i-4] & P_lv2[i]);
	end





	//level 4 init
	for(i = 0; i < 8; i = i + 1) begin
		P_lv4[i] = P_lv3[i];
		G_lv4[i] = G_lv3[i];
	end

	//level 4 kogge-stone
	for(i = 8; i < 128; i = i + 1) begin
		P_lv4[i] = P_lv3[i] & P_lv3[i-8];
		G_lv4[i] = G_lv3[i] | (G_lv3[i-8] & P_lv3[i]);
	end





	//level 5 init
	for(i = 0; i < 16; i = i + 1) begin
		P_lv5[i] = P_lv4[i];
		G_lv5[i] = G_lv4[i];
	end

	//level 5 kogge-stone
	for(i = 16; i < 128; i = i + 1) begin
		P_lv5[i] = P_lv4[i] & P_lv4[i-16];
		G_lv5[i] = G_lv4[i] | (G_lv4[i-16] & P_lv4[i]);
	end





	//level 6 init
	for(i = 0; i < 32; i = i + 1) begin
		P_lv6[i] = P_lv5[i];
		G_lv6[i] = G_lv5[i];
	end

	//level 6 kogge-stone
	for(i = 32; i < 128; i = i + 1) begin
		P_lv6[i] = P_lv5[i] & P_lv5[i-32];
		G_lv6[i] = G_lv5[i] | (G_lv5[i-32] & P_lv5[i]);
	end





	//level 7 init
	for(i = 0; i < 64; i = i + 1) begin
		P_lv7[i] = P_lv6[i];
		G_lv7[i] = G_lv6[i];
	end

	//level 7 kogge-stone
	for(i = 64; i < 128; i = i + 1) begin
		P_lv7[i] = P_lv6[i] & P_lv6[i-64];
		G_lv7[i] = G_lv6[i] | (G_lv6[i-64] & P_lv6[i]);
	end



	//answer will be placed at P_level7 and G_level7
end

assign Pout = P_lv7;
assign Gout = G_lv7;


endmodule

