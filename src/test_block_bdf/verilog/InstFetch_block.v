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
// CREATED		"Tue Jun 19 22:59:22 2018"

module InstFetch_block(
	RST,
	CLK,
	COND,
	ULA,
	ESTADO,
	IR,
	NPC
);


input wire	RST;
input wire	CLK;
input wire	COND;
input wire	[15:0] ULA;
output wire	[2:0] ESTADO;
output wire	[31:0] IR;
output wire	[15:0] NPC;

wire	[15:0] NPC_ALTERA_SYNTHESIZED;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[0:31] SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;




InstFetch	b2v_inst(
	.RST(RST),
	.CLK(CLK),
	.COND(COND),
	.MEM_OUT(SYNTHESIZED_WIRE_0),
	.ULA(ULA),
	
	.ESTADO(ESTADO),
	.IR(IR),
	.NPC(NPC_ALTERA_SYNTHESIZED));
	defparam	b2v_inst.IDLE = 0;
	defparam	b2v_inst.INC_PC = 5;
	defparam	b2v_inst.PREP_READ = 1;
	defparam	b2v_inst.READ_SEND = 2;
	defparam	b2v_inst.UPDATE_PC = 6;
	defparam	b2v_inst.VAZIO_0 = 3;
	defparam	b2v_inst.VAZIO_1 = 4;


seg_dados	b2v_inst1(
	.wren(SYNTHESIZED_WIRE_1),
	.clock(CLK),
	.address(NPC_ALTERA_SYNTHESIZED[9:0]),
	.data(SYNTHESIZED_WIRE_2),
	.q(SYNTHESIZED_WIRE_0));



assign	NPC = NPC_ALTERA_SYNTHESIZED;

endmodule
