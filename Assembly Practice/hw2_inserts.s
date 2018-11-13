.data
error_string: .asciiz "ERROR: invalid arguments\n"

.text
main:
	# Do not modify this code. It is responsible for
	# command line parsing. See further below.
	blt $a0,1,error
	move $s0, $a0 
	
	addiu  $t9, $s0, 0
	addiu  $t7, $s0, 1
	sll   $t8, $t7, 2
	li $v0, 9
	move $a0, $t8   # sbrk 4*(num+1) 
	syscall         
	move $s1, $v0
	addu $s2, $s1, $t8         
	move  $s3, $s1
charloop1:
	lw $t0, 0($a1) 
	lb $t1, 0($t0)  
	addiu $t1,$t1,-48   
	sw    $t1, 0($s3)
	addiu $s3, $s3, 4
	addiu $t9, $t9, -1
	addiu $a1, $a1, 4
	bgt $t9, $zero, charloop1
	
 

	
	# $s0 contains the number of elements in the array
	# $s1 contains the address of the array of integers
	
	# Your job is to insert the number 2630 into the front
	# of the array, moving over all the other elements.
	#
	# The array is fixed in memory; don't just insert 2630 in the address before the start of the array
	#
	# E.g. (here the value in $s0 would be 3)
	# values in the array before:
	# [1, 2, 3, ?]
    # (the question mark just indicates the data could be anything)
    #
	# values in the array after:
	# [2630, 1, 2 3]
	
    # SOLUTION GOES HERE
 	
 	addi $t2, $zero, 0
 	addi $t3, $s3, 0
 	addi $t6, $s3, -4
 	
 
 	
 	
 for: 	
 	beq $t2, $s0, exitLoop  # loop until elements are moved
 	
 	lw $t4, ($t6)  # these two lines move each element backwards as they go along
 	sw $t4, ($t3)
	
	addi $t6, $t6, -4 # deincrement each index pointer in the list 
	addi $t3, $t3, -4



 	 
	addi $t2, $t2, 1
 	#sw $t4, ($t5)
 	j for 
 exitLoop: 
 	addi $t7, $zero, 2630 # create the 2630 element 

 	sw $t7, ($s1)  # insert 2630 into the front of the array


    
            
    
	
exit:
	# exit cleanly
	li $v0, 10
	syscall	
	
error:
	la $a0, error_string
	li $v0, 4       # print
	syscall
	j exit

	

