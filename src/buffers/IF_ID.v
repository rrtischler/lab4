module IF_ID(IR_OUT, NPC_OUT, RESET_OUT, IR_IN, NPC_IN, CLK, RST);

	output reg [31:0] IR_OUT;
	output reg [15:0] NPC_OUT;
	output RESET_OUT;

	input [31:0] IR_IN;
	input [15:0] NPC_IN;
    input CLK, RST;

	reg [31:0] IR;
	reg [15:0] NPC;
	reg RESET;

	reg [3:0] STATE, NEXT_STATE;
    parameter   IDLE = 0,
				WAIT_1 = 1,
				WAIT_2 = 2,
				WAIT_3 = 3,
				WAIT_4 = 4,
				GET_DATA = 5,
				WAIT_6 = 6,
				WAIT_7 = 7,
				WAIT_8 = 8,
				WAIT_9 = 9,
				WAIT_10 = 10,
				PREPARE_DATA = 11,
				WAIT_12 = 12;

	assign RESET_OUT = RESET;

    // DPE
    always @ (STATE) begin
        if(!RST) begin
            NEXT_STATE = IDLE;
        end
        else begin
            case(STATE)
            	IDLE: NEXT_STATE = WAIT_1;
				WAIT_1: NEXT_STATE = WAIT_2;
				WAIT_2: NEXT_STATE = WAIT_3;
				WAIT_3: NEXT_STATE = WAIT_4;
				WAIT_4: NEXT_STATE = GET_DATA;
				GET_DATA: NEXT_STATE = WAIT_6;
				WAIT_6: NEXT_STATE = WAIT_7;
				WAIT_7: NEXT_STATE = WAIT_8;
				WAIT_8: NEXT_STATE = WAIT_9;
				WAIT_9: NEXT_STATE = WAIT_10;
				WAIT_10: NEXT_STATE = PREPARE_DATA;
				PREPARE_DATA: NEXT_STATE = WAIT_12;
				WAIT_12: NEXT_STATE = WAIT_1;
				default: NEXT_STATE = IDLE;
            endcase
        end
    end

    // MEM
    always @ (posedge CLK) begin
        if(!RST) begin
            RESET <= 0;
            STATE <= IDLE;
            IR <= 0;
            NPC <= 0;
        end
        else begin
            STATE <= NEXT_STATE;
            /* defaults */
            RESET <= RESET;
            IR <= IR;
            NPC <= NPC;
            /* state logic */
            if(STATE == GET_DATA) begin
            	IR <= IR_IN;
            	NPC <= NPC_IN;
            end
            if(STATE == PREPARE_DATA)
            	RESET <= 1;
        end
    end

    // DS
    always @ (STATE) begin
        // se nao tiver em reset
        if(RST) begin
        	IR_OUT = IR_OUT;
			NPC_OUT = NPC_OUT;
			if(STATE == PREPARE_DATA) begin
				IR_OUT = IR;
				NPC_OUT = NPC;
			end
        end
        else begin
            IR_OUT = 0;
			NPC_OUT = 0;
        end
    end

	
endmodule
	