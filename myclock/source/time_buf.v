module time_buf
(
	input wire clk,
	input wire rst_n,
	
	/*******************/
	input wire sec_add,
	input wire stop,	
	input wire min_add,
	input wire min_sub,
	
	input wire hour_add,
	input wire hour_sub,

	/********************/
	
	output reg [5:0] sec,
	output reg [5:0] min,
	output reg [5:0] hour
);

//=========================

	always @ (posedge clk or negedge rst_n)
	begin 
		if(!rst_n)
			sec <= 6'd0;
		else if (sec >= 6'd60)
			sec <= 6'd0;
		else if ( (sec_add == 1'b1)&(!stop) )
			sec <= sec + 1'b1;
		else
			sec <= sec;
	end	
	
//===========================================
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			min <= 6'd0;
		else if (min >= 6'd60)
			min <= 6'd0;
		else if ( ((sec == 6'd60)|(min_add == 1'b1)) & (min <=60) & (min>=0) )
			min <= min + 1'b1;
		else if ( (min_sub == 1'b1)&(min <=60)&(min>=0) )
			min <= min - 1'b1;
		else
			min <= min;
	end
			
//===========================================

	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			hour <= 6'd12;
		else if (hour >= 6'd24)
			hour <= 6'd0;
		else if ( ((min == 6'd60)|(hour_add == 1'b1)) & (hour>=0) & (hour <= 24) )
			hour <= hour + 1'b1;
		else if ( (hour_sub == 1'b1) & (hour>=0) & (hour <= 24) )
			hour <= hour - 1'b1;
		else
			hour <= hour;
	end

endmodule
