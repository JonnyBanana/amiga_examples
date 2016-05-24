BOB_X			equ 4
BOB_Y			equ 8
BOB_DX			equ 12
BOB_SOURCE_ADDRESS	equ 16
BOB_MASK_ADDRESS	equ 20
BOB_SAVE_BUFFER_ADDRESS equ 24
BOB_LAST_DEST_ADDRESS	equ 32
BOB_BLIT_SIZE		equ 40	

BOB_BLIT_HEIGHT		equ 32
BOB_BLIT_WIDTH_WORDS	equ 3
BOB_BLIT_WIDTH_BYTES	equ BOB_BLIT_WIDTH_WORDS*2
BOB_MODULO		equ BACKGROUND_TILEMAP_WIDTH_BYTES-BOB_BLIT_WIDTH_BYTES
BOB_SHIFT_CONVERT	equ 4
BOB_SAVE_SIZE	equ BOB_BLIT_WIDTH_BYTES*SCREEN_BIT_DEPTH*BOB_BLIT_HEIGHT


BLITTER_OBJECT: macro
\@:
	dc.l	1
.\@x:
	dc.l	(\2)<<BOB_SHIFT_CONVERT
.\@y:
	dc.l	\3
.\@dx:
	dc.l	\4
.\@sourceAddress:
	dc.l	backgroundTilemap+(BACKGROUND_TILEMAP_WIDTH_BYTES*\5*SCREEN_BIT_DEPTH)	
.\@maskAddress:
	dc.l	bobMask+(BACKGROUND_TILEMAP_WIDTH_BYTES*\5*SCREEN_BIT_DEPTH)
.\@saveBufferAddress:
	dc.l	splash+(\1)*(BOB_SAVE_SIZE*2)
	dc.l	splash+(\1)*(BOB_SAVE_SIZE*2)+BOB_SAVE_SIZE
.\@lastDestAddress:
	dc.l	0
	dc.l	0	
.\@blitSize:
	dc.w	((\6)*SCREEN_BIT_DEPTH)<<6|(BOB_BLIT_WIDTH_WORDS)
	align 	4
	endm


BALOON_BOB: macro
	BLITTER_OBJECT \1,320,\2,\3,67,29
	endm

CLOUD_BOB: macro
	BLITTER_OBJECT \1,320,\2,\3,24,18
	endm	
