module InstFetch(NPC, IR, MEM_ADDR, MEM_CLK, RST, CLK, ULA, COND, MEM_OUT);
    output reg MEM_CLK;
    output reg [15:0] NPC, MEM_ADDR;
    output reg [31:0] IR;
    
    input RST, CLK, COND;
    input [15:0] ULA;
    input [31:0] MEM_OUT;

    reg [15:0] PC;

    reg [2:0] STATE, NEXT_STATE;
    parameter 	IDLE = 0,
                PREP_READ = 1,
                READ_SEND = 2,
                VAZIO_0 = 3,
                VAZIO_1 = 4,
                INC_PC = 5,
                UPDATE_PC = 6;

    // DPE
    always @ (STATE) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
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
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            PC <= 0;
            STATE <= IDLE;
        end
        else begin
            // defaults
            STATE <= NEXT_STATE;
            PC <= PC;
            // states
            if(STATE == INC_PC)
                PC <= PC + 1;
            else if(STATE == UPDATE_PC && COND)
                PC <= ULA;
        end
    end

    // DS
    always @ (STATE) begin
        // se nao tiver em reset
        if(RST) begin
            case(STATE)
                IDLE: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = PC;
                    IR = 0;
                end
                PREP_READ: begin
                    MEM_CLK = 1;
                    NPC = 0;
                    MEM_ADDR = PC; 
                    IR = 0;
                end
                READ_SEND: begin
                    MEM_CLK = 0;
                    NPC = PC;
                    MEM_ADDR = 0;
                    IR = MEM_OUT;
                end
                VAZIO_0: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = 0;
                    IR = 0;
                end
                VAZIO_1: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = 0;
                    IR = 0;
                end
                INC_PC: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = 0;
                    IR = 0;
                end
                UPDATE_PC: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = 0;
                    IR = 0;
                end
                default: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = 0;
                    IR = 0;
                end
                default: begin
                    MEM_CLK = 0;
                    NPC = 0;
                    MEM_ADDR = 0;
                    IR = 0;
                end
            endcase
        end
    end
endmodule
