module clkdiv
(
	input wire clk,
	input wire rst_n,
	output wire clk190
);

//=============================
	reg [24:0] q;
//=============================

	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			q <= 1'b0;
		else
			q <= q + 1'b1;
	end
	
	assign clk190 = q[17];
	
endmodule


