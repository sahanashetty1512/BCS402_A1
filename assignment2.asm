        AREA SUM_SQUARES, CODE, READONLY
        ENTRY

         LDR     r0, =numbers     ; Load address of numbers into r0
        MOV     r1, #0           ; Initialize loop counter
        MOV     r2, #0           ; Initialize sum to 0

loop
        CMP     r1, #5           ; Check if we've processed 5 numbers
        BEQ     end              ; If yes, exit loop

        LDR     r3, [r0, r1, LSL #2] ; Load numbers[r1] (each number is 4 bytes)
        MUL     r4, r3, r3       ; r4 = r3 * r3 (square the number)
        ADD     r2, r2, r4       ; sum += square
        ADD     r1, r1, #1       ; i++

        B       loop             ; Repeat

end
        LDR     r5, =result      ; Load address of result
        STR     r2, [r5]         ; Store final sum in memory

        B       end              ; Infinite loop to end program

        AREA SUM_DATA, DATA, READWRITE

numbers
        DCD     1, 2, 3, 4, 5     ; Example input numbers

result
        DCD     0                ; Memory location to store result

        END
