; Address (Hex)	Binary (High Byte)	Bit 0	Bit 1	Bit 2	Bit 3	Bit 4
; $FEFE	1111 1110	SHIFT	Z	X	C	V
; $FDFE	1111 1101	A	S	D	F	G
; $FBFE	1111 1011	Q	W	E	R	T
; $F7FE	1111 0111	1	2	3	4	5
; $EFFE	1110 1111	0	9	8	7	6
; $DFFE	1101 1111	P	O	I	U	Y
; $BFFE	1011 1111	ENTER	L	K	J	H
; $7FFE	0111 1111	SPACE	SYM	M	N	B
USER_INPUT:
	LD 		BC, $FEFE				; SHIFT	Z	X	C	V
	IN 		A, (C)

	BIT 	1, A 					; z
	PUSH	AF
	CALL 	Z, MOVE_VIEWPORT_LEFT
	POP 	AF
    RET     Z                       ; single action per frame

	BIT 	2, A 					; x
	PUSH	AF
	CALL 	Z, MOVE_VIEWPORT_RIGHT
	POP 	AF
    RET     Z                       ; single action per frame

	LD 		BC, $DFFE				; P	O	I	U	Y
	IN 		A, (C)

	BIT 	0, A 					; p
    PUSH    AF
	CALL 	Z, VIEWPORT_BUFFER_FLIP
    POP     AF 
    RET     Z                       ; single action per frame

	BIT 	1, A 					; o
    PUSH    AF
	CALL 	Z, SET_VIEWPORT
    POP     AF 
    RET     Z                       ; single action per frame

	LD 		BC, $BFFE				; ENTER	L	K	J	H
	IN 		A, (C)

	BIT 	2, A 					; k
    PUSH    AF
	CALL 	Z, SET_BUFFER
    POP     AF 
    RET     Z                       ; single action per frame


	RET 							; USER_INPUT

MOVE_VIEWPORT_LEFT:
    LD      A, (VIEWPORT_OFFSET)
    CP      0
    RET     Z                       ; already at most left

    CALL    SMC_PORT_LEFT

    LD      A, (VIEWPORT_OFFSET)
    DEC     A
    LD      (VIEWPORT_OFFSET), A

    RET                             ; MOVE_VIEWPORT_LEFT

MOVE_VIEWPORT_RIGHT:
    LD      A, (VIEWPORT_OFFSET)
    CP      16
    RET     Z                       ; already at most right

    CALL    SMC_PORT_RIGHT

    LD      A, (VIEWPORT_OFFSET)
    INC     A
    LD      (VIEWPORT_OFFSET), A

    RET                             ; MOVE_VIEWPORT_RIGHT

SET_VIEWPORT:
    LD      A, (VIEWPORT_BUFFER)
    CP      0
    RET     Z                       ; already viewport

    LD      A, 0                    ; set viewport
    LD      (VIEWPORT_BUFFER), A

    CALL    SMC_VIEWPORT

    RET                             ; SET_VIEWPORT

SET_BUFFER:
    LD      A, (VIEWPORT_BUFFER)
    CP      1
    RET     Z                       ; already buffer

    LD      A, 1                    ; set bufffer
    LD      (VIEWPORT_BUFFER), A

    CALL    SMC_BUFFER

    RET                             ; SET_BUFFER

VIEWPORT_BUFFER_FLIP:
    LD      A, (VIEWPORT_BUFFER)
    XOR     %00000001               ; flip last bit
    LD      (VIEWPORT_BUFFER), A

    CALL    SMC_VIEWPORT_BUFFER_SWITCH

    RET                             ; VIEWPORT_BUFFER_FLIP

; screen block offset 0-23
; starts at 8 to match sp_stack_render_data.asm defaults
VIEWPORT_OFFSET:
    DEFB    8

; 0 means viewport, otherwise buffer
VIEWPORT_BUFFER:
    DEFB    0