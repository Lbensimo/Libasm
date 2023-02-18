BITS 64

section .text
global _ft_read:

_ft_read:
    mov rax, 0
    syscall
    ret