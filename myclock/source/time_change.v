module time_control
(
	input wire clk,
	input wire rst_n,
	input wire btn_add,		//按键加释放
	input wire btn_sub,		//按键减释放
	input wire [2:0]set,		//调整
	output reg stop,			//使能秒计时
	output wire min_add,		//输出分加一
	output wire min_sub,		//输出分减一
	output wire hour_add,	//输出时加一
	output wire hour_sub
);

//=====================================
	always @ (posedge clk)
	begin
		if(set > 1'b1)
			stop <= 1'b1;		//如果进入调整，停止秒计时
		else
			stop <= 1'b0;
	end
	
//=====================================
	
	assign min_add  = set[1] & btn_add;
	assign min_sub  = set[1] & btn_sub;
	assign hour_add = set[2] & btn_add;
	assign hour_sub = set[2] & btn_sub;

endmodule
