module IF_ID(IR_OUT, NPC_OUT, IR_IN, NPC_IN, SCLK);

	output reg [31:0] IR_OUT;
	output reg [15:0] NPC_OUT;

	input [31:0] IR_IN;
	input [15:0] NPC_IN;

    input SCLK;

    always @ (posedge SCLK) begin
        IR_OUT <= IR_IN;
        NPC_OUT <= NPC_IN;
    end	
endmodule
	