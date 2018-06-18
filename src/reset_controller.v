module reset_controller(CLK, RST, RST_IF, RST_ID, RST_EXE, RST_MEM, RST_WB);
    input CLK, RST;
    output reg RST_IF, RST_ID, RST_EXE, RST_MEM, RST_WB;

    reg [2:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
                IF = 1,
                ID = 2,
                EXE = 3,
                MEM = 4,
                WB = 5;
    
    always @(*) begin
        NEXT_STATE = STATE;
        case(STATE)
            IDLE: NEXT_STATE = IF;
            IF: NEXT_STATE = ID;
            ID: NEXT_STATE = EXE;
            EXE: NEXT_STATE = MEM;
            MEM: NEXT_STATE = WB;
            WB: NEXT_STATE = WB;
            default: NEXT_STATE = IDLE;
        endcase
    end

    always @(posedge CLK) begin
        if(!RST) begin
            STATE <= IDLE;
        end
        else begin
            STATE <= NEXT_STATE;
        end
    end

    always @(*) begin
        RST_IF = 0;
        RST_ID = 0;
        RST_EXE = 0;
        RST_MEM = 0;
        RST_WB = 0;
        case(STATE)
            IF: begin // disable only if rst
                RST_IF = 1;
            end
            ID: begin
                RST_IF = 1;
                RST_ID = 1;
            end
            EXE: begin
                RST_IF = 1;
                RST_ID = 1;
                RST_EXE = 1;
            end
            MEM: begin
                RST_IF = 1;
                RST_ID = 1;
                RST_EXE = 1;
                RST_MEM = 1;
            end
            WB: begin // disable all rsts
                RST_IF = 1;
                RST_ID = 1;
                RST_EXE = 1;
                RST_MEM = 1;
                RST_WB = 1;
            end
            default: begin
                RST_IF = 0;
                RST_ID = 0;
                RST_EXE = 0;
                RST_MEM = 0;
                RST_WB = 0;
            end
        endcase
    end
endmodule