/*
 * 平方根算法的数据通道
	2020年4月11日 15点30分 ☆6
	
	以下是英文与中文对照:
	
	平方数 		--> square
	平方根 		--> square root
	德尔塔		--> delta
	小于或等于	--> less than or equal to

**/
//**********************************//
module datapath(
	input  wire			clk			,
	input  wire			rst_n		,
	input  wire	[7:0]	a			,
	input  wire			a_ld		,
	input  wire			sq_ld		,
	input  wire			del_ld		,
	input  wire			root_ld		,
	output reg	[7:0]	root_reg	,
	     
	// 小于或者等于标志位 less_or_equal_flag
	output wire			lseq_flag	
);

//*********************************//

	reg	[7:0]			   a_reg;
	reg	[7:0]			  sq_reg;	// square_reg
	reg	[7:0]			 del_reg;	// delta_reg

	
	wire	[7:0]		 sq_root;
	wire	[7:0]		 sq_next;		// square_next
	wire	[7:0]		del_next;		//  delta_next
	
//*********************************//


always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		a_reg <= 8'h00;
	else if(a_ld)
		a_reg <= a;
	else 
		a_reg <= a_reg;
end

assign lseq_flag = (sq_reg <= a_reg) ? 1'b1 : 1'b0; 

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		sq_reg <= 8'h01;
	else if(a_ld)
		sq_reg <= 8'h01;
	else if(sq_ld)
		sq_reg <= sq_next;
	else
		sq_reg <= sq_reg;
end

assign sq_next = sq_reg + del_reg;


always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		del_reg <= 8'h03;
	else if(a_ld)
		del_reg <= 8'h03;
	else if(del_ld)
		del_reg <= del_next;
	else
		del_reg <= del_reg;
end

assign del_next = del_reg + 8'h02;
	

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		root_reg <= 8'h00;
	else if(root_ld)
		root_reg <= sq_root;
	else 
		root_reg <= root_reg;
end

assign sq_root = (del_reg - 8'h05) >> 1'b1;
	
endmodule
