module MemAcc(DATA_OUT, MEM_DATA_ADDR, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, MEM_DATA_CLK_READ, 
                MEM_DATA_CLK_WRITE, ALU_OUT, MEM_DATA, OPCD_IN, ADDR_REG_IN, OPT_BIT_IN, RST, CLK, ESTADO);

    output reg [15:0] DATA_OUT;
    output reg [9:0] MEM_DATA_ADDR;
    output reg [4:0] OPCD_OUT, ADDR_REG_OUT;
    output reg OPT_BIT_OUT, MEM_DATA_CLK_READ, MEM_DATA_CLK_WRITE;

    output [2:0] ESTADO;

    input [15:0] ALU_OUT, MEM_DATA;
    input [4:0] OPCD_IN, ADDR_REG_IN;
    input OPT_BIT_IN, RST, CLK;

    reg [15:0] DATA;

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                PREPARE_READ = 1,
                READ_CLOCK = 2,
                READ = 3,
                PREPARE_WRITE = 4,
                WRITE = 5,
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
    
    // DPE
    always @ (STATE) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
            case(STATE)
                IDLE: NEXT_STATE = PREPARE_READ;
                PREPARE_READ: NEXT_STATE = READ_CLOCK;
                READ_CLOCK: NEXT_STATE = READ;
                READ: NEXT_STATE = PREPARE_WRITE;
                PREPARE_WRITE: NEXT_STATE = WRITE;
                WRITE: NEXT_STATE = VAZIO_0;
                VAZIO_0: NEXT_STATE = PREPARE_READ;
                default: NEXT_STATE = IDLE;
            endcase
        end
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            STATE <= IDLE;
            DATA <= 0;
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
            DATA <= DATA;
            /* state logic */
            if(STATE == READ && OPCD_IN == LW && OPT_BIT_IN == 1)
                DATA <= MEM_DATA;
            else
                DATA <= ALU_OUT;
        end
    end

    // DS
    always @ (STATE) begin
        // se nao tiver em reset
        if(RST) begin
            case(STATE)
                IDLE: begin
                    DATA_OUT = 0;
                    MEM_DATA_ADDR = 0;
                    OPCD_OUT = 0;
                    ADDR_REG_OUT = 0;
                    OPT_BIT_OUT = 0;
                    MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
                PREPARE_READ: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
                READ_CLOCK: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    if(OPCD_IN == LW && OPT_BIT_IN == 1)
                        MEM_DATA_CLK_READ = 1;
                    else
                        MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
                READ: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
                PREPARE_WRITE: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
                WRITE: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    MEM_DATA_CLK_READ = 0;
                    if(OPCD_IN == SW)
                        MEM_DATA_CLK_WRITE = 1;
                    else
                        MEM_DATA_CLK_WRITE = 0;
                end
                VAZIO_0: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
                default: begin
                    DATA_OUT = DATA;
                    MEM_DATA_ADDR = ALU_OUT;
                    OPCD_OUT = OPCD_IN;
                    ADDR_REG_OUT = ADDR_REG_IN;
                    OPT_BIT_OUT = OPT_BIT_IN;
                    MEM_DATA_CLK_READ = 0;
                    MEM_DATA_CLK_WRITE = 0;
                end
            endcase
        end
        
    end

endmodule
