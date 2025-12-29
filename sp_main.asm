	SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION	; for VSCODE and debugging
	DEVICE ZXSPECTRUM48 			; needed for SNA export (must be tab indented)
	ORG 	$8000					; the uncontended 32KiB
	
	INCLUDE "speccy_defs.asm"		; must be indented
	INCLUDE "sp_stack_render.asm"	
	
START:
	CALL 	INITIAL_SETUP

ANIMATE_MAIN:
	CALL	WAIT_BOTTOM_MAIN_SCREEN
	CALL 	STACK_RENDER
	JP		ANIMATE_MAIN

; flashing green on green 
ATTR_TRIG   = %11000000


; floating bus trick looking for ATTR_TRIG to appear at bottom of screen
WAIT_BOTTOM_MAIN_SCREEN:
WAIT_BOTTOM_MAIN_SCREEN_LOOP:
	IN 		A, ($FF)
	CP 		ATTR_TRIG
	RET 	Z						; WAIT_BOTTOM_MAIN_SCREEN
	JP 		WAIT_BOTTOM_MAIN_SCREEN_LOOP

INITIAL_SETUP:
	; diable interrupts
	; we're using floating bus trick, so won't be using HALT or interrupts
	DI

	; black border
	LD 		A, 0					
	OUT		($FE), A		

	; trigger row bright flashing black on black
	LD 		B, 32					; number of block to set to trigger attr
	LD 		HL, ATTR_END - 31		; first attr to change
	LD 		A, ATTR_TRIG				; trigger attr (flashing green on green)
INITIAL_SETUP_TRIGGE_ATTR_LOOP:	
	LD		(HL), A 
	INC  	HL
	DJNZ 	INITIAL_SETUP_TRIGGE_ATTR_LOOP

	RET								; INITIAL_SETUP

; Deployment: Snapshot
   SAVESNA 	"StackPort.sna", START
   