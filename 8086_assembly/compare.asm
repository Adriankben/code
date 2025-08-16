.model SMALL
.stack  100h

.DATA
    prompt1 db 10,13,'Enter A Number: $'
    prompt2 db 10,13,'Invalid Input. Try again. $'
    prompt3 db 10,13,'Valid Input $'

.CODE
START:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

@INPUT:
    ; Display prompt to enter a number
    lea dx, prompt1
    mov ah, 09h
    int 21h

    ; Get user input
    mov ah, 01h ; Read a character from input
    int 21h

    ; Check if the input is greater than or equal to '0' (ASCII 30h)
    cmp al, '0'
    jb @INVALID

    ; Check if the input is less than or equal to '9' (ASCII 39h)
    cmp al, '9'
    ja @INVALID

@VALID:
    ; Display valid input message
    lea dx, prompt3
    mov ah, 09h
    int 21h
    jmp END

@INVALID:
    ; Display invalid input message
    lea dx, prompt2
    mov ah, 09h
    int 21h

    ; Restart input prompt
    jmp @INPUT

END:
    ; Terminate program
    mov ax, 4C00h
    int 21h

END START
