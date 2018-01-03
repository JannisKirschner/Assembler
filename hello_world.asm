;TASM
p8086
model small
dataseg
mymessage DB 'Test!',0
codeseg
startupcode
mov bx, SEG mymessage
mov es, bx
mov si, OFFSET mymessage
mov bx, 0
fetchcharacter:
mov DL, es:[si+bx]
cmp DL, 0
je ending
mov ah, 2
push bx
push si
push es
int 21h
pop es
pop si
pop bx
inc bx
jmp fetchcharacter
ending:
mov ah, 04ch
mov al, 0
int 21h
end
