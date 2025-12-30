
	INCLUDE 	"sp_stack_render_data.asm"


	MACRO 		Stack_Pop 												; total 88 T
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
	ENDM 

	MACRO 		Stack_Push 												; total 96 T
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


STACK_RENDER:														; 17 T (call)
	; push any registers we need to preserve...
	; none for now

	; preserve SP
	LD 			(STACK_POINTER_BACKUP), SP							; 20 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 1 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_1:			; for SMC
	LD 			SP, IMAGE_ROW_1		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_1:			; for SMC
	LD 			SP, SCREEN_ROW_1	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 2 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_2:			; for SMC
	LD 			SP, IMAGE_ROW_2		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_2:			; for SMC
	LD 			SP, SCREEN_ROW_2	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 3 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_3:			; for SMC
	LD 			SP, IMAGE_ROW_3		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_3:			; for SMC
	LD 			SP, SCREEN_ROW_3	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 4 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_4:			; for SMC
	LD 			SP, IMAGE_ROW_4		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_4:			; for SMC
	LD 			SP, SCREEN_ROW_4	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 5 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_5:			; for SMC
	LD 			SP, IMAGE_ROW_5		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_5:			; for SMC
	LD 			SP, SCREEN_ROW_5	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 6 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_6:			; for SMC
	LD 			SP, IMAGE_ROW_6		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_6:			; for SMC
	LD 			SP, SCREEN_ROW_6	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 7 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_7:			; for SMC
	LD 			SP, IMAGE_ROW_7		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_7:			; for SMC
	LD 			SP, SCREEN_ROW_7	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 8 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_8:			; for SMC
	LD 			SP, IMAGE_ROW_8		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_8:			; for SMC
	LD 			SP, SCREEN_ROW_8	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 9 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_9:			; for SMC
	LD 			SP, IMAGE_ROW_9		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_9:			; for SMC
	LD 			SP, SCREEN_ROW_9	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 10 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_10:			; for SMC
	LD 			SP, IMAGE_ROW_10	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_10:			; for SMC
	LD 			SP, SCREEN_ROW_10	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 11 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_11:			; for SMC
	LD 			SP, IMAGE_ROW_11	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_11:			; for SMC
	LD 			SP, SCREEN_ROW_11	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 12 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_12:			; for SMC
	LD 			SP, IMAGE_ROW_12	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_12:			; for SMC
	LD 			SP, SCREEN_ROW_12	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 13 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_13:			; for SMC
	LD 			SP, IMAGE_ROW_13	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_13:			; for SMC
	LD 			SP, SCREEN_ROW_13	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 14 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_14:			; for SMC
	LD 			SP, IMAGE_ROW_14	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_14:			; for SMC
	LD 			SP, SCREEN_ROW_14	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 15 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_15:			; for SMC
	LD 			SP, IMAGE_ROW_15	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_15:			; for SMC
	LD 			SP, SCREEN_ROW_15	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 16 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_16:			; for SMC
	LD 			SP, IMAGE_ROW_16	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_16:			; for SMC
	LD 			SP, SCREEN_ROW_16	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 17 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_17:			; for SMC
	LD 			SP, IMAGE_ROW_17	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_17:			; for SMC
	LD 			SP, SCREEN_ROW_17	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 18 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_18:			; for SMC
	LD 			SP, IMAGE_ROW_18		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_18:			; for SMC
	LD 			SP, SCREEN_ROW_18	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 19 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_19:			; for SMC
	LD 			SP, IMAGE_ROW_19	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_19:			; for SMC
	LD 			SP, SCREEN_ROW_19	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 20 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_20:			; for SMC
	LD 			SP, IMAGE_ROW_20	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_20:			; for SMC
	LD 			SP, SCREEN_ROW_20	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 21 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_21:			; for SMC
	LD 			SP, IMAGE_ROW_21	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_21:			; for SMC
	LD 			SP, SCREEN_ROW_21	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 22 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_22:			; for SMC
	LD 			SP, IMAGE_ROW_22	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_22:			; for SMC
	LD 			SP, SCREEN_ROW_22	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 23 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_23:			; for SMC
	LD 			SP, IMAGE_ROW_23	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_23:			; for SMC
	LD 			SP, SCREEN_ROW_23	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 24 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_24:			; for SMC
	LD 			SP, IMAGE_ROW_24	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_24:			; for SMC
	LD 			SP, SCREEN_ROW_24	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 25 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_25:			; for SMC
	LD 			SP, IMAGE_ROW_25		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_25:			; for SMC
	LD 			SP, SCREEN_ROW_25	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 26 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_26:			; for SMC
	LD 			SP, IMAGE_ROW_26	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_26:			; for SMC
	LD 			SP, SCREEN_ROW_26	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 27 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_27:			; for SMC
	LD 			SP, IMAGE_ROW_27	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_27:			; for SMC
	LD 			SP, SCREEN_ROW_27	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 28 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_28:			; for SMC
	LD 			SP, IMAGE_ROW_28	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_28:			; for SMC
	LD 			SP, SCREEN_ROW_28	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 29 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_29:			; for SMC
	LD 			SP, IMAGE_ROW_29	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_29:			; for SMC
	LD 			SP, SCREEN_ROW_29	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 30 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_30:			; for SMC
	LD 			SP, IMAGE_ROW_30	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_30:			; for SMC
	LD 			SP, SCREEN_ROW_30	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 31 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_31:			; for SMC
	LD 			SP, IMAGE_ROW_31	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_31:			; for SMC
	LD 			SP, SCREEN_ROW_31	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 32 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_32:			; for SMC
	LD 			SP, IMAGE_ROW_32	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_32:			; for SMC
	LD 			SP, SCREEN_ROW_32	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 33 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_33:			; for SMC
	LD 			SP, IMAGE_ROW_33	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_33:			; for SMC
	LD 			SP, SCREEN_ROW_33	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 34 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_34:			; for SMC
	LD 			SP, IMAGE_ROW_34		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_34:			; for SMC
	LD 			SP, SCREEN_ROW_34	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 35 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_35:			; for SMC
	LD 			SP, IMAGE_ROW_35	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_35:			; for SMC
	LD 			SP, SCREEN_ROW_35	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 36 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_36:			; for SMC
	LD 			SP, IMAGE_ROW_36	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_36:			; for SMC
	LD 			SP, SCREEN_ROW_36	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 37 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_37:			; for SMC
	LD 			SP, IMAGE_ROW_37	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_37:			; for SMC
	LD 			SP, SCREEN_ROW_37	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 38 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_38:			; for SMC
	LD 			SP, IMAGE_ROW_38	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_38:			; for SMC
	LD 			SP, SCREEN_ROW_38	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 39 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_39:			; for SMC
	LD 			SP, IMAGE_ROW_39	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_39:			; for SMC
	LD 			SP, SCREEN_ROW_39	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 40 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_40:			; for SMC
	LD 			SP, IMAGE_ROW_40	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_40:			; for SMC
	LD 			SP, SCREEN_ROW_40	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 41 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_41:			; for SMC
	LD 			SP, IMAGE_ROW_41		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_41:			; for SMC
	LD 			SP, SCREEN_ROW_41	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 42 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_42:			; for SMC
	LD 			SP, IMAGE_ROW_42	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_42:			; for SMC
	LD 			SP, SCREEN_ROW_42	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 43 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_43:			; for SMC
	LD 			SP, IMAGE_ROW_43	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_43:			; for SMC
	LD 			SP, SCREEN_ROW_43	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 44 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_44:			; for SMC
	LD 			SP, IMAGE_ROW_44		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_44:			; for SMC
	LD 			SP, SCREEN_ROW_44	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 45 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_45:			; for SMC
	LD 			SP, IMAGE_ROW_45		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_45:			; for SMC
	LD 			SP, SCREEN_ROW_45	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 46 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_46:			; for SMC
	LD 			SP, IMAGE_ROW_46	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_46:			; for SMC
	LD 			SP, SCREEN_ROW_46	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 47 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_47:			; for SMC
	LD 			SP, IMAGE_ROW_47	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_47:			; for SMC
	LD 			SP, SCREEN_ROW_47	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 48 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_48:			; for SMC
	LD 			SP, IMAGE_ROW_48	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_48:			; for SMC
	LD 			SP, SCREEN_ROW_48	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 49 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_49:			; for SMC
	LD 			SP, IMAGE_ROW_49	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_49:			; for SMC
	LD 			SP, SCREEN_ROW_49	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 50 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_50:			; for SMC
	LD 			SP, IMAGE_ROW_50	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_50:			; for SMC
	LD 			SP, SCREEN_ROW_50	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 51 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_51:			; for SMC
	LD 			SP, IMAGE_ROW_51	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_51:			; for SMC
	LD 			SP, SCREEN_ROW_51	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 52 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_52:			; for SMC
	LD 			SP, IMAGE_ROW_52	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_52:			; for SMC
	LD 			SP, SCREEN_ROW_52	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 53 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_53:			; for SMC
	LD 			SP, IMAGE_ROW_53	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_53:			; for SMC
	LD 			SP, SCREEN_ROW_53	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 54 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_54:			; for SMC
	LD 			SP, IMAGE_ROW_54	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_54:			; for SMC
	LD 			SP, SCREEN_ROW_54	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 55 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_55:			; for SMC
	LD 			SP, IMAGE_ROW_55	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_55:			; for SMC
	LD 			SP, SCREEN_ROW_55	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 56 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_56:			; for SMC
	LD 			SP, IMAGE_ROW_56	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_56:			; for SMC
	LD 			SP, SCREEN_ROW_56	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 57 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_57:			; for SMC
	LD 			SP, IMAGE_ROW_57	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_57:			; for SMC
	LD 			SP, SCREEN_ROW_57	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 58 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_58:			; for SMC
	LD 			SP, IMAGE_ROW_58	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_58:			; for SMC
	LD 			SP, SCREEN_ROW_58	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 59 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_59:			; for SMC
	LD 			SP, IMAGE_ROW_59	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_59:			; for SMC
	LD 			SP, SCREEN_ROW_59	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 60 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_60:			; for SMC
	LD 			SP, IMAGE_ROW_60	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_60:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 61 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_61:			; for SMC
	LD 			SP, IMAGE_ROW_61	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_61:			; for SMC
	LD 			SP, SCREEN_ROW_61	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 62 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_62:			; for SMC
	LD 			SP, IMAGE_ROW_62	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_62:			; for SMC
	LD 			SP, SCREEN_ROW_62	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_63:			; for SMC
	LD 			SP, IMAGE_ROW_63	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_63:			; for SMC
	LD 			SP, SCREEN_ROW_63	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 64 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_64:			; for SMC
	LD 			SP, IMAGE_ROW_64	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_64:			; for SMC
	LD 			SP, SCREEN_ROW_64	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 65 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_65:			; for SMC
	LD 			SP, IMAGE_ROW_65	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_65:			; for SMC
	LD 			SP, SCREEN_ROW_65	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 66 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_66:			; for SMC
	LD 			SP, IMAGE_ROW_66	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_66:			; for SMC
	LD 			SP, SCREEN_ROW_66	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 67 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_67:			; for SMC
	LD 			SP, IMAGE_ROW_67	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_67:			; for SMC
	LD 			SP, SCREEN_ROW_67	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 68 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_68:			; for SMC
	LD 			SP, IMAGE_ROW_68	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_68:			; for SMC
	LD 			SP, SCREEN_ROW_68	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 69 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_69:			; for SMC
	LD 			SP, IMAGE_ROW_69	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_69:			; for SMC
	LD 			SP, SCREEN_ROW_69	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 70 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_70:			; for SMC
	LD 			SP, IMAGE_ROW_70	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_70:			; for SMC
	LD 			SP, SCREEN_ROW_70	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 71 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_71:			; for SMC
	LD 			SP, IMAGE_ROW_71	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_71:			; for SMC
	LD 			SP, SCREEN_ROW_71	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 72 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_72:			; for SMC
	LD 			SP, IMAGE_ROW_72	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_72:			; for SMC
	LD 			SP, SCREEN_ROW_72	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 73 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_73:			; for SMC
	LD 			SP, IMAGE_ROW_73	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_73:			; for SMC
	LD 			SP, SCREEN_ROW_73	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 74 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_74:			; for SMC
	LD 			SP, IMAGE_ROW_74	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_74:			; for SMC
	LD 			SP, SCREEN_ROW_74	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 75 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_75:			; for SMC
	LD 			SP, IMAGE_ROW_75	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_75:			; for SMC
	LD 			SP, SCREEN_ROW_75	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 76 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_76:			; for SMC
	LD 			SP, IMAGE_ROW_76	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_76:			; for SMC
	LD 			SP, SCREEN_ROW_76	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 77 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_77:			; for SMC
	LD 			SP, IMAGE_ROW_77	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_77:			; for SMC
	LD 			SP, SCREEN_ROW_77	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 78 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_78:			; for SMC
	LD 			SP, IMAGE_ROW_78	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_78:			; for SMC
	LD 			SP, SCREEN_ROW_78	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 79 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_79:			; for SMC
	LD 			SP, IMAGE_ROW_79	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_79:			; for SMC
	LD 			SP, SCREEN_ROW_79	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 80 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_80:			; for SMC
	LD 			SP, IMAGE_ROW_80	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_80:			; for SMC
	LD 			SP, SCREEN_ROW_80	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 81 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_81:			; for SMC
	LD 			SP, IMAGE_ROW_81	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_81:			; for SMC
	LD 			SP, SCREEN_ROW_81	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 82 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_82:			; for SMC
	LD 			SP, IMAGE_ROW_82	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_82:			; for SMC
	LD 			SP, SCREEN_ROW_82	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 83 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_83:			; for SMC
	LD 			SP, IMAGE_ROW_83	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_83:			; for SMC
	LD 			SP, SCREEN_ROW_83	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 84 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_84:			; for SMC
	LD 			SP, IMAGE_ROW_84	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_84:			; for SMC
	LD 			SP, SCREEN_ROW_84	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 85 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_85:			; for SMC
	LD 			SP, IMAGE_ROW_85	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_85:			; for SMC
	LD 			SP, SCREEN_ROW_85	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 86 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_86:			; for SMC
	LD 			SP, IMAGE_ROW_86	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_86:			; for SMC
	LD 			SP, SCREEN_ROW_86	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 87 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_87:			; for SMC
	LD 			SP, IMAGE_ROW_87	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_87:			; for SMC
	LD 			SP, SCREEN_ROW_87	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 88 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_88:			; for SMC
	LD 			SP, IMAGE_ROW_88	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_88:			; for SMC
	LD 			SP, SCREEN_ROW_88	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 89 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_89:			; for SMC
	LD 			SP, IMAGE_ROW_89	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_89:			; for SMC
	LD 			SP, SCREEN_ROW_89	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 90 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_90:			; for SMC
	LD 			SP, IMAGE_ROW_90	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_90:			; for SMC
	LD 			SP, SCREEN_ROW_90	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 91 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_91:			; for SMC
	LD 			SP, IMAGE_ROW_91	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_91:			; for SMC
	LD 			SP, SCREEN_ROW_91	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 92 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_92:			; for SMC
	LD 			SP, IMAGE_ROW_92	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_92:			; for SMC
	LD 			SP, SCREEN_ROW_92	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 93 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_93:			; for SMC
	LD 			SP, IMAGE_ROW_93	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_93:			; for SMC
	LD 			SP, SCREEN_ROW_93	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 94 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_94:			; for SMC
	LD 			SP, IMAGE_ROW_94	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_94:			; for SMC
	LD 			SP, SCREEN_ROW_94	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 95 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_95:			; for SMC
	LD 			SP, IMAGE_ROW_95	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_95:			; for SMC
	LD 			SP, SCREEN_ROW_95	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 96 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_96:			; for SMC
	LD 			SP, IMAGE_ROW_96	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_96:			; for SMC
	LD 			SP, SCREEN_ROW_96	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 97 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_97:			; for SMC
	LD 			SP, IMAGE_ROW_97	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_97:			; for SMC
	LD 			SP, SCREEN_ROW_97	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 98/ 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_98:			; for SMC
	LD 			SP, IMAGE_ROW_98	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_98:			; for SMC
	LD 			SP, SCREEN_ROW_98	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 99 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_99:			; for SMC
	LD 			SP, IMAGE_ROW_99	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_99:			; for SMC
	LD 			SP, SCREEN_ROW_99	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 100 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_100:			; for SMC
	LD 			SP, IMAGE_ROW_100	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_100:		; for SMC
	LD 			SP, SCREEN_ROW_100	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 101 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_101:			; for SMC
	LD 			SP, IMAGE_ROW_101	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_101			; for SMC
	LD 			SP, SCREEN_ROW_101	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 102 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_102:			; for SMC
	LD 			SP, IMAGE_ROW_102	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_102:		; for SMC
	LD 			SP, SCREEN_ROW_102	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 103 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_103:			; for SMC
	LD 			SP, IMAGE_ROW_103	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_103:		; for SMC
	LD 			SP, SCREEN_ROW_103	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 104 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_104:			; for SMC
	LD 			SP, IMAGE_ROW_104	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_104:		; for SMC
	LD 			SP, SCREEN_ROW_104	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 105 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_105:			; for SMC
	LD 			SP, IMAGE_ROW_105	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_105:		; for SMC
	LD 			SP, SCREEN_ROW_105	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 106 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_106:			; for SMC
	LD 			SP, IMAGE_ROW_106	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_106:		; for SMC
	LD 			SP, SCREEN_ROW_106	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 107 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_107:			; for SMC
	LD 			SP, IMAGE_ROW_107	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_107:		; for SMC
	LD 			SP, SCREEN_ROW_107	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 108 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_108:			; for SMC
	LD 			SP, IMAGE_ROW_108	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_108:		; for SMC
	LD 			SP, SCREEN_ROW_108	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 109 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_109:			; for SMC
	LD 			SP, IMAGE_ROW_109	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_109:		; for SMC
	LD 			SP, SCREEN_ROW_109	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 110 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_110:			; for SMC
	LD 			SP, IMAGE_ROW_110	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_110:		; for SMC
	LD 			SP, SCREEN_ROW_110	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 111 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_111:			; for SMC
	LD 			SP, IMAGE_ROW_111	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_111:		; for SMC
	LD 			SP, SCREEN_ROW_111	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 112 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_112:			; for SMC
	LD 			SP, IMAGE_ROW_112	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_112:		; for SMC
	LD 			SP, SCREEN_ROW_112	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 113 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_113:			; for SMC
	LD 			SP, IMAGE_ROW_113	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_113:		; for SMC
	LD 			SP, SCREEN_ROW_113	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 114 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_114:			; for SMC
	LD 			SP, IMAGE_ROW_114	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_114:		; for SMC
	LD 			SP, SCREEN_ROW_114	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 115 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_115:			; for SMC
	LD 			SP, IMAGE_ROW_115	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_115:		; for SMC
	LD 			SP, SCREEN_ROW_115	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 116 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_116:			; for SMC
	LD 			SP, IMAGE_ROW_116	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_116:		; for SMC
	LD 			SP, SCREEN_ROW_116	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 117 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_117:			; for SMC
	LD 			SP, IMAGE_ROW_117	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_117:		; for SMC
	LD 			SP, SCREEN_ROW_117	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 118 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_118:			; for SMC
	LD 			SP, IMAGE_ROW_118	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_118:		; for SMC
	LD 			SP, SCREEN_ROW_118	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 119 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_119:			; for SMC
	LD 			SP, IMAGE_ROW_119	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_119:		; for SMC
	LD 			SP, SCREEN_ROW_119	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 120 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_120:			; for SMC
	LD 			SP, IMAGE_ROW_120	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_120:		; for SMC
	LD 			SP, SCREEN_ROW_120	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 121 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_121:			; for SMC
	LD 			SP, IMAGE_ROW_121	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_121:		; for SMC
	LD 			SP, SCREEN_ROW_121	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 122 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_122:			; for SMC
	LD 			SP, IMAGE_ROW_122	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_122:		; for SMC
	LD 			SP, SCREEN_ROW_122	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 123 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_123:			; for SMC
	LD 			SP, IMAGE_ROW_123	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_123:		; for SMC
	LD 			SP, SCREEN_ROW_123	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 124 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_124:			; for SMC
	LD 			SP, IMAGE_ROW_124	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_124:		; for SMC
	LD 			SP, SCREEN_ROW_124	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 125 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_125:			; for SMC
	LD 			SP, IMAGE_ROW_125	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_125:		; for SMC
	LD 			SP, SCREEN_ROW_125	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 126 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_126:			; for SMC
	LD 			SP, IMAGE_ROW_126	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_126:		; for SMC
	LD 			SP, SCREEN_ROW_126	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 127 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_127:			; for SMC
	LD 			SP, IMAGE_ROW_127	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_127:		; for SMC
	LD 			SP, SCREEN_ROW_127	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 128 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_128:			; for SMC
	LD 			SP, IMAGE_ROW_128	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_128:		; for SMC
	LD 			SP, SCREEN_ROW_128	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 129 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_129:			; for SMC
	LD 			SP, IMAGE_ROW_129	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_129:		; for SMC
	LD 			SP, SCREEN_ROW_129	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 130 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_130:			; for SMC
	LD 			SP, IMAGE_ROW_130	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_130:		; for SMC
	LD 			SP, SCREEN_ROW_130	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 131 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_131:			; for SMC
	LD 			SP, IMAGE_ROW_131	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_131:		; for SMC
	LD 			SP, SCREEN_ROW_131	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 132 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_132:			; for SMC
	LD 			SP, IMAGE_ROW_132	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_132:		; for SMC
	LD 			SP, SCREEN_ROW_132	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 133 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_133:			; for SMC
	LD 			SP, IMAGE_ROW_133	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_133:		; for SMC
	LD 			SP, SCREEN_ROW_133	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 134 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_134:			; for SMC
	LD 			SP, IMAGE_ROW_134	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_134:		; for SMC
	LD 			SP, SCREEN_ROW_134	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 135 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_135:			; for SMC
	LD 			SP, IMAGE_ROW_135	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_135:		; for SMC
	LD 			SP, SCREEN_ROW_135	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 136 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_136:			; for SMC
	LD 			SP, IMAGE_ROW_136	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_136:		; for SMC
	LD 			SP, SCREEN_ROW_136	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 137 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_137:			; for SMC
	LD 			SP, IMAGE_ROW_137	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_137:		; for SMC
	LD 			SP, SCREEN_ROW_137	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 138 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_138:			; for SMC
	LD 			SP, IMAGE_ROW_138	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_138:		; for SMC
	LD 			SP, SCREEN_ROW_138	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 139 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_139:			; for SMC
	LD 			SP, IMAGE_ROW_139	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_139:		; for SMC
	LD 			SP, SCREEN_ROW_139	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 140 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_140:			; for SMC
	LD 			SP, IMAGE_ROW_140	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_140:		; for SMC
	LD 			SP, SCREEN_ROW_140	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 141 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_141:			; for SMC
	LD 			SP, IMAGE_ROW_141	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_141:		; for SMC
	LD 			SP, SCREEN_ROW_141	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 142 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_142:			; for SMC
	LD 			SP, IMAGE_ROW_142	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_142:		; for SMC
	LD 			SP, SCREEN_ROW_142	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 143 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_143:			; for SMC
	LD 			SP, IMAGE_ROW_143	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_143:		; for SMC
	LD 			SP, SCREEN_ROW_143	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 144 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_144:			; for SMC
	LD 			SP, IMAGE_ROW_144	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_144:		; for SMC
	LD 			SP, SCREEN_ROW_144	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 145 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_145:			; for SMC
	LD 			SP, IMAGE_ROW_145	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_145:		; for SMC
	LD 			SP, SCREEN_ROW_145	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 146 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_146:			; for SMC
	LD 			SP, IMAGE_ROW_146	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_146:		; for SMC
	LD 			SP, SCREEN_ROW_146	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 147 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_147:			; for SMC
	LD 			SP, IMAGE_ROW_147	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_147:		; for SMC
	LD 			SP, SCREEN_ROW_147	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 148 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_148:			; for SMC
	LD 			SP, IMAGE_ROW_148	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_148:		; for SMC
	LD 			SP, SCREEN_ROW_148	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 149 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_149:			; for SMC
	LD 			SP, IMAGE_ROW_149	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_149:		; for SMC
	LD 			SP, SCREEN_ROW_149	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 150 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_150:			; for SMC
	LD 			SP, IMAGE_ROW_150	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_150:		; for SMC
	LD 			SP, SCREEN_ROW_150	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 151 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_151:			; for SMC
	LD 			SP, IMAGE_ROW_151	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_151:		; for SMC
	LD 			SP, SCREEN_ROW_151	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 152 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_152:			; for SMC
	LD 			SP, IMAGE_ROW_152	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_152:		; for SMC
	LD 			SP, SCREEN_ROW_152	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 153 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_153:			; for SMC
	LD 			SP, IMAGE_ROW_153	; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_153:		; for SMC
	LD 			SP, SCREEN_ROW_153	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T

; render row 0 / 191												; total 204 T per row
STACK_RENDER_IMAGE_ROW_0:			; for SMC
	LD 			SP, IMAGE_ROW_0		; start of screen row			; 10 T
	Stack_Pop														; 88 T
STACK_RENDER_SCREEN_ROW_0:			; for SMC
	LD 			SP, SCREEN_ROW_0	; set SP to end of screen row	; 10 T
	Stack_Push														; 96 T














	; restore SP
	LD 			SP, (STACK_POINTER_BACKUP)							; 20 T

	; pop any registers we need to restore...
	; none for now
	RET								; STACK_RENDER					; 10 T
		; overhead: 17 + 20 + 20 + 10 = 67 T
		; rows 192 * 204 = 39,168 T
		; total = 39,235 T


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
