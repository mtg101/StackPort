

FAKE_PLACEHOLDER:
	DEFW		0

STACK_RENDER:														; 17 T (call)
	; push any registers we need to preserve...
	; none for now

	; preserve SP
	LD 			(STACK_POINTER_BACKUP), SP							; 20 T


; blit a row


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

	; set SP to end of screen row
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
	; 


; floating bus racing the beam 
; (what this demo uses)
	; we start rendering as soon as main screen draw is (basically) over
	; 56 bottom border
	; 8 vblank
	; 56 top border
	; = 120 scanlines before top main screen
	; = 26,880 t-states clear before real racing & contention kicks in...
	;

; chasing the beam
; (not used, but in theory...)
	; using HALT not floating bus
	; and timing 8 vblank & 56 top border away
	; then have all 192 main screen plus 56 bottom border before HALT
	; = 248 scanlines
	; so double the floating bus... 

STACK_POINTER_BACKUP:
	DEFW 		0

