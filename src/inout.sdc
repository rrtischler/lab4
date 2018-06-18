## Generated SDC file "inout.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

## DATE    "Sun Jun 17 20:04:45 2018"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK} -period 40.000 -waveform { 0.000 20.000 } [get_ports {CLK}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {inst11|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {inst11|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 6 -master_clock {CLK} [get_pins {inst11|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CLK}] -rise_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK}] -fall_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK}] -rise_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLK}] -rise_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {CLK}] -fall_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {CLK}] -fall_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -rise_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -fall_to [get_clocks {CLK}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -rise_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -rise_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -fall_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {CLK}] -fall_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {CLK}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {inst11|altpll_component|auto_generated|pll1|clk[0]}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.500 [get_ports {CLK}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_ADDR_REG[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_ADDR_REG[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_ADDR_REG[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_ADDR_REG[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_ADDR_REG[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_IMM[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_NPC_OUT[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_OPCD[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_OPCD[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_OPCD[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_OPCD[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_OPCD[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_A[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {DE_REG_B[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ADDR_REG_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ADDR_REG_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ADDR_REG_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ADDR_REG_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ADDR_REG_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[16]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[17]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[18]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[19]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[20]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[21]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[22]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[23]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[24]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[25]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[26]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[27]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[28]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[29]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[30]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_ALU_OUT[31]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_COND}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_OPCD_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_OPCD_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_OPCD_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_OPCD_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_OPCD_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {EX_OPT_BIT_OUT}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[16]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[17]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[18]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[19]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[20]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[21]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[22]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[23]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[24]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[25]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[26]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[27]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[28]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[29]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[30]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_IR[31]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_MEM_CLK}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {FE_NPC[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_ADDR_REG_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_ADDR_REG_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_ADDR_REG_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_ADDR_REG_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_ADDR_REG_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_DATA_OUT[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_CLK}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_MEM_DATA_ADDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_OPCD_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_OPCD_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_OPCD_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_OPCD_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_OPCD_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_OPT_BIT_OUT}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {ME_WRITE_ENABLE}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_ADDR_REG_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_ADDR_REG_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_ADDR_REG_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_ADDR_REG_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_ADDR_REG_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_COND}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  2.000 [get_ports {WB_DATA_OUT[15]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

