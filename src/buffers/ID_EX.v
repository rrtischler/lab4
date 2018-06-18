module ID_EX(REG_A_OUT, REG_B_OUT, IMM_OUT, NPC_OUT_OUT, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT,
             REG_A_IN, REG_B_IN, IMM_IN, NPC_OUT_IN, OPCD_IN, ADDR_REG_IN, OPT_BIT_IN, SCLK);

    output reg [15:0] REG_A_OUT, REG_B_OUT, IMM_OUT, NPC_OUT_OUT;
    output reg [4:0] OPCD_OUT; 
    output reg [4:0] ADDR_REG_OUT; 
    output reg OPT_BIT_OUT;

    input [15:0] REG_A_IN, REG_B_IN, IMM_IN, NPC_OUT_IN;
    input [4:0] OPCD_IN;
    input [4:0] ADDR_REG_IN;
    input OPT_BIT_IN;

    input SCLK;

    always @ (posedge SCLK) begin
        REG_A_OUT <= REG_A_IN;
        REG_B_OUT <= REG_B_IN;
        IMM_OUT <= IMM_IN;
        NPC_OUT_OUT <= NPC_OUT_IN;
        OPCD_OUT <= OPCD_IN;
        ADDR_REG_OUT <= ADDR_REG_IN;
        OPT_BIT_OUT <= OPT_BIT_IN;
    end
endmodule
