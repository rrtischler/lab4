`timescale 1ns/1ps
module infrared_tb();

wire [31:0] ALU_OUT;
wire [4:0] OPCD_OUT, ADDR_REG_OUT;
wire OPT_BIT_OUT, COND;

wire [2:0] ESTADO;

reg [15:0] NPC_IN, REG_A, REG_B, IMM;
reg [4:0] OPCD_IN, ADDR_REG_IN;
reg CLK, RST, OPT_BIT_IN;

InstFetch tb_inst
(
  .ALU_OUT(ALU_OUT),
  .OPCD_OUT(OPCD_OUT),
  .ADDR_REG_OUT(ADDR_REG_OUT),
  .wire OPT_BIT_OUT(OPT_BIT_OUT),
  .COND(COND),
  .ESTADO(ESTADO),
  .NPC_IN(NPC_IN),
  .REG_A(REG_A),
  .REG_B(REG_B),
  .IMM(IMM),
  .OPCD_IN(OPCD_IN),
  .ADDR_REG_IN(ADDR_REG_IN),
  .reg CLK(CLK),
  .RST(RST),
  .OPT_BIT_IN(OPT_BIT_IN)
);

always #20 clk = ~clk;


initial
begin

$monitor("TEMPO:%d -- ALU_OUT:%d | OPCD_OUT:%d | ADDR_REG_OUT:%d | OPT_BIT_OUT:%d | COND:%d | ESTADO:%d",
	$time, ALU_OUT, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, COND, ESTADO); 
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