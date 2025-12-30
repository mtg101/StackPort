
	INCLUDE 	"sp_stack_render_data.asm"

FAKE_PLACEHOLDER:
	DEFW		0

STACK_RENDER:														; 17 T (call)
	; push any registers we need to preserve...
	; none for now

	; preserve SP
	LD 			(STACK_POINTER_BACKUP), SP							; 20 T

; render row 0 / 191
	; save end of screen row addr
	LD 			HL, SCREEN_ROW_0									; 10 T
	LD 			DE, (STACK_SCREEN_OFFSET)							; 20 T
	ADD 		HL, DE												; 11 T
	LD 			(STACK_SCREEN_SP), HL								; 16 T
																		; = 57 T 


	; set SP to start of source row
	LD 			HL, IMAGE_ROW_0										; 10 T
	LD 			DE, (STACK_IMAGE_OFFSET)							; 20 T
	ADD 		HL, DE												; 11 T
	LD 			SP, HL												; 6 T
																		; = 47 T

	; pop from source to registers
	POP 		AF 													; 10 T
	POP 		BC 													; 10 T
	POP 		DE 													; 10 T
	POP 		HL													; 10 T
																		; = 40 T

	; flip to shadow registers
	EXX 															; 4 T
	EX AF															; 4 T
																		; = 8 T

	; pop from source to shadow registers
	POP 		AF 													; 10 T
	POP 		BC 													; 10 T
	POP 		DE 													; 10 T
	POP 		HL													; 10 T
																		; = 40 T

	; set SP to end of screen row
	LD 			SP, (STACK_SCREEN_SP)								; 20 T
																		; = 20 T

	; push from shadow registers to screen
	PUSH 		HL 													; 11 T
	PUSH 		DE 													; 11 T
	PUSH 		BC 													; 11 T
	PUSH 		AF 													; 11 T
																		; = 44 T

	; flip back to regular registers
	EXX 															; 4 T
	EX AF															; 4 T
																		; = 8 T

	; push from registers to screen
	PUSH 		HL 													; 11 T
	PUSH 		DE 													; 11 T
	PUSH 		BC 													; 11 T
	PUSH 		AF 													; 11 T
																		; = 44 T

																	; = 308 T for one row blit


	; restore SP
	LD 			SP, (STACK_POINTER_BACKUP)							; 20 T

	; pop any registers we need to restore...
	; none for now
	RET								; STACK_RENDER					; 10 T



; chasing the beam
; (using this as we need all the scanlines chasing the beam)
	; using HALT not floating bus
	; and timing 8 vblank & 56 top border away
	; then have all 192 main screen plus 56 bottom border before HALT
	; = 248 scanlines
	; = 55,552 t-states
	; so double the floating bus... 

; floating bus racing the beam 
; (not using this as it's better for bottom half of screen)
	; we start rendering as soon as main screen draw is (basically) over
	; 56 bottom border
	; 8 vblank
	; 56 top border
	; = 120 scanlines before top main screen
	; = 26,880 t-states clear before real racing & contention kicks in...
	;

STACK_POINTER_BACKUP:
	DEFW 		0

; start of image row
STACK_IMAGE_OFFSET:
	DEFB		8

; end of screen row (stack shit)
STACK_SCREEN_OFFSET:
	DEFB		8 + 16

STACK_SCREEN_SP:
	DEFW		0
