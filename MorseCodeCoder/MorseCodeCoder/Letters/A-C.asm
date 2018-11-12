/*
 * Alphabet.asm
 *
 *  Created: 11/1/2018 10:23:28 AM
 *   Author: Claudiu
 */ 

 
 A:
CALL Line
CALL Dot
JMP main_loop_start

 B:
CALL Line
CALL Dot
CALL Dot
CALL Dot
;No JMP without RET makes the arduino blink one more short time than it should
JMP main_loop_start

 C:
CALL Line
CALL Dot
CALL Line
CALL Dot
JMP main_loop_start

