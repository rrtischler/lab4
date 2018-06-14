`timescale 1ns/1ps
module infrared_tb();

wire MEM_CLK;
wire [15:0] NPC, MEM_ADDR;
wire [31:0] IR;

wire [2:0] ESTADO;

reg RST, CLK, COND;
reg [15:0] ULA;
reg [31:0] MEM_OUT;


InstFetch tb_inst
(
  .ESTADO(ESTADO)
  .MEM_CLK(MEM_CLK),
  .NPC(NPC),
  .MEM_ADDR(MEM_ADDR),
  .IR(IR),
  .COND(COND),
  .CLK(CLK),
  .E(E),
  .RST(RST),
  .ULA(ULA),
  .MEM_OUT(MEM_OUT)
);

always #20 clk = ~clk;


initial
begin

$monitor("TEMPO:%d -- MEM_CLK:%d | NPC:%d | MEM_ADDR:%d | IR:%d | ESTADO:%d",
	$time, MEM_CLK, NPC, MEM_ADDR, IR);
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