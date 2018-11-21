/*
 * Line.asm
 *
 *  Created: 10/31/2018 8:35:58 PM
 *   Author: Claudiu
 */ 

Line:
;Light up the LED after 300 ms
    
	CALL Delay_300_ms
;Light up the LED
	
	OUT PORTB, R19
;It stays lit for 900ms
	CALL Delay_300_ms
	CALL Delay_300_ms
	CALL Delay_300_ms
;Stop the LED
	OUT PORTB, R18
	
	RET