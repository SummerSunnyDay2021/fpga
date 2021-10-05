module btn_sig
(
	input wire clk,
	input wire rst_n,
	input wire [2:0] btn_in,
	output wire btn_sig1,
	output wire btn_sig2,
	output wire btn_sig3
);

//=============================
	reg [2:0] L2H_F1;
	reg [2:0] L2H_F2;
//=============================

	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
		begin
			L2H_F1 <= 3'b000;
			L2H_F2 <= 3'b000;
		end
		else
		begin
			L2H_F1 <= btn_in;
			L2H_F2 <= L2H_F1;
		end
	end
	
	assign btn_sig1 = ~L2H_F1[0] & L2H_F2[0];
	assign btn_sig2 = ~L2H_F1[1] & L2H_F2[1];
	assign btn_sig3 = ~L2H_F1[2] & L2H_F2[2];
	
endmodule
