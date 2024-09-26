ORG 100h           ; Program starts at 100h (COM file format)

; Display the prompt "Input an uppercase letter: "
MOV DX, OFFSET prompt_message  ; Load the address of the prompt message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the prompt

; Read a character from the keyboard
MOV AH, 01h        ; Function 01h of INT 21h reads a single character
INT 21h            ; Invoke DOS interrupt to get the input character
MOV DL, AL         ; Save the input character in AL

; Verify if the input is an uppercase letter (A-Z)
CMP AL, 'A'        ; Compare AL with 'A'
JL NotUpperCase    ; If less than 'A', it's not an uppercase letter
CMP AL, 'Z'        ; Compare AL with 'Z'
JG NotUpperCase    ; If greater than 'Z', it's not an uppercase letter

; Convert the input to a lowercase letter
ADD AL, 20h        ; Add 32 (20h) to convert the letter to lowercase
MOV BL, AL         ; Store the lowercase letter in BL

; Display the message "Lowercase version is: "
MOV DX, OFFSET output_message  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h to display a string
INT 21h            ; Call DOS interrupt to print the message
MOV AL, BL         ; Retrieve the lowercase letter from BL

; Output the lowercase letter
MOV DL, AL         ; Move the lowercase letter into DL for output
MOV AH, 02h        ; Function 02h of INT 21h to print a single character
INT 21h            ; Call DOS interrupt to print the character
JMP EndProgram     ; Jump to the end of the program

NotUpperCase:
; If input is not an uppercase letter, show an error message
MOV DX, OFFSET error_message  ; Load the address of the error message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the error message

EndProgram:
; End the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

prompt_message  DB 'Input an uppercase letter: $'
output_message  DB 0Dh, 0Ah, 'Lowercase version is: $'  ; Output message
error_message   DB 0Dh, 0Ah, 'Error: Input is not an uppercase letter! $'  ; Error message

END                ; End of the program
