module WriteBack()

    output reg [15:0] DATA_OUT;
    output reg [4:0] ADDR_REG_OUT;
    output reg COND;

    input [15:0] DATA_IN;
    input [4:0] OPCD_IN, ADDR_REG_IN;
    input OPT_BIT_IN;

    entrada: CLK(1), RST(1), OPCODE(5), OPT_BIT(1), DATA_OUT(16)
    saida: COND(1), ADDR_REG(5), DATA_OUT(16)

    reg [2:0] STATE, NEXT_STATE;
    parameter IDLE = 0,
              WRITE_BACK = 1,
              VAZIO_0 = 2,
              VAZIO_1 = 3,
              VAZIO_2 = 4,
              VAZIO_3 = 5,
              VAZIO_4 = 6,

    parameter	LW 		= 5'b00000,
                SW 		= 5'b00001,
                //
                ADD 	= 5'b00010,
                SUB		= 5'b00011,
                MUL 	= 5'b00100,
                DIV 	= 5'b00101,
                //
                AND		= 5'b00110,
                OR		= 5'b00111,
                CMP		= 5'b01000,
                NOT 	= 5'b01001,
                //
                JR		= 5'b01010,
                JPC		= 5'b01011,
                BRLF	= 5'b01100,
                CALL	= 5'b01101,
                RET 	= 5'b01110,
                NOP 	= 5'b01111;
    
    // DPE
    always @ (STATE) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
            case(STATE)
                IDLE: NEXT_STATE = WRITE_BACK;
                WRITE_BACK: NEXT_STATE = VAZIO_0;
                VAZIO_0: NEXT_STATE = VAZIO_1;
                VAZIO_1: NEXT_STATE = VAZIO_2;
                VAZIO_2: NEXT_STATE = VAZIO_3;
                VAZIO_3: NEXT_STATE = VAZIO_4;
                VAZIO_4: NEXT_STATE = WRITE_BACK;
                default: NEXT_STATE = IDLE;
            endcase
        end
    end

    // MEM
    always @ (posedge CLOCK) begin
        if(!RST) begin
            STATE <= IDLE;
        end
        else begin
            STATE <= NEXT_STATE;
        end
    end

    // DS
    always @ (STATE) begin
        case(STATE)
            IDLE: begin
                DATA_OUT = 0;
                ADDR_REG_OUT = 0;
                COND = 0;
            end
            WRITE_BACK: begin
                if(OPCD_IN == LW) begin
                    DATA_OUT = DATA_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    COND = 1;
                end else begin
                    DATA_OUT = 0;
                    ADDR_REG_OUT = 0;
                    COND = 0;
                end
            end
            VAZIO_0: begin
                if(OPCD_IN == LW) begin
                    DATA_OUT = DATA_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    COND = 1;
                end else begin
                    DATA_OUT = 0;
                    ADDR_REG_OUT = 0;
                    COND = 0;
                end
            end
            VAZIO_1: begin
                if(OPCD_IN == LW) begin
                    DATA_OUT = DATA_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    COND = 1;
                end else begin
                    DATA_OUT = 0;
                    ADDR_REG_OUT = 0;
                    COND = 0;
                end
            end
            VAZIO_2: begin
                if(OPCD_IN == LW) begin
                    DATA_OUT = DATA_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    COND = 1;
                end else begin
                    DATA_OUT = 0;
                    ADDR_REG_OUT = 0;
                    COND = 0;
                end
            end
            VAZIO_3: begin
                if(OPCD_IN == LW) begin
                    DATA_OUT = DATA_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    COND = 1;
                end else begin
                    DATA_OUT = 0;
                    ADDR_REG_OUT = 0;
                    COND = 0;
                end
            end
            VAZIO_4: begin
                if(OPCD_IN == LW) begin
                    DATA_OUT = DATA_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    COND = 1;
                end else begin
                    DATA_OUT = 0;
                    ADDR_REG_OUT = 0;
                    COND = 0;
                end
            end
            default: begin
                DATA_OUT = 0;
                ADDR_REG_OUT = 0;
                COND = 0;
            end
        endcase
    end

endmodule
