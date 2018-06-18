module WriteBack(DATA_OUT, ADDR_REG_OUT, COND, DATA_IN, OPCD_IN, ADDR_REG_IN, OPT_BIT_IN, RST, CLK, ESTADO);

    output [15:0] DATA_OUT;
    output [4:0] ADDR_REG_OUT;
    output reg COND;

    output [2:0] ESTADO;

    input [15:0] DATA_IN;
    input [4:0] OPCD_IN, ADDR_REG_IN;
    input OPT_BIT_IN, RST, CLK;

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                WRITE_BACK = 1,
                VAZIO_0 = 2,
                VAZIO_1 = 3,
                VAZIO_2 = 4,
                VAZIO_3 = 5,
                VAZIO_4 = 6;

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
    
    assign DATA_OUT = DATA_IN;
    assign ADDR_REG_OUT = ADDR_REG_IN;
    
    // DPE
    always @ (*) begin
        NEXT_STATE = STATE;
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

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            STATE <= IDLE;
        end
        else begin
            STATE <= NEXT_STATE;
        end
    end

    // DS
    always @ (*) begin
        if(OPCD_IN == LW ||
            OPCD_IN == SW ||
            OPCD_IN == ADD ||
            OPCD_IN == SUB ||
            OPCD_IN == MUL ||
            OPCD_IN == DIV ||
            OPCD_IN == AND ||
            OPCD_IN == OR ||
            OPCD_IN == NOT)
            COND = 1;
        else
            COND = 0;
    end

endmodule
