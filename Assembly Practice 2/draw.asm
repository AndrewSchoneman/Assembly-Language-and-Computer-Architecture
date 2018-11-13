# these are just useful constants set
# to the default parameters of
# the Bitmap Display
# width of screen
.eqv WIDTH 512
# height of screen
.eqv HEIGHT 256
# memory address of pixel (0, 0)
.eqv SCREEN 0x10010000


# draw 3 red pixels in the center of the screen
addiu $a0, $zero, WIDTH    # a0 = WIDTH/2
sra $a0, $a0, 1
addiu $a1, $zero, HEIGHT   # a1 = HEIGHT/2
sra $a1, $a1, 1
addiu $a2, $zero, 0xFF0000  # a2 = red (24-bit RRGGBB)
jal draw3pixels
 
# Draw a green horizontal line of length 144 from (0,0)
addiu $a0, $zero, 0
addiu $a1, $zero, 0
addiu $a2, $zero, 144       # length 144
addiu $a3, $zero, 0x00FF00 #green
jal drawhorizontal

# Draw a blue vertical line of length 71 from (40, 40)
addiu $a0, $zero, 40
addiu $a1, $zero, 40
addiu $a2, $zero, 71       # length 71
addiu $a3, $zero, 0x0000FF #blue
jal drawvertical

# Draw a red square of side length 100 from (80,80)
# Fill in the code to call drawsquare appropriately
# YOUR SOLUTION HERE
addiu $a0, $zero, 80
addiu $a1, $zero, 80
addiu $a2, $zero, 100       # length 100
addiu $a3, $zero, 0xFF0000

jal drawsquare


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




# Draws a square with top left corner at (x,y) and bottom right corner at (x+length, y+length) with the given color
# Color is 24-bit RGB value
#
# void drawsquare(x, y, length, color) 
drawsquare:
	# YOUR SOLUTION HERE
	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)

	add $s2, $a0, $zero
	add $s3, $a1, $zero
	jal drawvertical	 
	jal drawhorizontal


	add $a0, $s2, $zero
	add $a1, $s3, $zero
	jal drawhorizontal
	jal drawvertical 
	lw $ra, 0($sp)
	lw $s2, 4($sp)
	lw $s3, 8($sp)

	
	jr $ra 
	
	# s0 will still have the color value from the draw three pixels program since that color is never reset in the default code. I could fix that but
	# I figured I'd leave it to demonstrate that my code resets any registers that it uses for its functions 

# do not write code beyond this line; it marks the end of the program
end:	
