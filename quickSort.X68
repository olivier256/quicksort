    ORG    $0
START:

; https://franke.ms/cex/

_main:
	lea	array,a0
	moveq	#0,d0
	moveq	#6,d1
	bsr	quickSort

INF_LOOP:
	BRA	INF_LOOP



; void quickSort(int *t, int left, int right);
quickSort:
; IN
; a0	*t
; d0	left
; d1	right
	movem.l	a2/d2-d4,-(a7)

.loop:
	ext.w	d0
	ext.w	d1

	move.l	a0,a2		; a2 = t
	move.w	d0,d2		; d2 = left
	move.w	d1,d3		; d3 = right

	cmp.w	d3,d2		; if (left - right >= 0)
	bge.s	.epilog

	move.w	d3,d0
	add.w	d0,d0
	move.w	(a2,d0),d4	; d4 = pivot

	movea.l	a2,a0
	move.w	d2,d0
	move.w	d3,d1
	move.w	d4,a1
	bsr	partition
	move.w	d0,d4		; d4 = partitionPoint

	movea.l	a2,a0
	move.w	d2,d0
	move.w	d4,d1
	subq.w	#1,d1
	bsr	quickSort	; quickSort(t, left, partitionPoint - 1);

	move.w	d4,d0
	addq.w	#1,d0		; left = partitionPoint + 1;
	move.w	d3,d1

	bra.s	.loop


.epilog:
	movem.l (a7)+,a2/d2-d4
	rts





; int partition(int *t, int left, int right, int pivot);
partition:
; IN
; a0	*t
; d0	left
; d1	right
; a1	pivot
	movem.l	a2-a3/d2-d6,-(sp)

	ext.w	d0
	ext.w	d1

	movea.l	a0,a2		; a2 = *t
	move.l	a1,d4		; d4 = pivot
	ext.w	d4
	move.w	d0,d2		; d2 = left
	move.w	d1,d3		; d3 = right

	move.w	d1,d5		; d5 = rightPointer

.loop:

	movea.l	a2,a4		; a4 = t
	moveq	#0,d6
	move.w	d2,d6
	add.w	d6,d6		; d6
	adda.l	d6,a4		; a4 = t[left]
.loopLeft:
	cmp.w	(a4)+,d4
	bgt.s	.loopLeft
	suba.l	a2,a4
	move.l	a4,d2
	lsr.w	#1,d2
	subq	#1,d2		; left--;

	movea.l	a2,a4		; a4 = t
	moveq	#0,d6
	move.w	d5,d6
	add.w	d5,d6
	adda.l	d6,a4		; a4 = t[rightPointer]
.loopRight:
	cmpa.w	a4,a2
	bge.s	.endLoopRight
	cmp.w	-(a4),d4
	blt.s	.loopRight
.endLoopRight
	suba.l	a2,a4
	move.l	a4,d5
	lsr.w	#1,d5		; d5 = rightPointer

	cmp.w	d2,d5
	bgt.s	.swap1
	bra.s	.endLoop
.swap1:
	movea.l	a2,a0
	move.w	d2,d0
	move.w	d5,d1
	bsr	swap

	bra.s	.loop
.endLoop
	movea.l	a2,a0
	move.w	d2,d0
	move.w	d3,d1
	bsr	swap

	move.w	d2,d0

	movem.l (sp)+,a2-a3/d2-d6
	rts


; void swap (int *t, int i, int j);
swap:
; IN
; a0	*t
; d0	i
; d1	j
	ext.w	d0
	add.w	d0,d0
	ext.w	d1
	add.w	d1,d1
	movea.l	a0,a1
	adda.l	d0,a0		; a0 = t[i]
	adda.l	d1,a1		; a1 = t[j]
	move.w	(a0),d0
	move.w	(a1),(a0)
	move.w	d0,(a1)
	rts


	DS.B	$100-*
array:
	dc.w	4,6,3,2,1,9,7

    END    START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
