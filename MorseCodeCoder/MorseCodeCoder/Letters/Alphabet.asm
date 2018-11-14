/*
 * Alphabet.asm
 *
 *  Created: 11/1/2018 10:23:28 AM
 *   Author: Claudiu
 */ 

 
 A:
CALL Dot
CALL Line
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

 D:
CALL Line
CALL Dot
CALL Dot
JMP main_loop_start

 E:
CALL Dot
JMP main_loop_start

 F:
CALL Dot
CALL Dot
CALL Line
CALL Dot
JMP main_loop_start

 G:
CALL Line
CALL Line
CALL Dot
JMP main_loop_start

 H:
CALL Dot
CALL Dot
CALL Dot
CALL Dot
JMP main_loop_start

 I:
CALL Dot
CALL Dot
JMP main_loop_start

 J:
CALL Dot
CALL Line
CALL Line
CALL Line
JMP main_loop_start

 K:
CALL Line
CALL Dot
CALL Line
JMP main_loop_start

 L:
CALL Dot
CALL Line
CALL Dot
CALL Dot
JMP main_loop_start

 M:
CALL Line
CALL Line
JMP main_loop_start

 N:
CALL Line
CALL Dot
JMP main_loop_start

 O:
CALL Line
CALL Line
CALL Line
JMP main_loop_start

 P:
CALL Dot
CALL Line
CALL Line
CALL Dot
JMP main_loop_start

 Q:
CALL Line
CALL Line
CALL Dot
CALL Line
JMP main_loop_start

 R:
CALL Dot
CALL Line
CALL Dot
JMP main_loop_start

 S:
CALL Dot
CALL Dot
CALL Dot
JMP main_loop_start
 
 T:
CALL Line
JMP main_loop_start

 U:
CALL Dot
CALL Dot
CALL Line
JMP main_loop_start

 V:
CALL Dot
CALL Dot
CALL Dot
CALL Line
JMP main_loop_start

 W:
CALL Dot
CALL Line
CALL Line
JMP main_loop_start

//X, Y, Z are reserved for Assembly so we change X to XX etc.
 XX:
CALL Line
CALL Dot
CALL Dot
CALL Line
JMP main_loop_start

 YY:
CALL Line
CALL Dot
CALL Line
CALL Line
JMP main_loop_start

 ZZ:
CALL Line
CALL Line
CALL Dot
CALL Dot
JMP main_loop_start

 ZERO:
CALL Line
CALL Line
CALL Line
CALL Line
CALL Line
JMP main_loop_start

 ONE:
CALL Dot
CALL Line
CALL Line
CALL Line
CALL Line
JMP main_loop_start

 TWO:
CALL Dot
CALL Dot
CALL Line
CALL Line
CALL Line
JMP main_loop_start

 THREE:
CALL Dot
CALL Dot
CALL Dot
CALL Line
CALL Line
JMP main_loop_start

 FOUR:
CALL Dot
CALL Dot
CALL Dot
CALL Dot
CALL Line
JMP main_loop_start

 FIVE:
CALL Dot
CALL Dot
CALL Dot
CALL Dot
CALL Dot
JMP main_loop_start

 SIX:
CALL Line
CALL Dot
CALL Dot
CALL Dot
CALL Dot
JMP main_loop_start

 SEVEN:
CALL Line
CALL Line
CALL Dot
CALL Dot
CALL Dot
JMP main_loop_start

 EIGHT:
CALL Line
CALL Line
CALL Line
CALL Dot
CALL Dot
JMP main_loop_start

 NINE:
CALL Line
CALL Line
CALL Line
CALL Line
CALL Dot
JMP main_loop_start
