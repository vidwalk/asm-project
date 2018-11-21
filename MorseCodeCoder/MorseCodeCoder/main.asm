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
;18th letter
CPI R16, 0x52
BREQ jump_to_not_R
JMP secondHalf
RJMP main_loop_start

USART_Receive:
	LDS R17, UCSR0A
	SBRS R17, RXC0
	RJMP USART_Receive
	LDS R16, UDR0
	RET

;Solution to error relative branch out of reach
;A relative branch means that the jump occurs by changing the position of the program counter(which instruction is being executed right now) by either adding or subtracting a value from it
;BREQ has a limit. BREQ is -63 to 64
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

;second half of the alphabet here because BREQ has call range of 64 lines SOLUTION TO Relative branch out of reach error
secondHalf:
CPI R16, 0x53
BREQ jump_to_not_S
CPI R16, 0x54
BREQ jump_to_not_T
CPI R16, 0x55
BREQ jump_to_not_U
CPI R16, 0x56
BREQ jump_to_not_V
CPI R16, 0x57
BREQ jump_to_not_W
CPI R16, 0x58
BREQ jump_to_not_XX
CPI R16, 0x59
BREQ jump_to_not_YY
CPI R16, 0x5A
BREQ jump_to_not_ZZ
CPI R16, 0x30
BREQ jump_to_not_ZERO
CPI R16, 0x31
BREQ jump_to_not_ONE
CPI R16, 0x32
BREQ jump_to_not_TWO
CPI R16, 0x33
BREQ jump_to_not_THREE
CPI R16, 0x34
BREQ jump_to_not_FOUR
CPI R16, 0x35
BREQ jump_to_not_FIVE
CPI R16, 0x36
BREQ jump_to_not_SIX
CPI R16, 0x37
BREQ jump_to_not_SEVEN
CPI R16, 0x38
BREQ jump_to_not_EIGHT
CPI R16, 0x39
BREQ jump_to_not_NINE
JMP main_loop_start

jump_to_not_S:
CALL S
jump_to_not_T:
CALL T
jump_to_not_U:
CALL U
jump_to_not_V:
CALL V
jump_to_not_W:
CALL W
jump_to_not_XX:
CALL XX
jump_to_not_YY:
CALL YY
jump_to_not_ZZ:
CALL ZZ
jump_to_not_ZERO:
CALL ZERO
jump_to_not_ONE:
CALL ONE
jump_to_not_TWO:
CALL TWO
jump_to_not_THREE:
CALL THREE
jump_to_not_FOUR:
CALL FOUR
jump_to_not_FIVE:
CALL FIVE
jump_to_not_SIX:
CALL SIX
jump_to_not_SEVEN:
CALL SEVEN
jump_to_not_EIGHT:
CALL EIGHT
jump_to_not_NINE:
CALL NINE






