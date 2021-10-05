module seg_flash
(
	set,
	sec_sig2,
	sel_in,
	sel_out
);

//=======================================

	input  wire [2:0] set;
	input  wire sec_sig2;
	input  wire [5:0] sel_in;
	output wire [5:0] sel_out;

//========================================
	assign	sel_out[2] = ~( set[1] ? (~sel_in[2] & sec_sig2) : ~sel_in[2] );
	assign	sel_out[3] = ~( set[1] ? (~sel_in[3] & sec_sig2) : ~sel_in[3] );
	assign	sel_out[4] = ~( set[2] ? (~sel_in[4] & sec_sig2) : ~sel_in[4] );
	assign	sel_out[5] = ~( set[2] ? (~sel_in[5] & sec_sig2) : ~sel_in[5] );
	assign	sel_out[1:0] = sel_in[1:0];

endmodule
