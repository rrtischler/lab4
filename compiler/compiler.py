#!/usr/bin/env python3
import re
import sys

DEBUG = True

def usage(program):
    print("usage: {} input.file output.file", program)

def compile(line, count):
    ir_size = 32
    table = {'LW':      0b00000,
             'SW':      0b00001,
             'ADD':     0b00010,
             'SUB':     0b00011,
             'MUL':     0b00100,
             'DIV':     0b00101,
             'AND':     0b00110,
             'OR':      0b00111,
             'CMP':     0b01000,
             'NOT':     0b01001,
             'JR':      0b01010,
             'JPC':     0b01011,
             'BRFL':    0b01100,
             'CALL':    0b01101,
             'RET':     0b01110,
             'NOP':     0b01111,}
    pattern = re.compile(r'^(?P<opcode>\w+)[ ]*(?P<m1>\w+)?[ ,]*(?P<m2>\d+)?[ ]*(?P<m3>\(\w+\)+)?(?P<m4>\w+)?(?P<m5>,\d)?$') # um pouco de regex
    result = pattern.match(line)
    if not result:
        print('error at line {}: {}'.format(count+1, line))
        exit(1)
    # debug:
    if DEBUG:
        print('------- line: {} -------'.format(count))
        print('opcode:', result.group('opcode'))
        print('m1:', result.group('m1'))
        print('m2:', result.group('m2'), '(imm)')
        print('m3:', result.group('m3'))
        print('m4:', result.group('m4'))
        print('m5:', result.group('m5'))
    
    if result.group('opcode').upper() in ['LW', 'SW', 'ADD', 'SUB', 'MUL', 'DIV', 
                                          'AND', 'OR', 'CMP', 'NOT', 'JR', 'CALL',
                                          'RET', 'NOP']:
        opcode = table[result.group('opcode').upper()]
        if result.group('m1'):
            ra = int(result.group('m1')[1:])
        else:
            ra = 0b00000
        if result.group('m2'):
            imm = int(result.group('m2'))
        else:
            imm = 0b0000000000000000
        if result.group('m3'):
            rb = int(result.group('m3')[2:-1])
            if result.group('opcode').upper() == 'LW':
                opt_bit = 0b1
            else:
                opt_bit = 0b0
        elif result.group('m4'):
            rb = int(result.group('m4')[1:])
            opt_bit = 0b0
        else:
            rb = 0b00000
            opt_bit = 0b0
    elif result.group('opcode').upper() == 'BRFL':
        opcode = table[result.group('opcode').upper()]
        flags = {'OF': 0b10000,
                 'AB': 0b01000,
                 'EQ': 0b00100,
                 'BE': 0b00010,
                 'ER': 0b00001,
                 }
        if result.group('m1'):
            ra = int(result.group('m1')[1:])
        else:
            ra = 0b00000
        if result.group('m3'):
            rb = flags.get(result.group('m3'), 0b00001)
        else:
            rb = 0b00000
        if result.group('m5'):
            opt_bit = int(result.group('m5')[1])
        else:
            opt_bit = 0b0
        imm = 0b0000000000000000
    elif result.group('opcode').upper() == 'JPC':
        opcode = table[result.group('opcode').upper()]
        ra = 0b00000
        rb = 0b00000
        opt_bit = 0b0
        imm = int(result.group('m1'))
    else: # wrong opcode
        print('unknown opcode at line {}: {}'.format(count, line))
        exit(2)

    if DEBUG:
        print('## result: ##')
        print('opcode(bin):', format(opcode, '#07b'))
        print('opt_bit(bin):', format(opt_bit, '#03b'))
        print('ra(bin):', format(ra, '#07b'))
        print('rb(bin):', format(rb, '#07b'))
        print('imm(bin):', format(imm, '#018b'))

    bits = (opcode << (ir_size - 5)) + (opt_bit << (ir_size - 5 - 1)) + \
                (ra << (ir_size - 5 - 1 - 5)) + (rb << (ir_size - 5 - 1 - 5 - 5)) + \
                imm
    return bits

def run():
    if(len(sys.argv) > 2):
        count = 0
        with open(sys.argv[1], "r") as src:
            lines = src.readlines()
        with open(sys.argv[2],'w') as out:
            for line in lines:
                val = '{:08x}'.format(compile(line, count))
                out.write(':04{:04x}00{}\n'.format(count, val))
                count = count + 1
    else:
        print(usage(sys.argv[0]))

run()