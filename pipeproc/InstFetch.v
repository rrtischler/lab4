module InstFetch(NPC, IR, MEM_ADDR, MEM_CLK, RST, CLK, ULA, COND, MEM_OUT);
	/*
		Exemplo usando FSM de um IF onde no estado IDLE você prepara
		a leitura e no estado READ você lê e ja manda para a saida
	*/
	
	output MEM_CLK;
	output reg [15:0] NPC, MEM_ADDR;
	output reg [31:0] IR;
	
	input RST, CLK, COND;
	input [15:0] ULA;
	input [31:0] MEM_OUT;
	
	reg STATE, NEXT_STATE;

	reg [15:0] PC;

	parameter 	IDLE = 0,
				READ = 1;

	// (sem usar always)
	// assign MEM_CLK = STATE == IDLE ? 1 : 0 ;
	// assign MEM_NPC = ...

	always @ (STATE) begin
		if(STATE == IDLE) begin
			NEXT_STATE = READ;
		end
		else if(STATE == READ) begin
			NEXT_STATE = IDLE;
		end
		else begin 
			NEXT_STATE = IDLE;
		end
	end

	always @ (posedge CLK) begin
		if(!RST) begin
			PC <= 0;
		end
		else begin
			PC <= PC;
			if(STATE == IDLE) begin
				if(COND) begin
				PC <= ULA;
				end
				else begin
					PC <= PC + 1;
				end
			end
		end
	end

	always @ (STATE) begin
		if(STATE == IDLE) begin
			// prepara a leitura
			MEM_CLK = 1;
			NPC = 0;
			MEM_ADDR = PC;
			IR = 0;
		end
		else if(STATE == READ) begin
			// lê e envia
			MEM_CLK = 0;
			NPC = PC;
			MEM_ADDR = 0;
			IR = MEM_OUT;
		end
		else begin
			MEM_CLK = 0;
			NPC = 0;
			MEM_ADDR = 0;
			IR = 0;
		end
	end
endmodule
