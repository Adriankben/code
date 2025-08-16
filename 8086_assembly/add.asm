.model SMALL
.stack  100h

.DATA

    prompt1 db 10,13,'Enter First Number: $'
    prompt2 db 10,13,'Enter Second Number: $'
    result db  10,13,'Sum: $'

    num1 db ? ; FIRST NUMBER
    num2 db ? ; SECOND NUMBER
    sum db ?  ; Store result

.CODE
START:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; DISPLAY MESSAGE FOR FIRST NUMBER.
    mov ah, 09h
    lea dx, prompt1
    int 21h

    ; Get first number input
    mov ah, 01h
    int 21h
    sub al, '0'   ; Convert ASCII to integer
    mov num1, al  ; Save first number

    ; DISPLAY MESSAGE FOR SECOND NUMBER.
    mov ah, 09h
    lea dx, prompt2
    int 21h

    ; Get second number input
    mov ah, 01h
    int 21h
    sub al, '0'   ; Convert ASCII to integer
    mov num2, al  ; Save second number

    ; Addition
    mov al, num1      ; Load num1 into AL
    add al, num2      ; Add num2 to AL

    ; Handle carry (if sum > 9)
    mov ah, 0         ; Clear AH
    aaa               ; ASCII adjust after addition

    ; Store the result in sum
    mov sum, al       ; Store the result of AL (with adjustment)

    ; DISPLAY RESULT MESSAGE
    mov ah, 09h
    lea dx, result
    int 21h

    ; Convert sum to ASCII and display
    mov al, sum       ; Load result (sum)
    add al, '0'       ; Convert to ASCII
    mov dl, al        ; Move result to DL for printing
    mov ah, 02h
    int 21h           ; Print the first digit

    ; If the result is more than 9 (two digits), print second digit
    mov al, ah        ; Move the second digit (in AH) to AL
    add al, '0'       ; Convert to ASCII
    mov dl, al
    mov ah, 02h
    int 21h           ; Print second digit (if any)

    ; End of program
    mov ah, 4Ch
    int 21h
END START
