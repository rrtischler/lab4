`timescale 1ns/1ps
module InstFetch_block_tb();

wire [2:0] ESTADO;
wire [31:0] IR;
wire [15:0] NPC;

reg	RST;
reg	CLK;
reg	COND;
reg	[15:0] ULA;


InstFetch_block tb_inst
(
	.ESTADO(ESTADO),
	.IR(IR),
	.NPC(NPC),
	.RST(RST),
	.CLK(CLK),
	.COND(COND),
	.ULA(ULA)
);

always #20 CLK = ~CLK;


initial
begin

$monitor("TEMPO:%d -- NPC:%d | IR:%d | ESTADO:%d",
	$time, NPC, IR, ESTADO);
	// estados iniciais
	CLK = 1;
	RST = 0;
	COND = 0;
	ULA = 0;

	// ---- INICIO ----
	#40 // clock 1
	RST = 1; // retira o reset
	COND = 0;
	ULA = 0;

	#40 // clock 2
	COND = 0;
	ULA = 0;

	#40 // clock 3
	COND = 0;
	ULA = 0;

	#40 // clock 4
	COND = 0;
	ULA = 0;

	#40 // clock 5
	COND = 0;
	ULA = 0;

	#40 // clock 6
	COND = 0;
	ULA = 0;

	#40 // clock 7
	COND = 0;
	ULA = 0;

	// etc ...

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	#40
	COND = 0;
	ULA = 0;

	
	 #2000 $stop;
end

endmodule