`timescale 1ns/1ps
module main_tb();

// inputs
reg	CLK;
reg	RST;
reg	[3:0] INTERRUPT;

// outputs
wire	WB_COND;
wire	ME_MEM_CLK;
wire	ME_WRITE_ENABLE;
wire	ME_OPT_BIT_OUT;
wire	EX_OPT_BIT_OUT;
wire	EX_COND;
wire	FE_MEM_CLK;
wire	DE_OPT_BIT;
wire	[4:0] DE_ADDR_REG;
wire	[15:0] DE_IMM;
wire	[15:0] DE_NPC_OUT;
wire	[4:0] DE_OPCD;
wire	[15:0] DE_REG_A;
wire	[15:0] DE_REG_B;
wire	[4:0] EX_ADDR_REG_OUT;
wire	[31:0] EX_ALU_OUT;
wire	[4:0] EX_OPCD_OUT;
wire	[31:0] FE_IR;
wire	[15:0] FE_NPC;
wire	[4:0] ME_ADDR_REG_OUT;
wire	[15:0] ME_DATA_OUT;
wire	[9:0] ME_MEM_DATA_ADDR;
wire	[4:0] ME_OPCD_OUT;
wire	[4:0] WB_ADDR_REG_OUT;
wire	[15:0] WB_DATA_OUT;

main tb_inst
(
    .CLK(CLK);
    .RST(RST);
    .INTERRUPT(INTERRUPT);
    .WB_COND(WB_COND);
    .ME_MEM_CLK(ME_MEM_CLK);
    .ME_WRITE_ENABLE(ME_WRITE_ENABLE);
    .ME_OPT_BIT_OUT(ME_OPT_BIT_OUT);
    .EX_OPT_BIT_OUT(EX_OPT_BIT_OUT);
    .EX_COND(EX_COND);
    .FE_MEM_CLK(FE_MEM_CLK);
    .DE_OPT_BIT(DE_OPT_BIT);
    .DE_ADDR_REG(DE_ADDR_REG);
    .DE_IMM(DE_IMM);
    .DE_NPC_OUT(DE_NPC_OUT);
    .DE_OPCD(DE_OPCD);
    .DE_REG_A(DE_REG_A);
    .DE_REG_B(DE_REG_B);
    .EX_ADDR_REG_OUT(EX_ADDR_REG_OUT);
    .EX_ALU_OUT(EX_ALU_OUT);
    .EX_OPCD_OUT(EX_OPCD_OUT);
    .FE_IR(FE_IR);
    .FE_NPC(FE_NPC);
    .ME_ADDR_REG_OUT(ME_ADDR_REG_OUT);
    .ME_DATA_OUT(ME_DATA_OUT);
    .ME_MEM_DATA_ADDR(ME_MEM_DATA_ADDR);
    .ME_OPCD_OUT(ME_OPCD_OUT);
    .WB_ADDR_REG_OUT(WB_ADDR_REG_OUT);
    .WB_DATA_OUT(WB_DATA_OUT);
);

always #20 CLK = ~CLK;


initial
begin

$monitor(
"TEMPO:%d ---------------------- \n\n

IF: {FE_MEM_CLK: %d, FE_IR: %d, FE_NPC: %d}
ID: {DE_OPT_BIT: %d, DE_ADDR_REG: %d, DE_IMM: %d, DE_NPC_OUT: %d, DE_OPCD: %d, DE_REG_A: %d, DE_REG_B: %d}
EX: {EX_OPT_BIT_OUT: %d, EX_COND: %d, EX_ADDR_REG_OUT: %d, EX_ALU_OUT: %d, EX_OPCD_OUT: %d}
ME: {ME_MEM_CLK: %d, ME_WRITE_ENABLE: %d, ME_OPT_BIT_OUT: %d, ME_ADDR_REG_OUT: %d, ME_DATA_OUT: %d, ME_MEM_DATA_ADDR: %d, ME_OPCD_OUT: %d}
WB: {WB_COND: %d, WB_ADDR_REG_OUT: %d, WB_DATA_OUT: %d}

\n\n----------------------",
	$time, FE_MEM_CLK, FE_IR, FE_NPC, DE_OPT_BIT, DE_ADDR_REG, DE_IMM, DE_NPC_OUT,
    DE_OPCD, DE_REG_A, DE_REG_B, EX_OPT_BIT_OUT, EX_COND, EX_ADDR_REG_OUT, EX_ALU_OUT, 
    EX_OPCD_OUT, ME_MEM_CLK, ME_WRITE_ENABLE, ME_OPT_BIT_OUT, ME_ADDR_REG_OUT, ME_DATA_OUT,
    ME_MEM_DATA_ADDR, ME_OPCD_OUT, WB_COND, WB_ADDR_REG_OUT, WB_DATA_OUT);
	// estados iniciais
	CLK = 1;
	RST = 0;

	// ---- INICIO ----
	#40 // clock 1
	RST = 1; // retira o reset

	#40 // clock 2

	#40 // clock 3

	#40 // clock 4

	#40 // clock 5

	#40 // clock 6

	#40 // clock 7

	// etc ...

	
	 #4000 $stop;
end

endmodule