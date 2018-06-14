module EX_MA(ALU_OUT_OUT, OPCD_OUT_OUT, ADDR_REG_OUT_OUT, OPT_BIT_OUT_OUT, RESET_OUT,
             ALU_OUT_IN, OPCD_OUT_IN, ADDR_REG_OUT_IN, OPT_BIT_OUT_IN, CLK, RST);

    output reg [15:0] ALU_OUT_OUT;
    output reg [4:0] OPCD_OUT_OUT, ADDR_REG_OUT_OUT;
    output reg OPT_BIT_OUT_OUT;
    output RESET_OUT;

    input [15:0] ALU_OUT_IN;
    input [4:0] OPCD_OUT_IN, ADDR_REG_OUT_IN;
    input OPT_BIT_OUT_IN;
    input CLK, RST;

    reg [15:0] ALU_OUT;
    reg [4:0] OPCD_OUT, ADDR_REG_OUT;
    reg OPT_BIT_OUT;

	reg RESET;

	reg [3:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
				WAIT_1 = 1,
				WAIT_2 = 2,
				WAIT_3 = 3,
				WAIT_4 = 4,
				WAIT_5 = 5,
				WAIT_6 = 6,
				WAIT_7 = 7,
				WAIT_8 = 8,
				WAIT_9 = 9,
				GET_DATA = 10,
				PREPARE_DATA = 11,
				WAIT_12 = 12;

    assign RESET_OUT = RESET;

    // DPE
    always @ (STATE) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
            case(STATE)
                IDLE: NEXT_STATE = WAIT_1;
                WAIT_1: NEXT_STATE = WAIT_2;
                WAIT_2: NEXT_STATE = WAIT_3;
                WAIT_3: NEXT_STATE = WAIT_4;
                WAIT_4: NEXT_STATE = WAIT_5;
                WAIT_5: NEXT_STATE = WAIT_6;
                WAIT_6: NEXT_STATE = WAIT_7;
                WAIT_7: NEXT_STATE = WAIT_8;
                WAIT_8: NEXT_STATE = WAIT_9;
                WAIT_9: NEXT_STATE = GET_DATA;
                GET_DATA: NEXT_STATE = PREPARE_DATA;
                PREPARE_DATA: NEXT_STATE = WAIT_12;
                WAIT_12: NEXT_STATE = WAIT_1;
                default: NEXT_STATE = IDLE;
            endcase
        end
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            RESET <= 0;
            STATE <= IDLE;
            ALU_OUT <= 0;
            OPCD_OUT <= 0;
            ADDR_REG_OUT <= 0;
            OPT_BIT_OUT <= 0;
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
            RESET <= RESET;
            ALU_OUT <= ALU_OUT;
            OPCD_OUT <= OPCD_OUT;
            ADDR_REG_OUT <= ADDR_REG_OUT;
            OPT_BIT_OUT <= OPT_BIT_OUT;
            /* state logic */
            if(STATE == GET_DATA) begin
                ALU_OUT <= ALU_OUT_IN;
                OPCD_OUT <= OPCD_OUT_IN;
                ADDR_REG_OUT <= ADDR_REG_OUT_IN;
                OPT_BIT_OUT <= OPT_BIT_OUT_IN;
            end
            if(STATE == PREPARE_DATA)
                RESET <= 1;
        end
    end

    // DS
    always @ (STATE) begin
        // se nao tiver em reset
        if(RST) begin
            ALU_OUT_OUT = ALU_OUT_OUT;
            OPCD_OUT_OUT = OPCD_OUT_OUT;
            ADDR_REG_OUT_OUT = ADDR_REG_OUT_OUT;
            OPT_BIT_OUT_OUT = OPT_BIT_OUT_OUT;
            if(STATE == PREPARE_DATA) begin
                ALU_OUT_OUT = ALU_OUT;
                OPCD_OUT_OUT = OPCD_OUT;
                ADDR_REG_OUT_OUT = ADDR_REG_OUT;
                OPT_BIT_OUT_OUT = OPT_BIT_OUT;
            end
        end
        else begin
            ALU_OUT_OUT = 0;
            OPCD_OUT_OUT = 0;
            ADDR_REG_OUT_OUT = 0;
            OPT_BIT_OUT_OUT = 0;
        end
    end

endmodule
