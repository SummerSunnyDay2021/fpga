module sqrt(
	clk,
	rst_n,
	go,
	a,
	root_reg
);

input wire	clk;
input wire	rst_n;
input wire	go;
input wire	[7:0] a;
output wire	[7:0] root_reg;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

controlunit	b2v_inst(
	.clk(clk),
	.rst_n(rst_n),
	.lseq_flag(SYNTHESIZED_WIRE_0),
	.go(go),
	.a_ld(SYNTHESIZED_WIRE_1),
	.sq_ld(SYNTHESIZED_WIRE_2),
	.del_ld(SYNTHESIZED_WIRE_3),
	.root_ld(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst.S0 = 2'b00;
	defparam	b2v_inst.S1 = 2'b01;
	defparam	b2v_inst.S2 = 2'b11;
	defparam	b2v_inst.S3 = 2'b10;

datapath	b2v_inst1(
	.clk(clk),
	.rst_n(rst_n),
	.a_ld(SYNTHESIZED_WIRE_1),
	.sq_ld(SYNTHESIZED_WIRE_2),
	.del_ld(SYNTHESIZED_WIRE_3),
	.root_ld(SYNTHESIZED_WIRE_4),
	.a(a),
	.lseq_flag(SYNTHESIZED_WIRE_0),
	.root_reg(root_reg)
);

endmodule
