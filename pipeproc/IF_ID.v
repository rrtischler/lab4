module IF_ID(IF_ID, RST, CLK_PIPE, NPC, IR);

	output reg [47:0] IF_ID;

	input RST;
	input CLK_PIPE;
	
	input [15:0] NPC;
	input [31:0] IR;

	wire [47:0] concat;

	assign concat = {NPC, IR};

	always@(posedge CLK_PIPE)
	begin
		if (RST) //synchronous reset
			IF_ID = 0;
		else
			IF_ID = concat;
	end
	
endmodule
	