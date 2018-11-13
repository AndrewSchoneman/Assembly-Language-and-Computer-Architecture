# these are just useful constants set
# to the default parameters of
# the Bitmap Display
# width of screen
.eqv WIDTH 512
# height of screen
.eqv HEIGHT 256
# memory address of pixel (0, 0)
.eqv SCREEN 0x10010000


 

addiu $a0, $zero, 150
addiu $a1, $zero, 55
addiu $a2, $zero, 45       
addiu $a3, $zero, 0x0000FF 
jal drawvertical

addiu $a0, $zero, 30
addiu $a1, $zero, 80
addiu $a2, $zero, 51       
addiu $a3, $zero, 0x00FF00 
jal drawhorizontal


addiu $a0, $zero, 105
addiu $a1, $zero, 55
addiu $a2, $zero, 45       
addiu $a3, $zero, 0x0000FF 
jal drawvertical

addiu $a0, $zero, 234
addiu $a1, $zero, 75
addiu $a2, $zero, 30       
addiu $a3, $zero, 0x0000FF 
jal drawvertical



addiu $a0, $zero, 55
addiu $a1, $zero, 55
addiu $a2, $zero, 45       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft

addiu $a0, $zero, 105
addiu $a1, $zero, 55
addiu $a2, $zero, 45         
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownLeft



addiu $a0, $zero, 160
addiu $a1, $zero, 55
addiu $a2, $zero, 45       
addiu $a3, $zero, 0x0000FF 
jal drawvertical

addiu $a0, $zero, 160
addiu $a1, $zero, 55
addiu $a2, $zero, 22       
addiu $a3, $zero, 0x0000FF 
jal drawhorizontal


addiu $a0, $zero, 182
addiu $a1, $zero, 55
addiu $a2, $zero, 22       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownLeft


addiu $a0, $zero, 160
addiu $a1, $zero, 100
addiu $a2, $zero, 22       
addiu $a3, $zero, 0x0000FF 
jal drawhorizontal

addiu $a0, $zero, 204
addiu $a1, $zero, 77
addiu $a2, $zero, 23        
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownRight

addiu $a0, $zero, 214
addiu $a1, $zero, 55
addiu $a2, $zero, 20       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownLeft

addiu $a0, $zero, 254
addiu $a1, $zero, 55
addiu $a2, $zero, 21       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownRight


addiu $a0, $zero, 55
addiu $a1, $zero, 55
addiu $a2, $zero, 45       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownRight

#########################################
# circles
#########################################

addiu $a0, $zero, 55
addiu $a1, $zero, 140
addiu $a2, $zero, 30       
addiu $a3, $zero, 0x0000FF 
jal drawhorizontal


addiu $a0, $zero, 85
addiu $a1, $zero, 140
addiu $a2, $zero, 15       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft

addiu $a0, $zero, 100
addiu $a1, $zero, 155
addiu $a2, $zero, 30       
addiu $a3, $zero, 0x0000FF 
jal drawvertical


addiu $a0, $zero, 100
addiu $a1, $zero, 185
addiu $a2, $zero, 15       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownRight


addiu $a0, $zero, 55
addiu $a1, $zero, 200
addiu $a2, $zero, 30       
addiu $a3, $zero, 0x0000FF 
jal drawhorizontal

addiu $a0, $zero, 55
addiu $a1, $zero, 140
addiu $a2, $zero, 15       # length 71
addiu $a3, $zero, 0x0000FF #blue
jal drawDiagonalDownRight


addiu $a0, $zero, 40
addiu $a1, $zero, 155
addiu $a2, $zero, 30       # length 71
addiu $a3, $zero, 0x0000FF #blue
jal drawvertical


addiu $a0, $zero, 40
addiu $a1, $zero, 185
addiu $a2, $zero, 15       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft

##########################
# Inner circle
#########################

addiu $a0, $zero, 59
addiu $a1, $zero, 150
addiu $a2, $zero, 22       
addiu $a3, $zero, 0x00FF00 
jal drawhorizontal

addiu $a0, $zero, 81
addiu $a1, $zero, 150
addiu $a2, $zero, 10       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownLeft



addiu $a0, $zero, 91
addiu $a1, $zero, 160
addiu $a2, $zero, 20       
addiu $a3, $zero, 0x00FF00 
jal drawvertical

addiu $a0, $zero, 91
addiu $a1, $zero, 180
addiu $a2, $zero, 10       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownRight

addiu $a0, $zero, 59
addiu $a1, $zero, 190
addiu $a2, $zero, 23       
addiu $a3, $zero, 0x00FF00 
jal drawhorizontal

addiu $a0, $zero, 59
addiu $a1, $zero, 150
addiu $a2, $zero, 10       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownRight

addiu $a0, $zero, 49
addiu $a1, $zero, 160
addiu $a2, $zero, 20       
addiu $a3, $zero, 0x00FF00 
jal drawvertical

addiu $a0, $zero, 49
addiu $a1, $zero, 180
addiu $a2, $zero, 10       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownLeft


##########################
# Inner-inner circle
#########################

addiu $a0, $zero, 62
addiu $a1, $zero, 155
addiu $a2, $zero, 16       
addiu $a3, $zero, 0x0000FF 
jal drawhorizontal

addiu $a0, $zero, 78
addiu $a1, $zero, 155
addiu $a2, $zero, 7       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft



addiu $a0, $zero, 85
addiu $a1, $zero, 162
addiu $a2, $zero, 15       
addiu $a3, $zero, 0x0000FF 
jal drawvertical

addiu $a0, $zero, 85
addiu $a1, $zero, 177
addiu $a2, $zero, 7       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownRight

addiu $a0, $zero, 62
addiu $a1, $zero, 184
addiu $a2, $zero, 17       
addiu $a3, $zero, 0x0000FF 
jal drawhorizontal

addiu $a0, $zero, 62
addiu $a1, $zero, 155
addiu $a2, $zero, 7       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownRight

addiu $a0, $zero, 55
addiu $a1, $zero, 162
addiu $a2, $zero, 15       
addiu $a3, $zero, 0x0000FF 
jal drawvertical

addiu $a0, $zero, 55
addiu $a1, $zero, 177
addiu $a2, $zero, 7       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft

########################
# zig-zags
########################



addiu $a0, $zero, 140
addiu $a1, $zero, 140
addiu $a2, $zero, 240       
addiu $a3, $zero, 0x00FF00 
jal drawhorizontal

addiu $a0, $zero, 200
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownRight


addiu $a0, $zero, 200
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft

addiu $a0, $zero, 140
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x0000FF 
jal drawvertical

addiu $a0, $zero, 140
addiu $a1, $zero, 200
addiu $a2, $zero, 240       
addiu $a3, $zero, 0x00FF00 
jal drawhorizontal

addiu $a0, $zero, 320
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownRight


addiu $a0, $zero, 320
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x0000FF 
jal drawDiagonalDownLeft

addiu $a0, $zero, 380
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x0000FF 
jal drawvertical


addiu $a0, $zero, 260
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownLeft

addiu $a0, $zero, 260
addiu $a1, $zero, 140
addiu $a2, $zero, 60       
addiu $a3, $zero, 0x00FF00 
jal drawDiagonalDownRight




# do not modify this line; it jumps to the end of the program
j end

# Example procedure to draw some pixels
# 
# void drawpixel(x, y, color)
draw3pixels:
	# Example code for drawing to the screen
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	move $s0, $a2   # save color
	jal addressOfPixel
	sw $s0, 0($v0)
	addiu $v0, $v0, 4
	sw $s0, 0($v0)
	addiu $a0, $v0, 4
	sw $s0, 0($v0)
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

# Helper procedure that gives the screen address
# of the given x, y coordinate
#
# int addressOfPixel(x, y)
addressOfPixel:
	addiu $t0, $zero, WIDTH  # v0 = SCREEN + (x + y*WIDTH)*4
	mul $t1, $t0, $a1
	addu $t2, $a0, $t1
	sll $t2, $t2, 2
	addiu $v0, $t2, SCREEN
	jr $ra

# Draws a horizontal line from (x,y) to (x+length, y) in the given color.
# Color is 24-bit RGB value
#
# void drawhorizontal(x, y, length, color) 
drawhorizontal:
	# YOUR SOLUTION HERE
	
	addiu $sp, $sp, -12
	
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	addiu $s1, $v1, 0
	
	jal addressOfPixel
	move $s0, $v0

	# basecase 
	beq $s1, $a2, basecase
	addiu $a0, $a0, 1
#	addiu $t3, $t3, 1
	
	addiu $s1, $s1, 1
	move $v1, $s1
	sw $a3, 0($s0) 
	jal drawhorizontal



basecase: 
horizontalEnd: 
	li $v1, 0
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra
# Draws a vertical line from (x,y) to (x, y+length) in the given color.
# Color is 24-bit RGB value
#
# void drawvertical(x, y, length, color) 
drawvertical:
	# YOUR SOLUTION HERE
	# YOUR SOLUTION HERE

	addiu $sp, $sp, -12
	
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	addiu $s1, $v1, 0
	
	
	jal addressOfPixel
	move $s0, $v0
	
	# basecase 
	beq $s1, $a2, basecaseVertical
#	addiu $t3, $t3, 1
	
	addiu $s1, $s1, 1
	move $v1, $s1
	addiu $a1, $a1, 1
	sw $a3, 0($s0) 
	jal drawvertical
	
basecaseVertical: 	
verticalEnd:
	li $v1, 0
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra


drawDiagonalDownRight:


	# YOUR SOLUTION HERE
	
	addiu $sp, $sp, -12
	
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	addiu $s1, $v1, 0
	
	jal addressOfPixel
	move $s0, $v0

	# basecase 
	beq $s1, $a2, basecase
	addiu $a0, $a0, -1
	addiu $a1, $a1, 1
#	addiu $t3, $t3, 1
	
	addiu $s1, $s1, 1
	move $v1, $s1
	sw $a3, 0($s0) 
	jal drawDiagonalDownRight

# jr needs to be figured out 

basecaseDiagonal: 
diagonalEnd: 
	li $v1, 0
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra

drawDiagonalDownLeft:


	# YOUR SOLUTION HERE
	
	addiu $sp, $sp, -12
	
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	addiu $s1, $v1, 0
	
	jal addressOfPixel
	move $s0, $v0

	# basecase 
	beq $s1, $a2, basecase
	addiu $a0, $a0, 1
	addiu $a1, $a1, 1
#	addiu $t3, $t3, 1
	
	addiu $s1, $s1, 1
	move $v1, $s1
	sw $a3, 0($s0) 
	jal drawDiagonalDownLeft



basecaseDiagonalL: 
diagonalEndL: 
	li $v1, 0
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra



end:	
