module EX_MA(ALU_OUT_OUT, OPCD_OUT_OUT, ADDR_REG_OUT_OUT, OPT_BIT_OUT_OUT,
             ALU_OUT_IN, OPCD_OUT_IN, ADDR_REG_OUT_IN, OPT_BIT_OUT_IN, SCLK);

    output reg [15:0] ALU_OUT_OUT;
    output reg [4:0] OPCD_OUT_OUT, ADDR_REG_OUT_OUT;
    output reg OPT_BIT_OUT_OUT;

    input [15:0] ALU_OUT_IN;
    input [4:0] OPCD_OUT_IN, ADDR_REG_OUT_IN;
    input OPT_BIT_OUT_IN;
    
    input SCLK;

    always @ (posedge SCLK) begin
        ALU_OUT_OUT <= ALU_OUT_IN;
        OPCD_OUT_OUT <= OPCD_OUT_IN;
        ADDR_REG_OUT_OUT <= ADDR_REG_OUT_IN;
        OPT_BIT_OUT_OUT <= OPT_BIT_OUT_IN;
    end
endmodule
