module MA_WB();

	output reg [xx:0] MA_WB;

	input CLK_PIPE;
	input RST;
	
//	input [15:0] COND;
//	input [15:0] REG_B;
//	input [5:0] OPCD;
//	input [4:0] RD;
//	input [15:0] IMM;
//	input [15:0] NPC;
//
//	wire [47:0] concat;
//
//	assign concat = {REG_A, REG_B, OPCD, RD, IMM, NPC};
//
//	always@(posedge CLK_PIPE)
//	begin
//		if (RST) //synchronous reset
//			MA_WB = 0;
//		else
//			MA_WB = concat;
//	end

endmodule
