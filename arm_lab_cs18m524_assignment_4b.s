/******************************************************************************
* file: arm_lab_cs18m524_assignment_4_b
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
STRING:  .word 0x42, 0x41,0x42, 0x54, 0x23, 0x21, 0x42, 0x54, 0x63, 0x00; @0x00 is the terminating character
SUBSTR:  .word 0x42, 0x54, 0x63, 0x00; @0x00 is the terminating character
Present: .word 0x00; @location contains 0x00 if not present

@ TEXT section
      .text

.globl _main
	LDR R1, = STRING @loading address of STRING in R1	
	LDR R3, = SUBSTR @loading address of SUBSTR in R3
	LDR R4, [R1]     @R4 iterates through STRING
	LDR R5, [R3] , #4 @R5 iterartes through SUBSTR, R3 already has 1st character
	MOV R2, #0x00   @to count length of substring  
	MOV R10, #0x00  @stores first occurence of substring

/* Calculating length of substring and storing it in R2 */	
Length_of_substring:
	LDR R5, [R3], #4
	ADD R2, #0x01
	CMP R5 , #0x00
	BNE Length_of_substring

/*Restore R3 to the starting location of sunstring for further use*/	
	LDR R3, = SUBSTR
	LDR R5, [R3]
	
/*Comparing every character of string with the first character of substring, if it matches, we check subsequent characters*/	
Matching:
	LDR R4,[R1], #4
	ADD R10, #0x01   
	MOV R6, R1
	CMP R4 , #0x00 @on reaching end of STRING , we exit
	BEQ exit
	CMP R5, R4
	BEQ Check_substring @if first character of substring matches any character of STRING, we match subsequent characters
	B Matching
	
	
/*Once the first character matches, subsequent characters are checked here */
Check_substring:
	LDR R3, = SUBSTR
	LDR R5, [R3], #4
	MOV R9 , #0x01

/*Iteratively matching every character of string to corresponding character of substring */ 
LOOP:
	CMP R9, R2
	BEQ PRESENT
	LDR R7, [R6],#4
	LDR R8, [R3], #4
	ADD R9, #0x01
	CMP R8, R7
	BNE Matching
	B LOOP
	
/* Once we find the substring , the first occurence location is updated here*/	
PRESENT :
	LDR R8, =Present
    STR R10, [R8]
	B exit

exit:
	@end
	
	
	
