module Exec(ALU_OUT, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, COND, NPC_IN, REG_A, REG_B, IMM, OPCD_IN, ADDR_REG_IN, CLK, RST, OPT_BIT_IN, ESTADO);

    output [31:0] ALU_OUT;
    output reg [4:0] OPCD_OUT, ADDR_REG_OUT;
    output reg OPT_BIT_OUT, COND;
    
    output [2:0] ESTADO;

    input [15:0] NPC_IN, REG_A, REG_B, IMM;
    input [4:0] OPCD_IN, ADDR_REG_IN;
    input CLK, RST, OPT_BIT_IN;

    reg [4:0] RFLAGS;

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                CALCULA_ULA_1 = 1,
                CALCULA_ULA_2 = 2,
                CALCULA_ULA_3 = 3,
                SEND = 4,
                BRANCH_JUMP = 5,
                VAZIO_0 = 6;


    parameter   LW      = 5'b00000,
                SW      = 5'b00001,
                //
                ADD     = 5'b00010,
                SUB     = 5'b00011,
                MUL     = 5'b00100,
                DIV     = 5'b00101,
                //
                AND     = 5'b00110,
                OR      = 5'b00111,
                CMP     = 5'b01000,
                NOT     = 5'b01001,
                //
                JR      = 5'b01010,
                JPC     = 5'b01011,
                BRLF    = 5'b01100,
                CALL    = 5'b01101,
                RET     = 5'b01110,
                NOP     = 5'b01111;
    
    // debug
    assign ESTADO = STATE;

    // ULA
    assign ALU_OUT = (OPCD_IN == LW)    ? REG_B + IMM // precisa para valor de memoria regB + Imm
                   : (OPCD_IN == SW)    ? REG_B + IMM // precisa para valor de memoria regB + Imm
                   : (OPCD_IN == ADD)   ? REG_A + REG_B
                   : (OPCD_IN == SUB)   ? REG_A - REG_B
                   : (OPCD_IN == MUL)   ? REG_A * REG_B
                   : (OPCD_IN == DIV)   ? REG_A / REG_B
                   : (OPCD_IN == AND)   ? REG_A & REG_B
                   : (OPCD_IN == OR)    ? REG_A | REG_B
                   : (OPCD_IN == CMP)   ? 0 // seta flags somente
                   : (OPCD_IN == NOT)   ? ~REG_A
                   : (OPCD_IN == JR)    ? REG_A
                   : (OPCD_IN == JPC)   ? IMM
                   : (OPCD_IN == BRLF)  ? REG_A // vai pro endereco [REG_A] se RFLAGS[i] == OPT_BIT_IN
                   : (OPCD_IN == CALL)  ? REG_A // chamada de subrotina no endereco [REG_A]
                   : (OPCD_IN == RET)   ? 0
                   : (OPCD_IN == NOP)   ? 0
                   /* default */        : 0;
    // DPE
    always @ (STATE) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
            case(STATE)
                IDLE: NEXT_STATE = CALCULA_ULA_1;
                CALCULA_ULA_1: NEXT_STATE = CALCULA_ULA_2;
                CALCULA_ULA_2: NEXT_STATE = CALCULA_ULA_3;
                CALCULA_ULA_3: NEXT_STATE = SEND;
                SEND: NEXT_STATE = BRANCH_JUMP;
                BRANCH_JUMP: NEXT_STATE = VAZIO_0;
                VAZIO_0: NEXT_STATE = CALCULA_ULA_1;
                default: NEXT_STATE = IDLE;
            endcase
        end
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            STATE <= IDLE;
            RFLAGS <= 0;
        end
        else begin
              STATE <= NEXT_STATE;
            /* defaults */
            RFLAGS <= RFLAGS;
            /* state logic */
            // if(STATE == CALCULA_ULA_1 ||
            //    STATE == CALCULA_ULA_2 ||
            //    STATE == CALCULA_ULA_3) begin
            if(OPCD_IN == CMP) begin
                if(REG_A > REG_B) // above
                    RFLAGS[3] <= 1;
                if(REG_A == REG_B) // equal
                    RFLAGS[2] <= 1;
                if(REG_A < REG_B) // below
                    RFLAGS[1] <= 1;
                if(ALU_OUT > 16'b1111111111111111) // overflow
                    RFLAGS[0] <= 1;
            end
            // end
        end
    end

    // DS
    always @ (STATE) begin
        // se nao tiver em reset
        if(RST) begin
            case(STATE)
                IDLE: begin
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    COND = 0;
                end
                CALCULA_ULA_1: begin
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    COND = 0;
                end
                CALCULA_ULA_2: begin
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    COND = 0;
                end
                CALCULA_ULA_3: begin
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    COND = 0;
                end
                SEND: begin
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    COND = 0;
                end
                BRANCH_JUMP: begin
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    if(OPCD_IN == JR ||
                    OPCD_IN == JPC)
                        COND = 1;
                    else if (OPCD_IN == BRLF && RFLAGS[REG_B] == OPT_BIT_IN)
                        COND = 1;
                    else
                        COND = 0;
                end
                VAZIO_0: begin
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    COND = 0;
                end
                default: begin
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    COND = 0;
                end
            endcase
        end
        else begin
            OPCD_OUT = 0;
            ADDR_REG_OUT = 0;
            OPT_BIT_OUT = 0;
            COND = 0;
        end
    end

endmodule