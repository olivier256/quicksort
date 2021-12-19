	ORG	0
START

_main:
        link	a5,#-16
        move.w #4,-14(a5)
        move.w #6,-12(a5)
        move.w #3,-10(a5)
        move.w #2,-8(a5)
        move.w #1,-6(a5)
        move.w #9,-4(a5)
        move.w #7,-2(a5)

;        move.w #6,-(sp)
;        clr.w -(sp)
;        pea -14(a5)

	move.l	a5,d6
	subi.l	#14,d6
	moveq	#0,d7
	movea.l	#6,a5



        bsr	quickSort
        addq.l #8,sp
        clr.w d0
INF_LOOP:
	BRA	INF_LOOP








; void quickSort(int *t, int left, int right);
quickSort:
; IN
; d6	*t
; d7	left
; a5	right
        movem.l a2-a6/d2-d7,-(sp)
;        move.l 48(sp),d6
;        move.w 52(sp),d7
;        move.w 54(sp),a5
        cmp.w a5,d7
        bge.s	.L1
        move.w a5,a6
        move.l a6,d0
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
        move.l a6,d1
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
;        move.w d5,-(sp)		; right	=> a5
;        move.w d7,-(sp)		; left	=> d7
;        move.l d6,-(sp)		; *t	=> d6
	exg	d5,a5
	bsr	quickSort
;        addq.l #8,sp
	exg	d5,a5
.L8:
        move.w d5,d7
        addq.w #2,d7
        cmp.w a5,d7
        blt .L9
.L1:
        movem.l (sp)+,a2-a6/d2-d7
        rts



	END START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
