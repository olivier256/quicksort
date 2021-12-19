	ORG	0
START

_main:
	lea	array,a0
	move.l	a0,d6		; d6 = t
	moveq	#0,d7		; d7 = 0
	lea	arrayEnd,a1
	suba.l	a0,a1
	move.l	a1,d5
	lsr.w	#1,d5
	subq	#1,d5
	movea.l	d5,a5		; a5 = n - 1

        bsr	quickSort
INF_LOOP:
	BRA	INF_LOOP








; void quickSort(int *t, int left, int right);
quickSort:
; IN
; d6	*t
; d7	left
; a5	right
        movem.l a2-a5/d2-d7,-(sp)
        cmp.w a5,d7
        bge.s	.L1
        move.w a5,a3
        move.l a3,d0
        add.l d0,d0
        move.l d6,a4
        add.l d0,a4
.L9:
        move.w (a4),d2
        move.w d7,d5
        subq.w #1,d5
        move.w d7,a1
        move.l a1,d0
        add.l d0,d0
        move.l d0,a1
        add.l d6,a1
        move.w a5,d0
        move.l a3,d1
.L3:
        move.w d5,d4
        addq.w #1,d4
        move.l a1,a2
        move.w (a1)+,d3
        cmp.w d2,d3
        blt.s	.L4
        add.l d1,d1
        move.l d6,a0
        add.l d1,a0
.L6:
        tst.w d0
        ble.s	.L5
        subq.w #1,d0
        cmp.w -(a0),d2
        blt .L6
.L5:
        cmp.w d4,d0
        ble.s	.L7
        move.w d0,d1
        ext.l d1
        move.l d1,d5
        add.l d5,d5
        move.l d5,a0
        add.l d6,a0
        move.w (a0),-2(a1)
        move.w d3,(a0)
.L4:
        move.w d4,d5
        bra .L3
.L7:
        move.w (a4),(a2)
        move.w d3,(a4)
        cmp.w d5,d7
        bge.s .L8
	exg	d5,a5		; Backup d5
	bsr	quickSort
	exg	d5,a5		; Restore d5
.L8:
        move.w d5,d7
        addq.w #2,d7
        cmp.w a5,d7
        blt .L9
.L1:
        movem.l (sp)+,a2-a5/d2-d7
        rts

	ds.b	$100-*
array:
	dc.w	45, 321,  17489, 145, 165, 112, 135, 65, 48, 16, 23, 48, 49, 98
	dc.w	45, 321, 7489, 45, 65, 12, 35, 135, 178, 198, 165 , 148, 116, 123, 148, 149, 198
	dc.w	145, 1321, 17489, 145, 165,  135, 178, 198, 165 , 148, 116, 123, 148, 149, 198
	dc.w	145, 1321, 17489, 145, 165, 112, 135, 65, 48, 16, 23, 48, 49, 98
	dc.w	45, 321, 7489, 45, 65, 12, 35, 135, 178, 198, 165 ,  148, 116, 123, 148, 149, 198

	dc.w	45, 321, 7489, 45, 65, 12, 35, 135, 178, 198, 165 , 148, 116, 123, 148, 149, 198
	dc.w	145, 1321, 17489, 145, 165, 112, 135, 65, 48, 16, 23, 48, 49, 98


arrayEnd:


	END START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
