/*
 *	2018年12月24日 13点53分
 *	GCD 算法的控制单元

	在数据通道有以下信号：

		input wire	[3:0]	xin,	// x 输入信号
		input wire	[3:0]	yin,	// y 输入信号

		input wire			xsel,	// x 选择信号
		input wire			ysel,	// y 选择信号
		input wire			xld,	// x 更新信号
		input wire			yld,	// y 更新信号
		input wire			gld,	// gcd 更新信号

		output reg			ltflag,	// 小于标志位
		output reg			eqflag,	// 等于标志位
		output reg	[3:0]	gcdreg	// gcd 输出

	状态机编码如下：
		S0 --> 启动状态，当 go 信号为 1'b1 时，进入 S1，否则停留在 S0
		S1 --> 加载状态，载入 x 和 y，无条件进入 S2
		S2 --> 判断状态，判断 x 是否等于 y，进入 S3，否则进入 S4
		S3 --> 结束状态，输出 gcd，如果 go == 1'b1，则进入下一次循环
		S4 --> 判断状态2，比较 x 与 y 的大小，x 小于 y 则进入 S6，否则进入 S5
		S5 --> 更新状态，输出 x - y，输出 xsel 更新 xreg
		S6 --> 更新状态2，输出 y - x，输出 ysel 更新 yreg


	使用 Modelsim 的测试表明这个代码计算的结果是对的，但无法连续计算，
	在 testbench 种改变 xin 和 yin 的值的时候，必须要进行复位才能够显示正确的结果，表明 DONE 状态下的逻辑有待完善，
	第三个 always 语句中的控制代码理解出现了问题，本例中是抄书上的。。还没有吃透。

	20点33分：
	问题找出来了，当测试信号中存在 0 值的时候，结果会出错，比如
		x: 15 --> 15 --> 15
		y: 0  --> 0  --> 0
	由于 15 总是大于 0, 15 - 0 = 15, x 和 y 的值没有发生任何变化，导致死循环

	总结： 目前的这个 GCD　算法不允许输入０值，否则结果出不来。
**/

module gcd_control(
	input wire clk,
	input wire rst_n,

	input wire go,

	input wire ltflag,
	input wire eqflag,

	output reg xsel,
	output reg ysel,
	output reg xld,
	output reg yld,
	output reg gld
);

//-----------------------------------//
	parameter
		START		= 7'b000_0001,
		LOAD		= 7'b000_0010,
		JUDGE_1	= 7'b000_0100,
		DONE		= 7'b000_1000,
		JUDGE_2	= 7'b001_0000,
		UPDATE_1	= 7'b010_0000,
		UPDATE_2	= 7'b100_0000;
//-----------------------------------//
	reg [6:0] pre_state, next_state;
//-----------------------------------//

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		pre_state <= START;
	else
		pre_state <= next_state;
end

always @ (*)
begin
	case(pre_state)
	START:
		if(go)
			next_state = LOAD;
		else
			next_state = START;
	LOAD:
		next_state = JUDGE_1;
	JUDGE_1:
		if(eqflag)
			next_state = DONE;
		else
			next_state = JUDGE_2;
	DONE:
			next_state = START;
	JUDGE_2:
		if(ltflag)
			next_state = UPDATE_1;
		else
			next_state = UPDATE_2;
	UPDATE_1:
		next_state = JUDGE_1;
	UPDATE_2:
		next_state = JUDGE_1;
	endcase
end

always @ (*)
begin
	case(pre_state)
		LOAD:
		begin
			xsel = 1'b1;
			ysel = 1'b1;
			xld	 = 1'b1;
			yld	 = 1'b1;
			gld  = 1'b0;
		end
		DONE:
		begin
			xsel = 1'b0;
			ysel = 1'b0;
			xld  = 1'b0;
			yld  = 1'b0;
			gld  = 1'b1;
		end

		UPDATE_1:
		begin
			xsel = 1'b0;
			ysel = 1'b0;
			xld  = 1'b0;
			yld  = 1'b1;
			gld  = 1'b0;
		end

		UPDATE_2:
		begin
			xsel = 1'b0;
			ysel = 1'b0;
			xld  = 1'b1;
			yld  = 1'b0;
			gld  = 1'b0;
		end
		default:
		begin
			xsel = 1'b0;
			ysel = 1'b0;
			xld  = 1'b0;
			yld  = 1'b0;
			gld  = 1'b0;
		end
	endcase
end


endmodule
