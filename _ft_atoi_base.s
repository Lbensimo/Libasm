BITS 64

section .text
global _ft_atoi_base:
extern _ft_strlen

_ft_atoi_base:
    jmp check_base

Heart:
    push rax                            
    mov al, BYTE [rdi + rcx]        ; Ici : rcx = position dans str, rbx = nombre de '-', rdi = str, rsi = base, al ~= str[rcx], r8 = len(base) 
.index_base:                        ; Place dans rdx l'index du caractère al dans la base (rsi)
    xor rdx, rdx
.loop_IB:
    cmp BYTE [rsi + rdx], 0         ; Si le caractère est '\0' on quitte la boucle algorithmique
    jz end
    cmp BYTE [rsi + rdx], al
    jz .algo
    inc rdx
    jmp .loop_IB   
.algo:
    pop rax
    imul rax, r8
    add rax, rdx
    inc rcx
    jmp Heart

end:
    pop rax
    test rbx, 1
    jnz .negative
    jmp .final
.negative:
    neg rax
.final:
    ret

check_base:                                     ; Renvoie la taille de la base et vérifie sa validité (base = rsi)
    xor rcx, rcx
    xor rbx, rbx
.loop_check:                                       
    cmp BYTE [rsi + rcx], 0                     ; Vérifie si on a atteint la fin de la chaîne
    jz .ret_check
    call _ft_strlen                             ; Si i < len(base) - 1 : i2 = i + 1
    sub rax, 1                                  ; Le but de ces lignes est de tester les doublons avec i2
    cmp rcx, rax                                ; Mais de ne pas placer i2 en dehors de la base
    jae .loop_double
.inc_rbx:
    mov rbx, rcx
    inc rbx
.loop_double:
    cmp BYTE [rsi + rbx], 0
    jz .check_char
    mov al, BYTE [rsi + rcx]
    cmp BYTE [rsi + rbx], al
    jz err
    inc rbx
    jmp .loop_double
.check_char:                                    ; Vérification des caractères '\f', '\n', '\t', '\v', '\r', ' ', '+', '-'
    cmp BYTE [rsi + rcx], 9
    jz err
    cmp BYTE [rsi + rcx], 10
    jz err
    cmp BYTE [rsi + rcx], 11
    jz err
    cmp BYTE [rsi + rcx], 12
    jz err
    cmp BYTE [rsi + rcx], 13
    jz err
    cmp BYTE [rsi + rcx], 32
    jz err
    cmp BYTE [rsi + rcx], 43
    jz err
    cmp BYTE [rsi + rcx], 45
    jz err
    inc rcx
    jmp .loop_check
.ret_check:
    cmp rcx, 2
    jb err
    mov r8, rcx
    xor rcx, rcx
    xor rbx, rbx
    xor rax, rax

skip:                                           ; Fait avancer l'index dans la str jusqu'au premier char
    cmp BYTE [rdi + rcx], 9
    jz .inc_skip
    cmp BYTE [rdi + rcx], 10
    jz .inc_skip
    cmp BYTE [rdi + rcx], 11
    jz .inc_skip
    cmp BYTE [rdi + rcx], 12
    jz .inc_skip
    cmp BYTE [rdi + rcx], 13
    jz .inc_skip
    cmp BYTE [rdi + rcx], 32
    jz .inc_skip
    jmp is_negative
.inc_skip:
    inc rcx
    jmp skip

is_negative:                                    ; Vérifie si le int doit être négatif en comptant les '-' 
    xor rax, rax
    cmp BYTE [rdi + rcx], 43
    jz .loop_IN
    cmp BYTE [rdi + rcx], 45
    jz .loop_IN
    jmp Heart
.loop_IN:
    cmp BYTE [rdi + rcx], 45
    jz .neg_inc
    inc rcx
    jmp is_negative
.neg_inc:
    inc rbx
    inc rcx
    jmp is_negative

err:                                            ; Renvoie 0 en cas d'appel
    mov rax, 0
    ret
