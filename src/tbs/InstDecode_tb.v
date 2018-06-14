`timescale 1ns/1ps
module infrared_tb();

wire [15:0] REG_A, REG_B, IMM, NPC_OUT;
wire [5:0] OPCD;
wire [4:0] ADDR_REG;

wire [2:0] ESTADO;

reg [31:0] IR;
reg [15:0] NPC_IN, MEM_ACC_OUT, EXE_OUT, WB_OUT;
reg [4:0] RD_WB;
reg COND_WB, RST, CLK;


InstFetch tb_inst
(
  .REG_A(REG_A),
  .REG_B(REG_B),
  .IMM(IMM),
  .NPC_OUT(NPC_OUT),
  .OPCD(OPCD),
  .ADDR_REG(ADDR_REG),
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

$monitor("TEMPO:%d -- REG_A:%d | REG_B:%d | NPC_OUT:%d | OPCD:%d | ADDR_REG:%d | ESTADO:%d",
	$time, REG_A, REG_B, IMM, NPC_OUT, OPCD, ADDR_REG, ESTADO);
    // estados iniciais
    CLK = 0;
    RST = 0;

    // ---- INICIO ----
    #20 // clock 1
    RST = 1; // retira o reset
    
    #40 // clock 2

    #41 // clock 3

    #41 // clock 4

    #41 // clock 5

    #41 // clock 6

    #41 // clock 7

    // etc ...


    #2000 $stop;
end

endmodule