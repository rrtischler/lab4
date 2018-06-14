module InstDecode(REG_A, REG_B, OPCD, IMM, NPC_OUT, CLK, RST, IR, NPC_IN, WB_OUT, COND_WB, RD_WB, MEM_ACC_OUT, EXE_OUT, ADDR_REG, ESTADO);

    output reg [15:0] REG_A, REG_B, IMM, NPC_OUT;
    output reg [5:0] OPCD;
    output reg [4:0] ADDR_REG;

    output [2:0] ESTADO;
    // output reg [4:0] RD; // ???

    
    input [31:0] IR; // [31:27]: opcode, [26]: extra bit, [25:21]: Ra, [20:16]: Rb, [15:0]: Imm
    input [15:0] NPC_IN, MEM_ACC_OUT, EXE_OUT, WB_OUT; // MEM_ACC_OUT, EXE_OUT, WB_OUT: tratamento de hazards
    input [4:0] RD_WB;
    input COND_WB, RST, CLK;

    reg [15:0] ARR_REG [31:0]; // 32 registers of 16 bit size
    reg [2:0] ARR_FLAG_REG [31:0]; // 32 registers of 3 bit size (anti hazard gimmick)

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                WAIT_WB = 1,
                WB_WRTING = 2,
                VAZIO_0 = 3,
                VAZIO_1 = 4,
                READ_SEND = 5,
                D_TABLE = 6;

    // opcodes
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

    // DPE          
    always @(*) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
            case(STATE)
                IDLE: NEXT_STATE = WAIT_WB;
                WAIT_WB: NEXT_STATE = WB_WRTING;
                WB_WRTING: NEXT_STATE = VAZIO_0;
                VAZIO_0: NEXT_STATE = VAZIO_1;
                VAZIO_1: NEXT_STATE = READ_SEND;
                READ_SEND: NEXT_STATE = D_TABLE;
                D_TABLE: NEXT_STATE = WAIT_WB;
                default: NEXT_STATE = IDLE;
            endcase
        end
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            // reset ARR_REG
                ARR_REG[0] <= 0;
                ARR_REG[1] <= 0;
                ARR_REG[2] <= 0;
                ARR_REG[3] <= 0;
                ARR_REG[4] <= 0;
                ARR_REG[5] <= 0;
                ARR_REG[6] <= 0;
                ARR_REG[7] <= 0;
                ARR_REG[8] <= 0;
                ARR_REG[9] <= 0;
                ARR_REG[10] <= 0;
                ARR_REG[11] <= 0;
                ARR_REG[12] <= 0;
                ARR_REG[13] <= 0;
                ARR_REG[14] <= 0;
                ARR_REG[15] <= 0;
                ARR_REG[16] <= 0;
                ARR_REG[17] <= 0;
                ARR_REG[18] <= 0;
                ARR_REG[19] <= 0;
                ARR_REG[20] <= 0;
                ARR_REG[21] <= 0;
                ARR_REG[22] <= 0;
                ARR_REG[23] <= 0;
                ARR_REG[24] <= 0;
                ARR_REG[25] <= 0;
                ARR_REG[26] <= 0;
                ARR_REG[27] <= 0;
                ARR_REG[28] <= 0;
                ARR_REG[29] <= 0;
                ARR_REG[30] <= 0;
                ARR_REG[31] <= 0;
                // reset ARR_FLAG_REG
            ARR_FLAG_REG[0] <= 0;
                ARR_FLAG_REG[1] <= 0;
                ARR_FLAG_REG[2] <= 0;
                ARR_FLAG_REG[3] <= 0;
                ARR_FLAG_REG[4] <= 0;
                ARR_FLAG_REG[5] <= 0;
                ARR_FLAG_REG[6] <= 0;
                ARR_FLAG_REG[7] <= 0;
                ARR_FLAG_REG[8] <= 0;
                ARR_FLAG_REG[9] <= 0;
                ARR_FLAG_REG[10] <= 0;
                ARR_FLAG_REG[11] <= 0;
                ARR_FLAG_REG[12] <= 0;
                ARR_FLAG_REG[13] <= 0;
                ARR_FLAG_REG[14] <= 0;
                ARR_FLAG_REG[15] <= 0;
                ARR_FLAG_REG[16] <= 0;
                ARR_FLAG_REG[17] <= 0;
                ARR_FLAG_REG[18] <= 0;
                ARR_FLAG_REG[19] <= 0;
                ARR_FLAG_REG[20] <= 0;
                ARR_FLAG_REG[21] <= 0;
                ARR_FLAG_REG[22] <= 0;
                ARR_FLAG_REG[23] <= 0;
                ARR_FLAG_REG[24] <= 0;
                ARR_FLAG_REG[25] <= 0;
                ARR_FLAG_REG[26] <= 0;
                ARR_FLAG_REG[27] <= 0;
                ARR_FLAG_REG[28] <= 0;
                ARR_FLAG_REG[29] <= 0;
                ARR_FLAG_REG[30] <= 0;
                ARR_FLAG_REG[31] <= 0;
                // reset state
            STATE <= IDLE;
        end
        else begin
                STATE <= NEXT_STATE;
            /* defaults */
            // same state ARR_REG
            ARR_REG[0] <= ARR_REG[0];
                ARR_REG[1] <= ARR_REG[1];
                ARR_REG[2] <= ARR_REG[2];
                ARR_REG[3] <= ARR_REG[3];
                ARR_REG[4] <= ARR_REG[4];
                ARR_REG[5] <= ARR_REG[5];
                ARR_REG[6] <= ARR_REG[6];
                ARR_REG[7] <= ARR_REG[7];
                ARR_REG[8] <= ARR_REG[8];
                ARR_REG[9] <= ARR_REG[9];
                ARR_REG[10] <= ARR_REG[10];
                ARR_REG[11] <= ARR_REG[11];
                ARR_REG[12] <= ARR_REG[12];
                ARR_REG[13] <= ARR_REG[13];
                ARR_REG[14] <= ARR_REG[14];
                ARR_REG[15] <= ARR_REG[15];
                ARR_REG[16] <= ARR_REG[16];
                ARR_REG[17] <= ARR_REG[17];
                ARR_REG[18] <= ARR_REG[18];
                ARR_REG[19] <= ARR_REG[19];
                ARR_REG[20] <= ARR_REG[20];
                ARR_REG[21] <= ARR_REG[21];
                ARR_REG[22] <= ARR_REG[22];
                ARR_REG[23] <= ARR_REG[23];
                ARR_REG[24] <= ARR_REG[24];
                ARR_REG[25] <= ARR_REG[25];
                ARR_REG[26] <= ARR_REG[26];
                ARR_REG[27] <= ARR_REG[27];
                ARR_REG[28] <= ARR_REG[28];
                ARR_REG[29] <= ARR_REG[29];
                ARR_REG[30] <= ARR_REG[30];
                ARR_REG[31] <= ARR_REG[31];
                // same state ARR_FLAG_REG
                ARR_FLAG_REG[0] <= ARR_FLAG_REG[0];
                ARR_FLAG_REG[1] <= ARR_FLAG_REG[1];
                ARR_FLAG_REG[2] <= ARR_FLAG_REG[2];
                ARR_FLAG_REG[3] <= ARR_FLAG_REG[3];
                ARR_FLAG_REG[4] <= ARR_FLAG_REG[4];
                ARR_FLAG_REG[5] <= ARR_FLAG_REG[5];
                ARR_FLAG_REG[6] <= ARR_FLAG_REG[6];
                ARR_FLAG_REG[7] <= ARR_FLAG_REG[7];
                ARR_FLAG_REG[8] <= ARR_FLAG_REG[8];
                ARR_FLAG_REG[9] <= ARR_FLAG_REG[9];
                ARR_FLAG_REG[10] <= ARR_FLAG_REG[10];
                ARR_FLAG_REG[11] <= ARR_FLAG_REG[11];
                ARR_FLAG_REG[12] <= ARR_FLAG_REG[12];
                ARR_FLAG_REG[13] <= ARR_FLAG_REG[13];
                ARR_FLAG_REG[14] <= ARR_FLAG_REG[14];
                ARR_FLAG_REG[15] <= ARR_FLAG_REG[15];
                ARR_FLAG_REG[16] <= ARR_FLAG_REG[16];
                ARR_FLAG_REG[17] <= ARR_FLAG_REG[17];
                ARR_FLAG_REG[18] <= ARR_FLAG_REG[18];
                ARR_FLAG_REG[19] <= ARR_FLAG_REG[19];
                ARR_FLAG_REG[20] <= ARR_FLAG_REG[20];
                ARR_FLAG_REG[21] <= ARR_FLAG_REG[21];
                ARR_FLAG_REG[22] <= ARR_FLAG_REG[22];
                ARR_FLAG_REG[23] <= ARR_FLAG_REG[23];
                ARR_FLAG_REG[24] <= ARR_FLAG_REG[24];
                ARR_FLAG_REG[25] <= ARR_FLAG_REG[25];
                ARR_FLAG_REG[26] <= ARR_FLAG_REG[26];
                ARR_FLAG_REG[27] <= ARR_FLAG_REG[27];
                ARR_FLAG_REG[28] <= ARR_FLAG_REG[28];
                ARR_FLAG_REG[29] <= ARR_FLAG_REG[29];
                ARR_FLAG_REG[30] <= ARR_FLAG_REG[30];
                ARR_FLAG_REG[31] <= ARR_FLAG_REG[31];
            /* state logic */
            if(STATE == WB_WRTING && COND_WB)
                ARR_REG[RD_WB] = WB_OUT; // grava dados wb se for a condicao certa
            else
                ARR_REG[RD_WB] = ARR_REG[RD_WB];
            if(STATE == READ_SEND) begin
                if(IR[31:27] == LW || 
                   IR[31:27] == SW || 
                   IR[31:27] == ADD || 
                   IR[31:27] == SUB || 
                   IR[31:27] == MUL || 
                   IR[31:27] == DIV || 
                   IR[31:27] == AND || 
                   IR[31:27] == OR || 
                   IR[31:27] == CMP || 
                   IR[31:27] == NOT || 
                   IR[31:27] == JR || 
                   IR[31:27] == BRLF || 
                   IR[31:27] == CALL)
                        ARR_FLAG_REG[IR[25:21]] <= 4;
                if((IR[31:27] == LW && IR[26] == 1) || 
                   IR[31:27] == SW || 
                   IR[31:27] == ADD || 
                   IR[31:27] == SUB || 
                   IR[31:27] == MUL || 
                   IR[31:27] == DIV || 
                   IR[31:27] == AND || 
                   IR[31:27] == OR || 
                   IR[31:27] == CMP)
                           ARR_FLAG_REG[IR[20:16]] <= 4;
            end
            if(STATE == D_TABLE) begin
                // nao se preocupe, isso foi gerado por um codigo python :^)
                if(ARR_FLAG_REG[0] > 0) ARR_FLAG_REG[0] <= ARR_FLAG_REG[0] - 1;
                if(ARR_FLAG_REG[1] > 0) ARR_FLAG_REG[1] <= ARR_FLAG_REG[1] - 1;
                if(ARR_FLAG_REG[2] > 0) ARR_FLAG_REG[2] <= ARR_FLAG_REG[2] - 1;
                if(ARR_FLAG_REG[3] > 0) ARR_FLAG_REG[3] <= ARR_FLAG_REG[3] - 1;
                if(ARR_FLAG_REG[4] > 0) ARR_FLAG_REG[4] <= ARR_FLAG_REG[4] - 1;
                if(ARR_FLAG_REG[5] > 0) ARR_FLAG_REG[5] <= ARR_FLAG_REG[5] - 1;
                if(ARR_FLAG_REG[6] > 0) ARR_FLAG_REG[6] <= ARR_FLAG_REG[6] - 1;
                if(ARR_FLAG_REG[7] > 0) ARR_FLAG_REG[7] <= ARR_FLAG_REG[7] - 1;
                if(ARR_FLAG_REG[8] > 0) ARR_FLAG_REG[8] <= ARR_FLAG_REG[8] - 1;
                if(ARR_FLAG_REG[9] > 0) ARR_FLAG_REG[9] <= ARR_FLAG_REG[9] - 1;
                if(ARR_FLAG_REG[10] > 0) ARR_FLAG_REG[10] <= ARR_FLAG_REG[10] - 1;
                if(ARR_FLAG_REG[11] > 0) ARR_FLAG_REG[11] <= ARR_FLAG_REG[11] - 1;
                if(ARR_FLAG_REG[12] > 0) ARR_FLAG_REG[12] <= ARR_FLAG_REG[12] - 1;
                if(ARR_FLAG_REG[13] > 0) ARR_FLAG_REG[13] <= ARR_FLAG_REG[13] - 1;
                if(ARR_FLAG_REG[14] > 0) ARR_FLAG_REG[14] <= ARR_FLAG_REG[14] - 1;
                if(ARR_FLAG_REG[15] > 0) ARR_FLAG_REG[15] <= ARR_FLAG_REG[15] - 1;
                if(ARR_FLAG_REG[16] > 0) ARR_FLAG_REG[16] <= ARR_FLAG_REG[16] - 1;
                if(ARR_FLAG_REG[17] > 0) ARR_FLAG_REG[17] <= ARR_FLAG_REG[17] - 1;
                if(ARR_FLAG_REG[18] > 0) ARR_FLAG_REG[18] <= ARR_FLAG_REG[18] - 1;
                if(ARR_FLAG_REG[19] > 0) ARR_FLAG_REG[19] <= ARR_FLAG_REG[19] - 1;
                if(ARR_FLAG_REG[20] > 0) ARR_FLAG_REG[20] <= ARR_FLAG_REG[20] - 1;
                if(ARR_FLAG_REG[21] > 0) ARR_FLAG_REG[21] <= ARR_FLAG_REG[21] - 1;
                if(ARR_FLAG_REG[22] > 0) ARR_FLAG_REG[22] <= ARR_FLAG_REG[22] - 1;
                if(ARR_FLAG_REG[23] > 0) ARR_FLAG_REG[23] <= ARR_FLAG_REG[23] - 1;
                if(ARR_FLAG_REG[24] > 0) ARR_FLAG_REG[24] <= ARR_FLAG_REG[24] - 1;
                if(ARR_FLAG_REG[25] > 0) ARR_FLAG_REG[25] <= ARR_FLAG_REG[25] - 1;
                if(ARR_FLAG_REG[26] > 0) ARR_FLAG_REG[26] <= ARR_FLAG_REG[26] - 1;
                if(ARR_FLAG_REG[27] > 0) ARR_FLAG_REG[27] <= ARR_FLAG_REG[27] - 1;
                if(ARR_FLAG_REG[28] > 0) ARR_FLAG_REG[28] <= ARR_FLAG_REG[28] - 1;
                if(ARR_FLAG_REG[29] > 0) ARR_FLAG_REG[29] <= ARR_FLAG_REG[29] - 1;
                if(ARR_FLAG_REG[30] > 0) ARR_FLAG_REG[30] <= ARR_FLAG_REG[30] - 1;
                if(ARR_FLAG_REG[31] > 0) ARR_FLAG_REG[31] <= ARR_FLAG_REG[31] - 1;
            end
        end
    end

    // DS
    always @(*) begin
        // se nao tiver em reset
        if(RST) begin
            case(STATE)
                IDLE: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
                WAIT_WB: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
                WB_WRTING: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
                VAZIO_0: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
                VAZIO_1: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
                READ_SEND: begin
                    REG_A = 0;
                    // casos em que existe um regA
                    if(IR[31:27] == LW || 
                    IR[31:27] == SW || 
                    IR[31:27] == ADD || 
                    IR[31:27] == SUB || 
                    IR[31:27] == MUL || 
                    IR[31:27] == DIV || 
                    IR[31:27] == AND || 
                    IR[31:27] == OR || 
                    IR[31:27] == CMP || 
                    IR[31:27] == NOT || 
                    IR[31:27] == JR || 
                    IR[31:27] == BRLF || 
                    IR[31:27] == CALL) begin
                            // saber onde procurar o regA
                            case(ARR_FLAG_REG[IR[25:21]])
                                0: REG_A = ARR_REG[IR[25:21]]; // caso padrao
                                1: REG_A = WB_OUT;
                                2: REG_A = MEM_ACC_OUT;
                                3: REG_A = EXE_OUT;
                            endcase
                    end

                    REG_B = 0;
                    // casos em que existe um regB
                    if((IR[31:27] == LW && IR[26] == 1) || 
                    IR[31:27] == SW || 
                    IR[31:27] == ADD || 
                    IR[31:27] == SUB || 
                    IR[31:27] == MUL || 
                    IR[31:27] == DIV || 
                    IR[31:27] == AND || 
                    IR[31:27] == OR || 
                    IR[31:27] == CMP) begin
                            // saber onde procurar o regB
                            case(ARR_FLAG_REG[IR[20:16]])
                                0: REG_A = ARR_REG[IR[20:16]]; // caso padrao
                                1: REG_A = WB_OUT;
                                2: REG_A = MEM_ACC_OUT;
                                3: REG_A = EXE_OUT;
                            endcase
                    end
                    if(IR[31:27] == BRLF)
                        REG_B = IR[20:16]; // i

                    IMM = IR[15:0];
                    NPC_OUT = NPC_IN;
                    OPCD = IR[31:27];
                    ADDR_REG = IR[25:21];
                end
                D_TABLE: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
                default: begin
                    REG_A = 0;
                    REG_B = 0;
                    IMM = 0;
                    NPC_OUT = 0;
                    OPCD = 0;
                    ADDR_REG = 0;
                end
            endcase
        end
    end
endmodule
