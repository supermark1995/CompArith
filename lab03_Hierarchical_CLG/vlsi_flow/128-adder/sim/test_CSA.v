module test_CSA;

reg			clk;

initial clk=0;
always #5 clk=~clk;

reg		enable;
reg		[127:0]		A;
reg		[127:0]		B;
wire		[127:0]		sum;
wire				carry;


adder_128bit_CSA CSA_adder (
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
				A = 128'h123456789ABCDEF0123456789ABCDEF0;
				B = 128'h23456789ABCDEF0123456789ABCDEF12;
			end

			1: begin
				enable = 1'b1;
				A = 128'hFFFFFFFFFFFFFFFF000000013579ABDF;
				B = 128'h1111AAAABBBCCDDEEEFFFA2223334567;
			end
			2: begin
				enable = 1'b1;
				A = 128'h012345678901234567890123456789AB;
				B = 128'h887754321FFEADADDEADAABBABAB1123;				
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




