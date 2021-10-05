module bridge
(
	in_1,
	in_2,
	in_3,
	in_4,
	in_5,
	in_6,
	out
);

	input wire [3:0] in_1;
	input wire [3:0] in_2;
	input wire [3:0] in_3;
	input wire [3:0] in_4;
	input wire [3:0] in_5;
	input wire [3:0] in_6;
	output wire [23:0] out;
	
	assign out = {in_6,in_5,in_4,in_3,in_2,in_1};

endmodule
