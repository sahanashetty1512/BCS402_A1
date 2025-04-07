        AREA FIBONACCI, CODE, READONLY
        ENTRY

        MOV     r0, #0          ; First Fibonacci number
        MOV     r1, #1          ; Second Fibonacci number
        LDR     r4, =fib_array  ; r4 points to output array
        MOV     r5, #10         ; Counter: generate 10 numbers
        MOV     r6, #0          ; Loop index

store_loop
        CMP     r6, #10         ; Check if we've generated 10 numbers
        BEQ     end             ; If yes, exit

        STR     r0, [r4], #4    ; Store r0 into memory, then increment pointer

        ADD     r2, r0, r1      ; r2 = r0 + r1 (next Fibonacci number)
        MOV     r0, r1          ; r0 = r1 (shift)
        MOV     r1, r2          ; r1 = r2 (new term)
        ADD     r6, r6, #1      ; increment index
        B       store_loop      ; repeat loop

end
        B       end             ; Infinite loop to end program

        AREA FIB_DATA, DATA, READWRITE
fib_array
        SPACE   40              ; Reserve space for 10 numbers (10 x 4 bytes)

        END
