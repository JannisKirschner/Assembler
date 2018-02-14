; addition.asm: Read and sum two numbers. Display the result.
; Made for TASM

 
        .model small
        .stack 256
 
CR equ 13d
LF equ 10d
 
        .data
        prompt1 db 'Enter a number: $'
        prompt2 db CR, LF,'Enter number to add: $'
result db CR, LF, 'Sum: $'
num1 dw ?
num2 dw ? 
 
        .code
start:
        mov ax, @data
        mov ds, ax
 
        mov ax, offset prompt1
        call putsrting  
 
        call getnumber  
        mov num1, ax
        mov ax, offset prompt2
        call putstring  
 
        call getnumber  
 
        mov num2, ax
        mov ax, offset result
        call putstring  
 
        mov ax, num1  
        add ax, num2  
        call putnumber 
 
        mov ax, 4c00h
        int 21h  
getnumber:            
            

 
        push bx        
        push cx
        push dx
 
        mov dx, 1       
        mov bx, 0       
        mov cx, 0       
 
        call getchar      
        cmp al, '-'     
        jne newline      
        mov dx, -1       
    
        call getchar      
newline:
        push dx      
        cmp al, 13      
        je  finish_read    
                    
        sub al, '0'      
        mov cl, al      
        call getchar       
 
read_loop:
        cmp al, 13      
        je finish_read     
 
         sub al, '0'     
         mov bl, al     
         mov ax, 10      
         mul cx      
         mov cx, ax      
         add cx, bx     
         call getchar      
        jmp read_loop
 
finish_read:
        mov ax, cx      
        pop dx       
        cmp dx, 1      
        je  finish_getnumber
        neg ax      
finish_getnumber:
        pop dx
        pop cx
        pop bx
        ret
 
putstring:       
            
        push ax  
        push bx  
        push cx  
        push dx 
 
        mov dx, ax
        mov ah, 9h
        int 21h 
 
        pop dx  
        pop cx  
        pop bx  
        pop ax  
 
        ret
 
putnumber:               
                
                 
                 
    push    bx
    push    cx
    push    dx
 
    mov     dx, 0            
    push    dx         
    mov     cx, 10      
 
    cmp     ax, 0
    jge     calculate_digits     
    neg     ax          
    push    ax         
    mov al, '-'      
    call    putchar
    pop ax           
 
calculate_digits:
    div cx           
                    
    add dx, '0'    
    push    dx           
    mov dx, 0       
    cmp ax, 0           
    jne calculate_digits      
 

 
display_loop:
    pop dx          
    cmp dx, 0           
    je  end_display_loop   
    mov al, dl       
    call    putchar         
    jmp display_loop
 
end_display_loop:
    pop dx           
    pop cx
    pop bx
    ret
 
putchar: 
 
        push ax 
        push bx  
        push cx 
        push dx  
 
        mov dl, al
        mov ah, 2h
        int 21h
 
        pop dx  
        pop cx  
        pop bx  
        pop ax  
        ret
 
 
getchar:    
 
        push bx  
        push cx 
        push dx  
 
        mov ah, 1h
        int 21h
 
        pop dx  
        pop cx  
        pop bx  
        ret
 
        end start
