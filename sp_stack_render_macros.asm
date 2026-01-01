

	MACRO 		Stack_Row_Pixel	   row_num									; total 204 T
		; start of screen row
		LD 			SP, IMAGE_ROW_row_num								; 10 T
																			; = 10 T

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
		LD 			SP, SCREEN_ROW_row_num								; 10 T
																			; = 10 T
	
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
	ENDM 

	MACRO 		Stack_Row_Attr		row_num								; total 204 T
		; start of screen row
		LD 			SP, IMAGE_ROW_ATTR_row_num							; 10 T
																			; = 10 T

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
		LD 			SP, SCREEN_ROW_ATTR_row_num							; 10 T
																			; = 10 T
	
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
	ENDM 

