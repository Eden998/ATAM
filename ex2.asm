.global _start

.section .text
_start:
#your code here
	movl $0, %ecx
	movl (num), %ebx
	testl %ebx, %ebx
	js _neg_init
_pos:
	movb source(, %ecx, 1), %al
	movb %al, destination(, %ecx, 1)
	inc %ecx
	cmpl %ecx, %ebx
	jne _pos
	jmp _end

_neg_init:
	imull $-1, %ebx
	decl %ebx

_neg:
	movb source(, %ecx, 1), %al
	movb %al, destination(, %ebx, 1)
	decl %ebx
	incl %ecx
	cmpl $-1, %ebx
	jne _neg
	jmp _end
_end: