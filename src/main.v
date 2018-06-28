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
// CREATED		"Thu Jun 28 16:17:48 2018"

module pipeproc(
	CLK,
	RST,
	INTERRUPT,
	WB_COND,
	ME_MEM_CLK,
	ME_WRITE_ENABLE,
	ME_OPT_BIT_OUT,
	EX_OPT_BIT_OUT,
	EX_COND,
	FE_MEM_CLK,
	DE_OPT_BIT,
	DE_ADDR_REG,
	DE_IMM,
	DE_NPC_OUT,
	DE_OPCD,
	DE_REG_A,
	DE_REG_B,
	EX_ADDR_REG_OUT,
	EX_ALU_OUT,
	EX_OPCD_OUT,
	FE_IR,
	FE_NPC,
	ME_ADDR_REG_OUT,
	ME_DATA_OUT,
	ME_MEM_DATA_ADDR,
	ME_OPCD_OUT,
	WB_ADDR_REG_OUT,
	WB_DATA_OUT
);


input wire	CLK;
input wire	RST;
input wire	[3:0] INTERRUPT;
output wire	WB_COND;
output wire	ME_MEM_CLK;
output wire	ME_WRITE_ENABLE;
output wire	ME_OPT_BIT_OUT;
output wire	EX_OPT_BIT_OUT;
output wire	EX_COND;
output wire	FE_MEM_CLK;
output wire	DE_OPT_BIT;
output wire	[4:0] DE_ADDR_REG;
output wire	[15:0] DE_IMM;
output wire	[15:0] DE_NPC_OUT;
output wire	[4:0] DE_OPCD;
output wire	[15:0] DE_REG_A;
output wire	[15:0] DE_REG_B;
output wire	[4:0] EX_ADDR_REG_OUT;
output wire	[31:0] EX_ALU_OUT;
output wire	[4:0] EX_OPCD_OUT;
output wire	[31:0] FE_IR;
output wire	[15:0] FE_NPC;
output wire	[4:0] ME_ADDR_REG_OUT;
output wire	[15:0] ME_DATA_OUT;
output wire	[9:0] ME_MEM_DATA_ADDR;
output wire	[4:0] ME_OPCD_OUT;
output wire	[4:0] WB_ADDR_REG_OUT;
output wire	[15:0] WB_DATA_OUT;

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
wire	[15:0] SYNTHESIZED_WIRE_50;
wire	[15:0] SYNTHESIZED_WIRE_51;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[4:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[4:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[9:0] SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[15:0] SYNTHESIZED_WIRE_33;
wire	[4:0] SYNTHESIZED_WIRE_34;
wire	[15:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_38;
wire	[4:0] SYNTHESIZED_WIRE_39;
wire	[4:0] SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	[4:0] SYNTHESIZED_WIRE_43;
wire	[15:0] SYNTHESIZED_WIRE_44;
wire	[4:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[4:0] SYNTHESIZED_WIRE_47;
wire	[4:0] SYNTHESIZED_WIRE_49;

assign	WB_COND = SYNTHESIZED_WIRE_30;
assign	ME_WRITE_ENABLE = SYNTHESIZED_WIRE_23;
assign	ME_OPT_BIT_OUT = SYNTHESIZED_WIRE_46;
assign	EX_OPT_BIT_OUT = SYNTHESIZED_WIRE_38;
assign	EX_COND = SYNTHESIZED_WIRE_27;
assign	DE_OPT_BIT = SYNTHESIZED_WIRE_0;
assign	DE_ADDR_REG = SYNTHESIZED_WIRE_1;
assign	DE_IMM = SYNTHESIZED_WIRE_2;
assign	DE_NPC_OUT = SYNTHESIZED_WIRE_3;
assign	DE_OPCD = SYNTHESIZED_WIRE_4;
assign	DE_REG_A = SYNTHESIZED_WIRE_5;
assign	DE_REG_B = SYNTHESIZED_WIRE_6;
assign	EX_ADDR_REG_OUT = SYNTHESIZED_WIRE_39;
assign	EX_OPCD_OUT = SYNTHESIZED_WIRE_40;
assign	FE_IR = SYNTHESIZED_WIRE_7;
assign	ME_ADDR_REG_OUT = SYNTHESIZED_WIRE_47;
assign	ME_DATA_OUT = SYNTHESIZED_WIRE_52;
assign	ME_MEM_DATA_ADDR = SYNTHESIZED_WIRE_24;
assign	ME_OPCD_OUT = SYNTHESIZED_WIRE_49;
assign	WB_ADDR_REG_OUT = SYNTHESIZED_WIRE_34;
assign	WB_DATA_OUT = SYNTHESIZED_WIRE_35;




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
	.REG_A_OUT(SYNTHESIZED_WIRE_50),
	.REG_B_OUT(SYNTHESIZED_WIRE_51));


IF_ID	b2v_inst1(
	.SCLK(CLK_BUFFERS),
	.IR_IN(SYNTHESIZED_WIRE_7),
	.NPC_IN(NPC),
	.IR_OUT(SYNTHESIZED_WIRE_31),
	.NPC_OUT(SYNTHESIZED_WIRE_33));


Exec	b2v_inst10(
	.CLK(CLK),
	.RST(SYNTHESIZED_WIRE_8),
	.OPT_BIT_IN(SYNTHESIZED_WIRE_9),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_10),
	.IMM(SYNTHESIZED_WIRE_11),
	.INTERRUPT(INTERRUPT),
	.NPC_IN(SYNTHESIZED_WIRE_12),
	.OPCD_IN(SYNTHESIZED_WIRE_13),
	.REG_A(SYNTHESIZED_WIRE_50),
	.REG_B(SYNTHESIZED_WIRE_51),
	.RESULT_DIV(SYNTHESIZED_WIRE_16),
	.OPT_BIT_OUT(SYNTHESIZED_WIRE_38),
	.COND(SYNTHESIZED_WIRE_27),
	.ADDR_REG_OUT(SYNTHESIZED_WIRE_39),
	.ALU_OUT(ALU_OUT),
	
	.OPCD_OUT(SYNTHESIZED_WIRE_40));
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
	
	.clock(CLK),
	.address(NPC[9:0]),
	
	.q(SYNTHESIZED_WIRE_28));


pll_buffers	b2v_inst13(
	.inclk0(CLK),
	.c0(CLK_BUFFERS));


MemAcc	b2v_inst16(
	.OPT_BIT_IN(SYNTHESIZED_WIRE_17),
	.RST(SYNTHESIZED_WIRE_18),
	.CLK(CLK),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_19),
	.ALU_OUT(SYNTHESIZED_WIRE_20),
	.MEM_DATA(SYNTHESIZED_WIRE_21),
	.OPCD_IN(SYNTHESIZED_WIRE_22),
	.OPT_BIT_OUT(SYNTHESIZED_WIRE_46),
	.WRITE_ENABLE(SYNTHESIZED_WIRE_23),
	.MEM_CLK(ME_MEM_CLK),
	.ADDR_REG_OUT(SYNTHESIZED_WIRE_47),
	.DATA_OUT(SYNTHESIZED_WIRE_52),
	
	.MEM_DATA_ADDR(SYNTHESIZED_WIRE_24),
	.OPCD_OUT(SYNTHESIZED_WIRE_49));
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
	.wren(SYNTHESIZED_WIRE_23),
	.clock(CLK),
	.address(SYNTHESIZED_WIRE_24),
	.data(SYNTHESIZED_WIRE_52),
	.q(SYNTHESIZED_WIRE_21));


InstFetch	b2v_inst3(
	.RST(SYNTHESIZED_WIRE_26),
	.CLK(CLK),
	.COND(SYNTHESIZED_WIRE_27),
	.MEM_OUT(SYNTHESIZED_WIRE_28),
	.ULA(ALU_OUT[15:0]),
	.MEM_CLK(FE_MEM_CLK),
	
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
	.RST(SYNTHESIZED_WIRE_29),
	.COND_WB(SYNTHESIZED_WIRE_30),
	.EXE_OUT(ALU_OUT[15:0]),
	.IR(SYNTHESIZED_WIRE_31),
	.MEM_ACC_OUT(SYNTHESIZED_WIRE_52),
	.NPC_IN(SYNTHESIZED_WIRE_33),
	.RD_WB(SYNTHESIZED_WIRE_34),
	.WB_OUT(SYNTHESIZED_WIRE_35),
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
	.A(SYNTHESIZED_WIRE_50),
	.B(SYNTHESIZED_WIRE_51),
	.RESULT(SYNTHESIZED_WIRE_16));


EX_MA	b2v_inst6(
	.OPT_BIT_OUT_IN(SYNTHESIZED_WIRE_38),
	.SCLK(CLK_BUFFERS),
	.ADDR_REG_OUT_IN(SYNTHESIZED_WIRE_39),
	.ALU_OUT_IN(ALU_OUT[15:0]),
	.OPCD_OUT_IN(SYNTHESIZED_WIRE_40),
	.OPT_BIT_OUT_OUT(SYNTHESIZED_WIRE_17),
	.ADDR_REG_OUT_OUT(SYNTHESIZED_WIRE_19),
	.ALU_OUT_OUT(SYNTHESIZED_WIRE_20),
	.OPCD_OUT_OUT(SYNTHESIZED_WIRE_22));


WriteBack	b2v_inst7(
	.OPT_BIT_IN(SYNTHESIZED_WIRE_41),
	.RST(SYNTHESIZED_WIRE_42),
	.CLK(CLK),
	.ADDR_REG_IN(SYNTHESIZED_WIRE_43),
	.DATA_IN(SYNTHESIZED_WIRE_44),
	.OPCD_IN(SYNTHESIZED_WIRE_45),
	.COND(SYNTHESIZED_WIRE_30),
	.ADDR_REG_OUT(SYNTHESIZED_WIRE_34),
	.DATA_OUT(SYNTHESIZED_WIRE_35)
	);
	defparam	b2v_inst7.ADD = 5'b00010;
	defparam	b2v_inst7.AND = 5'b00110;
	defparam	b2v_inst7.BRLF = 5'b01100;
	defparam	b2v_inst7.CALL = 5'b01101;
	defparam	b2v_inst7.CMP = 5'b01000;
	defparam	b2v_inst7.DIV = 5'b00101;
	defparam	b2v_inst7.IDLE = 0;
	defparam	b2v_inst7.JPC = 5'b01011;
	defparam	b2v_inst7.JR = 5'b01010;
	defparam	b2v_inst7.LW = 5'b00000;
	defparam	b2v_inst7.MUL = 5'b00100;
	defparam	b2v_inst7.NOP = 5'b01111;
	defparam	b2v_inst7.NOT = 5'b01001;
	defparam	b2v_inst7.OR = 5'b00111;
	defparam	b2v_inst7.RET = 5'b01110;
	defparam	b2v_inst7.SUB = 5'b00011;
	defparam	b2v_inst7.SW = 5'b00001;
	defparam	b2v_inst7.VAZIO_0 = 2;
	defparam	b2v_inst7.VAZIO_1 = 3;
	defparam	b2v_inst7.VAZIO_2 = 4;
	defparam	b2v_inst7.VAZIO_3 = 5;
	defparam	b2v_inst7.VAZIO_4 = 6;
	defparam	b2v_inst7.WRITE_BACK = 1;


MA_WB	b2v_inst8(
	.OPT_BIT_OUT_IN(SYNTHESIZED_WIRE_46),
	.DCLK(CLK_BUFFERS),
	.ADDR_REG_OUT_IN(SYNTHESIZED_WIRE_47),
	.DATA_OUT_IN(SYNTHESIZED_WIRE_52),
	.OPCD_OUT_IN(SYNTHESIZED_WIRE_49),
	.OPT_BIT_OUT_OUT(SYNTHESIZED_WIRE_41),
	.ADDR_REG_OUT_OUT(SYNTHESIZED_WIRE_43),
	.DATA_OUT_OUT(SYNTHESIZED_WIRE_44),
	.OPCD_OUT_OUT(SYNTHESIZED_WIRE_45));


reset_controller	b2v_inst9(
	.CLK(CLK_BUFFERS),
	.RST(RST),
	.RST_IF(SYNTHESIZED_WIRE_26),
	.RST_ID(SYNTHESIZED_WIRE_29),
	.RST_EXE(SYNTHESIZED_WIRE_8),
	.RST_MEM(SYNTHESIZED_WIRE_18),
	.RST_WB(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst9.EXE = 3;
	defparam	b2v_inst9.ID = 2;
	defparam	b2v_inst9.IDLE = 0;
	defparam	b2v_inst9.IF = 1;
	defparam	b2v_inst9.MEM = 4;
	defparam	b2v_inst9.WB = 5;

assign	EX_ALU_OUT = ALU_OUT;
assign	FE_NPC = NPC;

endmodule
