/*
 *	6位 移位加三算法
 *	( 2015-5-29 18:42 星期五 )
 *	目的是实现 二进制数的转码为十进制后的 百位、十位和各位分离
 *	
 *	b为输入六位数
 *	六位二进制数最大值为 6'b111_111 即 十进制数 8'd63
 *
 *	p为输出值，z为中间变量

 	假设六位二进制数 为 XX_XXXX
 	初始值	   C      D       Value
 			  0000， 0000， 00XX， XXXX		-----1-----
 	移三次	  000X， 000X， XXXX， X000		-----2-----
 	位数   15--12，11--8，7---4，3---0
 	判断是否有需要加三的项，
 		如果有，加三，
 	无论上一步结果如何，这一步都是移位
 	重复判断是否有需要加三的项
 	····································································
 	直至移动所有位到 BCD 项
            C      D       Value
			  XXXX， XXXX， 0000， 0000		-----3-----
	对比 2 处，可知从 z[3] 移到了 z[8] 
	一共移动了 5 次（不包括前三次移动），而且一定是 5 次	
 */

module binbcd6 (b, p, q);
input wire [5:0] b;
output reg [3:0] p;
output reg [3:0] q;

//==============================================

reg [16:0] z;
integer i;

//==============================================

always @ (*)
begin
	for(i=0;i<=16;i=i+1)			//这里初始化 z 的值
		z[i] = 0;
		
	z[8:3] = b;					//移位 3 次
	
	repeat(5)					//这里重复 5 次
		begin
			if (z[11:8]  > 3'b100)				// BCD 位超过 5(3'b100)，就加三
				 z[11:8]  = z[11:8]  + 2'b11;
			if (z[15:12] > 3'b100)
				 z[15:12] = z[15:12] + 2'b11;
				 
			z[16:1] = z [15:0];
		end
	p = z[11:8];									// 输出分离后的值
	q = z[15:12];
end
endmodule
