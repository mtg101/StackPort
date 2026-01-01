
SMC_PORT_LEFT:
    LD      A, (VIEWPORT_BUFFER)
    CP      0
    RET     Z               ; only doing buffer for now

    ; attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_BUFFER_ATTRS + 13 + 1   ; +13 to start of instruction, +1 to start of LE addr
SMC_PORT_LEFT_ATTR_LOOP:
    ; load old
    LD      E, (HL)         ; LE address                ; 7 T
    INC     HL                                          ; 6 T
    LD      D, (HL)         ; DE has addr               ; 7 T

    ; dec
    DEC     DE              ; DE moved left             ; 6 T

    ; save new
    LD      (HL), D         ; LE                        ; 7 T
    DEC     HL                                          ; 6 T
    LD      (HL), E         ; saved                     ; 7 T

    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T

    DJNZ    SMC_PORT_LEFT_ATTR_LOOP                     ; 13 T (8 T)

    RET                     ; SMC_PORT_LEFT

SMC_PORT_RIGHT:
    LD      A, (VIEWPORT_BUFFER)
    CP      0
    RET     Z               ; only doing buffer for now

    ; attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_BUFFER_ATTRS + 13 + 1   ; +13 to start of instruction, +1 to start of LE addr
SMC_PORT_RIGHT_ATTR_LOOP:
    ; load old
    LD      E, (HL)         ; LE address                ; 7 T
    INC     HL                                          ; 6 T
    LD      D, (HL)         ; DE has addr               ; 7 T

    ; inc
    INC     DE              ; DE moved right            ; 6 T

    ; save new
    LD      (HL), D         ; LE                        ; 7 T
    DEC     HL                                          ; 6 T
    LD      (HL), E         ; saved                     ; 7 T

    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T

    DJNZ    SMC_PORT_RIGHT_ATTR_LOOP                    ; 13 T (8 T)

    RET                     ; SMC_PORT_RIGHT





