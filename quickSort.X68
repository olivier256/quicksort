	ORG	0
START
_main:
        link a5,#-16
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
        bsr __Z9quickSortPiii_part_0
        clr.w d0
INF_LOOP:
	BRA.S	INF_LOOP



__Z9partitionPiiii:
        link	a5,#0
        movem.l a2/d2-d6,-(sp)
        move.l 8(a5),d5
        move.w 12(a5),d1
        move.w 14(a5),d6
        move.w 16(a5),d3
        move.w d1,d0
        subq.w #1,d0
        ext.l d1
        add.l d1,d1
        move.l d5,a1
        add.l d1,a1
        move.w d6,d1
        move.w d6,d2
        ext.l d2
.L2:
        addq.w #1,d0
        move.l a1,a2
        move.w (a1)+,d4
        cmp.w d4,d3
        bgt .L2
        add.l d2,d2
        move.l d5,a0
        add.l d2,a0
.L5:
        tst.w d1
        ble.s	.L4
        subq.w #1,d1
        cmp.w -(a0),d3
        blt .L5
.L4:
        cmp.w d1,d0
        bge.s	.L6
        move.w d1,d2
        ext.l d2
        move.l d2,d7
        add.l d7,d7
        move.l d7,a0
        add.l d5,a0
        move.w (a0),-2(a1)
        move.w d4,(a0)
        bra .L2
.L6:
        ext.l d6
        add.l d6,d6
        move.l d5,a0
        add.l d6,a0
        move.w (a0),(a2)
        move.w d4,(a0)
        movem.l (sp)+,a2/d2-d6
        unlk a5
        rts




__Z9quickSortPiii_part_0:
        link	a5,#0
        movem.l a2/d2-d5,-(sp)
        move.l 8(a5),d5
        move.w 12(a5),d2
        move.w 14(a5),d4
        cmp.w d4,d2
        bge.s	.L10
        move.w d4,a2
        move.l a2,d0
        add.l d0,d0
        move.l d0,a2
        add.l d5,a2
.L13:
        move.w (a2),-(sp)
        move.w d4,-(sp)
        move.w d2,-(sp)
        move.l d5,-(sp)
	bsr	__Z9partitionPiiii
        move.w d0,d3
        subq.w #1,d0
        lea (10,sp),sp
        cmp.w d0,d2
        bge.s	.L12
        move.w d0,-(sp)
        move.w d2,-(sp)
        move.l d5,-(sp)
	bsr	__Z9quickSortPiii_part_0
        addq.l #8,sp
.L12:
        move.w d3,d2
        addq.w #1,d2
        cmp.w d4,d2
        blt .L13
.L10:
        movem.l -28(a5),a2/d2-d5
        unlk a5
        rts



__Z9quickSortPiii:
        link	a5,#0
        move.w 12(a5),d0
        move.w 14(a5),d1
        cmp.w d1,d0
        bge .L17
        unlk a5
        bra __Z9quickSortPiii_part_0
.L17:
        unlk a5
        rts



__Z4swapPiii:
        link	a5,#0
        move.l 8(a5),a1
        move.w 12(a5),a0
        move.l a0,d0
        add.l d0,d0
        lea (a1,d0.l),a0
        move.w (a0),d1
        move.w 14(a5),d0
        ext.l d0
        add.l d0,d0
        add.l d0,a1
        move.w (a1),(a0)
        move.w d1,(a1)
        unlk a5
        rts

	END START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
