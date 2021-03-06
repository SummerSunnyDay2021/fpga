/*
 *	2018年12月11日 15点37分
 *	按照 书上的代码 编写 GCD 算法的时候出现了错误，
	原书撰写的应该不错，但翻译成中文之后代码质量极差，
	故重写一遍：

	这是一个重新实现的 GCD 算法的数据通道模块


 *	首先补下英文课：
		小于	Less	Than
		大于	Greater Than
		等于	Equals
		加法	Add
		减法	Subtraction
		标识	Flag
		加上	Plus
		减去	Minus
		加载	Load
		选择	Select
		寄存器	Register

 * 下面代码种使用以下专有缩写
 		x 减去 y	xmy(x minus y)
		y 减去 x	ymx(y minus x)
		加载 x		xld(x load)
		加载 y		yld(y load)
		加载 gcd	gld(gcd load)
		选择 x		xsel(x select)
		选择 y		ysel(y select)
		x 寄存器		xreg(x register)
		y 寄存器		yreg(y register)
		小于标识信号	ltflag(less than flag)
		相等标识是号	eqflag(equals flag)
		x 输入信号	xin(x input)
		y 输入信号	yin(y input)
*/

module gcd_datapath(
	input wire			clk,
	input wire			rst_n,

	input wire	[3:0]	xin,
	input wire	[3:0]	yin,

	input wire			xsel,
	input wire			ysel,
	input wire			xld,
	input wire			yld,
	input wire			gld,

	output reg			ltflag,
	output reg			eqflag,
	output reg	[3:0]	gcdreg
);

//*****************************************//
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] xmy;
	wire [3:0] ymx;
	reg  [3:0] xreg;
	reg  [3:0] yreg;
//*****************************************//

always @ (*)
begin
	if(xsel)
		x = xin;
	else
		x = xmy;
end

always @ (*)
begin
	if(ysel)
		y = yin;
	else
		y = ymx;
end

//***************************************************//

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		xreg <= 4'b0000;
	else if(xld)
		xreg <= x;
	else
		xreg <= xreg;
end

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		yreg <= 4'b0000;
	else if(yld)
		yreg <= y;
	else
		yreg <= yreg;
end

//*********************************************//

	assign xmy = xreg - yreg;
	assign ymx = yreg - xreg;

//*********************************************//

always @ (*)
begin
	if(xreg < yreg)
		ltflag = 1'b1;
	else
		ltflag = 1'b0;
end

always @ (*)
begin
	if(xreg == yreg)
		eqflag = 1'b1;
	else
		eqflag = 1'b0;
end

//**********************************************//

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		gcdreg <= 4'b0000;
	else if(gld)
		gcdreg <= xreg;
	else
		gcdreg <= gcdreg;
end

//**********************************************//

endmodule
