;IF ELSE

;RESTRICT INPUT TO NUMBERS 

;take input from user
;compares if input is less than or equal to '9' (ASCII 40)

;if yes, continue to check if it is greater than or equal to '0' (ASCII 30)
;if no, print invalid and go to start of program

;if less than 30 print invalid and go to start of program
;if valid jump to end label, which closes program 

.model SMALL
.stack  100h

.DATA 
    prompt1 db 10,13,'Enter A Number: $'
    prompt2 db 10,13,'Invalid Input. Try again. $'
    prompt3 db  10,13,'Valid Input $'

.CODE
    START:
        mov ax, @data;get data segment address 
        mov ds, ax;INITIALIZE DATA SEGMENT. 
        
        @INPUT:
       ;DISPLAY MESSAGE FOR FIRST NUMBER.
        LEA dx, prompt1
        mov ah, 09h 
        int 21h
        
        mov ah,1; input function
        int 21h
        
        cmp al, '9'
        jbe @CHECK
        ja @INVALID
        
        
        @CHECK: 
        cmp al, '0'
        jae @VALID
        jb @INVALID
        
        
        @INVALID:
        
       ;DISPLAY MESSAGE FOR FIRST NUMBER.
        LEA dx, prompt2
        mov ah, 09h 
        int 21h
               
        JMP @INPUT
        
        
        @VALID:
        LEA dx, prompt3
        mov ah, 09h 
        int 21h
        
        JMP END
        
             
        END:
        MOV AX,4c00h; message that program has ended
        int 21h
    
    
    END START