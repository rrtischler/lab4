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
// CREATED		"Thu Jun 28 00:17:24 2018"

module MemAcc_block_(
	CLK,
	RST,
	INTERRUPT,
	ME_MEM_CLK,
	ME_WRITE_ENABLE,
	ME_OPT_BIT_OUT,
	ME_ADDR_REG_OUT,
	ME_DATA_OUT,
	ME_ESTADO,
	ME_MEM_DATA_ADDR,
	ME_OPCD_OUT
);


input wire	CLK;
input wire	RST;
input wire	[3:0] INTERRUPT;
output wire	ME_MEM_CLK;
output wire	ME_WRITE_ENABLE;
output wire	ME_OPT_BIT_OUT;
output wire	[4:0] ME_ADDR_REG_OUT;
output wire	[15:0] ME_DATA_OUT;
output wire	[2:0] ME_ESTADO;
output wire	[9:0] ME_MEM_DATA_ADDR;
output wire	[4:0] ME_OPCD_OUT;

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
wire	[15:0] SYNTHESIZED_WIRE_40;
wire	[15:0] SYNTHESIZED_WIRE_41;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	[4:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[15:0] SYNTHESIZED_WIRE_22;
wire	[4:0] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[9:0] SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[15:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_37;
wire	[4:0] SYNTHESIZED_WIRE_38;
wire	[4:0] SYNTHESIZED_WIRE_39;

assign	ME_MEM_CLK = SYNTHESIZED_WIRE_25;
assign	ME_WRITE_ENABLE = SYNTHESIZED_WIRE_24;
assign	ME_DATA_OUT = SYNTHESIZED_WIRE_42;
assign	ME_MEM_DATA_ADDR = SYNTHESIZED_WIRE_26;




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
	.REG_A_OUT(SYNTHESIZED_WIRE_40),
	.REG_B_OUT(SYNTHESIZED_WIRE_41));


IF_ID	b2v_inst1(
	.SCLK(CLK_BUFFERS),
	.IR_IN(SYNTHESIZED_WIRE_7),
	.NPC_IN(NPC),
	.IR_OUT(SYNTHESIZED_WIRE_32),
	.NPC_OUT(SYNTHESIZED_WIRE_34));


Exec	b2v_inst10(
	.CLK(CLK),
	.RST(SYNTHESIZED_WIRE_8),
	.OPT_BIT_IN(SYNTHESIZED_WIRE_9),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_10),
	.IMM(SYNTHESIZED_WIRE_11),
	.INTERRUPT(INTERRUPT),
	.NPC_IN(SYNTHESIZED_WIRE_12),
	.OPCD_IN(SYNTHESIZED_WIRE_13),
	.REG_A(SYNTHESIZED_WIRE_40),
	.REG_B(SYNTHESIZED_WIRE_41),
	.RESULT_DIV(SYNTHESIZED_WIRE_16),
	.OPT_BIT_OUT(SYNTHESIZED_WIRE_37),
	.COND(SYNTHESIZED_WIRE_29),
	.ADDR_REG_OUT(SYNTHESIZED_WIRE_38),
	.ALU_OUT(ALU_OUT),
	
	.OPCD_OUT(SYNTHESIZED_WIRE_39));
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
	
	.q(SYNTHESIZED_WIRE_30));


pll_buffers	b2v_inst13(
	.inclk0(CLK),
	.c0(CLK_BUFFERS));


MemAcc	b2v_inst16(
	.OPT_BIT_IN(SYNTHESIZED_WIRE_18),
	.RST(SYNTHESIZED_WIRE_19),
	.CLK(CLK),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_20),
	.ALU_OUT(SYNTHESIZED_WIRE_21),
	.MEM_DATA(SYNTHESIZED_WIRE_22),
	.OPCD_IN(SYNTHESIZED_WIRE_23),
	.OPT_BIT_OUT(ME_OPT_BIT_OUT),
	.WRITE_ENABLE(SYNTHESIZED_WIRE_24),
	.MEM_CLK(SYNTHESIZED_WIRE_25),
	.ADDR_REG_OUT(ME_ADDR_REG_OUT),
	.DATA_OUT(SYNTHESIZED_WIRE_42),
	.ESTADO(ME_ESTADO),
	.MEM_DATA_ADDR(SYNTHESIZED_WIRE_26),
	.OPCD_OUT(ME_OPCD_OUT));
	defparam	b2v_inst16.ADD = 5'b00010;
	defparam	b2v_inst16.AND = 5'b00110;
	defparam	b2v_inst16.BRLF = 5'b01100;
	defparam	b2v_inst16.CALL = 5'b01101;
	defparam	b2v_inst16.CMP = 5'b01000;
	defparam	b2v_inst16.DIV = 5'b00101;
	defparam	b2v_inst16.IDLE = 0;
	defparam	b2v_inst16.JPC = 5'b01011;
	defparam	b2v_inst16.JR = 5'b01010;
	defparam	b2v_inst16.LW = 5'b00000;
	defparam	b2v_inst16.MUL = 5'b00100;
	defparam	b2v_inst16.NOP = 5'b01111;
	defparam	b2v_inst16.NOT = 5'b01001;
	defparam	b2v_inst16.OR = 5'b00111;
	defparam	b2v_inst16.PREPARE_READ = 1;
	defparam	b2v_inst16.PREPARE_WRITE = 4;
	defparam	b2v_inst16.READ = 3;
	defparam	b2v_inst16.READ_CLOCK = 2;
	defparam	b2v_inst16.RET = 5'b01110;
	defparam	b2v_inst16.SUB = 5'b00011;
	defparam	b2v_inst16.SW = 5'b00001;
	defparam	b2v_inst16.VAZIO_0 = 6;
	defparam	b2v_inst16.WRITE = 5;


seg_programa	b2v_inst2(
	.wren(SYNTHESIZED_WIRE_24),
	.clock(SYNTHESIZED_WIRE_25),
	.address(SYNTHESIZED_WIRE_26),
	.data(SYNTHESIZED_WIRE_42),
	.q(SYNTHESIZED_WIRE_22));


InstFetch	b2v_inst3(
	.RST(SYNTHESIZED_WIRE_28),
	.CLK(CLK),
	.COND(SYNTHESIZED_WIRE_29),
	.MEM_OUT(SYNTHESIZED_WIRE_30),
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
	.RST(SYNTHESIZED_WIRE_31),
	
	.EXE_OUT(ALU_OUT[15:0]),
	.IR(SYNTHESIZED_WIRE_32),
	.MEM_ACC_OUT(SYNTHESIZED_WIRE_42),
	.NPC_IN(SYNTHESIZED_WIRE_34),
	
	
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
	.A(SYNTHESIZED_WIRE_40),
	.B(SYNTHESIZED_WIRE_41),
	.RESULT(SYNTHESIZED_WIRE_16));


EX_MA	b2v_inst6(
	.OPT_BIT_OUT_IN(SYNTHESIZED_WIRE_37),
	.SCLK(CLK_BUFFERS),
	.ADDR_REG_OUT_IN(SYNTHESIZED_WIRE_38),
	.ALU_OUT_IN(ALU_OUT[15:0]),
	.OPCD_OUT_IN(SYNTHESIZED_WIRE_39),
	.OPT_BIT_OUT_OUT(SYNTHESIZED_WIRE_18),
	.ADDR_REG_OUT_OUT(SYNTHESIZED_WIRE_20),
	.ALU_OUT_OUT(SYNTHESIZED_WIRE_21),
	.OPCD_OUT_OUT(SYNTHESIZED_WIRE_23));


reset_controller	b2v_inst9(
	.CLK(CLK_BUFFERS),
	.RST(RST),
	.RST_IF(SYNTHESIZED_WIRE_28),
	.RST_ID(SYNTHESIZED_WIRE_31),
	.RST_EXE(SYNTHESIZED_WIRE_8),
	.RST_MEM(SYNTHESIZED_WIRE_19)
	);
	defparam	b2v_inst9.EXE = 3;
	defparam	b2v_inst9.ID = 2;
	defparam	b2v_inst9.IDLE = 0;
	defparam	b2v_inst9.IF = 1;
	defparam	b2v_inst9.MEM = 4;
	defparam	b2v_inst9.WB = 5;


endmodule
