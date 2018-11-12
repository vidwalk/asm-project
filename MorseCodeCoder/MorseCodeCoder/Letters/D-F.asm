/*
 * D-F.asm
 *
 *  Created: 11/12/2018 11:12:28 PM
 *   Author: Claudiu
 */ 
  D:
CALL Line
CALL Dot
CALL Dot
JMP main_loop_start

 E:
CALL Dot
JMP main_loop_start
