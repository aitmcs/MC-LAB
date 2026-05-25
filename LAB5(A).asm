AREA LARGEST, CODE, READONLY
        ENTRY
START
        MOV   R5, #6
        LDR   R1, =VALUE
        LDR   R2, [R1], #4

LOOP
        LDR   R4, [R1], #4
        CMP   R2, R4
        BHT   LOOP1
        MOV   R2, R4

LOOP1
        SUBS  R5, R5, #1
        CMP   R5, #0
        BNE   LOOP
        LDR   R4, =RESULT
        STR   R2, [R4]
        NOP

BACK    B     BACK

VALUE   DCD   0x44444444, 0x99999999
        DCD   0x22222222, 0x88888888
        DCD   0xAAAAAAAA
        DCD   0x33333333
        DCD   0x55555555

        AREA  DATA2, DATA, READWRITE
RESULT  DCD   0x0
        END
