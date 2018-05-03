module InstDecode(REG_A, REG_B, OPCD, RD, IMM, NPC, CLK, RST, IF_ID, DATA_WRBK, OPCD_WRBK, RD_WRBK);
	
	output reg [15:0] REG_A;
	output reg [15:0] REG_B;
	output [5:0] OPCD;
	output [4:0] RD;
	output [15:0] IMM;
	output [15:0] NPC;
	
	input RST;
	input CLK;
	input [47:0] IF_ID;
	input [15:0] DATA_WRBK;
	input [5:0] OPCD_WRBK;
	input [4:0] RD_WRBK;

	reg [31:0] [15:0] ARR_REG;

	parameter SW = 5'b00001;

	always @ (posedge CLK) begin
		if(!RST) begin
			ARR_REG <= 0;
		end
		else begin
			if(OPCD_WRBK == SW ) begin
				ARR_REG [RD_WRBK] <= DATA_WRBK;
			end
		end
	end
	
	
endmodule
