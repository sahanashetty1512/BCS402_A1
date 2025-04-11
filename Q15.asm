	AREA pgr15,CODE,READONLY
        ENTRY

        

        LDR     r0, =7             
        LDR     r1, =ARRAY         
        MOV     r2, #0             
        MOV     r3, #7             

LOOP    CMP     r2, r3              
        BGT     NOT_FOUND

        ADD     r4, r2, r3
        MOV     r5, r4, LSR #1      

        LDR     r6, [r1, r5, LSL #2] 

        CMP     r0, r6
        BEQ     FOUND

        BLT     GO_LEFT

        
        ADD     r2, r5, #1
        B       LOOP

GO_LEFT
       
        SUB     r3, r5, #1
        B       LOOP

FOUND
        
        B       DONE

NOT_FOUND
        
        MOV     r5, #-1

DONE
        B DONE                   

       
        AREA Q15_DATA, DATA, READWRITE
ARRAY   DCD 1, 3, 5, 7, 9, 11, 13, 15  

        END
