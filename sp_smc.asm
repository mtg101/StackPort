
SMC_PORT_LEFT:
    ; need to clear a col
    LD      A, (VIEWPORT_OFFSET)    ; moving left, clear current offset + 16
    ADD     15
    LD      (STACK_RENDER_BLANK_COL), A

    ; screen attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_ATTRS + 13 + 1   ; +13 to start of instruction, +1 to start of LE addr
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

    ; screen pixels
    LD      B, 192           ; 192 pixel rows
    LD      HL, STACK_RENDER_PIXELS + 13 + 1   ; +13 to start of instruction, +1 to start of LE addr
SMC_PORT_LEFT_PIXEL_LOOP:
    ; load old
    LD      E, (HL)         ; LE address                ; 7 T
    INC     HL                                          ; 6 T
    LD      D, (HL)         ; DE has addr               ; 7 T

    ; dec
    DEC     DE              ; DE moved right            ; 6 T

    ; save new
    LD      (HL), D         ; LE                        ; 7 T
    DEC     HL                                          ; 6 T
    LD      (HL), E         ; saved                     ; 7 T

    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T

    DJNZ    SMC_PORT_LEFT_PIXEL_LOOP                    ; 13 T (8 T)

    ; port needs source
    LD      A, (VIEWPORT_BUFFER)                        ; 13 T
    CP      0                                           ; 7 T
    JP      NZ, SMC_PORT_RIGHT_DONE ; buffer can skip   ; 10 T

    ; source attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_ATTRS + 1   ; +1 to start of LE addr
SMC_PORT_LEFT_ATTR_SOURCE_LOOP:
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

    DJNZ    SMC_PORT_LEFT_ATTR_SOURCE_LOOP             ; 13 T (8 T)

    ; source pixels
    LD      B, 192           ; 192 pixel rows
    LD      HL, STACK_RENDER_PIXELS + 1   ; +1 to start of LE addr
SMC_PORT_LEFT_PIXEL_SOURCE_LOOP:
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

    DJNZ    SMC_PORT_LEFT_PIXEL_SOURCE_LOOP                   ; 13 T (8 T)

SMC_PORT_LEFT_DONE:
    RET                     ; SMC_PORT_LEFT

SMC_PORT_RIGHT:
    ; need to clear a col
    LD      A, (VIEWPORT_OFFSET)    ; moving right, clear current offset
    LD      (STACK_RENDER_BLANK_COL), A

    ; screen attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_ATTRS + 13 + 1   ; +13 to start of instruction, +1 to start of LE addr
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

    ; screen pixels
    LD      B, 192           ; 192 pixel rows
    LD      HL, STACK_RENDER_PIXELS + 13 + 1   ; +13 to start of instruction, +1 to start of LE addr
SMC_PORT_RIGHT_PIXEL_LOOP:
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

    DJNZ    SMC_PORT_RIGHT_PIXEL_LOOP                   ; 13 T (8 T)

    ; port needs source
    LD      A, (VIEWPORT_BUFFER)                        ; 13 T
    CP      0                                           ; 7 T
    JP      NZ, SMC_PORT_RIGHT_DONE ; buffer can skip   ; 10 T

    ; source attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_ATTRS + 1   ; +1 to start of LE addr
SMC_PORT_RIGHT_ATTR_SOURCE_LOOP:
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

    DJNZ    SMC_PORT_RIGHT_ATTR_SOURCE_LOOP             ; 13 T (8 T)

    ; source pixels
    LD      B, 192           ; 192 pixel rows
    LD      HL, STACK_RENDER_PIXELS + 1   ; +1 to start of LE addr
SMC_PORT_RIGHT_PIXEL_SOURCE_LOOP:
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

    DJNZ    SMC_PORT_RIGHT_PIXEL_SOURCE_LOOP                   ; 13 T (8 T)

SMC_PORT_RIGHT_DONE:
    RET                     ; SMC_PORT_RIGHT

SMC_VIEWPORT_BUFFER_SWITCH:
    LD      A, (VIEWPORT_BUFFER)
    CP      0               ; is it viewport?
    PUSH    AF
    CALL    Z, SMC_VIEWPORT
    POP     AF 
    CALL    NZ, SMC_BUFFER 

    RET                     ; SMC_VIEWPORT_BUFFER_SWITCH 

SMC_VIEWPORT:
    ; source attrs
    LD      B, 24           ; 24 attr rows
    LD      DE, IMAGE_ROW_ATTR_0 - 8 ; initial offset 8 
    LD      A, (VIEWPORT_OFFSET)
    LD      H, 0    
    LD      L, a            ; HL has offset image attr
    ADD     HL, DE
    EX      DE, HL          ; DE now has offset image attr
    LD      HL, STACK_RENDER_ATTRS + 1   ; +1 to start of LE addr
SMC_VIEWPORT_ATTR_SOURCE_LOOP:
    ; save new
    LD      (HL), E         ; LE                        ; 7 T
    INC     HL                                          ; 6 T
    LD      (HL), D         ; saved                     ; 7 T

    ; move to next source row - DE + 32
    PUSH    HL              ; remember                  ; 11 T
    LD      HL, 32          ; adding 32                 ; 10 T
    ADD     HL, DE          ; add it                    ; 11 T
    EX      DE, HL          ; back in DE                ; 4 T
    POP     HL              ; restore HL                ; 10 T

    ; move to next to SMC - HL + 26
    DEC     HL                                          ; 6 T
    PUSH    DE
    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T
    POP     DE

    DJNZ    SMC_VIEWPORT_ATTR_SOURCE_LOOP             ; 13 T (8 T)

    ; source pixels
    LD      B, 192           ; 192 pixel rows
    LD      HL, STACK_RENDER_PIXELS + 1   ; +1 to start of LE addr
    LD      DE, IMAGE_OFFSET_LUT    ; base LUT          ;  T
SMC_VIEWPORT_PIXEL_SOURCE_LOOP:
    ; LUT...
    PUSH    DE              ; remember                  ; 11 T
    PUSH    HL              ; remember                  ; 11 T

    EX      DE, HL          ; for (HL)                  ;  T

    LD      E, (HL)         ; LE                        ;  T
    INC     HL
    LD      D, (HL)         ; DE has base value         ;  T

    LD      A, (VIEWPORT_OFFSET)    ; offset...         ;  T
    LD      H, 0                                        ;  T
    LD      L, A            ; HL has offset             ;  T

    ADD     HL, DE                                      ;  T
    EX      DE, HL          ; DE had offset value       ;  T

    POP     HL              ; restore HL                ; 10 T

    ; save new
    LD      (HL), E         ; LE                        ; 7 T
    INC     HL                                          ; 6 T
    LD      (HL), D         ; saved                     ; 7 T

    ; move to next LUT value
    POP     DE              ; get back to LUT value     ;  T
    INC     DE                                          ;  T
    INC     DE              ; 16bit addresses           ;  T

    ; move to next to SMC
    DEC     HL                                          ; 6 T
    PUSH    DE
    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T
    POP     DE

    DJNZ    SMC_VIEWPORT_PIXEL_SOURCE_LOOP                   ; 13 T (8 T)

    RET                     ; SMC_VIEWPORT

SMC_BUFFER:
    ; source attrs
    LD      B, 24           ; 24 attr rows
    LD      HL, STACK_RENDER_ATTRS + 1   ; +1 to start of LE addr
    LD      DE, STACK_RENDER_BUFFER_ATTR_ROW_0
SMC_BUFFER_ATTR_SOURCE_LOOP:
    ; save new
    LD      (HL), E         ; LE                        ; 7 T
    INC     HL                                          ; 6 T
    LD      (HL), D         ; saved                     ; 7 T

    ; move to next source row - DE + 16
    PUSH    HL              ; remember                  ; 11 T
    LD      HL, 16          ; adding 16                 ; 10 T
    ADD     HL, DE          ; add it                    ; 11 T
    EX      DE, HL          ; back in DE                ; 4 T
    POP     HL              ; restore HL                ; 10 T

    ; move to next to SMC - HL + 26
    DEC     HL                                          ; 6 T
    PUSH    DE
    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T
    POP     DE

    DJNZ    SMC_BUFFER_ATTR_SOURCE_LOOP             ; 13 T (8 T)

    ; source pixels
    LD      B, 192           ; 192 pixel rows
    LD      HL, STACK_RENDER_PIXELS + 1   ; +1 to start of LE addr
    LD      DE, STACK_RENDER_BUFFER_PIXEL_ROW_0
SMC_BUFFER_PIXEL_SOURCE_LOOP:
    ; save new
    LD      (HL), E         ; LE                        ; 7 T
    INC     HL                                          ; 6 T
    LD      (HL), D         ; saved                     ; 7 T

    ; move to next source row
    PUSH    HL              ; remember                  ; 11 T
    LD      HL, 16          ; adding 16                 ; 10 T
    ADD     HL, DE          ; add it                    ; 11 T
    EX      DE, HL          ; back in DE                ; 4 T
    POP     HL              ; restore HL                ; 10 T

    ; move to next to SMC
    DEC     HL                                          ; 6 T
    PUSH    DE
    LD      DE, 26          ; next instruction to       ; 10 T
                            ; modify is 26 bytes away
    ADD     HL, DE                                      ; 11 T
    POP     DE

    DJNZ    SMC_BUFFER_PIXEL_SOURCE_LOOP                   ; 13 T (8 T)

    RET                     ; SMC_BUFFER


