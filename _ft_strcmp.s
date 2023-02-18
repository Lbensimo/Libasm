BITS 64

section .text

global _ft_strcmp:

_ft_strcmp:
    xor rcx, rcx
    jmp .loop
.loop:
    movzx rax, BYTE [rdi + rcx]     ; movzx permet de remplir la partie inutilisée du registre avec des '0'
    movzx rdx, BYTE [rsi + rcx]
    cmp rax, rdx                    ; Comparaison entre src[rcx] et dest[rcx]

    ja .greater
    jb .smaller
    
    inc rcx
    cmp rax, 0                      ; Si les deux caractères ne sont pas le '\0' on retourne dans la boucle
    jne .loop
    cmp rdx, 0
    jne .loop
    mov rax, 0
    ret                             ; On vérifie si la fin des chaînes est atteinte
.greater:
    movzx rax, BYTE [rdi + rcx]     ; On remplit rax de la valeur du caractère différend de rdi et en laissant...
    sub rax, rdx                    ; tous les autres bytes à zéro (mov ne fonctionne pas)
    ret
.smaller:
    movzx rax, BYTE [rdi + rcx]
    sub rax, rdx                       ; Idem avec smaller
    ret                             
