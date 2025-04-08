        AREA PRIME_CHECK, CODE, READONLY
ENTRY
        LDR     r0, =num         ; Load the address of the number
        LDR     r1, [r0]         ; Load the number into r1 (n)
        MOV     r2, #2           ; Start divisor from 2
        MOV     r3, #0           ; Flag: 0 means prime, 1 means not prime

        CMP     r1, #2
        BLT     not_prime        ; If number < 2, it's not prime

loop
        MOV     r4, r1
        MOV     r5, r2

        MOV     r6, #0           ; Clear quotient (r6)
div_loop
        CMP     r4, r5           ; Compare r4 (remainder) with r5 (divisor)
        BLT     done_div         ; If r4 < r5, division is done
        SUB     r4, r4, r5       ; r4 = r4 - r5
        ADD     r6, r6, #1       ; Increment quotient (r6)
        B       div_loop         ; Repeat until remainder is less than divisor

done_div
        MUL     r7, r6, r2       ; r7 = (quotient) * divisor
        CMP     r7, r1
        BEQ     not_prime        ; If divisible, it's not prime

        ADD     r2, r2, #1       ; divisor++
        CMP     r2, r1
        BLT     loop             ; Continue if divisor < number

        B       is_prime         ; If no divisors found, it's prime

not_prime
        MOV     r3, #1           ; Set flag to 1 (not prime)

is_prime
        LDR     r8, =result
        STR     r3, [r8]         ; Store result: 0 = prime, 1 = not prime

end
        B       end              ; Infinite loop to end program

        AREA DATA_SECTION, DATA, READWRITE

num     DCD     29              ; Change this to test other numbers
result  DCD     0               ; Will hold the result

        END