;
; MorseCodeCoder.asm
;
; Created: 10/31/2018 8:28:54 PM
; Author : Claudiu
;
.ORG 0x00
JMP start
.include "m2560def.inc"
.include "MorseCode/Line.asm"
.include "MorseCode/Dot.asm"
.include "Functions/Delays.asm"
.include "Letters/ALetter.asm"

start:
;Initialize Registers
LDI R16, 0xFF
;load 0xFF to DDRB, so it is set to output in arduino
LDI R17, 0x00
CALL A
RET


