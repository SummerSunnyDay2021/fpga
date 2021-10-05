/*
 *	按照书上的例子抄写 GCD 算法
 	GCD(Greatest Common Divsior) 即最大公约数算法，
 	有古希腊数学家 欧几里得(Eucild)发明，伪代码的描述如下：
 	+------------------------+
 		input : int x, y;
 		output: int gcd;
 		while( x != y ) {
 			if(x < y)
 				y = y - x;
 			else
 				x = x - y;
 		}
 		gcd = x;
 	+------------------------+
 */

module gcd(
	input wire clk,
	input wire rst_n,
	input wire [3:0] xin,
	input wire [3:0] yin,
	input wire go,
	output wire [3:0] gcdreg
);

	wire		xsel;
	wire		ysel;
	wire		xld;
	wire		yld;
	wire		gld;

	wire		ltflag;
	wire		eqflag;

gcd_datapath U1 (
	.clk(clk),
	.rst_n(rst_n),

	.xin(xin),
	.yin(yin),

	.xsel(xsel),
	.ysel(ysel),
	.xld(xld),
	.yld(yld),
	.gld(gld),

	.ltflag(ltflag),
	.eqflag(eqflag),
	.gcdreg(gcdreg)
);

gcd_control U2(
	.clk(clk),
	.rst_n(rst_n),

	.go(go),

	.ltflag(ltflag),
	.eqflag(eqflag),

	.xsel(xsel),
	.ysel(ysel),
	.xld(xld),
	.yld(yld),
	.gld(gld)
);

endmodule
