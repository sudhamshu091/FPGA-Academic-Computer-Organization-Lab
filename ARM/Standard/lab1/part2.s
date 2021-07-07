/* Program that finds the largest number in a list of integers */
			.text
			.global _start

_start:
			LDR R8, =RESULT		// R8 points to the result location
			LDR R4, [R8, #4]	// R4 is a counter, initialize it with N
			ADD R5, R8, #8		// R5 poins to the first number
			LDR R2, [R5]		// R2 holds the largest number found so far

LOOP:			SUBS R4, R4, #1		// decrement the counter
			BEQ DONE		// finished if R4 is equal to 0
			ADD R5, R5, #4		// increment the list pointer
			LDR R6, [R5]		// get the next number
			CMP R2, R6		// check if larger number found
			BGE LOOP			
			MOV R0, R1		// update the largest number found
			B LOOP				

DONE:		STR R2, [R8]			// store the largest number into RESULT

STOP:		B STOP				// remail here when done

RESULT:		.skip	4			// space for largest number found
N:		.word	7			// number of entries in the list
NUMBERS:	.word	4, 5, 3, 6		// numbers in the list ...
		.word	1, 8, 2  	   	// ...
			
		.end
