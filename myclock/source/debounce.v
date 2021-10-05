module debounce
(
	input  wire clk190,
	input  wire rst_n,
	input  wire btn1,
	input  wire btn2,
	input  wire btn3,
	output wire [2:0] btn_out
);

//===============================
	reg [2:0] delay1;
	reg [2:0] delay2;
	reg [2:0] delay3;
	wire [2:0] btn;
//===============================
	assign btn = {btn3,btn2,btn1};
//===============================

	always @ (posedge clk190 or negedge rst_n)
	begin
		if(!rst_n)
			begin
				delay1 <= 3'b000;
				delay2 <= 3'b000;
				delay3 <= 3'b000;
			end
		else
			begin
				delay1 <= ~btn;
				delay2 <= delay1;
				delay3 <= delay2;
			end
	end
	
	assign btn_out = delay1 & delay2 & delay3;
	
endmodule

	