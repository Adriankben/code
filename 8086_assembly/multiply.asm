;multiply two words and display product
;0 - 99
 
.model SMALL
.stack  100h

.DATA

    prompt1 db 10,13,'Enter First Number: $'
    prompt2 db 10,13,'Enter Second Number: $'
    result db  10,13,'Product : $'

    num1 db ?;FIRST  NUMBER 
    num2 db ?;SECOND NUMBER
    quotient db ?; quotient
    remain db ? ;remainder 
    

.CODE
    START:
       mov ax, @data;get data segment address 
       mov ds, ax;INITIALIZE DATA SEGMENT.
       
        ;DISPLAY MESSAGE FOR FIRST NUMBER.
        mov ah, 09h
        mov dx, offset prompt1
        int 21h
        
        mov ah,1; input function
        int 21h
        
        sub al,'0'; ('0' = 30)
        mov num1, al; save the value from input to num1
        
        ;DISPLAY MESSAGE FOR SECOND NUMBER.
        mov ah, 09h
        mov dx, offset prompt2
        int 21h
        
        mov ah,1; input function
        int 21h 
        
        sub al,'0'; ('0' = 30)
        mov num2, al; save the value from input to num2

        ;print string
        mov ah, 09h
        lea dx, result
        int 21h
                 
        ;clear   
        xor ax,ax
        xor bh,bh
        ;Addition
        
        mov al, num1;move num1 into ax; ax = num1
        mul num2; ax = ax * num2;
        mov dx,ax; move ax to dx
        
        ; adjust after multiplication
        aam;- 51 converts to 81        
        ;AH = AL / 10 (80)
        ;AL = remainder  (1)
        
        add al,'0'
        add ah,'0'
        
        mov quotient,ah
        mov remain,al
        
        xor ax,ax            
                                        
        ;print string
        mov ah, 02h
        
        mov dl, quotient
        int 21h
        
        mov dl, remain
        int 21h
        
       
        MOV AH,004ch; message that program has ended
        int 21h
   
    END START