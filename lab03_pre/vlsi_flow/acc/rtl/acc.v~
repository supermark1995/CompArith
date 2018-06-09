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
reg				R_enable;
reg		[128:0]		data_out;
reg		[127:0]		data_Pprex1;
reg		[127:0]		data_Gprex1;
reg		[127:0]		data_Pprex2;
reg		[127:0]		data_Gprex2;
reg		[127:0]		data_Pprex3;
reg		[127:0]		data_Gprex3;
reg		[127:0]		data_Pprex4;
reg		[127:0]		data_Gprex4;
reg		[127:0]		data_Pprex5;
reg		[127:0]		data_Gprex5;
reg		[127:0]		data_Pprex6;
reg		[127:0]		data_Gprex6;
reg		[127:0]		data_Pprex7;
reg		[127:0]		data_Gprex7;
reg		[127:0]		data_c;

wire		[127:0]		data_P;
wire		[127:0]		data_G;

integer				i;
integer				j;
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
		
		for(j = 0;j<8;j = j+1)begin
			data_Pprex1[16*j] = data_P[16*j];
			data_Gprex1[16*j] = data_G[16*j];
			for(i = 1+16*j;i < 16+16*j;i=i+1)begin
				data_Pprex1[i] = data_P[i]&data_P[i-1];
				data_Gprex1[i] = data_G[i] | data_G[i-1]& data_P[i];
			end
		end

		for(j = 0;j<8;j = j+1)begin
			data_Pprex2[16*j] = data_Pprex1[16*j];
			data_Gprex2[16*j] = data_Gprex1[16*j];
			data_Pprex2[16*j+1] = data_Pprex1[16*j+1];
			data_Gprex2[16*j+1] = data_Gprex1[16*j+1];
			for(i = 2+16*j;i < 16+16*j;i=i+1)begin
				data_Pprex2[i] = data_Pprex1[i]&data_Pprex1[i-2];
				data_Gprex2[i] = data_Gprex1[i] | data_Gprex1[i-2]& data_Pprex1[i];
			end
		end

		for(j = 0;j<8;j = j+1)begin
			data_Pprex3[16*j] = data_Pprex2[16*j];
			data_Gprex3[16*j] = data_Gprex2[16*j];
			data_Pprex3[16*j+1] = data_Pprex2[16*j+1];
			data_Gprex3[16*j+1] = data_Gprex2[16*j+1];
			data_Pprex3[16*j+2] = data_Pprex2[16*j+2];
			data_Gprex3[16*j+2] = data_Gprex2[16*j+2];
			data_Pprex3[16*j+3] = data_Pprex2[16*j+3];
			data_Gprex3[16*j+3] = data_Gprex2[16*j+3];
			for(i = 4+16*j;i < 16+16*j;i=i+1)begin
				data_Pprex3[i] = data_Pprex2[i]&data_Pprex2[i-4];
				data_Gprex3[i] = data_Gprex2[i] | data_Gprex2[i-4]& data_Pprex2[i];
			end
		end

		for(j = 0;j<8;j = j+1)begin
			data_Pprex4[16*j] = data_Pprex3[16*j];
			data_Gprex4[16*j] = data_Gprex3[16*j];
			data_Pprex4[16*j+1] = data_Pprex3[16*j+1];
			data_Gprex4[16*j+1] = data_Gprex3[16*j+1];
			data_Pprex4[16*j+2] = data_Pprex3[16*j+2];
			data_Gprex4[16*j+2] = data_Gprex3[16*j+2];
			data_Pprex4[16*j+3] = data_Pprex3[16*j+3];
			data_Gprex4[16*j+3] = data_Gprex3[16*j+3];
			data_Pprex4[16*j+4] = data_Pprex3[16*j+4];
			data_Gprex4[16*j+4] = data_Gprex3[16*j+4];
			data_Pprex4[16*j+5] = data_Pprex3[16*j+5];
			data_Gprex4[16*j+5] = data_Gprex3[16*j+5];
			data_Pprex4[16*j+6] = data_Pprex3[16*j+6];
			data_Gprex4[16*j+6] = data_Gprex3[16*j+6];
			data_Pprex4[16*j+7] = data_Pprex3[16*j+7];
			data_Gprex4[16*j+7] = data_Gprex3[16*j+7];
			for(i = 8+16*j;i < 16+16*j;i=i+1)begin
				data_Pprex4[i] = data_Pprex3[i]&data_Pprex3[i-8];
				data_Gprex4[i] = data_Gprex3[i] | data_Gprex3[i-8]& data_Pprex3[i];
			end
		end

		for(i = 0;i < 16; i=i+1)begin
				data_Pprex5[i] = data_Pprex4[i];
				data_Gprex5[i] = data_Gprex4[i];
		end
		for(j = 1;j<8;j=j+1)begin
			for(i = 0;i < 16; i=i+1)begin
				data_Pprex5[j*16+i] = data_Pprex4[j*16+i]&data_Pprex4[16*j-1];
				data_Gprex5[j*16+i] = data_Gprex4[j*16+i] | data_Gprex4[16*j-1]& data_Pprex4[j*16+i];
			end
		end
		
		for(i = 0;i < 32; i=i+1)begin
				data_Pprex6[i] = data_Pprex5[i];
				data_Gprex6[i] = data_Gprex5[i];
		end
		for(j = 2;j<8;j=j+1)begin
			for(i = 0;i < 16; i=i+1)begin
				data_Pprex6[j*16+i] = data_Pprex5[j*16+i]&data_Pprex5[16*j-17];
				data_Gprex6[j*16+i] = data_Gprex5[j*16+i] | data_Gprex5[16*j-17]& data_Pprex5[j*16+i];
			end
		end
		
		for(i = 0;i < 64; i=i+1)begin
				data_Pprex7[i] = data_Pprex6[i];
				data_Gprex7[i] = data_Gprex6[i];
		end
		for(j = 4;j<8;j=j+1)begin
			for(i = 0;i < 16; i=i+1)begin
				data_Pprex7[j*16+i] = data_Pprex6[j*16+i]&data_Pprex6[16*j-49];
				data_Gprex7[j*16+i] = data_Gprex6[j*16+i] | data_Gprex6[16*j-49]& data_Pprex6[j*16+i];
			end
		end

		for(i = 0;i < 128;i=i+1)begin
			data_c[i] = data_Gprex7[i] | R_cin&data_Pprex7[i];
		end
	
/*
		for(i = 0;i < 16;i=i+1)begin
			data_c[i] = data_Gprex4[i] | R_cin&data_Pprex4[i];

			data_c[16+i] = 	data_Gprex4[16+i] | 
					data_Gprex4[15]&data_Pprex4[16+i] | 
					data_Pprex4[16+i]&data_Pprex4[15]&R_cin;

			data_c[32+i] = 	data_Gprex4[32+i] |
					(data_Gprex4[31] | data_Gprex4[15]&data_Pprex4[31])&data_Pprex4[32+i] |
					data_Pprex4[32+1]&data_Pprex4[31]&data_Pprex4[15]&R_cin;

			data_c[48+i] = 	data_Gprex4[48+i] |
					(data_Gprex4[47] |
					(data_Gprex4[31] | data_Gprex4[15]&data_Pprex4[31])&data_Pprex4[47])&data_Pprex4[48+i] |
					data_Pprex4[48+i]&data_Pprex4[47]&data_Pprex4[31]&data_Pprex4[15]&R_cin;

			data_c[64+i] = 	data_Gprex4[64+i] |
					(data_Gprex4[63] |
					(data_Gprex4[47] |
					(data_Gprex4[31] | data_Gprex4[15]&data_Pprex4[31])&data_Pprex4[47])&data_Pprex4[63])&data_Pprex4[64+i] |
					data_Pprex4[64+i]&data_Pprex4[63]&data_Pprex4[47]&data_Pprex4[31]&data_Pprex4[15]&R_cin;
			
			data_c[80+i] = 	data_Gprex4[80+i] |
					(data_Gprex4[79] |
					(data_Gprex4[63] |
					(data_Gprex4[47] |
					(data_Gprex4[31] | data_Gprex4[15]&data_Pprex4[31])&data_Pprex4[47])&data_Pprex4[63])&data_Pprex4[79])&data_Pprex4[80+i] |
					data_Pprex4[80+i]&data_Pprex4[79]&data_Pprex4[63]&data_Pprex4[47]&data_Pprex4[31]&data_Pprex4[15]&R_cin;
			
			data_c[96+i] =  data_Gprex4[96+i] |
					(data_Gprex4[95] |
					(data_Gprex4[79] |
					(data_Gprex4[63] |
					(data_Gprex4[47] |
					(data_Gprex4[31] | data_Gprex4[15]&data_Pprex4[31])&data_Pprex4[47])&data_Pprex4[63])&data_Pprex4[79])&data_Pprex4[95])&data_Pprex4[96+i] |
					data_Pprex4[96+i]&data_Pprex4[95]&data_Pprex4[79]&data_Pprex4[63]&data_Pprex4[47]&data_Pprex4[31]&data_Pprex4[15]&R_cin;

			data_c[112+i]= 	data_Gprex4[112+i] |
					(data_Gprex4[111] |
					(data_Gprex4[95] |
					(data_Gprex4[79] |
					(data_Gprex4[63] |
					(data_Gprex4[47] |
					(data_Gprex4[31] | data_Gprex4[15]&data_Pprex4[31])&data_Pprex4[47])&data_Pprex4[63])&data_Pprex4[79])&data_Pprex4[95])&data_Pprex4[111])&data_Pprex4[112+i] |
					data_Pprex4[112+i]&data_Pprex4[111]&data_Pprex4[95]&data_Pprex4[79]&data_Pprex4[63]&data_Pprex4[47]&data_Pprex4[31]&data_Pprex4[15]&R_cin;
		end
*/
		//data_out <=R_cin&data_Gprex4[0];
/*
		data_out[0]<=R_cin;
		data_out[128:1]<=data_c;
*/
		for(i = 1;i < 128;i=i+1)begin
			data_out[i] <= (R_data1[i]^R_data2[i])^data_c[i-1];
		end

		data_out[128] <= data_c[127];

	end
	else
		data_out <= data_out;

end

endmodule

