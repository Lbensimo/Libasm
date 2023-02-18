BITS 64

section .text

global _ft_strcpy:

_ft_strcpy:                  
    xor rcx, rcx
    jmp .loop
.loop:
    cmp BYTE [rsi + rcx], 0         ; Vérifier qu'on a pas atteint la fin de src via le '\0'
    jz .exit
    mov dl, BYTE[rsi + rcx]            ; On place le caractère src[rcx] dans rax
    mov BYTE [rdi + rcx], dl            ; On place le caractère rax dans dest[rcx]
    inc rcx
    jmp .loop
.exit:
    mov dl, BYTE [rsi + rcx]            ; On copie aussi le '\0'
    mov BYTE [rdi + rcx], dl 
    mov rax, rdi
    ret
