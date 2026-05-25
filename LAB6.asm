AREA ONEZERO, CODE, READONLY
        ENTRY
START
        MOV  R0, #0
        MOV  R3, #0
        MOV  R7, #7
        LDR  R6, =VALUE

LOOP
        MOV  R1, #32
        LDR  R0, [R6], #4

LOOP1
        MOVS R0, R0, ROR #1
        BHI  ONES

ZEROS   ADD  R3, R3, #1
        B    LOOP2

ONES    ADD  R2, R2, #1

LOOP2   SUBS R1, R1, #1
        BNE  LOOP1
        SUBS R7, R7, #1
        BNE  LOOP
        NOP
        NOP

JMP     B    JMP

VALUE   DCD  0x11111111, 0xAABBAABB
        END
