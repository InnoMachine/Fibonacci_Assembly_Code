;This program computes the fibonacci series of the first 'n' nos and stores it in an array
;
;Fibonacci series 1 1 2 3 5 8 13 21 34
;                 a b c
;		    a b c.............b becomes a and c becomes b for next iteration
;		      a b c and so on	
;a+b=c


Data segment
a DB 01H
b DB 01H
c DB ?					;This is for understanding only
count DW 07H				;The size of the sequence
Fibonacci_series DB 100 DUP(?)		;Initialize an array to store the series
Data ends

Code segment 

	Start:
		ASSUME DS:Data,CS:Code,ES:Data	

		MOV AX,Data
		MOV DS,AX

		MOV SI,OFFSET Fibonacci_Series	;to store the results into memory we need an offset(index) of the ARRAY
		MOV CX,count

		MOV AL,a	;For the initial 
		MOV AH,b	;iteration
				;and to
		MOV [SI],AL	;Initialize first two locations of array 
		INC SI		;with the first two nos
		MOV [SI],AH	;of the series
		INC SI		;viz 1 1....****Note cannot use MOV [SI],a since both are memory location****



		Fibo:
		ADD AH,AL	;'b' becomes 'c'		
		
				;MOV b,AH........These statements can be used 
				;MOV a,AL........inplace of the next single
				;MOV [SI],b......statement for a better understanding
	
		MOV [SI],AH	;Record the answer into the array
		XCHG AH,AL	;exchange so that 'b' becomes 'a' and 'c' becomes 'b'....see comment at start of program
		DEC CX
		JZ Ender	;Count is over end the program
		JMP Fibo	;else get the next sequence

		Ender:
			INT 3
Code ends
	end Start