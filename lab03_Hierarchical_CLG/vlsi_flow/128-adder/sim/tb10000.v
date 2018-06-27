module test_CLA;

reg			clk;

initial clk=0;
always #5 clk=~clk;

reg		enable;
reg		[127:0]		A;
reg		[127:0]		B;
wire		[127:0]		sum;
wire				carry;

reg		[128:0]		compare;
reg				same;

integer i;

adder_128bit CLA_adder (
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

	while (sim_cycle<10000) begin
		@(posedge clk);
		enable = 1'b1;
		for(i = 31; i < 128; i = i + 32) begin
			A[i -: 32] = $random;
			B[i -: 32] = $random;
		end
		compare = A + B;
		@(posedge clk);
		@(posedge clk);
		#8;
		if(compare == {carry,sum}) begin
			$display("Same");
			same = 1'b1;		
		end
		else begin
			$display("Not Same");
			same = 1'b0;
		end
		
		$display ("%d: sum ='h%h  if same = %b", sim_cycle, sum, compare == {carry,sum});

		sim_cycle = sim_cycle+1;
	end

	$finish(1);
end

endmodule
