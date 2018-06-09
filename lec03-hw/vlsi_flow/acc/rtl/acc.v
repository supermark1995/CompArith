module acc (enable, data_in1 , data_in2 , data_out, reset, clk , data_cin);
input				data_cin;
input				enable;
input		[127:0]		data_in1;
input		[127:0]		data_in2;
output		[128:0]		data_out;
input				reset;
input				clk;

reg				R_cin;
reg		[127:0]		R_data1;
reg		[127:0]		R_data2;
reg		[31:0]		R_dataP;
reg		[31:0]		R_dataG;
reg				R_enable;
reg		[128:0]		data_out;
reg		[8:0]		R_cin_array;
wire		[127:0]		data_P;
wire		[127:0]		data_G;
integer				i;
always @(posedge clk) begin
	R_enable <= (reset)? 1'b0	: enable;
	R_data1  <= (reset)? 127'b0	: data_in1;
	R_data2  <= (reset)? 127'b0	: data_in2;
	R_cin	 <= (reset)? 1'b0	: data_cin;
	
end
assign data_P= R_data1^R_data2;
assign data_G= R_data1&R_data2;


always @(posedge clk) begin
	if (reset)
		data_out <= 129'b0;
	else if (R_enable) begin

	for(i = 0;i<32;i=i+1)begin
		//g3,0 =g3+g2p3+g1p3p2+g0p3p2p1
		R_dataG[i] = data_G[i*4+3] | 
				data_G[i*4+2]&data_P[i*4+3] | 
				data_G[i*4+1]&data_P[i*4+3]&data_P[i*4+2] | 
				data_G[i*4]&data_P[i*4+3]&data_P[i*4+2]&data_P[i*4+1];
			//p3,0 =p3p2p1p0
		R_dataP[i] = data_P[i*4+3]&data_P[i*4+2]&data_P[i*4+1]&data_P[i*4];
	end

	R_cin_array[0] = R_cin;
	
	//g15,12+g11,8p15,12+g7,4p15,12p11,8+g3,0p15,12p11,8p7,4p3,0+C0p15,12p11,8p7,4p3,0
	R_cin_array[1] = R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin;
	
	R_cin_array[2] = R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin);

	R_cin_array[3] = R_dataG[11] | R_dataP[11]&R_dataG[10] | R_dataP[11]&R_dataP[10]&R_dataG[9] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataG[8] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataP[8]&
			(R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin));

	R_cin_array[4] = R_dataG[15] | R_dataP[15]&R_dataG[14] | R_dataP[15]&R_dataP[14]&R_dataG[13] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataG[12] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataP[12]&
			(R_dataG[11] | R_dataP[11]&R_dataG[10] | R_dataP[11]&R_dataP[10]&R_dataG[9] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataG[8] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataP[8]&
			(R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin)));

	R_cin_array[5] = R_dataG[19] | R_dataP[19]&R_dataG[18] | R_dataP[19]&R_dataP[18]&R_dataG[17] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataG[16] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataP[16]&
			(R_dataG[15] | R_dataP[15]&R_dataG[14] | R_dataP[15]&R_dataP[14]&R_dataG[13] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataG[12] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataP[12]&
			(R_dataG[11] | R_dataP[11]&R_dataG[10] | R_dataP[11]&R_dataP[10]&R_dataG[9] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataG[8] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataP[8]&
			(R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin))));

	R_cin_array[6] = R_dataG[23] | R_dataP[23]&R_dataG[22] | R_dataP[23]&R_dataP[22]&R_dataG[21] | R_dataP[23]&R_dataP[22]&R_dataP[21]&R_dataG[20] | R_dataP[23]&R_dataP[22]&R_dataP[21]&R_dataP[20]&
			(R_dataG[19] | R_dataP[19]&R_dataG[18] | R_dataP[19]&R_dataP[18]&R_dataG[17] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataG[16] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataP[16]&
			(R_dataG[15] | R_dataP[15]&R_dataG[14] | R_dataP[15]&R_dataP[14]&R_dataG[13] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataG[12] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataP[12]&
			(R_dataG[11] | R_dataP[11]&R_dataG[10] | R_dataP[11]&R_dataP[10]&R_dataG[9] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataG[8] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataP[8]&
			(R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin)))));

	R_cin_array[7] = R_dataG[27] | R_dataP[27]&R_dataG[26] | R_dataP[27]&R_dataP[26]&R_dataG[25] | R_dataP[27]&R_dataP[26]&R_dataP[25]&R_dataG[24] | R_dataP[27]&R_dataP[26]&R_dataP[25]&R_dataP[24]&
			(R_dataG[23] | R_dataP[23]&R_dataG[22] | R_dataP[23]&R_dataP[22]&R_dataG[21] | R_dataP[23]&R_dataP[22]&R_dataP[21]&R_dataG[20] | R_dataP[23]&R_dataP[22]&R_dataP[21]&R_dataP[20]&
			(R_dataG[19] | R_dataP[19]&R_dataG[18] | R_dataP[19]&R_dataP[18]&R_dataG[17] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataG[16] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataP[16]&
			(R_dataG[15] | R_dataP[15]&R_dataG[14] | R_dataP[15]&R_dataP[14]&R_dataG[13] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataG[12] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataP[12]&
			(R_dataG[11] | R_dataP[11]&R_dataG[10] | R_dataP[11]&R_dataP[10]&R_dataG[9] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataG[8] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataP[8]&
			(R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin))))));

	R_cin_array[8] = R_dataG[31] | R_dataP[31]&R_dataG[30] | R_dataP[31]&R_dataP[30]&R_dataG[29] | R_dataP[31]&R_dataP[30]&R_dataP[29]&R_dataG[28] | R_dataP[31]&R_dataP[30]&R_dataP[29]&R_dataP[28]&
			(R_dataG[27] | R_dataP[27]&R_dataG[26] | R_dataP[27]&R_dataP[26]&R_dataG[25] | R_dataP[27]&R_dataP[26]&R_dataP[25]&R_dataG[24] | R_dataP[27]&R_dataP[26]&R_dataP[25]&R_dataP[24]&
			(R_dataG[23] | R_dataP[23]&R_dataG[22] | R_dataP[23]&R_dataP[22]&R_dataG[21] | R_dataP[23]&R_dataP[22]&R_dataP[21]&R_dataG[20] | R_dataP[23]&R_dataP[22]&R_dataP[21]&R_dataP[20]&
			(R_dataG[19] | R_dataP[19]&R_dataG[18] | R_dataP[19]&R_dataP[18]&R_dataG[17] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataG[16] | R_dataP[19]&R_dataP[18]&R_dataP[17]&R_dataP[16]&
			(R_dataG[15] | R_dataP[15]&R_dataG[14] | R_dataP[15]&R_dataP[14]&R_dataG[13] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataG[12] | R_dataP[15]&R_dataP[14]&R_dataP[13]&R_dataP[12]&
			(R_dataG[11] | R_dataP[11]&R_dataG[10] | R_dataP[11]&R_dataP[10]&R_dataG[9] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataG[8] | R_dataP[11]&R_dataP[10]&R_dataP[9]&R_dataP[8]&
			(R_dataG[7] | R_dataP[7]&R_dataG[6] | R_dataP[7]&R_dataP[6]&R_dataG[5] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataG[4] | R_dataP[7]&R_dataP[6]&R_dataP[5]&R_dataP[4]&
			(R_dataG[3] | R_dataP[3]&R_dataG[2] | R_dataP[3]&R_dataP[2]&R_dataG[1] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataG[0] | R_dataP[3]&R_dataP[2]&R_dataP[1]&R_dataP[0]&R_cin)))))));

	for(i = 0;i<8;i=i+1)begin

		data_out[i*16+0] <= (R_data1[i*16+0]^R_data2[i*16+0])^R_cin_array[i];
					

		data_out[i*16+1] <= (R_data1[i*16+1]^R_data2[i*16+1])^
					(data_G[i*16+0] | 
					data_P[i*16+0]&
					R_cin_array[i]);

		data_out[i*16+2] <= (R_data1[i*16+2]^R_data2[i*16+2])^	
					(data_G[i*16+1] | 
					data_G[i*16+0]&data_P[i*16+1] | 
					data_P[i*16+0]&data_P[i*16+1]&
					R_cin_array[i]);

		data_out[i*16+3] <= (R_data1[i*16+3]^R_data2[i*16+3])^
					(data_G[i*16+2] | data_G[i*16+1]&data_P[i*16+2] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&
					R_cin_array[i]);

		data_out[i*16+4] <= (R_data1[i*16+4]^R_data2[i*16+4])^	
					(data_G[i*16+3] | 
					data_G[i*16+2]&data_P[i*16+3] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+3]&data_P[i*16+3] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&
					R_cin_array[i]);

		data_out[i*16+5] <= (R_data1[i*16+5]^R_data2[i*16+5])^	
					(data_G[i*16+4] | 
					data_G[i*16+3]&data_P[i*16+4] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+4]&data_P[i*16+4] |
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+4]&data_P[i*16+4] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					R_cin_array[i]);

		data_out[i*16+6] <= (R_data1[i*16+6]^R_data2[i*16+6])^	
					(data_G[i*16+5] | 
					data_G[i*16+4]&data_P[i*16+5] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+5]&data_P[i*16+5] |
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					R_cin_array[i]);

		data_out[i*16+7] <= (R_data1[i*16+7]^R_data2[i*16+7])^
					(data_G[i*16+6] | 
					data_G[i*16+5]&data_P[i*16+6] | 
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+6]&data_P[i*16+6] |
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&
					R_cin_array[i]);

		data_out[i*16+8] <= (R_data1[i*16+8]^R_data2[i*16+8])^
					(data_G[i*16+7] | 
					data_G[i*16+6]&data_P[i*16+7] | 
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7] | 
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7] |
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7] |
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7] |
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&
					R_cin_array[i]);

		data_out[i*16+9] <= (R_data1[i*16+9]^R_data2[i*16+9])^
					(data_G[i*16+8] | 
					data_G[i*16+7]&data_P[i*16+8] | 
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8] | 
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8] |
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8] |
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&
					R_cin_array[i]);

		data_out[i*16+10] <= (R_data1[i*16+10]^R_data2[i*16+10])^
					(data_G[i*16+9] | 
					data_G[i*16+8]&data_P[i*16+9] | 
					data_G[i*16+7]&data_P[i*16+8]&data_P[i*16+9] | 
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]|
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9] | 
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9] |
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9] |
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&
					R_cin_array[i]);

		data_out[i*16+11] <= (R_data1[i*16+11]^R_data2[i*16+11])^
					(data_G[i*16+10] | 
					data_G[i*16+9]&data_P[i*16+10] | 
					data_G[i*16+8]&data_P[i*16+9]&data_P[i*16+10] | 
					data_G[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]|
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] | 
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] | 
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] |
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] |
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&R_cin_array[i]);

		data_out[i*16+12] <= (R_data1[i*16+12]^R_data2[i*16+12])^
					(data_G[i*16+11] | 
					data_G[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]|
					data_G[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] |
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] |
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&R_cin_array[i]);

		data_out[i*16+13] <= (R_data1[i*16+13]^R_data2[i*16+13])^
					(data_G[i*16+12] | 
					data_G[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]|
					data_G[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] |
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] |
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&
					data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&R_cin_array[i]);

		data_out[i*16+14] <= (R_data1[i*16+14]^R_data2[i*16+14])^
					(data_G[i*16+13] | 
					data_G[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] |
					data_G[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] |
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] |
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&
					data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&
					data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&
					data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&R_cin_array[i]);

		data_out[i*16+15] <= (R_data1[i*16+15]^R_data2[i*16+15])^
					(data_G[i*16+14] | 
					data_G[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] |
					data_G[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] |
					data_G[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] |
					data_G[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&
					data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&data_P[i*16+7]&
					data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&data_P[i*16+6]&
					data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_G[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14] | 
					data_P[i*16+0]&data_P[i*16+1]&data_P[i*16+2]&data_P[i*16+3]&data_P[i*16+4]&data_P[i*16+5]&
					data_P[i*16+6]&data_P[i*16+7]&data_P[i*16+8]&data_P[i*16+9]&data_P[i*16+10]&data_P[i*16+11]&data_P[i*16+12]&data_P[i*16+13]&data_P[i*16+14]&R_cin_array[i]);


	end

		data_out[128]<=R_cin_array[8];
	end
	else
		data_out <= data_out;

end

endmodule

