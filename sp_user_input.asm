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

	PUSH	AF
	BIT 	1, A 					; z
	CALL 	Z, MOVE_VIEWPORT_LEFT
	POP 	AF

	BIT 	2, A 					; x
	CALL 	Z, MOVE_VIEWPORT_RIGHT

	LD 		BC, $DFFE				; P	O	I	U	Y
	IN 		A, (C)

	BIT 	0, A 					; p
	CALL 	Z, VIEWPORT_BUFFER_FLIP

	RET 							; USER_INPUT

MOVE_VIEWPORT_LEFT:
    LD      A, (VIEWPORT_OFFSET)
    CP      0
    RET     Z                       ; already at most left

    DEC     A
    LD      (VIEWPORT_OFFSET), A

    CALL    SMC_PORT_LEFT

    RET                             ; MOVE_VIEWPORT_LEFT

MOVE_VIEWPORT_RIGHT:
    LD      A, (VIEWPORT_OFFSET)
    CP      16
    RET     Z                       ; already at most right

    INC     A
    LD      (VIEWPORT_OFFSET), A

    CALL    SMC_PORT_RIGHT

    RET                             ; MOVE_VIEWPORT_RIGHT

VIEWPORT_BUFFER_FLIP:
    LD      A, (VIEWPORT_BUFFER)
    XOR     %00000001               ; flip last bit
    LD      (VIEWPORT_BUFFER), A

    RET                             ; VIEWPORT_BUFFER_FLIP

; screen block offset 0-23
; starts at 8 to match sp_stack_render_data.asm defaults
VIEWPORT_OFFSET:
    DEFB    8

; 0 means viewport, otherwise buffer
VIEWPORT_BUFFER:
    DEFB    1