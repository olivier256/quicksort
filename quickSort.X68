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
        move.l 4(sp),a1
        move.w 8(sp),a0
        move.l a0,d0
        add.l d0,d0
        lea (a1,d0.l),a0
        move.w (a0),d1
        move.w 10(sp),d0
        ext.l d0
        add.l d0,d0
        add.l d0,a1
        move.w (a1),(a0)
        move.w d1,(a1)
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
        bra .L3
.L5:
        cmp.w d2,d4
        bge .L7
        move.w d2,-(sp)
        move.w d4,-(sp)
        move.l d5,-(sp)
	bsr	swap		; SWAP
        addq.l #8,sp
.L3:
        addq.w #1,d4
        cmp.w (a2)+,d3
        bgt .L3
        move.w d2,a0
        move.l a0,d0
        add.l d0,d0
        move.l d0,a0
        add.l d5,a0
.L6:
        tst.w d2
        ble .L5
        subq.w #1,d2
        cmp.w -(a0),d3
        blt .L6
        bra .L5
.L7:
        move.w d6,-(sp)
        move.w d4,-(sp)
        move.l d5,-(sp)
        jsr	swap		; SWAP
        addq.l #8,sp
        move.w d4,d0
	movem.l (sp)+,a2-a3/d2-d6
        rts



__Z9quickSortPiii:
	movem.l	a2-a3/d2-d4,-(sp)        movem.l #14384,-(sp)
        move.l 24(sp),a2
        move.w 28(sp),d3
        move.w 30(sp),d2
        cmp.w d2,d3
        blt .L11
.L9:
        movem.l	(sp)+,a2-a3/d2-d4	; movem.l (sp)+,#3100
        rts
.L11:
        move.w d2,a0
	lsl.l	#1,d2
        move.w (a2,d2),-(sp)
	lsr.l	#1,d2
        move.w d2,-(sp)
        move.w d3,-(sp)
        move.l a2,-(sp)
        jsr __Z9partitionPiiii
        move.w d0,d4
        subq.w #1,d0
        move.w d0,-(sp)
        move.w d3,-(sp)
        move.l a2,-(sp)
        lea __Z9quickSortPiii,a3
        jsr (a3)
        move.w d2,-(sp)
        addq.w #1,d4
        move.w d4,-(sp)
        move.l a2,-(sp)
        jsr (a3)
        lea (26,sp),sp
        bra .L9



    END    START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
