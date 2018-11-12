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
.include "Letters/A-C.asm"
.include "Letters/D-F.asm"
; Setup USART0
start:
; Set baud rate
	LDI R18, 0x00
	LDI R19, 0xFF
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
;PUSH R18
CALL USART_Receive
;POP R16
CPI R16, 0x41
BREQ A
CPI R16, 0x42
BREQ B
CPI R16, 0x43
BREQ C
CPI R16, 0x44
BREQ D
CPI R16, 0x45
BREQ E
RJMP main_loop_start

USART_Receive:
	LDS R17, UCSR0A
	SBRS R17, RXC0
	RJMP USART_Receive
	LDS R16, UDR0
	RET





