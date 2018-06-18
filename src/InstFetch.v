module InstFetch(IR, NPC, MEM_CLK, MEM_OUT, ULA, RST, CLK, COND, ESTADO);

    output [31:0] IR;
    output [15:0] NPC;
    output reg MEM_CLK;
    
    output [2:0] ESTADO;
    
    input [31:0] MEM_OUT;
    input [15:0] ULA;
    input RST, CLK, COND;

    reg [15:0] PC;
    reg [31:0] REG_IR;

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                PREP_READ = 1,
                READ_SEND = 2,
                VAZIO_0 = 3,
                VAZIO_1 = 4,
                INC_PC = 5,
                UPDATE_PC = 6;

    // debug
    assign ESTADO = STATE;
    
    assign NPC = PC;
    assign IR = (STATE == READ_SEND) ? MEM_OUT : REG_IR;

    // DPE
    always @ (*) begin
        case(STATE)
            IDLE: NEXT_STATE = PREP_READ;
            PREP_READ: NEXT_STATE = READ_SEND;
            READ_SEND: NEXT_STATE = VAZIO_0;
            VAZIO_0: NEXT_STATE = VAZIO_1;
            VAZIO_1: NEXT_STATE = INC_PC;
            INC_PC: NEXT_STATE = UPDATE_PC;
            UPDATE_PC: NEXT_STATE = PREP_READ;
            default: NEXT_STATE = IDLE;
        endcase
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            PC <= 0;
            REG_IR <= 0;
            STATE <= IDLE;
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
            PC <= PC;
            REG_IR <= REG_IR;
            /* state logic */
            if (STATE == READ_SEND)
                REG_IR <= MEM_OUT;
            else if(STATE == INC_PC)
                PC <= PC + 1;
            else if(STATE == UPDATE_PC && COND)
                PC <= ULA;
        end
    end

    // DS
    always @ (*) begin
        case(STATE)
            PREP_READ: MEM_CLK = 1;
            default: MEM_CLK = 0;
        endcase
    end
endmodule
