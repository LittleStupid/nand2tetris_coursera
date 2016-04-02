// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

//IT COST ME A WHOLE DAY TO WORK IT OUT......WTF

//ROW_NUM=256
//COL_NUM=512
//MEM_NUM=256*512/16=8192
//INIT:SET R0 as 8192

	//R0 = 8192
	@8192
	D=A
	@R0
	M=D
	
	//R1 is -1
	@R1
	M=-1
	
(LOOP)
	//R2 is i,set as 0 erery time
	@R2
	M=0
	
	@KBD
	D=M
	
	@BLACK
	D;JGT
	
(WHITE)
	//get i
	@R2
	D=M
	
	//fill screen[i] as 0
	@SCREEN
	A=A+D
	M=0
	
	//i++
	@R2
	M=M+1

	//fill enough memory blocks? if so,back to loop
	@R0
	D=M
	
	//compare with iterator
	@R2
	D=D-M
	
	//end inner loop if needed
	@LOOP
	D;JLE
	
	//continue fill black
	@WHITE
	0;JMP
//WHITE END
	

(BLACK)
	//get i
	@R2
	D=M
	
	//fill screen[i] as -1
	@SCREEN
	A=A+D
	M=-1
	
	//i++
	@R2
	M=M+1
	
	//fill enough memory blocks? if so,back to loop
	@R0
	D=M
	
	//compare with iterator
	@R2
	D=D-M
	
	//end inner loop if needed
	@LOOP
	D;JLE
	
	//continue fill black
	@BLACK
	0;JMP
//BLACK END

	@LOOP
	0;JMP
//END LOOP