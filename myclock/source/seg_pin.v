module seg_pin
(
	input wire	[5:0] sel_out,
	input wire	[6:0] seg,
	
	output wire sel_pin0,
	output wire sel_pin1,
	output wire sel_pin2,
	output wire sel_pin3,
	output wire sel_pin4,
	output wire sel_pin5,
	
	output wire seg_pin0,
	output wire seg_pin1,
	output wire seg_pin2,
	output wire seg_pin3,
	output wire seg_pin4,
	output wire seg_pin5,
	output wire seg_pin6
);
	
	assign sel_pin0 = sel_out[0];
	assign sel_pin1 = sel_out[1];
	assign sel_pin2 = sel_out[2];
	assign sel_pin3 = sel_out[3];
	assign sel_pin4 = sel_out[4];
	assign sel_pin5 = sel_out[5];
	
	assign seg_pin0 = seg[0];
	assign seg_pin1 = seg[1];
	assign seg_pin2 = seg[2];
	assign seg_pin3 = seg[3];
	assign seg_pin4 = seg[4];
	assign seg_pin5 = seg[5];
	assign seg_pin6 = seg[6];
	
endmodule

	
	
	
	
	
	
	
	
	
	
	
	
	