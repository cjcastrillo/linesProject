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
lines:
	.byte	0:10
inbuf:
	.space	32
	
	.text
main:

gets:					#Parameters: a0-cstring a1-size
	li		$v0, 8
	la		$a0, inbuf
	li		$a1, 32
	syscall
	jr		$ra

puts:					#Parameters: a0-cstring
	li		$v0, 4
	syscall
	jr		$ra

strlen:					#Parameters: a0-cstring
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

strdup:					#Parameters: a0-cstring
	jr		$ra

malloc:					#Parameters: a0-int
	li		$v0, 9
	addi	$a0, $a0, 3
	srl		$a0, $a0, 2
	sll		$a0, $a0, 2
	syscall
	jr		$ra
