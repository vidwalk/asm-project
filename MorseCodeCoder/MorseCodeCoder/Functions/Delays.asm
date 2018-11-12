/*
 * Delays.asm
 *
 *  Created: 11/1/2018 9:58:22 AM
 *   Author: Claudiu
 */
;Function to delay the action for 100ms	
Delay_100_ms:
	LDI R22, 234
Delay_1_ms:
	LDI R21, 52
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