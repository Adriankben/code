.model SMALL
.stack  100h

.DATA
    prompt1 db 10,13,'Enter First Number: $'
    prompt2 db 10,13,'Enter Second Number: $'
    result db  10,13,'Product : $'
    num1 db ? ; FIRST NUMBER
    num2 db ? ; SECOND NUMBER
    quotient db ? ; Tens place of the product
    remain db ? ; Ones place of the product

.CODE
START:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; DISPLAY MESSAGE FOR FIRST NUMBER.
    mov ah, 09h
    lea dx, prompt1
    int 21h

    ; Get input for first number
    mov ah, 01h
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov num1, al ; Save first number

    ; DISPLAY MESSAGE FOR SECOND NUMBER.
    mov ah, 09h
    lea dx, prompt2
    int 21h

    ; Get input for second number
    mov ah, 01h
    int 21h
    sub al, '0' ; Convert ASCII to integer
    mov num2, al ; Save second number

    ; Print result prompt
    mov ah, 09h
    lea dx, result
    int 21h

    ; Clear AX, BX registers for multiplication
    xor ax, ax
    xor bx, bx

    ; Multiply the two numbers
    mov al, num1 ; Move num1 into AL
    mov bl, num2 ; Move num2 into BL
    mul bl        ; AX = AL * BL (product in AX)

    ; Extract the tens place and ones place of the result
    mov al, ah    ; Tens place of the result
    add al, '0'   ; Convert to ASCII
    mov quotient, al

    mov al, al    ; Ones place (AL contains the lower byte of AX)
    add al, '0'   ; Convert to ASCII
    mov remain, al

    ; Print the quotient (tens place)
    mov ah, 02h
    mov dl, quotient
    int 21h

    ; Print the remainder (ones place)
    mov dl, remain
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

END START
