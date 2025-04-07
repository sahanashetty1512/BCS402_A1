        AREA SWAP_XOR, CODE, READONLY
        ENTRY 

        LDR     r0, =num1        ; Load address of num1
        LDR     r1, =num2        ; Load address of num2

        LDR     r2, [r0]         ; r2 = num1
        LDR     r3, [r1]         ; r3 = num2

        EOR     r2, r2, r3       ; r2 = r2 ^ r3
        EOR     r3, r2, r3       ; r3 = r2 ^ r3 = (r2 ^ r3) ^ r3 = r2
        EOR     r2, r2, r3       ; r2 = r2 ^ r3 = (r2 ^ r3) ^ r2 = r3

        STR     r2, [r0]         ; Store new value in num1
        STR     r3, [r1]         ; Store new value in num2

end
        B       end              ; Infinite loop to end program

        AREA SWAP_DATA, DATA, READWRITE

num1    DCD     15              ; First number
num2    DCD     42              ; Second number

        END
