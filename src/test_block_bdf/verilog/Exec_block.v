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
// CREATED		"Thu Jun 28 00:11:21 2018"

module Exec_block_(
	CLK,
	RST,
	INTERRUPT,
	EX_OPT_BIT_OUT,
	EX_COND,
	EX_ADDR_REG_OUT,
	EX_ALU_OUT,
	EX_ESTADO,
	EX_OPCD_OUT
);


input wire	CLK;
input wire	RST;
input wire	[3:0] INTERRUPT;
output wire	EX_OPT_BIT_OUT;
output wire	EX_COND;
output wire	[4:0] EX_ADDR_REG_OUT;
output wire	[31:0] EX_ALU_OUT;
output wire	[2:0] EX_ESTADO;
output wire	[4:0] EX_OPCD_OUT;

wire	[31:0] ALU_OUT;
wire	CLK_BUFFERS;
wire	CLK_DIV;
wire	[15:0] NPC;
wire	SYNTHESIZED_WIRE_0;
wire	[4:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	[4:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[4:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	[4:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_22;
wire	[15:0] SYNTHESIZED_WIRE_23;

assign	EX_COND = SYNTHESIZED_WIRE_19;




ID_EX	b2v_inst(
	.OPT_BIT_IN(SYNTHESIZED_WIRE_0),
	.SCLK(CLK_BUFFERS),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_1),
	.IMM_IN(SYNTHESIZED_WIRE_2),
	.NPC_OUT_IN(SYNTHESIZED_WIRE_3),
	.OPCD_IN(SYNTHESIZED_WIRE_4),
	.REG_A_IN(SYNTHESIZED_WIRE_5),
	.REG_B_IN(SYNTHESIZED_WIRE_6),
	.OPT_BIT_OUT(SYNTHESIZED_WIRE_9),
	.ADDR_REG_OUT(SYNTHESIZED_WIRE_10),
	.IMM_OUT(SYNTHESIZED_WIRE_11),
	.NPC_OUT_OUT(SYNTHESIZED_WIRE_12),
	.OPCD_OUT(SYNTHESIZED_WIRE_13),
	.REG_A_OUT(SYNTHESIZED_WIRE_26),
	.REG_B_OUT(SYNTHESIZED_WIRE_27));


IF_ID	b2v_inst1(
	.SCLK(CLK_BUFFERS),
	.IR_IN(SYNTHESIZED_WIRE_7),
	.NPC_IN(NPC),
	.IR_OUT(SYNTHESIZED_WIRE_22),
	.NPC_OUT(SYNTHESIZED_WIRE_23));


Exec	b2v_inst10(
	.CLK(CLK),
	.RST(SYNTHESIZED_WIRE_8),
	.OPT_BIT_IN(SYNTHESIZED_WIRE_9),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_10),
	.IMM(SYNTHESIZED_WIRE_11),
	.INTERRUPT(INTERRUPT),
	.NPC_IN(SYNTHESIZED_WIRE_12),
	.OPCD_IN(SYNTHESIZED_WIRE_13),
	.REG_A(SYNTHESIZED_WIRE_26),
	.REG_B(SYNTHESIZED_WIRE_27),
	.RESULT_DIV(SYNTHESIZED_WIRE_16),
	.OPT_BIT_OUT(EX_OPT_BIT_OUT),
	.COND(SYNTHESIZED_WIRE_19),
	.ADDR_REG_OUT(EX_ADDR_REG_OUT),
	.ALU_OUT(ALU_OUT),
	.ESTADO(EX_ESTADO),
	.OPCD_OUT(EX_OPCD_OUT));
	defparam	b2v_inst10.ADD = 5'b00010;
	defparam	b2v_inst10.AND = 5'b00110;
	defparam	b2v_inst10.BRANCH_JUMP = 5;
	defparam	b2v_inst10.BRLF = 5'b01100;
	defparam	b2v_inst10.CALCULA_ULA_1 = 1;
	defparam	b2v_inst10.CALCULA_ULA_2 = 2;
	defparam	b2v_inst10.CALCULA_ULA_3 = 3;
	defparam	b2v_inst10.CALL = 5'b01101;
	defparam	b2v_inst10.CMP = 5'b01000;
	defparam	b2v_inst10.DIV = 5'b00101;
	defparam	b2v_inst10.IDLE = 0;
	defparam	b2v_inst10.IN_CALL_0 = 1;
	defparam	b2v_inst10.IN_CALL_1 = 2;
	defparam	b2v_inst10.IN_CALL_2 = 3;
	defparam	b2v_inst10.IN_CALL_3 = 4;
	defparam	b2v_inst10.JPC = 5'b01011;
	defparam	b2v_inst10.JR = 5'b01010;
	defparam	b2v_inst10.LW = 5'b00000;
	defparam	b2v_inst10.MUL = 5'b00100;
	defparam	b2v_inst10.NOP = 5'b01111;
	defparam	b2v_inst10.NOT = 5'b01001;
	defparam	b2v_inst10.OR = 5'b00111;
	defparam	b2v_inst10.RET = 5'b01110;
	defparam	b2v_inst10.SEND = 4;
	defparam	b2v_inst10.SUB = 5'b00011;
	defparam	b2v_inst10.SW = 5'b00001;
	defparam	b2v_inst10.VAZIO_0 = 6;


plldiv	b2v_inst11(
	.inclk0(CLK),
	.c0(CLK_DIV));


seg_dados	b2v_inst12(
	
	.clock(SYNTHESIZED_WIRE_17),
	.address(NPC[9:0]),
	
	.q(SYNTHESIZED_WIRE_20));


pll_buffers	b2v_inst13(
	.inclk0(CLK),
	.c0(CLK_BUFFERS));


InstFetch	b2v_inst3(
	.RST(SYNTHESIZED_WIRE_18),
	.CLK(CLK),
	.COND(SYNTHESIZED_WIRE_19),
	.MEM_OUT(SYNTHESIZED_WIRE_20),
	.ULA(ALU_OUT[15:0]),
	.MEM_CLK(SYNTHESIZED_WIRE_17),
	
	.IR(SYNTHESIZED_WIRE_7),
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
	.RST(SYNTHESIZED_WIRE_21),
	
	.EXE_OUT(ALU_OUT[15:0]),
	.IR(SYNTHESIZED_WIRE_22),
	
	.NPC_IN(SYNTHESIZED_WIRE_23),
	
	
	.OPT_BIT(SYNTHESIZED_WIRE_0),
	.ADDR_REG(SYNTHESIZED_WIRE_1),
	
	.IMM(SYNTHESIZED_WIRE_2),
	.NPC_OUT(SYNTHESIZED_WIRE_3),
	.OPCD(SYNTHESIZED_WIRE_4),
	.REG_A(SYNTHESIZED_WIRE_5),
	.REG_B(SYNTHESIZED_WIRE_6));
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


divider_3clock	b2v_inst5(
	.CLK(CLK_DIV),
	.A(SYNTHESIZED_WIRE_26),
	.B(SYNTHESIZED_WIRE_27),
	.RESULT(SYNTHESIZED_WIRE_16));


reset_controller	b2v_inst9(
	.CLK(CLK_BUFFERS),
	.RST(RST),
	.RST_IF(SYNTHESIZED_WIRE_18),
	.RST_ID(SYNTHESIZED_WIRE_21),
	.RST_EXE(SYNTHESIZED_WIRE_8)
	
	);
	defparam	b2v_inst9.EXE = 3;
	defparam	b2v_inst9.ID = 2;
	defparam	b2v_inst9.IDLE = 0;
	defparam	b2v_inst9.IF = 1;
	defparam	b2v_inst9.MEM = 4;
	defparam	b2v_inst9.WB = 5;

assign	EX_ALU_OUT = ALU_OUT;

endmodule
