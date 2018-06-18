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

$monitor("TEMPO:%d -- MEM_CLK:%d | NPC:%d | MEM_ADDR:%d | IR:%d | ESTADO:%d",
	$time, MEM_CLK, NPC, IR, ESTADO);
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