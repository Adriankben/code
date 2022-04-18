;add two digits even greater than 9 assembler
;
.model SMALL
.stack  100h

.DATA

    ;db declare byte
    ;10, 13 - new line 
    prompt1 db 10,13,'Enter First Number: $'
    prompt2 db 10,13,'Enter Second Number: $'
    result db  10,13,'Sum : $'

    num1 db ?;FIRST  NUMBER.
    num2 db ?;SECOND NUMBER.
    

.CODE
    START:
       ;AH=9 - output of a string at DS:DX. String must be terminated by '$'. 
       ;AH=1 - read character from standard input,
       ;AH=2 - write character to standard output.
       
        mov ax, @data;get data segment address 
        mov ds, ax;INITIALIZE DATA SEGMENT.
       
       ;DISPLAY MESSAGE FOR FIRST NUMBER.
        mov ah, 09h
        lea dx, prompt1
        int 21h
        
        mov ah,1; input function
        int 21h
	sub al,'0'
        mov num1, al; save the value from input num1 = 1
        
        ;DISPLAY MESSAGE FOR SECOND NUMBER.
        mov ah, 09h
        lea dx, prompt2
        int 21h
        
        mov ah,1; input function
        int 21h
	sub al,'0'
        mov num2, al; save the value from input num2 = 2
        
        ;Addition
        mov al,num1;;move num1 into ax; ax = 1
        add al,num2; dl = dl + num2; dl =3
        
        mov ah,0
        AAA; split it up/ adjust after addition
        
        add al,'0'; add back the 0 so it shows the ascii
        add ah,'0'
        
        mov bx, ax
        
        ;print string
        mov ah, 09h
        lea dx, result
        int 21h
                
        ;print integer
        mov ah,2 ; LOAD FUNCTION 02 print character
        mov dl, bh
        int 21h
        
        ;print integer
        mov ah,2 ; LOAD FUNCTION 02 print character
        mov dl, bl
        int 21h
       
        MOV AH,004ch; message that program has ended
        int 21h
   
    END START