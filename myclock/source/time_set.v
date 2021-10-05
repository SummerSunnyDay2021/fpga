module time_set
(
	input wire clk,
	input wire rst_n,
	input wire btn_set,
	output reg [2:0]set
);

	always @ (posedge clk or negedge rst_n)
	begin
	if(!rst_n)
		set <= 3'b001;
	else if(btn_set == 1'b1)
		set[2:0] <= {set[1:0],set[2]};
	else
		set <= set;
	end
	
	endmodule
	
