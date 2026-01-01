
	INCLUDE 	"sp_stack_render_data.asm"
	INCLUDE 	"sp_stack_render_macros.asm"


STACK_RENDER:														; 17 T (call)
	; push any registers we need to preserve...
	; none for now

	; preserve SP
	LD 			(STACK_POINTER_BACKUP), SP							; 20 T

STACK_RENDER_PIXELS:
	; 192 rows @ 204 T each
	Stack_Row_Pixel 0
	Stack_Row_Pixel 1
	Stack_Row_Pixel 2
	Stack_Row_Pixel 3
	Stack_Row_Pixel 4
	Stack_Row_Pixel 5
	Stack_Row_Pixel 6
	Stack_Row_Pixel 7
	Stack_Row_Pixel 8
	Stack_Row_Pixel 9
	Stack_Row_Pixel 10
	Stack_Row_Pixel 11
	Stack_Row_Pixel 12
	Stack_Row_Pixel 13
	Stack_Row_Pixel 14
	Stack_Row_Pixel 15
	Stack_Row_Pixel 16
	Stack_Row_Pixel 17
	Stack_Row_Pixel 18
	Stack_Row_Pixel 19
	Stack_Row_Pixel 20
	Stack_Row_Pixel 21
	Stack_Row_Pixel 22
	Stack_Row_Pixel 23
	Stack_Row_Pixel 24
	Stack_Row_Pixel 25
	Stack_Row_Pixel 26
	Stack_Row_Pixel 27
	Stack_Row_Pixel 28
	Stack_Row_Pixel 29
	Stack_Row_Pixel 30
	Stack_Row_Pixel 31
	Stack_Row_Pixel 32
	Stack_Row_Pixel 33
	Stack_Row_Pixel 34
	Stack_Row_Pixel 35
	Stack_Row_Pixel 36
	Stack_Row_Pixel 37
	Stack_Row_Pixel 38
	Stack_Row_Pixel 39
	Stack_Row_Pixel 40
	Stack_Row_Pixel 41
	Stack_Row_Pixel 42
	Stack_Row_Pixel 43
	Stack_Row_Pixel 44
	Stack_Row_Pixel 45
	Stack_Row_Pixel 46
	Stack_Row_Pixel 47
	Stack_Row_Pixel 48
	Stack_Row_Pixel 49
	Stack_Row_Pixel 50
	Stack_Row_Pixel 51
	Stack_Row_Pixel 52
	Stack_Row_Pixel 53
	Stack_Row_Pixel 54
	Stack_Row_Pixel 55
	Stack_Row_Pixel 56
	Stack_Row_Pixel 57
	Stack_Row_Pixel 58
	Stack_Row_Pixel 59
	Stack_Row_Pixel 60
	Stack_Row_Pixel 61
	Stack_Row_Pixel 62
	Stack_Row_Pixel 63
	Stack_Row_Pixel 64
	Stack_Row_Pixel 65
	Stack_Row_Pixel 66
	Stack_Row_Pixel 67
	Stack_Row_Pixel 68
	Stack_Row_Pixel 69
	Stack_Row_Pixel 70
	Stack_Row_Pixel 71
	Stack_Row_Pixel 72
	Stack_Row_Pixel 73
	Stack_Row_Pixel 74
	Stack_Row_Pixel 75
	Stack_Row_Pixel 76
	Stack_Row_Pixel 77
	Stack_Row_Pixel 78
	Stack_Row_Pixel 79
	Stack_Row_Pixel 80
	Stack_Row_Pixel 81
	Stack_Row_Pixel 82
	Stack_Row_Pixel 83
	Stack_Row_Pixel 84
	Stack_Row_Pixel 85
	Stack_Row_Pixel 86
	Stack_Row_Pixel 87
	Stack_Row_Pixel 88
	Stack_Row_Pixel 89
	Stack_Row_Pixel 90
	Stack_Row_Pixel 91
	Stack_Row_Pixel 92
	Stack_Row_Pixel 93
	Stack_Row_Pixel 94
	Stack_Row_Pixel 95
	Stack_Row_Pixel 96
	Stack_Row_Pixel 97
	Stack_Row_Pixel 98
	Stack_Row_Pixel 99
	Stack_Row_Pixel 100
	Stack_Row_Pixel 101
	Stack_Row_Pixel 102
	Stack_Row_Pixel 103
	Stack_Row_Pixel 104
	Stack_Row_Pixel 105
	Stack_Row_Pixel 106
	Stack_Row_Pixel 107
	Stack_Row_Pixel 108
	Stack_Row_Pixel 109
	Stack_Row_Pixel 110
	Stack_Row_Pixel 111
	Stack_Row_Pixel 112
	Stack_Row_Pixel 113
	Stack_Row_Pixel 114
	Stack_Row_Pixel 115
	Stack_Row_Pixel 116
	Stack_Row_Pixel 117
	Stack_Row_Pixel 118
	Stack_Row_Pixel 119
	Stack_Row_Pixel 120
	Stack_Row_Pixel 121
	Stack_Row_Pixel 122
	Stack_Row_Pixel 123
	Stack_Row_Pixel 124
	Stack_Row_Pixel 125
	Stack_Row_Pixel 126
	Stack_Row_Pixel 127
	Stack_Row_Pixel 128
	Stack_Row_Pixel 129
	Stack_Row_Pixel 130
	Stack_Row_Pixel 131
	Stack_Row_Pixel 132
	Stack_Row_Pixel 133
	Stack_Row_Pixel 134
	Stack_Row_Pixel 135
	Stack_Row_Pixel 136
	Stack_Row_Pixel 137
	Stack_Row_Pixel 138
	Stack_Row_Pixel 139
	Stack_Row_Pixel 140
	Stack_Row_Pixel 141
	Stack_Row_Pixel 142
	Stack_Row_Pixel 143
	Stack_Row_Pixel 144
	Stack_Row_Pixel 145
	Stack_Row_Pixel 146
	Stack_Row_Pixel 147
	Stack_Row_Pixel 148
	Stack_Row_Pixel 149
	Stack_Row_Pixel 150
	Stack_Row_Pixel 151
	Stack_Row_Pixel 152
	Stack_Row_Pixel 153
	Stack_Row_Pixel 154
	Stack_Row_Pixel 155
	Stack_Row_Pixel 156
	Stack_Row_Pixel 157
	Stack_Row_Pixel 158
	Stack_Row_Pixel 159
	Stack_Row_Pixel 160
	Stack_Row_Pixel 161
	Stack_Row_Pixel 162
	Stack_Row_Pixel 163
	Stack_Row_Pixel 164
	Stack_Row_Pixel 165
	Stack_Row_Pixel 166
	Stack_Row_Pixel 167
	Stack_Row_Pixel 168
	Stack_Row_Pixel 169
	Stack_Row_Pixel 170
	Stack_Row_Pixel 171
	Stack_Row_Pixel 172
	Stack_Row_Pixel 173
	Stack_Row_Pixel 174
	Stack_Row_Pixel 175
	Stack_Row_Pixel 176
	Stack_Row_Pixel 177
	Stack_Row_Pixel 178
	Stack_Row_Pixel 179
	Stack_Row_Pixel 180
	Stack_Row_Pixel 181
	Stack_Row_Pixel 182
	Stack_Row_Pixel 183
	Stack_Row_Pixel 184
	Stack_Row_Pixel 185
	Stack_Row_Pixel 186
	Stack_Row_Pixel 187
	Stack_Row_Pixel 188
	Stack_Row_Pixel 189
	Stack_Row_Pixel 190
	Stack_Row_Pixel 191

STACK_RENDER_ATTRS:
	; 24 (block) rows @ 204 T each
	Stack_Row_Attr 0
	Stack_Row_Attr 1
	Stack_Row_Attr 2
	Stack_Row_Attr 3
	Stack_Row_Attr 4
	Stack_Row_Attr 5
	Stack_Row_Attr 6
	Stack_Row_Attr 7
	Stack_Row_Attr 8
	Stack_Row_Attr 9
	Stack_Row_Attr 10
	Stack_Row_Attr 11
	Stack_Row_Attr 12
	Stack_Row_Attr 13
	Stack_Row_Attr 14
	Stack_Row_Attr 15
	Stack_Row_Attr 16
	Stack_Row_Attr 17
	Stack_Row_Attr 18
	Stack_Row_Attr 19
	Stack_Row_Attr 20
	Stack_Row_Attr 21
	Stack_Row_Attr 22
	Stack_Row_Attr 23

STACK_RENDER_BUFFER_BLANK:
	LD 		A, (STACK_RENDER_BLANK_COL)								; 13 T
	CP 		$FF														; 7 T
	JP 		Z, STACK_RENDER_BUFFER_DONE	; no blank needed			; 10 T
																		; = 30 T

	; blank attr the specified col
	LD 		D, 0													; 7 T
	LD 		E, A 						; DE has offset				; 4 T
																		; = 11 T

	; row 0
	LD 		HL, SCREEN_ROW_ATTR_0 - 24	; point to initial col		; 10 T
	ADD 	HL, DE						; HL has col to blank		; 11 T
	LD 		(HL), 0						; blank it					; 10 T

	LD 		DE, 32						; a row of screen attrs		; 10 T
																		; = 41 T
																			; = 82 T

	; row 1
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 2
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 3
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 4
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 5
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 6
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 7
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 8
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 9
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 10
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 11
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 12
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 13
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 14
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 15
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 16
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 17
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 18
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 19
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 20
	ADD 	HL, DE						; next row					
	LD 		(HL), 0						; blank it					

	; row 21
	ADD 	HL, DE						; next row				
	LD 		(HL), 0						; blank it				

	; row 22
	ADD 	HL, DE						; next row				
	LD 		(HL), 0						; blank it				

	; row 23
	ADD 	HL, DE						; next row				; 11 T
	LD 		(HL), 0						; blank it				; 10 T
																	; = 21 T

	; don't need to blank next time
	LD 		A, $FF													; 7 T
	LD 		(STACK_RENDER_BLANK_COL), A								; 13 T
																		; = 20 T



										; 23 (0th col separate) * 21 T
																		; = 483 T
																		; + 82 T
																			; = 565 T

STACK_RENDER_BUFFER_DONE:
	; restore SP
	LD 			SP, (STACK_POINTER_BACKUP)							; 20 T

	; pop any registers we need to restore...
	; none for now
	RET								; STACK_RENDER					; 10 T
		; overhead: 17 + 20 + 20 + 10 = 67 T
		; pixel rows 192 * 204 = 39,168 T
		; attr row 24 * 204 = 4,896 T
		; blanking col needed = 585 T
		; total = 44,726 T




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

; which col to blank when moving, 255 for do nothing
STACK_RENDER_BLANK_COL:
	DEFB 		$FF

