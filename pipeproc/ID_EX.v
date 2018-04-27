module ID_EX(ID_EX, RST, CLK_PIPE, REG_A, REG_B, OPCD, RD, IMM, NPC);

	output reg [74:0] ID_EX;

	input RST;
	input CLK_PIPE;
	
	input [15:0] REG_A;
	input [15:0] REG_B;
	input [5:0] OPCD;
	input [4:0] RD;
	input [15:0] IMM;
	input [15:0] NPC;

	wire [47:0] concat;

	assign concat = {REG_A, REG_B, OPCD, RD, IMM, NPC};

	always@(posedge CLK_PIPE)
	begin
		if (RST) //synchronous reset
				ID_EX = 0;
			else
				ID_EX = concat;
	end
	
endmodule
