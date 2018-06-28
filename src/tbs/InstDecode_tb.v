`timescale 1ns/1ps
module InstDecode_tb();

wire [15:0] REG_A, REG_B, IMM, NPC_OUT;
wire [4:0] OPCD;
wire [4:0] ADDR_REG;
wire OPT_BIT;

wire [2:0] ESTADO;

reg [31:0] IR;
reg [15:0] NPC_IN, MEM_ACC_OUT, EXE_OUT, WB_OUT;
reg [4:0] RD_WB;
reg COND_WB, RST, CLK;


InstDecode tb_inst
(
  .REG_A(REG_A),
  .REG_B(REG_B),
  .IMM(IMM),
  .NPC_OUT(NPC_OUT),
  .OPCD(OPCD),
  .ADDR_REG(ADDR_REG),
  .OPT_BIT(OPT_BIT),
  .ESTADO(ESTADO),
  .RST(RST),
  .CLK(CLK),
  .IR(IR),
  .NPC_IN(NPC_IN),
  .MEM_ACC_OUT(MEM_ACC_OUT),
  .EXE_OUT(EXE_OUT),
  .WB_OUT(WB_OUT),
  .RD_WB(RD_WB),
  .COND_WB(COND_WB)
);

always #20 CLK = ~CLK;


initial
begin

$monitor("TEMPO:%d -- REG_A:%d | REG_B:%d | IMM:%d | NPC_OUT:%d | OPCD:%d | ADDR_REG:%d | OPT_BIT:%d | ESTADO:%d",
	$time, REG_A, REG_B, IMM, NPC_OUT, OPCD, ADDR_REG, OPT_BIT, ESTADO);
	 // estados iniciais
	CLK = 1;
	RST = 0;
	IR = 191496192; // SW R27, (R10)
	NPC_IN = 500;
	MEM_ACC_OUT = 50;
	EXE_OUT = 60;
	WB_OUT = 70;
	RD_WB = 27;
	COND_WB = 0;

	// ---- INICIO ----
	#40 // clock 1
	RST = 1; // retira o reset

	
	#400
	COND_WB = 1;

	#40 // clock 2

	#40 // clock 3

	#40 // clock 4


	#40 // clock 5


	#40 // clock 6


	#40 // clock 7

	// etc ...
	
	 #2000 $stop;
end

endmodule