`timescale 1ns/1ps
module infrared_tb();

wire [15:0] DATA_OUT;
wire [9:0] MEM_DATA_ADDR;
wire [4:0] OPCD_OUT, ADDR_REG_OUT;
wire OPT_BIT_OUT, MEM_DATA_CLK_READ, MEM_DATA_CLK_WRITE;

wire [2:0] ESTADO;

reg [15:0] ALU_OUT, MEM_DATA;
reg [4:0] OPCD_IN, ADDR_REG_IN;
reg OPT_BIT_IN;
reg RST, CLK;


InstFetch tb_inst
(
  .DATA_OUT(),
  .MEM_DATA_ADDR(),
  .OPCD_OUT(),
  .ADDR_REG_OUT(),
  .OPT_BIT_OUT(),
  .MEM_DATA_CLK_READ(),
  .MEM_DATA_CLK_WRITE(),
  .ESTADO(),
  .ALU_OUT(),
  .MEM_DATA(),
  .OPCD_IN(),
  .ADDR_REG_IN(),
  .OPT_BIT_IN(),
  .RST(),
  .CLK()
);

always #20 clk = ~clk;


initial
begin

$monitor("TEMPO:%d -- DATA_OUT:%d | MEM_DATA_ADDR:%d | OPCD_OUT:%d | ADDR_REG_OUT:%d | OPT_BIT_OUT:%d | MEM_DATA_CLK_READ:%d | MEM_DATA_CLK_WRITE:%d | ESTADO:%d",
	$time, DATA_OUT, MEM_DATA_ADDR, OPCD_OUT, ADDR_REG_OUT, OPT_BIT_OUT, MEM_DATA_CLK_READ, MEM_DATA_CLK_WRITE, ESTADO);
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