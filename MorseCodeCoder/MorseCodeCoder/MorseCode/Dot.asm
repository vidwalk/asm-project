/*
 * Dot.asm
 *
 *  Created: 10/31/2018 8:30:40 PM
 *   Author: Claudiu
 */ 

Dot:
;Light up the LED after 100 ms
    CALL Delay_100_ms
;Light up the LED
	
	OUT PORTB, R19
;It stays lit for 100ms
	CALL Delay_100_ms
;Stop the LED
	OUT PORTB, R18

RET