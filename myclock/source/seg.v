module seg (seg, sel, clk, rst_n, num);

//===================================

	input wire clk;
	input wire rst_n;
	input wire [23:0] num;
	output reg [5:0] sel;
	output reg [6:0] seg;

//===================================

	reg  [15:0] buffer_1ms;
	reg  [3 :0] value;

//===================================

	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			sel <= 6'b111_110;
		else if(buffer_1ms == 16'd50_000)
			sel <= {sel[0],sel[5:1]};
		else
			sel <= sel;
	end

	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			buffer_1ms <= 1'b0;
		else if(buffer_1ms == 16'd50_000)
			buffer_1ms <= 1'b0;
		else
			buffer_1ms <= buffer_1ms + 1'b1;
	end
//===================================

	always @ (*)
	case(sel)
		6'b011_111:value <= num[23:20];
		6'b101_111:value <= num[19:16];
		6'b110_111:value <= num[15:12];
		6'b111_011:value <= num[11: 8];
		6'b111_101:value <= num[7 : 4];
		6'b111_110:value <= num[3 : 0];
		default:value <= num[3:0];
	endcase

	always @ (value)
	case (value)
		'h0:seg <= 7'b000_0001;
		'h1:seg <= 7'b100_1111;
		'h2:seg <= 7'b001_0010;
		'h3:seg <= 7'b000_0110;
		'h4:seg <= 7'b100_1100;
		'h5:seg <= 7'b010_0100;
		'h6:seg <= 7'b010_0000;
		'h7:seg <= 7'b000_1111;
		'h8:seg <= 7'b000_0000;
		'h9:seg <= 7'b000_0100;
		default:seg <= 7'b000_0001;
	endcase

endmodule

