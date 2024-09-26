# README: Assembly Language Programs for Character Input/Output and Case Conversion

## 1. Program 1a: Print Single Character on Screen

### Description:
This program prompts the user to enter a character, reads it from the keyboard, and displays it on the screen.

### Code:
```asm
ORG 100h          

MOV AH, 09h       
MOV DX, OFFSET msg_enter_input 
INT 21h           

MOV AH, 01h       
INT 21h           
MOV BL, AL        

MOV AH, 09h       
MOV DX, OFFSET msg_entered_input 
INT 21h           

MOV DL, BL        
MOV AH, 02h       
INT 21h           

MOV AH, 4Ch       
INT 21h           

msg_enter_input DB 'Enter the input: $'          
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' 
END  
```

### Expected Output:
- Displays the prompt "Enter the input:".
- Accepts a single character from the user.
- Displays "The entered input is:" followed by the character entered by the user.
![image](https://github.com/user-attachments/assets/53e55131-887c-420f-b040-31b7681da65e)

---

## 2. Program 1b: Convert Uppercase Letter to Lowercase

### Description:
This program prompts the user to input an uppercase letter, checks if the input is valid, and converts it to lowercase if it is an uppercase letter.

### Code:
```asm
ORG 100h          

MOV DX, OFFSET prompt_message  
MOV AH, 09h        
INT 21h            

MOV AH, 01h        
INT 21h            
MOV DL, AL         

CMP AL, 'A'        
JL NotUpperCase    
CMP AL, 'Z'        
JG NotUpperCase    

ADD AL, 20h        
MOV BL, AL         

MOV DX, OFFSET output_message  
MOV AH, 09h        
INT 21h            
MOV AL, BL         

MOV DL, AL         
MOV AH, 02h        
INT 21h            
JMP EndProgram     

NotUpperCase:
MOV DX, OFFSET error_message  
MOV AH, 09h        
INT 21h            

EndProgram:
MOV AH, 4Ch        
INT 21h            

prompt_message  DB 'Input an uppercase letter: $'
output_message  DB 0Dh, 0Ah, 'Lowercase version is: $'  
error_message   DB 0Dh, 0Ah, 'Error: Input is not an uppercase letter! $'  

END
```

### Expected Output:
- If the input is a valid uppercase letter (A-Z), the program displays the lowercase equivalent.
- If the input is not an uppercase letter, an error message is displayed: "Error: Input is not an uppercase letter!"
![image](https://github.com/user-attachments/assets/a7b4f975-556b-4727-8e3a-2b9ac9ae3d3c)

---

## 3. Program 2a: Print Multiple Characters on Screen

### Description:
This program prompts the user to enter multiple characters and prints them back on the screen.

### Code:
```asm
ORG 100h          

MOV AH, 09h       
MOV DX, OFFSET msg_enter_input 
INT 21h           

MOV AH, 0Ah       
MOV DX, OFFSET input_buffer  
INT 21h           

MOV AL, '$'            
LEA DI, input_buffer+2 
MOV CL, [input_buffer+1] 
ADD DI, CX             
MOV [DI], AL           

MOV AH, 09h       
MOV DX, OFFSET msg_entered_input 
INT 21h           

LEA DX, input_buffer+2  
MOV AH, 09h             
INT 21h                

MOV AH, 4Ch       
INT 21h           

msg_enter_input DB 'Enter the input: $'          
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' 
input_buffer DB 10, 0   
END         
```

### Expected Output:
- Prompts the user to enter up to 10 characters.
- Prints "The entered input is:" followed by the characters entered by the user.
![image](https://github.com/user-attachments/assets/be797e9e-32ad-4fef-91d4-cba83602467d)

---

## 4. Program 2b: Convert Lowercase Letter to Uppercase

### Description:
This program prompts the user to input a lowercase letter, checks if the input is valid, and converts it to uppercase if it is a lowercase letter.

### Code:
```asm
ORG 100h          

MOV DX, OFFSET msg_input  
MOV AH, 09h        
INT 21h            

MOV AH, 01h        
INT 21h            
MOV DL, AL         

CMP AL, 'a'        
JL NotLowerCase    
CMP AL, 'z'        
JG NotLowerCase    

SUB AL, 20h        
MOV BL, AL         

MOV DX, OFFSET msg_output  
MOV AH, 09h        
INT 21h            
MOV AL, BL         

MOV DL, AL         
MOV AH, 02h        
INT 21h            
JMP EndProgram     

NotLowerCase:
MOV DX, OFFSET msg_error  
MOV AH, 09h        
INT 21h            

EndProgram:
MOV AH, 4Ch        
INT 21h            

msg_input  DB 'Enter a lowercase letter: $'
msg_output DB 0Dh, 0Ah, 'The uppercase letter is: $'  
msg_error  DB 0Dh, 0Ah, 'Error: Not a lowercase letter! $'  

END
```

### Expected Output:
- If the input is a valid lowercase letter (a-z), the program displays the uppercase equivalent.
- If the input is not a lowercase letter, an error message is displayed: "Error: Not a lowercase letter!"
![image](https://github.com/user-attachments/assets/dd23645f-6c28-4302-8dca-945aa48c2e49)

---

## Instructions for Running the Programs:
1. Assemble the program using an assembler like **TASM** or **EMU8086**.
2. Link the object file to create an executable.
3. Run the executable in DOS or an emulator.

Each program is designed to demonstrate basic character I/O in assembly and simple case conversion logic using DOS interrupts (`INT 21h`).
