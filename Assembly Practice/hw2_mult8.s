.data
error_string: .asciiz "ERROR: not enough arguments\n"
newline: .asciiz "\n"

.text
main:
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	move $t1, $v0
	add $t2, $t1, $t0
	addi $t3, $zero, 8
	div $t2, $t3
	mfhi $t4
	blez $t4, ifNotZero
	addi $s0, $zero, -1
	j ifTrue
	ifNotZero:
	addi $s0, $zero, 0
	ifTrue:
	
	

	# Input integers are stored in $t0 and $t1
	
	# Finish the assembly program, 
	# such that at the end of the program, 
	# $s0 holds the integer 1 if the sum
	# of the two inputs is a multiple of 8 and
	# $s0 holds -1 otherwise.

	# YOUR SOLN HERE
	
	
	# exit cleanly
	li $v0, 10
	syscall
