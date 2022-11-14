.global _start

.section .text
_start:
	# Initialization
	movq $0, %rbx # mergedArray Counter
	movq $0, %rcx # array1 Counter
	movq $0, %rdx # array2 Counter
	
.LOOP:

	
	cmpl $0, array1(,%rcx, 4)
	jne .START
	cmpl $0, array2(,%rdx, 4)
	# Stop Condition after both equal zero.
	je .END

.START:
	movl array1(,%rcx, 4), %eax
	cmpl array2(,%rdx, 4), %eax
	ja .SECOND_BIGGER # jumps if array1[index1] < array2[index2]	

.FIRST_BIGGER:
	inc %rcx
	ja .ADD_TO_MERGED

.SECOND_BIGGER:
	inc %rdx
	movl array2(,%rdx, 4), %eax

.ADD_TO_MERGED:
	movl %eax, mergedArray(,%rbx, 4)
	inc %rbx
	jmp .LOOP

.END:
	movl $0, mergedArray(,%rbx, 4)

