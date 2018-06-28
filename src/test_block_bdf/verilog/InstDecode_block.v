// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
// CREATED		"Thu Jun 28 00:07:01 2018"

module InstDecode_block_(
	CLK,
	RST,
	DE_COND_WB,
	DE_MEM_ACC_OUT,
	DE_RD_WB,
	DE_WB_OUT,
	DE_OPT_BIT,
	DE_ADDR_REG,
	DE_ESTADO,
	DE_IMM,
	DE_NPC_OUT,
	DE_OPCD,
	DE_REG_A,
	DE_REG_B
);


input wire	CLK;
input wire	RST;
input wire	DE_COND_WB;
input wire	[15:0] DE_MEM_ACC_OUT;
input wire	[4:0] DE_RD_WB;
input wire	[15:0] DE_WB_OUT;
output wire	DE_OPT_BIT;
output wire	[4:0] DE_ADDR_REG;
output wire	[2:0] DE_ESTADO;
output wire	[15:0] DE_IMM;
output wire	[15:0] DE_NPC_OUT;
output wire	[4:0] DE_OPCD;
output wire	[15:0] DE_REG_A;
output wire	[15:0] DE_REG_B;

wire	CLK_BUFFERS;
wire	[15:0] NPC;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;





IF_ID	b2v_inst1(
	.SCLK(CLK_BUFFERS),
	.IR_IN(SYNTHESIZED_WIRE_0),
	.NPC_IN(NPC),
	.IR_OUT(SYNTHESIZED_WIRE_5),
	.NPC_OUT(SYNTHESIZED_WIRE_6));


seg_dados	b2v_inst12(
	
	.clock(SYNTHESIZED_WIRE_1),
	.address(NPC[9:0]),
	
	.q(SYNTHESIZED_WIRE_3));


pll_buffers	b2v_inst13(
	.inclk0(CLK),
	.c0(CLK_BUFFERS));


InstFetch	b2v_inst3(
	.RST(SYNTHESIZED_WIRE_2),
	.CLK(CLK),
	
	.MEM_OUT(SYNTHESIZED_WIRE_3),
	
	.MEM_CLK(SYNTHESIZED_WIRE_1),
	
	.IR(SYNTHESIZED_WIRE_0),
	.NPC(NPC));
	defparam	b2v_inst3.IDLE = 0;
	defparam	b2v_inst3.INC_PC = 5;
	defparam	b2v_inst3.PREP_READ = 1;
	defparam	b2v_inst3.READ_SEND = 2;
	defparam	b2v_inst3.UPDATE_PC = 6;
	defparam	b2v_inst3.VAZIO_0 = 3;
	defparam	b2v_inst3.VAZIO_1 = 4;


InstDecode	b2v_inst4(
	.CLK(CLK),
	.RST(SYNTHESIZED_WIRE_4),
	.COND_WB(DE_COND_WB),
	
	.IR(SYNTHESIZED_WIRE_5),
	.MEM_ACC_OUT(DE_MEM_ACC_OUT),
	.NPC_IN(SYNTHESIZED_WIRE_6),
	.RD_WB(DE_RD_WB),
	.WB_OUT(DE_WB_OUT),
	.OPT_BIT(DE_OPT_BIT),
	.ADDR_REG(DE_ADDR_REG),
	.ESTADO(DE_ESTADO),
	.IMM(DE_IMM),
	.NPC_OUT(DE_NPC_OUT),
	.OPCD(DE_OPCD),
	.REG_A(DE_REG_A),
	.REG_B(DE_REG_B));
	defparam	b2v_inst4.ADD = 5'b00010;
	defparam	b2v_inst4.AND = 5'b00110;
	defparam	b2v_inst4.BRLF = 5'b01100;
	defparam	b2v_inst4.CALL = 5'b01101;
	defparam	b2v_inst4.CMP = 5'b01000;
	defparam	b2v_inst4.D_TABLE = 6;
	defparam	b2v_inst4.DIV = 5'b00101;
	defparam	b2v_inst4.IDLE = 0;
	defparam	b2v_inst4.JPC = 5'b01011;
	defparam	b2v_inst4.JR = 5'b01010;
	defparam	b2v_inst4.LW = 5'b00000;
	defparam	b2v_inst4.MUL = 5'b00100;
	defparam	b2v_inst4.NOP = 5'b01111;
	defparam	b2v_inst4.NOT = 5'b01001;
	defparam	b2v_inst4.OR = 5'b00111;
	defparam	b2v_inst4.READ_SEND = 5;
	defparam	b2v_inst4.RET = 5'b01110;
	defparam	b2v_inst4.SUB = 5'b00011;
	defparam	b2v_inst4.SW = 5'b00001;
	defparam	b2v_inst4.VAZIO_0 = 3;
	defparam	b2v_inst4.VAZIO_1 = 4;
	defparam	b2v_inst4.WAIT_WB = 1;
	defparam	b2v_inst4.WB_WRITING = 2;


reset_controller	b2v_inst9(
	.CLK(CLK_BUFFERS),
	.RST(RST),
	.RST_IF(SYNTHESIZED_WIRE_2),
	.RST_ID(SYNTHESIZED_WIRE_4)
	
	
	);
	defparam	b2v_inst9.EXE = 3;
	defparam	b2v_inst9.ID = 2;
	defparam	b2v_inst9.IDLE = 0;
	defparam	b2v_inst9.IF = 1;
	defparam	b2v_inst9.MEM = 4;
	defparam	b2v_inst9.WB = 5;


endmodule
