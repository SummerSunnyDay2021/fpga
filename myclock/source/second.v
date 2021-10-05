module second
(
	clk,
	rst_n,
	sec_sig,
	sec_sig2
);

	input wire clk;
	input wire rst_n;
	output reg sec_sig;
	output reg sec_sig2;

//========================================
	reg [25:0] count;
	parameter N = 26'd49_999_999;
//========================================
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			count <= 26'd0;
		else if(count==N)
			count <= 26'd0;
		else
			count <= count + 1'b1;
	end
//=================================	
	always @ (posedge clk)
	begin
		if(count==N)
			sec_sig <= 1'b1;
		else
			sec_sig <= 1'b0;
	end
//==================================
	always @ (posedge clk)
		if(count==N)
			sec_sig2 <= ~sec_sig2;
	
endmodule
	
