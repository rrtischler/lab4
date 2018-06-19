module InstDecode(REG_A, REG_B, OPCD, IMM, NPC_OUT, CLK, RST, IR, NPC_IN, WB_OUT, COND_WB, RD_WB, MEM_ACC_OUT, EXE_OUT, ADDR_REG, OPT_BIT, ESTADO);

    output [15:0] REG_A, REG_B, IMM, NPC_OUT;
    output [4:0] OPCD;
    output [4:0] ADDR_REG;
    output OPT_BIT;

    output [2:0] ESTADO;
    
    input [31:0] IR; // [31:27]: opcode, [26]: extra bit, [25:21]: Ra, [20:16]: Rb, [15:0]: Imm
    input [15:0] NPC_IN, MEM_ACC_OUT, EXE_OUT, WB_OUT; // MEM_ACC_OUT, EXE_OUT, WB_OUT: tratamento de hazards
    input [4:0] RD_WB;
    input COND_WB, RST, CLK;

    reg [15:0] ARR_REG [31:0]; // 32 registers of 16 bit size
    reg [23:0] RLOCATION;

    reg [15:0] REG_REG_A, REG_REG_B, REG_IMM, REG_NPC_OUT;
    reg [4:0] REG_OPCD; 
    reg [4:0] REG_ADDR_REG;
    reg REG_OPT_BIT;

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                WAIT_WB = 1,
                WB_WRITING = 2,
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

    assign REG_A = (STATE != READ_SEND) ? REG_REG_A
                 : (IR[31:27] != LW &&
                    IR[31:27] != SW &&
                    IR[31:27] != ADD &&
                    IR[31:27] != SUB &&
                    IR[31:27] != MUL &&
                    IR[31:27] != DIV &&
                    IR[31:27] != AND &&
                    IR[31:27] != OR &&
                    IR[31:27] != CMP &&
                    IR[31:27] != NOT &&
                    IR[31:27] != JR &&
                    IR[31:27] != BRLF &&
                    IR[31:27] != CALL) ? REG_REG_A
                 : ({1'b1,IR[25:21]} == RLOCATION[11:6]) ? EXE_OUT
                 : ({1'b1,IR[25:21]} == RLOCATION[17:12]) ? MEM_ACC_OUT
                 : ({1'b1,IR[25:21]} == RLOCATION[23:18]) ? WB_OUT
    /* default*/ : REG_REG_A;

    assign REG_B = (STATE != READ_SEND) ? REG_REG_B
                 : ((IR[31:27] != LW) &&
                    IR[31:27] != SW &&
                    IR[31:27] != ADD &&
                    IR[31:27] != SUB &&
                    IR[31:27] != MUL &&
                    IR[31:27] != DIV &&
                    IR[31:27] != AND &&
                    IR[31:27] != OR &&
                    IR[31:27] != CMP) ? REG_REG_B
                 : (IR[31:27] == BRLF) ? IR[20:16]
                 : ({1'b1,IR[20:16]} == RLOCATION[11:6]) ? EXE_OUT
                 : ({1'b1,IR[20:16]} == RLOCATION[17:12]) ? MEM_ACC_OUT
                 : ({1'b1,IR[20:16]} == RLOCATION[23:18]) ? WB_OUT
    /* default*/ : REG_REG_B;

    assign IMM = (STATE == READ_SEND) ? IR[15:0] : REG_IMM;
    assign NPC_OUT = (STATE == READ_SEND) ? NPC_IN : REG_NPC_OUT;
    assign OPCD = (STATE == READ_SEND) ? IR[31:27] : REG_OPCD;
    assign ADDR_REG = (STATE == READ_SEND) ? IR[25:21] : REG_ADDR_REG;
    assign OPT_BIT = (STATE == READ_SEND) ? IR[6] : REG_OPT_BIT;

    // DPE          
    always @(*) begin
        NEXT_STATE = STATE;
        case(STATE)
            IDLE: NEXT_STATE = WAIT_WB;
            WAIT_WB: NEXT_STATE = WB_WRITING;
            WB_WRITING: NEXT_STATE = VAZIO_0;
            VAZIO_0: NEXT_STATE = VAZIO_1;
            VAZIO_1: NEXT_STATE = READ_SEND;
            READ_SEND: NEXT_STATE = D_TABLE;
            D_TABLE: NEXT_STATE = WAIT_WB;
            default: NEXT_STATE = IDLE;
        endcase
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            // reset state
            STATE <= IDLE;
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
            // reset anti hazard
            RLOCATION <= 0;
            // etc
            REG_REG_A <= 0;
            REG_REG_B <= 0;
            REG_IMM <= 0;
            REG_NPC_OUT <= 0;
            REG_OPCD <= 0;
            REG_ADDR_REG <= 0;
            REG_OPT_BIT <= 0;
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
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
            RLOCATION <= RLOCATION;
            REG_REG_A <= REG_REG_A;
            REG_REG_B <= REG_REG_B;
            REG_IMM <= REG_IMM;
            REG_NPC_OUT <= REG_NPC_OUT;
            REG_OPCD <= REG_OPCD;
            REG_ADDR_REG <= REG_ADDR_REG;
            REG_OPT_BIT <= REG_OPT_BIT;
            /* state logic */
            if(STATE == WB_WRITING && COND_WB)
                ARR_REG[RD_WB] <= WB_OUT; // grava dados wb se for a condicao certa
            if(STATE == READ_SEND) begin
                // push
                RLOCATION[5:0] <= {1'b1,IR[25:21]}; // A atual
                // casos em que existe um regA
                if( IR[31:27] == LW || 
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
                        if({1'b1,IR[25:21]} == RLOCATION[11:6]) REG_REG_A <= EXE_OUT;
                        else if({1'b1,IR[25:21]} == RLOCATION[17:12]) REG_REG_A <= MEM_ACC_OUT;
                        else if({1'b1,IR[25:21]} == RLOCATION[23:18]) REG_REG_A <= WB_OUT;
                        else REG_REG_A <= ARR_REG[IR[25:21]];
                end
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
                        if({1'b1,IR[20:16]} == RLOCATION[11:6]) REG_REG_B <= EXE_OUT;
                        else if({1'b1,IR[20:16]} == RLOCATION[17:12]) REG_REG_B <= MEM_ACC_OUT;
                        else if({1'b1,IR[20:16]} == RLOCATION[23:18]) REG_REG_B <= WB_OUT;
                        else REG_REG_B <= ARR_REG[IR[20:16]];
                end
                // caso especial do brlf
                if(IR[31:27] == BRLF)
                    REG_REG_B <= IR[20:16]; // i
                REG_IMM <= IR[15:0];
                REG_NPC_OUT <= NPC_IN;
                REG_OPCD <= IR[31:27];
                REG_ADDR_REG <= IR[25:21];
                REG_OPT_BIT <= IR[26];
            end
            if(STATE == D_TABLE) begin
                // pop
                RLOCATION <= RLOCATION << 5;
            end
        end
    end
endmodule
