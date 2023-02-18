BITS 64
section .text
global _ft_strlen

_ft_strlen:
    xor rax, rax            ; Place tous les bytes de rax à 0
    jmp .loop
.loop:
    cmp BYTE [rdi + rax], 0 ; Regarde rdi (str) à l'index rax (str[rax]) et vérifie si le "\0" est atteint
    jz .exit
    inc rax                 ; Incrémentation
    jmp .loop
.exit:
    ret
