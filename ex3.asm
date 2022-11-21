.global _start

.section .text
_start:
	# Initialization
	movq $0, %rbx # mergedArray Counter
	movq $0, %rcx # array1 Counter
	movq $0, %rdx # array2 Counter
	movq $0, %rdi # last value
	
.LOOP:
	cmpl $0, array1(,%rcx, 4)
	jne .START
	cmpl $0, array2(,%rdx, 4)
	# Stop Condition after both equal zero.
	je .END

.START:
	movl array1(,%rcx, 4), %eax
	cmpl array2(,%rdx, 4), %eax
	jb .SECOND_BIGGER # jumps if array1[index1] < array2[index2]	

.FIRST_BIGGER:
	incq %rcx
	jmp .ADD_TO_MERGED

.SECOND_BIGGER:
	movl array2(,%rdx, 4), %eax
	incq %rdx

.ADD_TO_MERGED:
	cmpl %eax, %edi # checks if current value equal to the previous one.
	je .LOOP
	movl %eax, mergedArray(,%rbx, 4)
	movl %eax, %edi
	inc %rbx
	jmp .LOOP

.END:
	movl $0, mergedArray(,%rbx, 4)

