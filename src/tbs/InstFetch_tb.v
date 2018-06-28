`timescale 1ns/1ps
module InstFetch_tb();

wire MEM_CLK;
wire [15:0] NPC;
wire [31:0] IR;

wire [2:0] ESTADO;

reg RST, CLK, COND;
reg [15:0] ULA;
reg [31:0] MEM_OUT;


InstFetch tb_inst
(
	.MEM_CLK(MEM_CLK),
	.NPC(NPC),
	.IR(IR),
	.ESTADO(ESTADO),
	.COND(COND),
	.CLK(CLK),
	.RST(RST),
	.ULA(ULA),
	.MEM_OUT(MEM_OUT)
);

always #20 CLK = ~CLK;


initial
begin

$monitor("TEMPO:%d -- MEM_CLK:%d | NPC:%d | IR:%d | ESTADO:%d",
	$time, MEM_CLK, NPC, IR, ESTADO);
	// estados iniciais
	CLK = 1;
	RST = 0;
	COND = 0;
	ULA = 0;
	MEM_OUT = 0;

	// ---- INICIO ----
	#40 // clock 1
	RST = 1; // retira o reset
	COND = 0;
	ULA = 0;
	MEM_OUT = 1;

	#40 // clock 2
	COND = 0;
	ULA = 0;
	#1 MEM_OUT = 0;
	#1 MEM_OUT = 1;
	#1 MEM_OUT = 2;
	#1 MEM_OUT = 3;
	#1 MEM_OUT = 4;
	#1 MEM_OUT = 5;
	#1 MEM_OUT = 6;
	#1 MEM_OUT = 7;
	#1 MEM_OUT = 8;
	#1 MEM_OUT = 9;
	#1 MEM_OUT = 10;
	#1 MEM_OUT = 11;
	#1 MEM_OUT = 12;
	#1 MEM_OUT = 13;
	#1 MEM_OUT = 14;
	#1 MEM_OUT = 15;
	#1 MEM_OUT = 16;
	#1 MEM_OUT = 17;
	#1 MEM_OUT = 18;
	#1 MEM_OUT = 19;
	#1 MEM_OUT = 20;
	#1 MEM_OUT = 21;
	#1 MEM_OUT = 22;
	#1 MEM_OUT = 23;
	#1 MEM_OUT = 24;
	#1 MEM_OUT = 25;
	#1 MEM_OUT = 26;
	#1 MEM_OUT = 27;
	#1 MEM_OUT = 28;
	#1 MEM_OUT = 29;
	#1 MEM_OUT = 30;
	#1 MEM_OUT = 31;
	#1 MEM_OUT = 32;
	#1 MEM_OUT = 33;
	#1 MEM_OUT = 34;
	#1 MEM_OUT = 35;
	#1 MEM_OUT = 36;
	#1 MEM_OUT = 37;
	#1 MEM_OUT = 38;
	#1 MEM_OUT = 39;
	#1 MEM_OUT = 40;
	#1 MEM_OUT = 41;
	#1 MEM_OUT = 42;
	#1 MEM_OUT = 43;
	#1 MEM_OUT = 44;
	#1 MEM_OUT = 45;
	#1 MEM_OUT = 46;
	#1 MEM_OUT = 47;
	#1 MEM_OUT = 48;
	#1 MEM_OUT = 49; 

	#40 // clock 3
	COND = 0;
	ULA = 0;
	MEM_OUT = 3;

	#40 // clock 4
	COND = 0;
	ULA = 0;
	MEM_OUT = 4;

	#40 // clock 5
	COND = 0;
	ULA = 0;
	MEM_OUT = 5;

	#40 // clock 6
	COND = 0;
	ULA = 0;
	MEM_OUT = 6;

	#40 // clock 7
	COND = 0;
	ULA = 0;
	MEM_OUT = 7;

	// etc ...

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 8;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 9;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 10;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 11;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 12;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 13;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 14;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 15;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 16;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 17;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 18;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 19;

	#40
	COND = 0;
	ULA = 0;
	MEM_OUT = 20;

	
	 #2000 $stop;
end

endmodule