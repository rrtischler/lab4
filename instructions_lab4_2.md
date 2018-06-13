### conjunto de tipos de instruções

setor 1: transferencia de dados
=====================================================================================
1. 	LW 		00000 0 Rd 00000 	Imm 				(lw somente imediato; Rb = 0)
2. 	LW 		00000 1 Rd Rb 		Imm 				(para caso só do Rb, Imm será 0)
3. 	SW 		00001 0 Rs Rb 		Imm 				(para caso só do Rb, Imm será 0)
=====================================================================================
setor 2: aritmética
=====================================================================================
4. 	ADD 	00010 0 Rd Rf 		0000 0000 0000 0000
5. 	SUB 	00011 0 Rd Rf 		0000 0000 0000 0000
6. 	MUL 	00100 0 Rd Rf 		0000 0000 0000 0000
7. 	DIV 	00101 0 Rd Rf 		0000 0000 0000 0000
=====================================================================================
setor 3: lógica
=====================================================================================
8. 	AND 	00110 0 Rd Rf 		0000 0000 0000 0000
9. 	OR  	00111 0 Rd Rf 		0000 0000 0000 0000
10. CMP 	01000 0 Rd Rf 		0000 0000 0000 0000
11. NOT 	01001 0 Rd 00000 	0000 0000 0000 0000
=====================================================================================
setor 4: transferência de controle
=====================================================================================
12. JR		01010 0 R 00000		0000 0000 0000 0000
13. JPC		01011 0 00000 00000	Imm
14. BRLF	01100 0 R i 		0000 0000 0000 0000	(const = 0)
15. BRLF	01100 1 R i 		0000 0000 0000 0000 (const = 1)
16. CALL	01101 0 R 00000 	0000 0000 0000 0000
17. RET		01110 0 00000 00000 0000 0000 0000 0000
18. NOP		01111 0 00000 00000 0000 0000 0000 0000

### casos de teste:

setor 1: transferência de dados
=====================================================================================
1. 00000 0 11011 00000 0000 0010 0000 1101	# LW R27, 525   		coloca no registrador 27 o numero 525 (?)

2. 00000 1 11011 01010 0000 0000 0000 1010	# LW R27, 10 (R10)   	coloca no registrador 27 o que estiver na memoria
																	na posição de valor contido no registrador 10 e pula 10 posições (?)

2. 00000 1 11011 01010 0000 0000 0000 0000	# LW R27, (R10)   		coloca no registrador 27 o que estiver na memoria
																	na posição de valor contido no registrador 10 (?)

3. 00001 0 11011 01010 0000 0000 0000 1010	# SW R27, 10 (R10)		coloca na memoria de valor contido no registrador 10
																	pulando 10 posições adicionais o valor de R27

3. 00001 0 11011 01010 0000 0000 0000 0000  # SW R27, (R10)			coloca na memoria de valor contido no registrador 10
																	o valor de R27
=====================================================================================
setor 2: aritmética
=====================================================================================
4. 	00010 0 00111 01000 0000 0000 0000 0000 # ADD R7, R8 			coloca no registrador 7 o resultado de
																	valor(R7) + valor(R8)

5. 	00011 0 00111 01000 0000 0000 0000 0000 # SUB R7, R8			coloca no registrador 7 o resultado de
																	valor(R7) - valor(R8)

6. 	00100 0 00111 01000 0000 0000 0000 0000 # MUL R7, R8			coloca no registrador 7 o resultado de
																	valor(R7) * valor(R8)

7. 	00101 0 00111 01000 0000 0000 0000 0000 # DIV R7, R8			coloca no registrador 7 o resultado de
																	valor(R7) / valor(R8)
=====================================================================================
setor 3: lógica
=====================================================================================
8. 	00110 0 00111 01000 0000 0000 0000 0000 # AND R7, R8			faz uma operação AND entre os registradores
																	7 e 8 e salva em R7 o resultado

9. 	00111 0 00111 01000 0000 0000 0000 0000 # OR R7, R8				faz uma operação OR entre os registradores
																	7 e 8 e salva em R7 o resultado

10. 01000 0 00111 01000 0000 0000 0000 0000 # CMP R7, R8			compara os valores de R7 e R8 e atribui os
																	flags certos em RFlags

11. 01001 0 00111 00000 0000 0000 0000 0000 # NOT R7 				nega o valor no registrador 7
=====================================================================================
setor 4: transferência de controle
=====================================================================================
12. JR		01010 0 00111 00000 0000 0000 0000 0000 # JR R7 		faz com que va para o endereço de valor
																	guardado no registrador 7

13. JPC		01011 0 00000 00000	0000 0011 0111 0101 # JPC 885		faz com que va para o endereço RELATIVO
																	ao PC em 885 posições

14. BRLF	01100 0 00111 00100 0000 0000 0000 0000 # BRFL R7,EQ,0	faz com que va para o endereço de valor
																	guardado no registrador 7 SE o RFlags de
																	igualdade (RE) estiver como 0

15. BRLF	01100 1 00111 00100 0000 0000 0000 0000 # BRFL R7,EQ,1	faz com que va para o endereço de valor
																	guardado no registrador 7 SE o RFlags de
																	igualdade (RE) estiver como 1

16. CALL	01101 0 00111 00000 0000 0000 0000 0000 # CALL R7 		chama uma subrotina no endereço provido
																	pelo valor de R7 (???)

17. RET		01110 0 00000 00000 0000 0000 0000 0000 # RET 			retorna da subrotina (???)

18. NOP		01111 0 00000 00000 0000 0000 0000 0000 # NOP 			nenhuma operação

### entradas/saidas dos blocos:

IF
=====================================================================================
entrada: CLK(1), RST(1), ALU_OUT(16), COND(1), MEM_INST(32)
dentro: PC(10)
saida: NPC(10), OPCODE(5), OPT_BIT(1), RegA(5), RegB(5), IMM(16), MEM_INST_CLK(1), MEM_INST_ADDR(10)
=====================================================================================
ID
=====================================================================================
entrada: NPC(10), CLK(1), RST(1), NPC(10), OPCODE(5), OPT_BIT(1), RegA(5), RegB(5), IMM(16), WB_OUT(16), COND(1), WB_REG(5)
dentro: 32xREGS(16)
saida: NPC(10), OPCODE(5), OPT_BIT(1), RegA_VAL(16), RegB_VAL(16), IMM(16)
=====================================================================================
EX
=====================================================================================
entrada: NPC(10), CLK(1), RST(1), OPCODE(5), OPT_BIT(1), RegA_VAL(16), RegB_VAL(16), IMM(16)
saida: OPCODE(5), OPT_BIT(1), ALU_OUT(16), COND(1), ADDR_REG(5)
=====================================================================================
MEM
=====================================================================================
entrada: CLK(1), RST(1), OPCODE(5), OPT_BIT(1), ALU_OUT(16), ADDR_REG(5), MEM_DATA(16)
saida: OPCODE(5), OPT_BIT(1), DATA_OUT(16), MEM_DATA_CLK(1), MEM_DATA_ADDR(10)
=====================================================================================
WB
=====================================================================================
entrada: CLK(1), RST(1), OPCODE(5), OPT_BIT(1), DATA_OUT(16)
saida: COND(1), ADDR_REG(5), DATA_OUT(16)