BITS 64

section .text
global _ft_write:

_ft_write:      ; rdi, rsi, rdx sont envoyés en paramètre, reste à donner l'id de sys_write à rax
    mov rax, 1
    syscall
    ret
    
