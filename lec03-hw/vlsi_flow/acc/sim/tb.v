module tb;

reg					clk;

initial clk=0;
always #5 clk=~clk;
reg				data_cin;
reg				enable;
reg		[127:0]		data_in1;
reg		[127:0]		data_in2;
reg				reset;
wire		[128:0]		data_out;

acc u_target (
	.enable (enable),
	.data_cin (data_cin),
	.data_in1 (data_in1),
	.data_in2 (data_in2),
	.data_out (data_out),
	.reset (reset),
	.clk (clk)
);

reg		[31:0]		sim_cycle;

initial begin
	$vcdplusfile("sim.vpd");
	$vcdpluson;

	reset = 1'b0;

	@(posedge clk);
	reset = 1'b1;

	@(posedge clk);
	@(posedge clk);
	sim_cycle = 0;
	reset = 1'b0;
	
	while (sim_cycle<20) begin
		@(posedge clk);	
		#1;
		case (sim_cycle)
			0: begin
				enable = 1'b1;
				data_cin = 1'b1;
				data_in1 = 127'b10101010101010101010101010101010;
				data_in2 = 127'b01010101010101010101010101010101;
				
			end
			1: begin
				enable = 1'b1;
				data_cin = 1'b1;
				data_in1 = 127'b1010101010101010;
				data_in2 = 127'b0101010101010101;
				
			end	
			2: begin
				enable = 1'b1;
				data_in1 = 127'b1111111111111111;
				data_in2 = 127'b1111111111111111;
				data_cin = 1'b0;
			end			
			default: begin
				enable = 1'b1;
				data_in1 = 127'b1111;
				data_in2 = 127'b1111;
				data_cin = 1'b1;
			end
		endcase

		#7;
		$display ("%d: data_out='h%h", sim_cycle, data_out);

		sim_cycle = sim_cycle+1;
	end

	$finish(1);
end

endmodule




