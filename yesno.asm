;TASM
.MODEL SMALL
.STACK 100h
.DATA

AssemblyPrompt  DB 'Do you know Assembly (Y/N)?$'
YesMsg  DB 13,10,'That is great to here!',13,10,'$'
NoMsg  DB 13,10,'Time to learn it!',13,10,'$'
ErrMsg  DB 13,10,'Oooooopsie thats an error!',13,10,'$'


.CODE
start:
mov ax,@data                     
    mov ds,ax                        ;points DS to the data segment
    mov dx, OFFSET AssemblyPrompt    ;points to prompt
    mov ah, 9                        ;DOS: print string
    int 21h                          ;display prompt
    mov ah, 1                        ;DOS: get character
    int 21h                          ;get single-char response
    or al,20h                        ;force char to lowercase

    cmp al,'y'                       ;compare instructions
    je IsYesOption
    cmp al,'n'
    je IsNoOption

    mov dx, OFFSET ErrMsg            ;default 
    jmp DisplayMsg



IsYesOption:
    mov dx, OFFSET YesMsg 
    jmp DisplayMsg


IsNoOption:
    mov dx,OFFSET NoMsg


DisplayMsg:
    mov ah,9                          ;DOS: print string
    int 21h                           ;display message
    mov ah,4ch                        ;DOS: terminate program
    mov al,0                          ;return code = 0
    int 21h                           ;terminates the program

END start
