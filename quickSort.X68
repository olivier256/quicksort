_swap:	macro
	movea.l	a0,a1
	ext.w	d0
	add.w	d0,d0
	adda.l	d0,a0
	ext.w	d1
	add.w	d1,d1
	adda.l	d1,a1

	move.w	(a0),d1
	move.w	(a1),(a0)
	move.w	d1,(a1)
	endm

    ORG    $0
START:

; https://franke.ms/cex/

_main:
        link	a5,#-16
        move.w #4,-14(a5)
        move.w #6,-12(a5)
        move.w #3,-10(a5)
        move.w #2,-8(a5)
        move.w #1,-6(a5)
        move.w #9,-4(a5)
        move.w #7,-2(a5)
        move.w #6,-(sp)
        clr.w -(sp)
        pea -14(a5)
        jsr __Z9quickSortPiii
        addq.l #8,sp
        clr.w d0

INF_LOOP:
	BRA	INF_LOOP



swap:
	movea.l	a0,a1
	ext.w	d0
	add.w	d0,d0
	adda.l	d0,a0
	ext.w	d1
	add.w	d1,d1
	adda.l	d1,a1

	move.w	(a0),d1
	move.w	(a1),(a0)
	move.w	d1,(a1)
        rts



__Z9partitionPiiii:
        movem.l a2-a3/d2-d6,-(sp)
        move.l 32(sp),d5
        move.w 36(sp),d0
        move.w 38(sp),d6
        move.w 40(sp),d3
        move.w d0,d4
        subq.w #1,d4
        ext.l d0
        add.l d0,d0
        move.l d5,a2
        add.l d0,a2
        move.w d6,d2
        bra.s	.L3
.L5:
        cmp.w d2,d4
        bge.s	.L7
	movea.l	d5,a0		; move.l d5,-(sp)
	move	d4,d0		; move.w d4,-(sp)
	move	d2,d1		; move.w d2,-(sp)
	_swap
.L3:
        addq.w #1,d4
        cmp.w (a2)+,d3
        bgt.s	.L3
        move.w d2,a0
        move.l a0,d0
        add.l d0,d0
        move.l d0,a0
        add.l d5,a0
.L6:
        tst.w d2
        ble.s	.L5
        subq.w #1,d2
        cmp.w -(a0),d3
        blt.s	.L6
        bra.s	.L5
.L7:
	movea.l	d5,a0
	move.w	d6,d1
	move.w	d4,d0
	_swap
        move.w d4,d0
	movem.l (sp)+,a2-a3/d2-d6
        rts



__Z9quickSortPiii:
        movem.l a2-a4/d2-d5,-(sp)
        move.l 32(sp),d5
        move.w 36(sp),d2
        move.w 38(sp),d4
        cmp.w d4,d2
        bge.s	.L9
        move.w d4,a2
        move.l a2,d0
        add.l d0,d0
        move.l d0,a2
        add.l d5,a2
.L11:
        move.w (a2),-(sp)
        move.w d4,-(sp)
        move.w d2,-(sp)
        move.l d5,-(sp)
	bsr	__Z9partitionPiiii
        move.w d0,d3
        subq.w #1,d0
        move.w d0,-(sp)
        move.w d2,-(sp)
        move.l d5,-(sp)
	bsr	__Z9quickSortPiii
        move.w d3,d2
        addq.w #1,d2
        lea (18,sp),sp
        cmp.w d4,d2
        blt.s	.L11
.L9:
        movem.l (sp)+,a2-a4/d2-d5
        rts


    END    START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
