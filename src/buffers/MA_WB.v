module MA_WB(DATA_OUT_OUT, OPCD_OUT_OUT, ADDR_REG_OUT_OUT, OPT_BIT_OUT_OUT,
             DATA_OUT_IN, OPCD_OUT_IN, ADDR_REG_OUT_IN, OPT_BIT_OUT_IN, DCLK);

    output reg [15:0] DATA_OUT_OUT;
    output reg [4:0] OPCD_OUT_OUT, ADDR_REG_OUT_OUT;
    output reg OPT_BIT_OUT_OUT;

    input [15:0] DATA_OUT_IN;
    input [4:0] OPCD_OUT_IN, ADDR_REG_OUT_IN;
    input OPT_BIT_OUT_IN;

    input DCLK;

    always @ (posedge DCLK) begin
        DATA_OUT_OUT <= DATA_OUT_IN;
        OPCD_OUT_OUT <= OPCD_OUT_IN;
        ADDR_REG_OUT_OUT <= ADDR_REG_OUT_IN;
        OPT_BIT_OUT_OUT <= OPT_BIT_OUT_IN;
    end
endmodule
