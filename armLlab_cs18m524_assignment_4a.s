/******************************************************************************
* file: arm_lab_cs18m524_assignment_4_a
* author: Ananya Barat
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  This is the starter code for assignment 3
  */

  @ BSS section
      .bss


  
	  
@ DATA SECTION
      .data

LENGTH : .word 0x03 ;
START1: .word 0x42, 0x41, 0x54;
START2: .word 0x43, 0x41, 0x54;
Greater: .word 0x1111;

@ TEXT section
      .text

.globl _main
	
	LDR R1, = START1
	LDR R2, = LENGTH
	LDR R3, = START2
	LDR R4, [R1] 
	LDR R5, [R3] 
	MOV R8, #0x00
	LDR R9, = Greater
	LDR R10, [R2]
LOOP:
	LDR R6, [R1], #4 @String1 traversing
	LDR R7, [R3], #4 @String2 traversing
	CMP R6, R7       @Compare characters of String1 and String2
	BLT SET_TO_MAX   @If any character of string1 is less than string2 then string1 lesser than string2
	CMP R6, R7
	BGT SET_TO_ZERO	 @If any character of string1 is greater than string2 then string1 greater than string2
	ADD R8, #0x01
	CMP R8, R10
	BNE LOOP
	B SET_TO_ZERO    @If we reach here it means all previous characters of string1 = all characters of string2 so set Greater to 0x00000000 

SET_TO_MAX: 
	MOV R10, #0xFFFFFFFF @string1 lesser than string2 so setting Greater to 0xFFFFFFFF
	STR R10, [R9]
	B exit
	
SET_TO_ZERO:
	MOV R10, #0x00000000 @string1 greater than string2 so setting Greater to 0x00000000
	STR R10, [R9]
	B exit


exit:
	@end
	
