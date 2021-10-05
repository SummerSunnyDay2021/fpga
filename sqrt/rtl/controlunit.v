/*
 * 平方根算法的控制单元
 *	2020年4月11日 16点22分
 * 四个状态
	S0: 开始状态，收到启动信号进入 S1、否则待在 S0
	S1: 判断状态，如果 lseq_flag 为 1，进入 S2，否则进入 S3
	S2: 更新状态，delta_reg 和 squart_reg 更新数据
	S3: 结束状态，输出 root_reg。
**/

module controlunit(
	input	wire	clk			,
	input	wire	rst_n		,
	input	wire	lseq_flag	,
	input	wire	go			,
	output	reg		a_ld		,
	output	reg		sq_ld		,
	output	reg		del_ld		,
	output	reg		root_ld	
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;

reg [1:0]	pre_stage;
reg [1:0]	next_stage;

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		pre_stage <= S0;
	else
		pre_stage <= next_stage;
end

always @ (*)
begin
	case(pre_stage)
	
		S0:
		begin
			if(go)
				next_stage = S1;
			else
				next_stage = S0;
		end
		
		S1:
		begin
			if(lseq_flag)
				next_stage = S2;
			else
				next_stage = S3;
		
		end
		
		S2:
		begin
				next_stage = S1;
		end

		S3:
		begin
				next_stage = S0;
		end
		
	endcase
	
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		a_ld	<= 1'b0;
		sq_ld	<= 1'b0;
		del_ld	<= 1'b0;
		root_ld	<= 1'b0;
	end
	else if(pre_stage == S0)
	begin
		a_ld	<= 1'b1;
		sq_ld	<= 1'b0;
		del_ld	<= 1'b0;
		root_ld	<= 1'b0;
	end
	else if(pre_stage == S1)
	begin
		a_ld	<= 1'b0;
		sq_ld	<= 1'b0;
		del_ld	<= 1'b0;
		root_ld	<= 1'b0;
	end
	else if(pre_stage == S2)
	begin
		a_ld	<= 1'b0;
		sq_ld	<= 1'b1;
		del_ld	<= 1'b1;
		root_ld	<= 1'b0;
	end
	else 
	begin
		a_ld	<= 1'b0;
		sq_ld	<= 1'b0;
		del_ld	<= 1'b0;
		root_ld	<= 1'b1;
	
	end

end
  
endmodule
