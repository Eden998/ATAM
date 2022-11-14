.global _start

.section .text
_start:
#your code here
	movl (num), %ecx
	js _neg
	movl $0, %ecx
_pos:
	movb source(, %ecx, 1), %al
	movb %al, destination(, %ecx, 1)
	inc %ecx
	cmpl %ecx, num
	jne _pos
	jmp _end
_neg:



_end: