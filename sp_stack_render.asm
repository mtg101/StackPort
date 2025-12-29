
	INCLUDE 	"sp_stack_render_data.asm"

FAKE_PLACEHOLDER:
	DEFW		0

STACK_RENDER:														; 17 T (call)
	; push any registers we need to preserve...
	; none for now

	; preserve SP
	LD 			(STACK_POINTER_BACKUP), SP							; 20 T

	; loop setup
	LD 			B, 192												; 7 T

; blit a row
STACK_RENDER_ROW:
	; screen address end of row +1 (PUSH pre drcrements)
	LD			L, B												; 4 T
    LD 			H, 0												; 7 T
    ADD 		HL, HL      ; 2 byte adresses						; 11 T
    LD 			DE, SCREEN_LUT ; DE = Base of table					; 10
    ADD 		HL, DE      ; HL points to screen addr				; 11 T
    
    LD 			A, (HL)       ; Get Low Byte of address				; 7 T
    INC 		HL													; 6 T
    LD 			H, (HL)      ; Get High Byte of address				; 7 T
    LD 			L, A												; 4 T
    
    LD 			(STACK_SCREEN_PTR), HL ; save it					; 16 T 
																	; = 83 T to get screen address

	; .scr/image address
	LD 			(STACK_IMAGE_PTR), 									; 16 T
																	; ??? T to get image addr


	; actual blit...

	; set SP to start of source row
	LD 			SP, FAKE_PLACEHOLDER								; 20 T

	; pop from source to registers
	POP 		AF 													; 10 T
	POP 		BC 													; 10 T
	POP 		DE 													; 10 T
	POP 		HL													; 10 T

	; flip to shadow registers
	EXX 															; 4 T
	EX AF															; 4 T

	; pop from source to shadow registers
	POP 		AF 													; 10 T
	POP 		BC 													; 10 T
	POP 		DE 													; 10 T
	POP 		HL													; 10 T

	LD  		SP, FAKE_PLACEHOLDER								; 20 T

	; push from shadow registers to screen
	PUSH 		HL 													; 11 T
	PUSH 		DE 													; 11 T
	PUSH 		BC 													; 11 T
	PUSH 		AF 													; 11 T

	; flip back to regular registers
	EXX 															; 4 T
	EX AF															; 4 T

	; push from registers to screen
	PUSH 		HL 													; 11 T
	PUSH 		DE 													; 11 T
	PUSH 		BC 													; 11 T
	PUSH 		AF 													; 11 T

																	; 224 =  T for actual blit

	DJNZ		STACK_RENDER_ROW									; 13 T (8 on last but meh)


	; restore SP
	LD 			SP, (STACK_POINTER_BACKUP)							; 20 T

	; pop any registers we need to restore...
	; none for now
	RET								; STACK_RENDER					; 10 T

; main overhead
	; 17 call
	; 20 save SP
	; 20 restore SP
	; 10 ret
	; = 67 T overhead

; per row all hard coded
; (doesn't do the LUT stuff, just buffer row to screen row hard coded)
	; 20 set SP
	; 40 pop
	; 8 shadow
	; 40 pop
	; 20 set SP
	; 44 push
	; 8 shadow
	; 44 push
	; = 224 T
	;
	; erm lol - that's a scanline :)
	;
	; floating bus racing the beam: 120 scanlines...
	; so 120 rows of 16col stack blitting without contention / racing
	; 15/24 blocks filled from the top
	; 
	; floating bus lower screen
	; extra 96 scanlines = 216
	; time for all of lower half to be blitted (2 blits per whole row)
	;
	; HALT & chase
	; at 224 T per stack blit, we can't catch up if we render from the top
	; but... can if we only do lower screen

; per row with the extras...
	; calc screen ptr: 83
	; cal image ptr: ???
	; actual blit: 224
	; loop overhead... 13 T per DJNZ (ignore the 8 T on the last row...) 
	; = ??? + 297 T total

; total 192  with extras...
	; ??? T per row
	; 192 * ??? = 
	; + 67 T main overhead
	; + 7 setup B for loop
	; total = ??? T

; floating bus racing the beam 
; (not using this as it's better for bottom half of screen)
	; we start rendering as soon as main screen draw is (basically) over
	; 56 bottom border
	; 8 vblank
	; 56 top border
	; = 120 scanlines before top main screen
	; = 26,880 t-states clear before real racing & contention kicks in...
	;

; chasing the beam
; (using this as we need all the scanlines chasing the beam)
	; using HALT not floating bus
	; and timing 8 vblank & 56 top border away
	; then have all 192 main screen plus 56 bottom border before HALT
	; = 248 scanlines
	; so double the floating bus... 

STACK_POINTER_BACKUP:
	DEFW 		0

STACK_SCREEN_PTR:
	DEFW 		0

STACK_IMAGE_PTR:
	DEFW 		0
