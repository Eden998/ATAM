.global _start

.section .text
_start:
	# %rbx - curr_node address 
	# %rcx - new_node value
	# %rdx - temp for curr_node value

	movq (root), %rbx
	testq %rbx, %rbx
	jz _load_node_root_HW1

	movq (new_node), %rcx 

_loop_HW1:
	movq (%rbx), %rdx
	cmpq %rdx, %rcx
	je _end_HW1
	jg _go_right_HW1

_go_left_HW1:
	movq 8(%rbx), %rdi
	testq %rdi, %rdi
	jz _load_node_left_HW1
	movq %rdi, %rbx
	jmp _loop_HW1

_go_right_HW1:
	movq 16(%rbx), %rdi
	testq %rdi, %rdi
	jz _load_node_right_HW1
	movq %rdi, %rbx
	jmp _loop_HW1
	
_load_node_root_HW1:
	movq $new_node, (root)
	jmp _end_HW1
_load_node_left_HW1:
	movq $new_node, 8(%rbx)
	jmp _end_HW1
_load_node_right_HW1:
	movq $new_node, 16(%rbx)
_end_HW1:
    