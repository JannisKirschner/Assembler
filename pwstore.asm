;TASM
.MODEL small
.STACK 10h
.DATA


prompt       db  "Enter your password (9 Chars):$"
reveal       db  "Your Password is $"
password     db  10 dup(?)
asterisk     db  "*$"
newline      db  13, 10, 24H    


.CODE
start:
    mov     ax, @data
    mov     ds,ax
    lea     dx, prompt
    mov     ah, 9
    int     21h
    mov     cx, 9   
    lea     si, password 
    lea     dx, asterisk 
    
show:
    mov     ah, 7
    int     21h
    mov     byte ptr[si], al
    mov     ah, 9
    int     21h
    inc     si
    dec     cx
    jnz     show 
    mov     byte ptr[si], "$"
    lea     dx, newline
    mov     ah, 9
    int     21h
    lea     dx, reveal
    mov     ah, 9
    int     21h
    lea     dx, password
    mov     ah, 9
    int     21h
    mov     ah, 4ch
    int     21h
    
end start
