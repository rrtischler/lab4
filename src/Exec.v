module Exec(ALU_OUT, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, COND, NPC_IN, REG_A, REG_B, IMM, OPCD_IN, ADDR_REG_IN, CLK, RST, OPT_BIT_IN, INTERRUPT, RESULT_DIV, ESTADO);

    output reg [31:0] ALU_OUT;
    output [4:0] OPCD_OUT, ADDR_REG_OUT; // repassado
    output reg COND;
    output OPT_BIT_OUT; // repassado
    
    output [2:0] ESTADO;

    input [15:0] NPC_IN, REG_A, REG_B, IMM, RESULT_DIV;
    input [4:0] OPCD_IN, ADDR_REG_IN;
    input CLK, RST, OPT_BIT_IN;

    input [3:0] INTERRUPT;
    
    reg [149:0] PCS_INTERRUPTED;

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
            PCS_INTERRUPTED <= 0;
            ALU_OUT <= 0;
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
            RFLAGS <= RFLAGS;
            REG_OPCD_OUT <= REG_OPCD_OUT;
            REG_ADDR_REG_OUT <= REG_ADDR_REG_OUT;
            REG_OPT_BIT_OUT <= REG_OPT_BIT_OUT;
            ALU_OUT <= ALU_OUT;
            /* state logic */
            if(STATE == CALCULA_ULA_1) begin
                // if is interrupted
                if(INTERRUPT > 0) begin
                    // push current pc
                    PCS_INTERRUPTED[15:0] <= NPC_IN; // salva PC
                    if(INTERRUPT == 4'b0001) ALU_OUT <= IN_CALL_0;
                    else if(INTERRUPT == 4'b0010) ALU_OUT <= IN_CALL_1;
                    else if(INTERRUPT == 4'b0100) ALU_OUT <= IN_CALL_2;
                    else if(INTERRUPT == 4'b1000) ALU_OUT <= IN_CALL_3;
                    
                end
                else if(OPCD_IN == LW) ALU_OUT <= REG_B + IMM; 
                else if(OPCD_IN == SW) ALU_OUT <= REG_B + IMM;
                else if(OPCD_IN == ADD) ALU_OUT <= REG_A + REG_B;
                else if(OPCD_IN == SUB) ALU_OUT <= REG_A - REG_B;
                else if(OPCD_IN == MUL) ALU_OUT <= REG_A * REG_B;
                // else if(OPCD_IN == DIV) ALU_OUT <= REG_A / REG_B;
                else if(OPCD_IN == AND) ALU_OUT <= REG_A & REG_B;
                else if(OPCD_IN == OR) ALU_OUT <= REG_A | REG_B;
                else if(OPCD_IN == CMP) ALU_OUT <= 0;
                else if(OPCD_IN == NOT) ALU_OUT <= ~REG_A;
                else if(OPCD_IN == JR) ALU_OUT <= REG_A;
                else if(OPCD_IN == JPC) ALU_OUT <= IMM;
                else if(OPCD_IN == BRLF) ALU_OUT <= REG_A;
                else if(OPCD_IN == CALL) ALU_OUT <= REG_A;
                else if(OPCD_IN == RET) begin
                    ALU_OUT <= PCS_INTERRUPTED[15:0];
                    // shift pcs
                    PCS_INTERRUPTED <= PCS_INTERRUPTED << 16;
                end
                else if(OPCD_IN == NOP) ALU_OUT <= 0;
            end
            else if(STATE == CALCULA_ULA_2) begin
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
            end
            else if(STATE == CALCULA_ULA_3) begin
                if(OPCD_IN == DIV) ALU_OUT <= RESULT_DIV;
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