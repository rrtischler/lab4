module ID_EX(REG_A_OUT, REG_B_OUT, IMM_OUT, NPC_OUT_OUT, OPCD_OUT, ADDR_REG_OUT, OPT_BIT, RESET_OUT,
             REG_A_IN, REG_B_IN, IMM_IN, NPC_OUT_IN, OPCD_IN, ADDR_REG_IN, CLK, RST);

    output reg [15:0] REG_A_OUT, REG_B_OUT, IMM_OUT, NPC_OUT_OUT;
    output reg [4:0] OPCD_OUT;
    output reg [4:0] ADDR_REG_OUT;
    output reg OPT_BIT;
    output RESET_OUT;

    input [15:0] REG_A_IN, REG_B_IN, IMM_IN, NPC_OUT_IN;
    input [5:0] OPCD_IN;
    input [4:0] ADDR_REG_IN;
    input CLK, RST;

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
				WAIT_10 = 10,
				GET_PREPARE_DATA = 11,
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
                WAIT_9: NEXT_STATE = WAIT_10;
                WAIT_10: NEXT_STATE = GET_PREPARE_DATA;
                GET_PREPARE_DATA: NEXT_STATE = WAIT_12; // atrasado
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
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
            RESET <= RESET;
            /* state logic */
            if(STATE == GET_PREPARE_DATA)
                RESET <= 1;
        end
    end

    // DS
    always @ (STATE) begin
        // se nao tiver em reset
        if(RST) begin
            REG_A_OUT = REG_A_OUT;
            REG_B_OUT = REG_B_OUT;
            IMM_OUT = IMM_OUT;
            NPC_OUT_OUT = NPC_OUT_OUT;
            OPCD_OUT = OPCD_OUT;
            OPT_BIT = OPT_BIT;
            ADDR_REG_OUT = ADDR_REG_OUT;
            if(STATE == GET_PREPARE_DATA) begin
                REG_A_OUT = REG_A_IN;
                REG_B_OUT = REG_B_IN;
                IMM_OUT = IMM_IN;
                NPC_OUT_OUT = NPC_OUT_IN;
                OPCD_OUT = OPCD_IN[5:1];
                OPT_BIT = OPCD_IN[0];
                ADDR_REG_OUT = ADDR_REG_IN;
            end
        end
        else begin
            REG_A_OUT = 0;
            REG_B_OUT = 0;
            IMM_OUT = 0;
            NPC_OUT_OUT = 0;
            OPCD_OUT = 0;
            OPT_BIT = 0;
            ADDR_REG_OUT = 0;
        end
    end
	
endmodule
