AREA SUM, CODE, READONLY
START
ENTRY
        MOV  R1, #10
        MOV  R2, #0

LOOP    ADD  R0, R1, R2
        SUBS R1, R1, #1
        BNE  LOOP

BACK    B    BACK
        NOP
        END
