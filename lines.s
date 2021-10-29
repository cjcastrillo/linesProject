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
MAXLINES:
	.word	10;
LINELEN:
	.word	32;
	
	.text
main:

gets:
	jr		$ra

puts:
	li		$v0, 4
	syscall
	jr		$ra

strlen:
	move	$t0, $zero
	li		$t1, '\0'
while:
	lb		$t2, $t0($a0)
	beq		$t2, $t1, endwhile
	addi	$t0, $t0, 1
	b		while
endwhile:
	move	$v0, $t0
	jr		$ra

strdup:
	jr		$ra

malloc:
	li		$v0, 9
	addi	$a0, $a0, 3
	srl		$a0, $a0, 2
	sll		$a0, $a0, 2
	syscall
	jr		$ra
