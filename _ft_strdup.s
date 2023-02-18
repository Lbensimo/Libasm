BITS 64

section	.text
global	_ft_strdup
extern	malloc
extern  _ft_strlen
extern _ft_strcpy

_ft_strdup:									
	call _ft_strlen
    inc rax
    push rdi					
	mov rdi, rax
    xor rax, rax
	call malloc					
	pop	rdi						
	cmp rax, 0
	jz .err	        
    mov rsi, rdi
    mov rdi, rax
    call _ft_strcpy
    jmp .end
.err:
    xor rax, rax
.end:
    ret