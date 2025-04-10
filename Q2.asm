AREA FIBONACCI, CODE, READONLY
START
    LDR R0, =0x40000000
    MOV R1, #0
    MOV R2, #1
    MOV R5, #0x0A
    STRB R1, [R0]
    STRB R2, [R0, #1]
    ADD R0, R0, #2
LOOP
    ADD R3, R2, R1
    MOV R1, R2
    MOV R2, R3
    STRB R3, [R0]
    ADD R0, R0, #1
    SUB R5, R5, #1
    CMP R5, #0
    BNE LOOP
HERE
    B HERE
    END
