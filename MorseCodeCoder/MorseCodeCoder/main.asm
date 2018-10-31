;
; MorseCodeCoder.asm
;
; Created: 10/31/2018 8:28:54 PM
; Author : Claudiu
;
.include "m2560def.inc"

; Replace with your application code

;Initialize Registers
LDI R16, 0xFF
;load 0xFF to DDRB, so it is set to output in arduino
LDI R17, 0x00

start:
;Light up the LED after 100 ms
    CALL Delay_100_ms
;Light up the LED
	OUT PORTB, R16
;It stays lit for 100ms
	CALL Delay_100_ms
;Stop the LED
	OUT PORTB, R17
	
;Function to delay the action for 100ms	
Delay_100_ms:
	LDI R22, 100
Delay_1_ms:
	LDI R21, 16
Delay_1000_cycles:
	LDI R20, 250
Delay_4_cycles:
	DEC R20
	NOP
	BRNE Delay_4_cycles

	DEC R21
	BRNE Delay_1000_cycles

	DEC R22
	BRNE Delay_1_ms
RET
