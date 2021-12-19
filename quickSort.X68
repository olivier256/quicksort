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
        move.w #6,-(sp)
        clr.w -(sp)
        pea -14(a5)
        bsr	__Z9quickSortPiii_part_0
        addq.l #8,sp
        clr.w d0
INF_LOOP:
	BRA	INF_LOOP



__Z9quickSortPiii_part_0:
        movem.l a2-a6/d2-d7,-(sp)
        move.l 48(sp),d6
        move.w 52(sp),d7
        move.w 54(sp),a5
        cmp.w a5,d7
        bge .L1
        move.w a5,a6
        move.l a6,d0
        add.l d0,d0
        move.l d6,a4
        add.l d0,a4
        lea __Z9quickSortPiii_part_0,a3
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
        blt .L4
        add.l d1,d1
        move.l d6,a0
        add.l d1,a0
.L6:
        tst.w d0
        ble .L5
        subq.w #1,d0
        cmp.w -(a0),d2
        blt .L6
.L5:
        cmp.w d4,d0
        ble .L7
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
        bge .L8
        move.w d5,-(sp)
        move.w d7,-(sp)
        move.l d6,-(sp)
        jsr (a3)
        addq.l #8,sp
.L8:
        move.w d5,d7
        addq.w #2,d7
        cmp.w a5,d7
        blt .L9
.L1:
        movem.l (sp)+,a2-a6/d2-d7
        rts





__Z9quickSortPiii:
        move.w 8(sp),d0
        move.w 10(sp),d1
        cmp.w d1,d0
        bge .L16
        bra __Z9quickSortPiii_part_0
.L16:
        rts
__Z9partitionPiiii:
        movem.l a2/d2-d7,-(sp)
        move.l 32(sp),d5
        move.w 36(sp),d1
        move.w 38(sp),d6
        move.w 40(sp),d3
        move.w d1,d0
        subq.w #1,d0
        ext.l d1
        add.l d1,d1
        move.l d5,a1
        add.l d1,a1
        move.w d6,d1
        move.w d6,d2
        ext.l d2
.L21:
        addq.w #1,d0
        move.l a1,a2
        move.w (a1)+,d4
        cmp.w d4,d3
        bgt .L21
        add.l d2,d2
        move.l d5,a0
        add.l d2,a0
.L24:
        tst.w d1
        ble .L23
        subq.w #1,d1
        cmp.w -(a0),d3
        blt .L24
.L23:
        cmp.w d1,d0
        bge .L25
        move.w d1,d2
        ext.l d2
        move.l d2,d7
        add.l d7,d7
        move.l d7,a0
        add.l d5,a0
        move.w (a0),-2(a1)
        move.w d4,(a0)
        bra .L21
.L25:
        ext.l d6
        add.l d6,d6
        move.l d5,a0
        add.l d6,a0
        move.w (a0),(a2)
        move.w d4,(a0)
        movem.l (sp)+,a2/d2-d7
        rts





__Z4swapPiii:
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

	END START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
