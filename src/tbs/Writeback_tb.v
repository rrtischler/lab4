`timescale 1ns/1ps
module Writeback_tb();

wire [15:0] DATA_OUT;
wire [4:0] ADDR_REG_OUT;
wire COND;

wire [2:0] ESTADO;

reg [15:0] DATA_IN;
reg [4:0] OPCD_IN, ADDR_REG_IN;
reg OPT_BIT_IN, RST, CLK;


WriteBack tb_inst
(
  .DATA_OUT(DATA_OUT),
  .ADDR_REG_OUT(ADDR_REG_OUT),
  .COND(COND),
  .ESTADO(ESTADO),
  .DATA_IN(DATA_IN),
  .OPCD_IN(OPCD_IN),
  .ADDR_REG_IN(ADDR_REG_IN),
  .OPT_BIT_IN(OPT_BIT_IN),
  .RST(RST),
  .CLK(CLK)
);

always #20 CLK = ~CLK;


initial
begin

$monitor("TEMPO:%d -- DATA_OUT:%d | ADDR_REG_OUT:%d | COND:%d | ESTADO:%d",
	$time, DATA_OUT, ADDR_REG_OUT, COND, ESTADO);
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