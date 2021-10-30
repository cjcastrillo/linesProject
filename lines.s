#
#	Name:		Carlos Castrillo
#	Project:	3
#	Due:		10/29/2021
#	Course:		cs-2640-02-f21
#
#	Description:
#				Take user input text and output the array constructed
#

	.data
intro:
	.asciiz	"Lines by C.Castrillo\n\n"
prompt:
	.asciiz	"Enter text? "
MAXLINES = 10
LINELEN = 32
lines:
	.word	0:MAXLINES
inbuf:
	.space	LINELEN
	
	.text
main:
	la		$a0, intro
	li		$v0, 4
	syscall
	la		$t0, lines
	addi	$t3, $t0, 40 
addtoarray:
	li		$v0, 4
	la		$a0, prompt
	syscall
	la		$a0, inbuf
	li		$a1, LINELEN
	jal		gets
	lb		$t0, ($v0)
	beqz	$t0, stopaddtoarray
	move	$a0, $v0
	jal		strdup
	move	$t0, $v0
	la		$t1, lines
	add		$t2, $t2, $t1
	sw		$t0, ($t2)
	addi	$t2, $t2, 4
	ble		$t2, $t3, addtoarray
stopaddtoarray:
	move	$a0, $v0
	jal		puts
	li		$v0, 10
	syscall

gets:					#Parameters: a0-cstring a1-size
	li		$v0, 8
	syscall
	move	$v0, $a0
	jr		$ra

puts:					#Parameters: a0-cstring
	li		$v0, 4
	syscall
	jr		$ra

strlen:					#Parameters: a0-cstring
	move	$s0, $zero
	li		$s1, '\0'
while:
	add		$s3, $a0, $s0
	lb		$s2, ($s3)
	beq		$s2, $s1, endwhile
	addi	$s0, $s0, 1
	b		while
endwhile:
	move	$v0, $s0
	jr		$ra

strdup:					#Parameters: a0-cstring
	move	$s7, $a0
	subu	$sp, $sp, 4
	sw		$ra, ($sp)
	jal		strlen
	lw		$ra, ($sp)
	addi	$sp, $sp, 4
	move	$a0, $v0
	addi	$a0, $a0, 1
	subu	$sp, $sp, 4
	sw		$ra, ($sp)
	jal		malloc
	lw		$ra, ($sp)
	addi	$sp, $sp, 4
	move	$s1, $v0
	move	$s2, $zero
	li		$s6, '\0'
dowhile:
	add		$s3, $s2, $s7 
	lb		$s4, ($s3)
	add		$s5, $s2, $s1
	sb		$s4, ($s5)
	addi	$s2, $s2, 1
	beq		$s4, $s6, enddw
	b		dowhile
enddw:
	move	$v0, $s1
	jr		$ra

malloc:					#Parameters: a0-int
	li		$v0, 9
	addi	$a0, $a0, 3
	srl		$a0, $a0, 2
	sll		$a0, $a0, 2
	syscall
	jr		$ra
