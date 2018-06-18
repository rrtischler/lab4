`timescale 1ns/1ps
module MemAcc_tb();

wire [15:0] DATA_OUT;
wire [9:0] MEM_DATA_ADDR;
wire [4:0] OPCD_OUT, ADDR_REG_OUT;
wire OPT_BIT_OUT, WRITE_ENABLE, MEM_CLK;

wire [2:0] ESTADO;

reg [15:0] ALU_OUT, MEM_DATA;
reg [4:0] OPCD_IN, ADDR_REG_IN;
reg OPT_BIT_IN, RST, CLK;

MemAcc tb_inst
(
  .DATA_OUT(DATA_OUT),
  .MEM_DATA_ADDR(MEM_DATA_ADDR),
  .OPCD_OUT(OPCD_OUT),
  .ADDR_REG_OUT(ADDR_REG_OUT),
  .OPT_BIT_OUT(OPT_BIT_OUT),
  .WRITE_ENABLE(WRITE_ENABLE),
  .MEM_CLK(MEM_CLK),
  .ESTADO(ESTADO),
  .ALU_OUT(ALU_OUT),
  .MEM_DATA(MEM_DATA),
  .OPCD_IN(OPCD_IN),
  .ADDR_REG_IN(ADDR_REG_IN),
  .OPT_BIT_IN(OPT_BIT_IN),
  .RST(RST),
  .CLK(CLK)
);

always #20 CLK = ~CLK;


initial
begin

$monitor("TEMPO:%d -- DATA_OUT:%d | MEM_DATA_ADDR:%d | OPCD_OUT:%d | ADDR_REG_OUT:%d | OPT_BIT_OUT:%d | WRITE_ENABLE:%d | MEM_CLK:%d | ESTADO:%d",
	$time, DATA_OUT, MEM_DATA_ADDR, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, WRITE_ENABLE, MEM_CLK, ESTADO);
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