.global _start

.section .text
_start:
#your code here
	movq (num), %rax
	movb $1, Bool
	testq $3, %rax
	jz _end
	movb $0, Bool
_end:
