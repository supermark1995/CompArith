module test_Prefix;

reg			clk;

initial clk=0;
always #5 clk=~clk;

reg		enable;
reg		[127:0]		A;
reg		[127:0]		B;
wire		[127:0]		sum;
wire				carry;


adder_128bit_Prefix Prefix_CLA_adder (
	.A(A),
	.B(B),
	.Sum (sum),
	.Cout(carry),
	.enable (enable),
	.clk (clk)
);

reg		[31:0]		sim_cycle;

initial begin
	$vcdplusfile("sim.vpd");
	$vcdpluson;

	@(posedge clk);
	sim_cycle = 0;

	while (sim_cycle<20) begin
		@(posedge clk);
		#1;
		case (sim_cycle)
			0: begin
				enable = 1'b1;
				A = 128'h55A63360EDD85890BE6AD13C0467954E;
				B = 128'hBE4E1AE08C8D42D003AD5EA520CB5090;
			end

			1: begin
				enable = 1'b1;
				A = 128'h3115CFC19260281DC20F0556FB3F5CB8;
				B = 128'hDCEABAB4C15EA6C68C581BF062FBEA4C;
			end
			2: begin
				enable = 1'b1;
				A = 128'h5DB5F086D1B669CEC3D228ABE14CBD80;
				B = 128'hA3593EF0FA75333F60198C46D8385B8F;
			end
			default: begin
				enable = 1'b0;
				A = 128'h0;
				B = 128'h0;			
			end
		endcase

		#7;
		$display ("%d: sum ='h%h", sim_cycle, sum);

		sim_cycle = sim_cycle+1;
	end

	$finish(1);
end

endmodule




