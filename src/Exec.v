module Exec(ALU_OUT, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, COND, NPC_IN, REG_A, REG_B, IMM, OPCD_IN, ADDR_REG_IN, CLK, RST, OPT_BIT_IN, ESTADO, INTERRUPT);

    output [31:0] ALU_OUT;
    output [4:0] OPCD_OUT, ADDR_REG_OUT;
    output reg COND;
    output OPT_BIT_OUT;
    
    output [2:0] ESTADO;

    input [15:0] NPC_IN, REG_A, REG_B, IMM;
    input [4:0] OPCD_IN, ADDR_REG_IN;
    input CLK, RST, OPT_BIT_IN;

    input [3:0] INTERRUPT;
    
    reg [15:0] PCS_INTERRUPTED [4:0]; // 5 registers of 10 bits
    reg [2:0] COUNT_PCS;

    reg [4:0] RFLAGS;
    reg [4:0] REG_OPCD_OUT, REG_ADDR_REG_OUT;
    reg REG_OPT_BIT_OUT;

    reg [2:0] STATE, NEXT_STATE;

    // posições na memória predefinidas para as interrupções
    parameter   IN_CALL_0 = 1,
                IN_CALL_1 = 2,
                IN_CALL_2 = 3,
                IN_CALL_3 = 4;

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
    
    assign OPCD_OUT = REG_OPCD_OUT;
    assign ADDR_REG_OUT = REG_ADDR_REG_OUT;
    assign OPT_BIT_OUT = REG_OPT_BIT_OUT;

    // ULA
    assign ALU_OUT = (INTERRUPT == 4'b0001) ? IN_CALL_0 // interrupções prioritárias
                   : (INTERRUPT == 4'b0010) ? IN_CALL_1
                   : (INTERRUPT == 4'b0100) ? IN_CALL_2
                   : (INTERRUPT == 4'b1000) ? IN_CALL_3
                   : (OPCD_IN == LW)        ? REG_B + IMM // precisa para valor de memoria regB + Imm
                   : (OPCD_IN == SW)        ? REG_B + IMM // precisa para valor de memoria regB + Imm
                   : (OPCD_IN == ADD)       ? REG_A + REG_B
                   : (OPCD_IN == SUB)       ? REG_A - REG_B
                   : (OPCD_IN == MUL)       ? REG_A * REG_B
                   : (OPCD_IN == DIV)       ? REG_A / REG_B
                   : (OPCD_IN == AND)       ? REG_A & REG_B
                   : (OPCD_IN == OR)        ? REG_A | REG_B
                   : (OPCD_IN == CMP)       ? 0 // seta flags somente; sem saida
                   : (OPCD_IN == NOT)       ? ~REG_A
                   : (OPCD_IN == JR)        ? REG_A
                   : (OPCD_IN == JPC)       ? IMM
                   : (OPCD_IN == BRLF)      ? REG_A // vai pro endereco [REG_A] se RFLAGS[i] == OPT_BIT_IN
                   : (OPCD_IN == CALL)      ? REG_A // chamada de subrotina no endereco [REG_A]
                   : (OPCD_IN == RET)       ? PCS_INTERRUPTED[COUNT_PCS] // retorna pro ultimo pc
                   : (OPCD_IN == NOP)       ? 0
    /* default */  :                          0; // default; sem saida

    // DPE
    always @ (*) begin
        NEXT_STATE = STATE;
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

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            STATE <= IDLE;
            RFLAGS <= 0;
            REG_OPCD_OUT <= 0;
            REG_ADDR_REG_OUT <= 0;
            REG_OPT_BIT_OUT <= 0;
            PCS_INTERRUPTED[0] <= 0;
            PCS_INTERRUPTED[1] <= 0;
            PCS_INTERRUPTED[2] <= 0;
            PCS_INTERRUPTED[3] <= 0;
            PCS_INTERRUPTED[4] <= 0;
            COUNT_PCS <= 0;
        end
        else begin
              STATE <= NEXT_STATE;
            /* defaults */
            RFLAGS <= RFLAGS;
            REG_OPCD_OUT <= REG_OPCD_OUT;
            REG_ADDR_REG_OUT <= REG_ADDR_REG_OUT;
            REG_OPT_BIT_OUT <= REG_OPT_BIT_OUT;
            PCS_INTERRUPTED[0] <= PCS_INTERRUPTED[0];
            PCS_INTERRUPTED[1] <= PCS_INTERRUPTED[1];
            PCS_INTERRUPTED[2] <= PCS_INTERRUPTED[2];
            PCS_INTERRUPTED[3] <= PCS_INTERRUPTED[3];
            PCS_INTERRUPTED[4] <= PCS_INTERRUPTED[4];
            COUNT_PCS <= COUNT_PCS;
            /* state logic */
            if(INTERRUPT > 0) begin
                // coloca na pilha
                COUNT_PCS <= COUNT_PCS + 1;
                PCS_INTERRUPTED[COUNT_PCS] <= NPC_IN;
            end

            else if(OPCD_IN == RET) begin
                // retira da pilha 1
                COUNT_PCS <= COUNT_PCS - 1;
                PCS_INTERRUPTED[0] <= PCS_INTERRUPTED[1];
                PCS_INTERRUPTED[1] <= PCS_INTERRUPTED[2];
                PCS_INTERRUPTED[2] <= PCS_INTERRUPTED[3];
                PCS_INTERRUPTED[3] <= PCS_INTERRUPTED[4];
            end

            else if(OPCD_IN == CMP) begin
                if(REG_A > REG_B) // above
                    RFLAGS[3] <= 1;
                if(REG_A == REG_B) // equal
                    RFLAGS[2] <= 1;
                if(REG_A < REG_B) // below
                    RFLAGS[1] <= 1;
                if(ALU_OUT > 16'b1111111111111111) // overflow
                    RFLAGS[0] <= 1;
            end
            else if(STATE == SEND) begin
                REG_OPCD_OUT <= OPCD_IN;
                REG_ADDR_REG_OUT <= ADDR_REG_IN;
                REG_OPT_BIT_OUT <= OPT_BIT_IN;
            end
        end
    end

    // DS
    always @ (*) begin
        COND = 0;
        if(STATE == BRANCH_JUMP) begin
            if(INTERRUPT > 0)
                COND = 1;
            else if(OPCD_IN == JR ||
            OPCD_IN == JPC)
                COND = 1;
            else if (OPCD_IN == BRLF && RFLAGS[REG_B] == OPT_BIT_IN)
                COND = 1;
        end
    end
endmodule