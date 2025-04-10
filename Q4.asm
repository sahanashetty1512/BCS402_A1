AREA prg4, CODE, READONLY
START
    MOV R0, #2
    MOV R1, #2
    MOV R2, #1
CHECK
    CMP R1, R0
    BGE STOP
    MOV R3, R0
    MOV R4, R3
SUBTRACT
    SUB R4, R4, R1
    CMP R4, #0
    BGE SUBTRACT
    CMP R4, #0
    MOVNE R2, #0
    MOVEQ R2, #0
    ADD R1, R1, #1
    CMP R1, R0
    BLT CHECK
STOP
HERE B HERE
      
