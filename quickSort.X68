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
	movem.l	a2-a4/d2-d5,-(a7)

	move.l	a0,a2
	move.w	d0,d2
	move.w	d1,d3

.loop:
	cmp.w	d1,d0		; if (left - right >= 0)
	bge.s	.epilog

	move.w	(a0,d1),d4	; d4 = pivot

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

	bra.s	.loop


.epilog:
	movem.l (a7)+,a2-a4/d2-d5
	rts


; int partition(int *t, int left, int right, int pivot);
partition:
; IN
; a0	*t
; d0	left
; d1	right
; a1	pivot
	movem.l	a2-a3/d2-d6,-(sp)




	movem.l (sp)+,a2-a3/d2-d6
	rts


array:
	dc.w	4,6,3,2,1,9,7,6

    END    START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
