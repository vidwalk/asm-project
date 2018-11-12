;
; MorseCodeCoder.asm
;
; Created: 10/31/2018 8:28:54 PM
; Author : Claudiu
;
.include "m2560def.inc"
.ORG 0x00
JMP start
.include "Functions/Delays.asm"
.include "MorseCode/Line.asm"
.include "MorseCode/Dot.asm"
.include "Letters/Alphabet.asm"
; Setup USART0
start:
; Set up the LED lighter and stopper
	LDI R18, 0x00
	LDI R19, 0xFF
; Set baud rate
	LDI R17, 0
	LDI R16, 103
; See table 22-12 to get UBBR value
	STS UBRR0H, R17
	STS UBRR0L, R16
	LDI R16, (0<<U2X0)
	STS UCSR0A, R16
; Enable receiver and transmitter
	LDI R16, (1<<RXEN0)
	STS UCSR0B,R16
; Set frame format: 8data, 1stop bit
	LDI R16, (2<<UMSEL0) | (3<<UCSZ00)
	STS UCSR0C, R16

; Setup stack pointer
	LDI R16, LOW(RAMEND)
	OUT SPL, R16 ; set low byte of RAMEND in stack pointer low byte
	LDI R16, HIGH(RAMEND)
	OUT SPH, R16 ; set high byte of RAMEND in stack pointer high byte
	; this is done so POP & PUSH doesnt invoke undefined behaviour

; Setup LED
	LDI R19, (1 << PB7)
	OUT DDRB, R19

main_loop_start:
CALL USART_Receive
;Acts as if statements to check each letter if it is the correct one
CPI R16, 0x41
BREQ jump_to_not_A
CPI R16, 0x42
BREQ jump_to_not_B
CPI R16, 0x43
BREQ jump_to_not_C
CPI R16, 0x44
BREQ jump_to_not_D
CPI R16, 0x45
BREQ jump_to_not_E
CPI R16, 0x46
BREQ jump_to_not_F
CPI R16, 0x47
BREQ jump_to_not_G
CPI R16, 0x48
BREQ jump_to_not_H
CPI R16, 0x49
;after 49 it becomes 4A until it gets past 4F because it's in hexa
BREQ jump_to_not_I
CPI R16, 0x4A
BREQ jump_to_not_J
CPI R16, 0x4B
BREQ jump_to_not_K
CPI R16, 0x4C
BREQ jump_to_not_L
CPI R16, 0x4D
BREQ jump_to_not_M
CPI R16, 0x4E
BREQ jump_to_not_N
CPI R16, 0x4F
BREQ jump_to_not_O
CPI R16, 0x50
BREQ jump_to_not_P
CPI R16, 0x51
BREQ jump_to_not_Q
CPI R16, 0x52
BREQ jump_to_not_R
CPI R16, 0x53
BREQ jump_to_not_S
CPI R16, 0x54
BREQ jump_to_not_T
RJMP main_loop_start

USART_Receive:
	LDS R17, UCSR0A
	SBRS R17, RXC0
	RJMP USART_Receive
	LDS R16, UDR0
	RET

;Solution to error relative branch out of reach
;A relative branch means that the jump occurs by changing the position of the program counter(which instruction is being executed right now) by either adding or subtracting a value from it
;JMP and CALL have a limit. JMP is -63 to 64
jump_to_not_A:
CALL A
jump_to_not_B:
CALL B
jump_to_not_C:
CALL C
jump_to_not_D:
CALL D
jump_to_not_E:
CALL E
jump_to_not_F:
CALL F
jump_to_not_G:
CALL G
jump_to_not_H:
CALL H
jump_to_not_I:
CALL I
jump_to_not_J:
CALL J
jump_to_not_K:
CALL K
jump_to_not_L:
CALL L
jump_to_not_M:
CALL M
jump_to_not_N:
CALL N
jump_to_not_O:
CALL O
jump_to_not_P:
CALL P
jump_to_not_Q:
CALL Q
jump_to_not_R:
CALL R
jump_to_not_S:
CALL S
jump_to_not_T:
CALL T






