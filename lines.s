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

	jr		$ra

strdup:
	jr		$ra

malloc:
	jr		$ra
