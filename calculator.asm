.globl main
.text

main:
	li a0, 2
	jal printint
	
	la a0, msg1
	jal printstring
	
	li a0, 'A'
	jal printchar
	
	jal readchar
	
	jal readint
	
	jal exit0
	

	
.data   
    msg1: .string "Test"

