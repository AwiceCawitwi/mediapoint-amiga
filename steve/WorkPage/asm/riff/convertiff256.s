*
* File	: viewiff.s
* Uses	: viewiff.i viewbloknew.i
* Date	: July 1993
* Author: ing. C. Lieshout
* Desc	: Show an IFF picture ( easy converted IFF's with more than 8 planes )
*	: Based on the
*	: IFF reader by Cees Lieshout 14-april-1990
*	: MP transitions XaPP
*

PREFS = 0
LIBV39 = 39
LIBV36 = 36

	INCDIR "include:"
	INCLUDE "exec/execbase.i"
	INCLUDE "exec/funcdef.i"
	INCLUDE "exec/exec_lib.i"
	INCLUDE	"exec/memory.i"
	INCLUDE "graphics/gfxbase.i"
	INCLUDE	"dos/dos.i"
	INCLUDE "graphics/view.i"
	INCLUDE "graphics/rastport.i"
	INCLUDE "graphics/gfx.i"
	INCLUDE	"intuition/intuitionbase.i"
	INCLUDE "intuition/preferences.i"
	INCDIR	"wp:asm/"
	INCLUDE "viewbloknew.i"
	INCDIR	"wp:asm/riff/"
	INCLUDE	"viewiff.i"
	INCDIR	"wp:inclibs/"
	INCLUDE "dos_lib.i"
	INCLUDE "graphics_libv39.i"
	INCLUDE "intuition_lib.i"

	RSRESET
im_block:	rs.w	0
im_width:	rs.l	1
im_height:	rs.l	1
im_depth:	rs.w	1
im_width_bytes:	rs.l	1
im_planar:	rs.l	1
im_planar_size:	rs.l	1
im_rgb:		rs.l	1
im_rgb_size:	rs.l	1
im_modulo:	rs.l	1
im_planes:	rs.l	24
im_SIZEOF:	rs.w	0

COLSIZE = 4000

mode_old = 1005

	link	a5,#-db_SIZEOF
	
	movem.l	d0-d7/a0-a6,-(a7)
	sub.l	#db_SIZEOF,a5

	move.l	a5,a3

	movem.l	d0/a0,-(a7)
	move.l	a5,a0
	move.l	#db_SIZEOF-1,d0
rep_cl:
	move.b	#0,(a0)+
	dbf	d0,rep_cl
	movem.l	(a7)+,d0/a0

	subq	#1,d0
	beq.W	input_error
zoeken:
	cmp.b	#$20,(a0)+
	bne.s	gevonden
	dbra	d0,zoeken
	bra.W	input_error
gevonden:
	cmp.b	#'"',-1(a0)		; skip the '"' sign
	beq.b	found_cc
gev2:
	subq.l	#1,a0
	move.l	a0,db_filename_pointer(a3)
zet:	cmp.b	#10,(a0)
	beq.s	zetnul
	cmp.b	#' ',(a0)
	beq.s	zetnul2
	cmp.b	#'"',(a0)
	beq.b	zetnul2
	addq.l	#1,a0
	bra.s	zet

zetnul2:
	move.b	#0,(a0)	; maak van de spatie na de filenaam een nul
	addq.l	#1,a0

rep_comm:
	tst.b	(a0)
	beq.b	no_in
	cmp.b	#10,(a0)
	beq.b	no_in
	cmp.b	#'c',(a0)
	bne.b	no_loop
	move.b	#1,db_nostop(a3)
	bsr.w	get_number
	move.w	d0,db_waittofs(a3)
no_loop:
	addq.l	#1,a0
	bra.b	rep_comm
	
zetnul:
	move.b	#0,(a0)	; maak van de spatie na de filenaam een nul
	bra.s	no_in
*
* There is a '"' in the command line read filename until closing '"'
*
found_cc:
	move.l	a0,db_filename_pointer(a3)

cczet:	cmp.b	#10,(a0)
	beq.s	zetnul
	cmp.b	#'"',(a0)
	beq.b	zetnul2
	addq.l	#1,a0
	bra.s	cczet

	bra.b	no_in
	
start:
	link	a5,#-db_SIZEOF
	movem.l	d0-d7/a0-a6,-(a7)
	sub.l	#db_SIZEOF,a5
	move.l	a5,a3
	move.l	a5,a0
	move.l	#db_SIZEOF-1,d0
rep_cl2:
	move.b	#0,(a0)+
	dbf	d0,rep_cl2
	move.l	#filename,db_filename_pointer(a3)
	move.b	#0,db_nostop(a3)
	move.w	#50,db_waittofs(a3)
no_in:
	move.l	a7,db_easy_exit(a3)

	bsr.w	openlibs

	lea	db_fileblok1(a3),a0
	move.l	a0,db_inactive_fileblok(a3)
	move.l	#COLSIZE,d0
	move.l	$4.w,a6
	moveq	#MEMF_PUBLIC,d1
	jsr	_LVOAllocMem(a6)
	move.l	d0,db_waarcolors1(a3)
	beq	exit
	
;	lea	db_cop_colorsLOF(a3),a0
;	move.l	a0,db_waarcolors1(a3)

	IF PREFS
	bsr.w	setprefs
	ENDC
	bsr.w	set_view_structs

	move.l	db_filename_pointer(a3),a0
	bsr.w	laadfile

;	bsr.w	proces_file		; maak van de eerste file een viewblok

	bsr	init_im_block

	bsr	clear_im_block
	
	bsr.w	showpicture		; inactive -> active

	bsr.w	wacht_change

	moveq	#0,d7
	bra.w	exit

	rts

input_error:
	moveq	#1,d7
	bra.w	exit5
	
;filename:	dc.b	"pics:esther0",0
;filename:	dc.b	"pics:grab/petra1.512x580",0
;filename:	dc.b	"work:data/marlboro.24",0
filename:	dc.b	"a:24bit/satelite",0
	even

get_number:
	moveq	#1,d2
	moveq	#0,d0
rep_number:
	addq.l	#1,a0
	cmp.b	#'-',(a0)
	bne.b	no_minus
	neg.l	d2
	bra.b	rep_number
no_minus:
	moveq	#0,d1
	move.b	(a0),d1
	cmp.b	#'0',d1
	blt.b	exit_gn
	cmp.b	#'9',d1
	bgt.b	exit_gn
	sub.l	#'0',d1
	mulu	#10,d0
	add.l	d1,d0
	bra.b	rep_number
exit_gn:
	rts

col_block2:
	dc.w	0,0,0		; col 0 - R G B
	dc.w	128,0,0
	dc.w	0,128,0
	dc.w	128,128,0
	dc.w	0,0,128
	dc.w	128,0,128
	dc.w	0,128,128
	dc.w	128,128,128
	dc.w	-1

col_block:
	dc.w	0,0,0
	dc.w	160,160,160
	dc.w	80,80,80
	dc.w	255,255,255
	dc.w	128,0,128
	dc.w	255,64,160
	dc.w	224,0,0
	dc.w	96,32,0
	dc.w	255,96,0
	dc.w	90,160,8
	dc.w	255,224,0
	dc.w	0,128,0
	dc.w	0,208,0
	dc.w	0,192,192
	dc.w	0,96,255
	dc.w	0,0,160
	dc.w	-1
	rts
*
* The lookup table stores the matching color-pens for the high 2 bits of
* each red, green and red values.
* r7r6g7g6b7b6 thus being 64 entries
* each entry should have space for the total colormap ( just to be sure ) + 1
* each entry starts with a number indicating the number of different pens
* For this test a 64 * 17 = 1088 bytes are needed
* plus the table itself   = 256 * 4
*			  + 1344 bytes total
* ( a 256 lookup tabel would require 17472 bytes
*
create_lookup_table:
	lea	ltable(pc),a0	; pointer to lookup table	
	move.l	a0,a1
	add.l	#4*64,a1	; point to first free area
	moveq	#18,d0		; required space for color table
	moveq	#63,d7		; entries in the table
.rep_tt:
	move.l	a1,(a0)+
	move.b	#0,(a1)		; set entries in sub table on 0
	add.l	d0,a1		; next sub table
	dbf	d7,.rep_tt

; the table is ready now find for each color the table entry

	lea	ltable(pc),a0
	moveq	#0,d3		; pen number
	lea	col_block(pc),a2
	moveq	#15,d7		; number of colors - 1
.rep_cc:
	move.w	(a2)+,d0	; red
	add.w	#31,d0
	cmp.w	#255,d0
	ble	.no2
	move.w	-2(a2),d0
.no2:
	and.w	#$c0,d0		; only r7r6
	move.w	(a2)+,d1	; green
	add.w	#31,d1
	cmp.w	#$ff,d1
	ble	.no1
	move.w	-2(a2),d1
.no1:
	and.w	#$c0,d1		; only g7g6
	lsr.w	#2,d1
	or.w	d1,d0		; r7r6g7g6--------
	move.w	(a2)+,d1	; blue
	add.w	#31,d1
	cmp.w	#255,d1
	ble	.no3
	move.w	-2(a2),d1
.no3:
	and.w	#$c0,d1		; b7b6
	lsr.w	#4,d1
	or.w	d1,d0		; r7r6g7g6b7b6----
	move.l	0(a0,d0.w),a1
	moveq	#0,d1
	move.b	(a1),d1		; number of entries sofar	
	add.b	#1,(a1)		; add the one
	addq.w	#1,d1		; start with entry 0
	add.l	d1,a1
	move.b	d3,(a1)		; place pen number in table
	addq.w	#1,d3
	dbf	d7,.rep_cc

;
; The colors from the colormap are placed in the table
; now fill in the entries that have no pen numbers
;

	moveq	#0,d3
	lea	ltable(pc),a0	; pointer to lookup table	
	moveq	#63,d7		; entries in the table
.rep_tt2:
	move.l	(a0)+,a1
	cmp.b	#0,(a1)
	bne	.oke_tt
	move.b	#1,(a1)
	move.b	d3,1(a1)
.oke_tt:
	move.b	1(a1),d3
	dbf	d7,.rep_tt2

	rts

ltable:	blk.b	2500,0		; in the program for now

*
* Find the best color with a table
*
find_best_col2:
	lea	ltable(pc),a0
	move.w	#$c0,d3
	and.w	d3,d0
	and.w	d3,d1
	and.w	d3,d2
	lsr.w	#2,d1
	lsr.w	#4,d2
	or.w	d1,d0
	or.w	d2,d0
	move.l	0(a0,d0.w),a0
	cmp.b	#1,(a0)
	bne	.nono
	move.b	1(a0),d4
	rts

.nono:					; find the best match from entries
	IFNE	0
	move.b	(a0),d3
	addq.l	#1,a0
	subq.w	#1,d3
	lea	col_block(pc),a4
.rep_ac:
	move.b	(a0)+,d4
	add.w	d4,d4			; words
	move.w	d4,d5
	add.w	d4,d4
	add.w	d5,d4			; * 3

	move.w	0(a4,d4.w),d0		; compare this with the rgb values
	move.w	2(a4,d4.w),d1
	move.w	4(a4,d4.w),d2
	
	dbf	d3,.rep_ac
	ENDC
	move.b	#0,d4
	rts

*
* Find best pen by color RGB d0,d1,d2
*
find_best_col:
	movem.l	d5/d6,-(a7)
	moveq	#-1,d3
	move.w	#10000,a2
	moveq	#0,d4
	move.w	d0,d5
	move.w	d1,d6
	move.w	d2,d7
	lea	col_block(pc),a0
.rep_c:
	move.w	d5,d0
	move.w	d6,d1
	move.w	d7,d2
	addq.w	#1,d3
	cmp.w	#-1,(a0)
	beq	.exit_fb
	sub.w	(a0)+,d0
	move.w	d0,diffs
	tst.w	d0
	bpl	.no2
	neg.w	d0
.no2:
	sub.w	(a0)+,d1
	move.w	d1,diffs+2
	tst.w	d1
	bpl	.no1
	neg.w	d1
.no1:
	sub.w	(a0)+,d2
	move.w	d2,diffs+4
	tst.w	d2
	bpl	.no
	neg.w	d2
.no:
	add.w	d2,d0
	add.w	d1,d0
	cmp.w	d0,a2
	blt	.rep_c
	move.w	d0,a2
	move.w	d3,d4
	bra	.rep_c
.exit_fb:
	movem.l	(a7)+,d6/d5
	rts

diffs:	dc.w	0,0,0

test_cols:
	move.w	#200,d0
	move.w	#10,d1
	move.w	#200,d2
	bsr	find_best_col
	move.w	#200,d0
	move.w	#10,d1
	move.w	#200,d2
	bsr	find_best_col
	rts

convert_pens:
	bsr	create_lookup_table
	lea	imb(pc),a5
	move.l	im_planar(a5),a1	; destination pens
	move.l	im_rgb(a5),a4		; source rgb values
	move.l	im_width(a5),d7
	add.l	d7,d7
	move.l	d7,a6
	move.l	im_height(a5),d5
 	subq.l	#1,d5
.rep_rgb2:
	move.l	im_width(a5),d6
	subq.l	#1,d6			; number off pixels
.rep_rgb:
	move.l	im_width(a5),d7
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	move.b	0(a4,d7),d1
	add.l	d7,d7
	move.b	0(a4,d7),d2
	move.b	(a4)+,d0
	bsr	find_best_col2
	move.b	d4,(a1)+
	dbf	d6,.rep_rgb
	add.l	a6,a4			; source modulo
	dbf	d5,.rep_rgb2
	rts

convert_pens_dith:
	lea	imb(pc),a5
	move.l	im_planar(a5),a1	; destination pens
	move.l	im_rgb(a5),a4		; source rgb values
	move.l	im_width(a5),d7
	add.l	d7,d7
	move.l	d7,a6
	move.l	im_height(a5),d5
	subq.l	#1,d5
.rep_rgb2:
	move.l	im_width(a5),d6
	subq.l	#1,d6			; number off pixels
.rep_rgb:
	move.l	im_width(a5),d7
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	move.b	0(a4,d7),d1
	add.l	d7,d7
	move.b	0(a4,d7),d2
	move.b	(a4),d0
	bsr	find_best_col
	bsr	floyd
	addq.l	#1,a4
	move.b	d4,(a1)+
	dbf	d6,.rep_rgb
	add.l	a6,a4			; source modulo
	dbf	d5,.rep_rgb2
	rts

floyd:
	move.l	im_width(a5),d7
	move.w	diffs(pc),d0		; red difference
	move.l	a4,a2
	bsr	floyd_pen
	move.w	diffs+2(pc),d0		; green difference
	add.l	d7,a2
	bsr	floyd_pen
	move.w	diffs+4(pc),d0		; blue difference
	add.l	d7,a2
	bsr	floyd_pen
	rts	

floyd_pen:
	move.w	d0,d1
	lsl.w	#3,d1
	sub.w	d0,d1
	lsr.w	#4,d1
	add.b	d1,1(a2)
	bcc	.no1
	move.b	#255,1(a2)
.no1:
	move.w	d0,d1
	add.w	d1,d1
	add.w	d0,d1
	lsr.w	#4,d1
	add.b	d1,-1(a2,d7.w)
	bcc	.no2
	move.b	#255,-1(a2,d7.w)
.no2:
	move.w	d0,d1
	lsl.w	#2,d1
	add.w	d0,d1
	lsr.w	#4,d1
	add.b	d1,0(a2,d7.w)
	bcc	.no3
	move.b	#255,0(a2,d7.w)
.no3:
	lsr.w	#4,d0
	add.b	d0,1(a2,d7.w)
	bcc	.no4
	move.b	#255,1(a2,d7)
.no4:
	rts

clear_im_block
	lea	imb(pc),a5
	tst.l	im_planar(a5)
	beq	.no_plan
	move.l	$4.w,a6
	move.l	im_planar(a5),a1
	move.l	im_planar_size(a5),d0
	jsr	_LVOFreeMem(a6)
.no_plan:
	tst.l	im_rgb(a5)
	beq	.no_rgb
	move.l	$4.w,a6
	move.l	im_rgb(a5),a1
	move.l	im_rgb_size(a5),d0
	jsr	_LVOFreeMem(a6)
.no_rgb:
	rts

*
* Fill in the image block and allocate memory
*
init_im_block:
	lea	db_fileblok1(a3),a4
	lea	imb(pc),a5
	moveq	#0,d0

	move.l	d0,im_rgb(a5)
	move.l	d0,im_planar(a5)
	
	move.w	vb_lenx(a4),d0
	move.l	d0,im_width(a5)
	move.w	vb_leny(a4),d0
	move.l	d0,im_height(a5)
	moveq	#0,d0
	move.w	vb_planes(a4),d0
	move.w	d0,im_depth(a5)

; get memory for the planar data uncrunched 
; and for the rgb data

	move.l	im_width(a5),d0
	add.l	#15,d0
	lsr.l	#4,d0
	add.l	d0,d0			; width in bytes
	move.l	d0,im_width_bytes(a5)
	move.l	im_height(a5),d1
	mulu	d1,d0
	move.w	im_depth(a5),d1
	mulu	d1,d0	
	move.l	d0,im_planar_size(a5)
	move.l	#MEMF_PUBLIC,d1
	move.l	$4.w,a6
	jsr	_LVOAllocMem(a6)
	move.l	d0,im_planar(a5)	
	beq	init_error

	move.l	im_width(a5),d0
	move.l	im_height(a5),d1
	mulu	d1,d0
	move.l	d0,d1
	add.l	d0,d0
	add.l	d1,d0
	move.l	d0,im_rgb_size(a5)
	move.l	#MEMF_PUBLIC,d1
	move.l	$4.w,a6
	jsr	_LVOAllocMem(a6)
	move.l	d0,im_rgb(a5)
	beq	init_error

	lea	db_fileblok1(a3),a4
	move.l	vb_body_start(a4),a0
	move.l	im_planar(a5),a1

	cmp.b	#1,vb_compression(a4)
	beq.w	.un1

* compression geen 1 dus of 0 of een onbekende 
* copieer van body_start naar unpacked

	move.l	vb_unpacked_size(a4),d0

	lsr.l	#1,d0
	subq.l	#1,d0
	move.l	vb_body_start(a4),a0

.no_co:	move.w	(a0)+,(a1)+
	subq.l	#1,d0
	bpl.b	.no_co
	moveq	#0,d0
	rts

.un1:
	move.l	im_planar(a5),a6
	add.l	im_planar_size(a5),a6
.un_again:
	cmp.l	a6,a1
	bge.s	.un_end

	moveq	#0,d5
	move.b	(a0)+,d5
	bmi.b	.un_minus

.un_plu:
	move.b	(a0)+,(a1)+
	dbf	d5,.un_plu
	bra.s	.un_again

.un_minus:
	neg.b	d5
	move.b	(a0)+,d0

.un_rm:	move.b	d0,(a1)+
	dbf	d5,.un_rm
	bra.s	.un_again
.un_end:	

; the data is unpacked
; convert now to rgb values
	lea	im_planes(a5),a0
	move.l	im_planar(a5),d0
	move.l	im_width_bytes(a5),d1
	moveq	#23,d7
.rep_p:
	move.l	d0,(a0)+
	add.l	d1,d0
	dbf	d7,.rep_p

	move.l	im_width_bytes(a5),d0
	move.w	im_depth(a5),d1
	subq.w	#1,d1
	mulu	d1,d0
	move.l	d0,im_modulo(a5)

	move.l	im_rgb(a5),a6		; point to rgb data to be filled

	move.l	im_height(a5),d6
	subq.l	#1,d6
.rep_rgb1:
	lea	im_planes(a5),a0
	bsr	get_8planes		; get R data

	lea	im_planes+32(a5),a0
	bsr	get_8planes		; get G data

	lea	im_planes+64(a5),a0
	bsr	get_8planes		; get B data

	dbf	d6,.rep_rgb1

	bsr	convert_pens
	
	bsr	convert_to_planar

	moveq	#0,d0
	rts

convert_to_planar:
	move.l	a3,-(a7)
	lea	db_fileblok1(a3),a5
	move.l	vb_tempbuffer(a5),a0		; destination chipmem

	move.l	vb_breedte_x(a5),d0		; width one line in bytes
	lea	imb(pc),a5
	move.l	a0,a1
	add.l	d0,a1
	move.l	a1,a2
	add.l	d0,a2
	move.l	a2,a3
	add.l	d0,a3
	move.l	im_planar(a5),a6
	move.l	d0,d1
	add.l	d1,d1
	add.l	d0,d1
	move.l	d1,a4

	bsr	do_4planes3

	move.l	(a7)+,a3
	lea	db_fileblok1(a3),a5
	bsr	set_cols_planes

	lea	db_fileblok1(a3),a5
	bsr.w	maak_viewport		; de inactive view is nu klaar
	moveq	#0,d0
	rts

set_cols_planes:
	move.w	#4,vb_planes(a5)		; for RG & B
	lea.l	vb_colors(a5),a4
	move.l	db_waarcolors1(a3),a4
	lea	vb_colors(a5),a4
	move.l	#48,vb_color_count(a5)
	lea	col_block(pc),a0
.rep_c:
	move.w	(a0)+,d0
	cmp.w	#-1,d0
	beq	.ex_col
	and.w	#$f0,d0
	lsl.w	#4,d0
	move.w	(a0)+,d1
	and.w	#$f0,d1
	or.w	d1,d0
	moveq	#0,d1
	move.w	(a0)+,d1
	lsr.w	#4,d1
	or.w	d1,d0
	move.w	d0,(a4)+
	bra	.rep_c
.ex_col:
	rts
*
* Converted values to word to skip bits 7 - 4
*
do_4planes3:
	movem.l	a4/a5,-(a7)
;	move.l	(a6)+,a0
;	move.l	(a6)+,a1
;	move.l	(a6)+,a2
;	move.l	im_chunk(a4),a6

	move.l	im_height(a5),d6	
	subq.l	#1,d6
	move.l	im_width(a5),d7
;	move.l	ch_mod(a5),a4
.rep_y
	move.l	#0,a5
.rep_x:
	move.l	(a6)+,d0	; a b c d
	rol.w	#8,d0		; a b d c
	swap	d0
	rol.w	#8,d0		; d c b a
	move.l	(a6)+,d1	; a b c d
	rol.w	#8,d1		; a b d c
	swap	d1
	rol.w	#8,d1		; d c b a

	Move.L	#$f0f0f0f0,D4	; d4=$f0f0f0f0
	Move.L	D4,D5
	Not.L	D5

	Move.L	D0,D2
	And.L	D4,D2
	Move.L	D1,D3
	And.L	D5,D3
	LSL.L	#4,D0
	And.L	D4,D0
	Or.L	D3,D0

;	LSR.L	#4,D1
;	And.L	D5,D1
;	Or.L	D2,D1

	moveq	#0,d1		; forget 7-4 bits

	Swap	D0
	Move.W	D0,D2
	Move.W	D1,D0
	Move.W	D2,D1
	Swap	D0

	Move.w	#$cccc,d4	; d4=$CCCCCCCC
	Move.w	D4,D5
	Not.w	D5
	Move.w	D0,D2
	And.w	D4,D2
	Move.w	D1,D3
	And.w	D5,D3
	LSL.w	#2,D0
	And.w	D4,D0
	Or.w	D3,D0
	LSR.w	#2,D1
	And.w	D5,D1
	Or.w	D2,D1
	Move.w	#$ff00,d4	;d4=FF00FF00
	Move.w	D4,D5
	Not.w	D5
	Move.w	D0,D2
	And.w	D4,D2
	LSR.w	#8,D2
	Move.w	D1,D3
	And.w	D5,D3
	LSL.w	#8,D3
	And.w	D5,D0
	Or.w	D3,D0
	And.w	D4,D1
	Or.w	D2,D1
	Move.w	#$AAAA,D4
	Move.w	D4,D5
	Not.w	D5
	Move.w	D0,D2
	And.w	D4,D2
	Move.w	D1,D3
	And.w	D5,D3
	add.w	d0,d0
	And.w	D4,D0
	Or.w	D3,D0
	move.b	d0,(a0)+	; plane0
	Swap	D0
	LSR.L	#1,D1
	And.L	D5,D1
	RoR.L	#8,D0
	Or.L	D2,D1
	Swap	D0
	move.b	d0,(a2)+	; plane 2
	Move.B	D1,(a1)+	; plane 1
	Swap	D1
	RoR.L	#8,D1
	Swap	D1
	Move.B	D1,(a3)+	; plane 3

	addq.w	#8,a5	
	cmp.w	d7,a5
	blt	.rep_x
	add.l	a4,a0			; pointer to next line
	add.l	a4,a1
	add.l	a4,a2
	add.l	a4,a3
	dbf	d6,.rep_y	
	movem.l	(a7)+,a4/a5
	rts

	
get_planes_8:
	move.l	12(a0),a2
	move.b	(a2)+,d1	; plane 3	0003
	move.l	a2,12(a0)

	swap	d1		;		0300	

	move.l	28(a0),a2
	move.b	(a2)+,d1	; plane 7	0307
	move.l	a2,28(a0)

	rol.l	#8,d1		;		3070

	move.l	20(a0),a2
	move.b	(a2)+,d1	; plane 5	3075
	move.l	a2,20(a0)

	swap	d1		;		7530

	move.l	4(a0),a2
	move.b	(a2)+,d1	; plane 1	7531
	move.l	a2,4(a0)

	move.l	8(a0),a2
	move.b	(a2)+,d0	; plane 2	0002
	move.l	a2,8(a0)

	swap	d0		; 		0200

	move.l	24(a0),a2
	move.b	(a2)+,d0	; plane 6	0206
	move.l	a2,24(a0)

	rol.l	#8,d0		; 		2060

	move.l	16(a0),a2
	move.b	(a2)+,d0	; plane 4	2064
	move.l	a2,16(a0)

	swap	d0		; 		6420

	move.l	(a0),a2
	move.b	(a2)+,d0	; plane 0 	6420
	move.l	a2,(a0)
	rts

*
* in a0 the pointer to the planes
* in a6 the pointer to the chunk data
*
get_8planes:
	movem.l	a5,-(a7)
	move.l	im_width(a5),d7
	move.l	im_modulo(a5),a4
.rep_y:
	move.l	#0,a5
.rep_x:
	bsr	get_planes_8

; D0 = a2b2c2d2e2f2g2h2 a0b0c0d0e0f0g0h0
; D1 = a3b3c3d3e3f3g3h3 a1b1c1d1e1f1g1h1

	move.l	d1,d2
	and.l	#$aaaaaaaa,d2
	and.l	#$55555555,d1

; D1 = --b3--d3--f3--h3 --b1--d1--f1--h1
; d2 = a3--c3--e3--g3-- a1--c1--e1--g1--

	move.l	d0,d3

	and.l	#$aaaaaaaa,d0
	and.l	#$55555555,d3

; D0 = a2--c2--e2--g2-- a0--c0--e0--g0--
; D3 = --b2--d2--f2--h2 --b0--d0--f0--h0

	lsr.l	#1,d0

; D0 = --a2--c2--e2--g2 --a0--c0--e0--g0

	or.l	d2,d0

; D0 = a3a2c3c2e3e2g3g2 a1a0c1c0e1e0g1g0

	add.l	d1,d1

; D1 = b3--d3--f3--h3-- b1--d1--f1--h1--
	
	or.l	d3,d1

; D1 = b3b2d3d2f3f2h3h2 b1b0d1d0f1f0h1h0

	move.l	d1,d2
	and.l	#$00ff00ff,d2
	and.l	#$ff00ff00,d1

; D1 = b3b2d3d2f3f2h3h2 ---------------
; D2 = ---------------- b1b0d1d0f1f0h1h0

	move.l	d0,d3
	and.l	#$00ff00ff,d0
	and.l	#$ff00ff00,d3

; D0 = ---------------- a1a0c1c0e1e0g1g0
; D3 = a3a2c3c2e3e2g3g2 ----------------

	lsr.l	#8,d3

; D3 = ---------------- a3a2c3c2e3e2g3g2

	lsl.l	#8,d2
	
; D2 = b1b0d1d0f1f0h1h0 ----------------

	or.l	d2,d0
	or.l	d3,d1
	
; D0 = b1b0d1d0f1f0h1h0 a1a0c1c0e1e0g1g0
; D1 = b3b2d3d2f3f2h3h2 a3a2c3c2e3e2g3g2

	move.l	d1,d2
	and.l	#$33333333,d1
	and.l	#$cccccccc,d2

; D1 = ----d3d2----h3h2 ----c3c2----g3g2
; D2 = b3b2----f3f2---- a3a2----e3e2----

	move.l	d0,d3
	and.l	#$cccccccc,d0
	and.l	#$33333333,d3


; D0 = b1b0----f1f0---- a1a0----e1e0----
; D3 = ----d1d0----h1h0 ----c1c0----g1g0

	lsl.l	#2,d1

; D1 = d3d2----h3h2---- c3c2----g3g2----

	or.l	d3,d1
		
; D1 = d3d2d1d0h3h2h1h0 c3c2c1c0g3g2g1g0

	lsr.l	#2,d0

; D0 = ----b1b0----f1f0 ----a1a0----e1e0

	or.l	d2,d0
	
; D0 = b3b2b1b0f3f2f1f0 a3a2a1a0e3e2e1e0
; D1 = d3d2d1d0h3h2h1h0 c3c2c1c0g3g2g1g0

	swap	d0

; D0 = b3b2b1b0f3f2f1f0 a3a2a1a0e3e2e1e0 ---------------- ----------------

	move.w	d0,d2
	move.w	d1,d0
	move.w	d2,d1
	
; D0 = b3b2b1b0f3f2f1f0 a3a2a1a0e3e2e1e0 d3d2d1d0h3h2h1h0 c3c2c1c0g3g2g1g0

	swap	d0
	
; D0 = d3d2d1d0h3h2h1h0 c3c2c1c0g3g2g1g0 b3b2b1b0f3f2f1f0 a3a2a1a0e3e2e1e0

	move.l	d0,d3
	and.l	#$0f0f0f0f,d3
	and.l	#$f0f0f0f0,d0

	move.l	d1,d2
	and.l	#$0f0f0f0f,d2
	and.l	#$f0f0f0f0,d1
	
; D0 = d3d2d1d0-------- c3c2c1c0-------- b3b2b1b0-------- a3a2a1a0--------
; D3 = --------h3h2h1h0 --------g3g2g1g0 --------f3f2f1f0 --------e3e2e1e0

	lsr.l	#4,d0

	or.l	d1,d0
	lsl.l	#4,d2

	or.l	d2,d3
	
; D0 = --------d3d2d1d0 --------c3c2c1c0 --------b3b2b1b0 --------a3a2a1a0

	ror.w	#8,d0
	swap	d0
	ror.w	#8,d0

; D0 = abcd

	ror.w	#8,d3
	swap	d3
	ror.w	#8,d3

; d3 = efgh

	move.l	d0,(a6)+
	move.l	d3,(a6)+

	addq.w	#8,a5	
	cmp.w	d7,a5
	blt	.rep_x
	move.l	a4,d0
	add.l	d0,(a0)
	add.l	d0,4(a0)
	add.l	d0,8(a0)
	add.l	d0,12(a0)
	add.l	d0,16(a0)
	add.l	d0,20(a0)
	add.l	d0,24(a0)
	add.l	d0,28(a0)
	movem.l	(a7)+,a5
	rts

init_error:
	moveq	#-1,d0
	rts
	
imb:	blk.b	im_SIZEOF,0

openlibs:
	moveq	#0,d0
	move.l	d0,db_graphbase(a3)
	move.l	d0,db_dosbase(a3)
	move.l	d0,db_intbase(a3)

	move.l	$4,a6
	lea	dosnaam(pc),a1
	moveq	#0,d0
	jsr	_LVOOpenLibrary(a6)
	move.l	d0,db_dosbase(a3)
	beq.w	exit

	lea	graphname(pc),a1
	moveq	#0,d0
	move.l	$4,a6
	jsr	_LVOOpenLibrary(a6)
	move.l	d0,db_graphbase(a3)
	beq.w	exit

	IF PREFS
	move.l	$4,a6
	moveq	#0,d0
	lea.l	intui(pc),a1
	jsr	_LVOOpenLibrary(a6)
	move.l	d0,db_intbase(a3)
	beq.w	exit
	ENDC
	
	move.l	db_graphbase(a3),a6
	move.l	gb_ActiView(a6),db_oldview(a3)
	rts

dosnaam:	dc.b	'dos.library',0
graphname:	dc.b	'graphics.library',0
intui:		dc.b	'intuition.library',0
	even
*
* De bedoeling is dat hier in de locale structuren voor het scherm
* de globale bitmap rasinfo view en viewport structuur gezet moeten worden
*
set_view_structs:

	lea	db_fileblok1(a3),a5
	lea.l	db_view1(a3),a0
	move.l	a0,vb_vieww(a5)
	lea	db_viewport1(a3),a0
	move.l	a0,vb_viewportw(a5)
	lea	db_rasinfo1(a3),a0
	move.l	a0,vb_rasinfow(a5)		
	lea	db_bitmap1(a3),a0
	move.l	a0,vb_bitmapw(a5)
	rts

*
* unpack de file naar de inactive buffer en maak een viewport
* van de data die in de inactive file buffer staat
*
proces_file:
	lea	db_fileblok1(a3),a5

	cmp.w	#8,vb_planes(a5)
	ble.b	normal_unpack
	bsr.b	line_by_line
	bra.b	m_view
normal_unpack:

	bsr.w	unpack
	tst.w	d0
	bne.b	no_cando

m_view:
	lea	db_fileblok1(a3),a5
	bsr.w	maak_viewport		; de inactive view is nu klaar

	moveq	#0,d0
no_cando:
	rts

line_by_line:
	cmp.w	#24,vb_planes(a5)
	bne.b	no_24
	move.w	#6,db_skip_planes(a3)
	bra.b	line_by_linevar
no_24:
	cmp.w	#18,vb_planes(a5)
	bne.b	no_18
	move.w	#4,db_skip_planes(a3)
	bra.b	line_by_linevar
no_18:
	cmp.w	#12,vb_planes(a5)
	bne.b	no_12
	move.w	#2,db_skip_planes(a3)
	bra.b	line_by_linevar
no_12:
	rts

*
* Test a line by line unpack for 24 plane pictures
* The not AA version ( keep only 1 plane for each color
*
line_by_linevar:
	tst.b	db_aa_present(a3)
	bne.w	line_by_line_aa
	
	move.l	vb_body_start(a5),a0
	move.l	vb_tempbuffer(a5),a1
	move.l	a0,db_data_pointer(a3)
	move.l	a1,db_dest_pointer(a3)

	move.w	vb_leny(a5),d6
	subq.w	#1,d6
rep_leny:
	moveq	#2,d4			; for RGB
rep_1col:
	move.w	db_skip_planes(a3),d7
rep_planes:
	bsr.w	skipline
	dbf	d7,rep_planes
	bsr.w	decrunchline		; show the first line
	dbf	d4,rep_1col
	dbf	d6,rep_leny
	bsr.b	set_cols_3planes
	rts

set_cols_3planes:
	move.w	#3,vb_planes(a5)		; for RG & B
	lea.l	vb_colors(a5),a4
	move.l	db_waarcolors1(a3),a4
	lea	vb_colors(a5),a4
	move.l	#24,vb_color_count(a5)
	move.w	#$0000,(a4)+
	move.w	#$0800,(a4)+
	move.w	#$0080,(a4)+
	move.w	#$0880,(a4)+
	move.w	#$0008,(a4)+
	move.w	#$0808,(a4)+
	move.w	#$0088,(a4)+
	move.w	#$0fff,(a4)+
	rts

line_by_line_aa:
	sub.w	#1,db_skip_planes(a3)
	move.l	vb_body_start(a5),a0
	move.l	vb_tempbuffer(a5),a1
	move.l	a0,db_data_pointer(a3)
	move.l	a1,db_dest_pointer(a3)

	move.w	vb_leny(a5),d6
	subq.w	#1,d6
rep_lenyaa:
	moveq	#2,d4			; for RGB
rep_1colaa:
	move.w	db_skip_planes(a3),d7
rep_planesaa:
	bsr.w	skipline
	dbf	d7,rep_planesaa
	bsr.w	decrunchline
	bsr.w	decrunchline
	dbf	d4,rep_1colaa
	dbf	d6,rep_lenyaa
	bsr.b	set_cols_6planes
	rts

set_cols_6planes:
	lea	vb_colbytes(a5),a0
	move.w	#6,vb_planes(a5)		; for RG & B
	move.l	#192,vb_color_count(a5)
	
	moveq	#0,d0
	moveq	#63,d7
rep_cols_aa:
	move.b	#0,(a0)
	move.b	#0,1(a0)
	move.b	#0,2(a0)

	btst	#1,d0
	beq.b	no_colb2
	move.b	#$7f,2(a0)
no_colb2:
	btst	#0,d0
	beq.b	no_colb1
	or.b	#$80,2(a0)
no_colb1:
	btst	#3,d0
	beq.b	no_colg2
	move.b	#$7f,1(a0)
no_colg2:
	btst	#2,d0
	beq.b	no_colg1
	or.b	#$80,1(a0)
no_colg1:
	btst	#5,d0
	beq.b	no_colr2
	move.b	#$7f,(a0)
no_colr2:
	btst	#4,d0
	beq.b	no_colr1
	or.b	#$80,(a0)
no_colr1:
	addq.l	#3,a0
	addq.l	#1,d0
	dbf	d7,rep_cols_aa
	rts

*
* decrunch een regel
*
decrunchline:	
	move.l	db_data_pointer(a3),a0		; de crunch data

	move.l	db_dest_pointer(a3),a1
	move.l	a1,a2
	add.l	vb_breedte_x(a5),a2
	
	cmp.b	#1,vb_compression(a5)
	beq.s	dun1

* compression geen 1 dus of 0 of een onbekende 
* copieer van body_start naar unpacked

	move.l	vb_breedte_x(a5),d0
	lsr.l	#1,d0
	subq.l	#1,d0

dno_co:	move.w	(a0)+,d1
	move.w	d1,(a1)+
	dbf	d0,dno_co
	move.l	a0,db_data_pointer(a3)		; volgende regel data
	rts

dun1:

dun_again:	
	cmp.l	a2,a1
	bge.s	dun_end

	moveq	#0,d5
	move.b	(a0)+,d5
	bmi.b	dun_minus

dun_plu:	move.b	(a0)+,(a1)+
	dbf	d5,dun_plu
	bra.s	dun_again

dun_minus:
	neg.b	d5
	move.b	(a0)+,d0

dun_rm:	move.b	d0,(a1)+
	dbf	d5,dun_rm

	bra.s	dun_again
dun_end:	
	move.l	a0,db_data_pointer(a3)		; voor volgende lijn
	move.l	a1,db_dest_pointer(a3)
	rts

*
* skip een regel
*
skipline:	
	move.l	db_data_pointer(a3),a0		; de crunch data

	move.l	db_dest_pointer(a3),a1
	move.l	a1,a2
	add.l	vb_breedte_x(a5),a2
	
	cmp.b	#1,vb_compression(a5)
	beq.s	skipdun1

* compression geen 1 dus of 0 of een onbekende 
* copieer van body_start naar unpacked

	add.l	vb_breedte_x(a5),a0
	move.l	a0,db_data_pointer(a3)		; volgende regel data
	rts

skipdun1:

skipdun_again:	
	cmp.l	a2,a1
	bge.s	skipdun_end
	moveq	#0,d5
	move.b	(a0)+,d5
	bmi.b	skipdun_minus
skipdun_plu:
	addq.l	#1,d5
	add.l	d5,a0
	add.l	d5,a1
	bra.s	skipdun_again
skipdun_minus:
	neg.b	d5
	addq.l	#1,a0
skipdun_rm:
	addq.l	#1,d5
	add.l	d5,a1
	bra.s	skipdun_again
skipdun_end:	
	move.l	a0,db_data_pointer(a3)		; voor volgende lijn
	rts

* showpicture laat de inactive view zien
* en verandert deze naar de active view
* dit gebeurt ook met het fileblok
*
showpicture:
	lea		db_fileblok1(a3),a5
	move.l		db_graphbase(a3),a6
	move.l		vb_vieww(a5),a1
	jsr		_LVOLoadView(a6)

	rts

*
* laadfile leest de file in 
* de data pointer is a5 welke naar de filedata wijst
* a0 wijst naar de in de laden file
*
laadfile:
	move.l	a0,-(a7)

	move.l	db_inactive_fileblok(a3),a5
	move.b	#$0,vb_bitmapped(a5)
	move.l	(a7)+,a0

	move.l	a0,vb_filenaam(a5)

	move.w	#3,vb_color_count(a5)	; minimum colors ???
	move.b	#0,vb_bmhd_found(a5)
	move.b	#0,vb_body_found(a5)

	move.l	db_inactive_fileblok(a3),a5
	bsr.w	read_whole_file		; lees de file geheel in het geheugen ?

*****
go_check:
	move.l	db_inactive_fileblok(a3),a5
	bsr.w	check_chunks		; controleer chunks
	moveq	#1,d7
	cmp.b	#$ff,vb_bmhd_found(a5)	; is er een bmhd header zo niet exit
	bne.w	exit
	cmp.b	#$ff,vb_body_found(a5)
	bne.w	exit
	rts

	IF PREFS
setprefs:
	move.l	db_intbase(a3),a6
	move.l	db_waarcolors1(a3),a0
	move.l	#400,d0
	jsr	_LVOGetPrefs(a6)
	move.l	db_waarcolors1(a3),a0

	move.b	pf_ViewXOffset(a0),db_Xoff(a3)
	move.b	pf_ViewYOffset(a0),db_Yoff(a3)
	rts
	ENDC
*
* a0 points to the FORM
*
laadmem:
	move.l	db_inactive_fileblok(a3),a5

	move.l	a0,vb_packed(a5)

	cmp.l	#'FORM',(a0)+
	bne.b	mem_exit
	move.l	(a0),d0
	add.l	#8,d0

	move.l	d0,vb_packed_size(a5)
	move.w	#3,vb_color_count(a5)
	move.b	#0,vb_bmhd_found(a5)
	move.b	#0,vb_body_found(a5)
	bsr.b	go_check
	moveq	#0,d0
	rts

mem_exit:
	moveq	#-1,d0
	rts

*
* Convert vb_colbytes a5 to db_waarcolors
*
convert_colors:
	lea		vb_colbytes(a5),a1
	move.l		db_waarcolors1(a3),a0
	move.w		d0,(a0)+		; aantal kleuren
	move.w		#0,(a0)+		; vanaf kleur 0
	subq.w		#1,d0
rep_rgb1:

	moveq		#2,d7
rep_rgbcol1:
	move.b		(a1)+,d1
	move.b		d1,d2
	lsl.w		#8,d2
	move.b		d1,d2
	move.w		d2,d1
	swap		d1
	move.w		d2,d1
	move.l		d1,(a0)+
	dbf		d7,rep_rgbcol1	
	dbf		d0,rep_rgb1
	move.l		#0,(a0)+

	rts

*
* laad_kleuren zet de kleuren afhankelijk van het OS
* in a5 de pointer naar het viewblok
*
*
laad_kleuren:
	tst.b		db_aa_present(a3)
	beq.b		no_v39_2

	move.l		vb_color_count(a5),d0
	divu		#3,d0
	move.l		#256,d0
laad_kleuren2:
	tst.b		db_aa_present(a3)
	beq.b		no_v39_3

	bsr.b		convert_colors

	move.l		db_waarcolors1(a3),a1
	move.l		vb_viewportw(a5),a0

	move.l		vp_ColorMap(a0),d0
	move.l		db_graphbase(a3),a6
;	jsr		_LVOLoadRGB32(a6)
	jsr		-$372(a6)
	bra.b		goon_aa1

no_v39_2:

	move.l		vb_viewportw(a5),a0
	move.l		vp_ColorMap(a0),d0

	lea		vb_colors(a5),a1
	move.l		vb_color_count(a5),d0
	divu		#3,d0
	moveq		#32,d0
	cmp.l		#32,d0
	ble.b		no_pro_th6
	moveq		#32,d0
no_pro_th6:
	move.l		db_graphbase(a3),a6
	jsr		_LVOLoadRGB4(a6)

goon_aa1:
	rts
no_v39_3:
	cmp.l	#32,d0
	ble.b	no_pro_th4
	moveq	#32,d0
no_pro_th4:
	move.l		vb_viewportw(a5),a0
	lea		vb_colors(a5),a1
	move.l		db_graphbase(a3),a6
	jsr		_LVOLoadRGB4(a6)
	rts

FLIP_SIZE = 580

maak_viewport:

	bsr.w		free_memory_view

	move.l		db_graphbase(a3),a6
	move.w		gb_NormalDisplayColumns(a6),db_colums(a3)
	move.w		gb_NormalDisplayRows(a6),db_rows(a3)

	move.l		vb_vieww(a5),a1
	jsr		_LVOInitView(a6)

	move.l		vb_viewportw(a5),a0
	jsr		_LVOInitVPort(a6)

	move.l		vb_vieww(a5),a0
	move.l		vb_viewportw(a5),a1
	move.l		a1,v_ViewPort(a0)
	move.w		vb_mode(a5),v_Modes(a0)
	or.w		#V_LACE,v_Modes(a0)
	

	move.l		vb_bitmapw(a5),a0
	move.w		vb_planes(a5),d0		; depth

	move.l		vb_breedte_x(a5),d1		; breedte in bytes * 8
	mulu		vb_planes(a5),d1
	lsl.l		#3,d1				; width
	move.w		vb_leny(a5),d2			; height
	jsr		_LVOInitBitMap(a6)

	move.l		vb_bitmapw(a5),a0

	move.l		vb_tempbuffer(a5),d0

	move.l		d0,bm_Planes(a0)		; zet de bitplanes

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+4(a0)

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+8(a0)

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+12(a0)

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+16(a0)

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+20(a0)

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+24(a0)

	add.l		vb_breedte_x(a5),d0
	move.l		d0,bm_Planes+28(a0)

	move.l		vb_rasinfow(a5),a0		; initialiseer rasinfo
	move.l		vb_bitmapw(a5),a1
	move.l		a1,ri_BitMap(a0)
	move.w		#0,ri_RxOffset(a0)
	move.w		#0,ri_RyOffset(a0)
	move.l		#0,ri_Next(a0)

	move.l		vb_viewportw(a5),a0
	move.l		vb_rasinfow(a5),a1
	move.l		a1,vp_RasInfo(a0)

ttt2:
	move.w	vb_lenx(a5),d0
	move.w	vb_leny(a5),d1
	
	move.w		vb_lenx(a5),vp_DWidth(a0)
	move.w		vb_leny(a5),vp_DHeight(a0)
	move.w		vb_mode(a5),vp_Modes(a0)

	move.w	db_colums(a3),d1	; zet de offsets berekend uit de prefs offsets
	tst.b	vb_hires(a5)
	bne.b	hi1
	lsr.w	#1,d1
hi1:
	tst.b	vb_shires(a5)
	beq.b	no_shi4
	lsl.w	#1,d1
no_shi4:
	move.w	vb_lenx(a5),d0	; pref.offset-(breedte - normal.breedte)/2

; test de offset berekening met de byte lengte

	move.l	vb_breedte_x(a5),d0
	lsl.l	#3,d0

	sub.w	d1,d0
	asr.w	#1,d0
	neg.w	d0
	IF PREFS
	move.b	db_Xoff(a3),d1	; standaard breedte
	ext.w	d1
	ELSE
	moveq	#0,d1
	ENDC
	tst.b	vb_hires(a5)
	bne.b	hi2
	asr.w	#1,d1
hi2:
	tst.b	vb_shires(a5)
	beq.b	no_shi2
	asl.w	#1,d1
no_shi2:
	add.w	d1,d0
	move.w	d0,vp_DxOffset(a0)

ptt10:
	move.w	db_rows(a3),d1
	tst.b	vb_interlace(a5)
	beq.b	no_inter1
	lsl.w	#1,d1
no_inter1:
	move.w	vb_leny(a5),d0
	cmp.w	#FLIP_SIZE,d0
	ble.b	oke_check_size
	move.l	#FLIP_SIZE,d0
oke_check_size:
	sub.w	d1,d0
	asr.w	#1,d0

	neg.w	d0

	btst	#0,d0
	beq.b	no_onev1
	add.w	#1,d0
no_onev1:

	IF PREFS
	move.b	db_Yoff(a3),d1
	ext.w	d1
	ELSE
	moveq	#0,d1
	ENDC
	tst.b	vb_interlace(a5)
	beq.b	no_inter5
	asl.w	#1,d1
no_inter5:
	add.w	d1,d0
	tst.b	db_aa_present(a3)
	beq.b	no_aa1001
	add.w	#1,d0
no_aa1001:
	move.w		d0,vp_DyOffset(a0)	
	
	moveq		#32,d0
	tst.b		db_aa_present(a3)
	beq.b		no_aa51
	move.w		#256,d0
no_aa51:
	jsr		_LVOGetColorMap(a6)
	move.l		vb_viewportw(a5),a0
	move.l		d0,vp_ColorMap(a0)
	beq.w		no_colormap

	bsr.w		laad_kleuren

	move.l		vb_vieww(a5),a0
	move.l		vb_viewportw(a5),a1
	jsr		_LVOMakeVPort(a6)

	move.l		vb_vieww(a5),a1
	jsr		_LVOMrgCop(a6)
	rts

*
* Wait until the view changed or a mous button
*
wacht_change:
	tst.b	db_nostop(a3)
	beq.b	dostop

	move.w	db_waittofs(a3),d7
rep_ww:
	btst	#6,$bfe001
	beq.b	cleanexit
	move.l	db_graphbase(a3),a6
	jsr	_LVOWaitTOF(a6)
	dbf	d7,rep_ww
	rts
dostop:
	btst		#6,$bfe001
	beq.b		cleanexit
	move.l		db_graphbase(a3),a6
	move.l		vb_vieww(a5),a0
	move.l		a0,d0
	cmp.l		gb_ActiView(a6),d0	; is de view weg ?
	beq.b		wacht_change
	rts

cleanexit:
	tst.l		db_oldview(a3)			; is er een oldview
	beq.b		no_oldview
	move.l		db_oldview(a3),a1
	move.l		db_graphbase(a3),a6
	jsr		_LVOLoadView(a6)	; restore deze
	jsr		_LVOWaitTOF(a6)
no_oldview:
	rts

free_memory_view:
	move.l		db_graphbase(a3),a6
	move.l		vb_viewportw(a5),a0
	tst.l		vp_ColorMap(a0)
	beq.b		no_colormem

	move.l		vp_ColorMap(a0),a0
	jsr		_LVOFreeColorMap(a6)
	move.l		vb_viewportw(a5),a0
	clr.l		vp_ColorMap(a0)
no_colormem:
	move.l		vb_viewportw(a5),a0
	jsr		_LVOFreeVPortCopLists(a6)

	move.l		vb_vieww(a5),a0
	tst.l		v_LOFCprList(a0)
	beq.b		no_lofmem
	move.l		v_LOFCprList(a0),a0
	jsr		_LVOFreeCprList(a6)
	move.l		vb_vieww(a5),a0
	clr.l		v_LOFCprList(a0)
no_lofmem:

	move.l		vb_vieww(a5),a0
	tst.l		v_SHFCprList(a0)
	beq.b		no_shfmem
	move.l		v_SHFCprList(a0),a0
	jsr		_LVOFreeCprList(a6)
	move.l		vb_vieww(a5),a0
	clr.l		v_SHFCprList(a0)
no_shfmem:
no_colormap:
	moveq		#0,d0
	rts

unpack:	
	move.l	vb_body_start(a5),a0
	move.l	vb_tempbuffer(a5),a1

	cmp.b	#1,vb_compression(a5)
	beq.s	un1

* compression geen 1 dus of 0 of een onbekende 
* copieer van body_start naar unpacked

	move.l	vb_unpacked_size(a5),d0

	lsr.l	#1,d0
	subq.l	#1,d0
	move.l	vb_body_start(a5),a0

no_co:	move.w	(a0)+,(a1)+
	subq.l	#1,d0
	bpl.b	no_co
	moveq	#0,d0
	rts

un1:
	move.l	vb_tempbuffer(a5),a6
	add.l	vb_unpacked_size(a5),a6
un_again:	
	cmp.l	a6,a1
	bge.s	un_end

	moveq	#0,d5
	move.b	(a0)+,d5
	bmi.b	un_minus

un_plu:	move.b	(a0)+,(a1)+
	dbf	d5,un_plu
	bra.s	un_again

un_minus:
	neg.b	d5
	move.b	(a0)+,d0

un_rm:	move.b	d0,(a1)+
	dbf	d5,un_rm

	bra.s	un_again
un_end:	
	moveq	#0,d0
	rts
no_unpack:
	moveq	#-1,d0
	rts
*
*
*
check_chunks:
	movem.l	d0-d7/a0-a6,-(a7)
	move.l	vb_packed(a5),a1
	move.l	4(a1),d0		; file size
	lea	8(a1),a1
	move.l	a1,a2
	addq.l	#4,a1			; skip het ILBM sign
	add.l	d0,a2			; einde data
cchunks1:
	cmp.l	#"BMHD",(a1)
	bne.w	no_bmhd_proc
	move.b	#$ff,vb_bmhd_found(a5)
	clr.b	vb_hires(a5)
	clr.b	vb_interlace(a5)
	clr.b	vb_shires(a5)

	lea	8(a1),a6
	move.w	(a6),d1
	btst	#0,d1
	beq.b	no_funny_add
	addq.w	#1,d1
no_funny_add:
	move.w	d1,vb_lenx(a5)
	move.w	2(a6),vb_leny(a5)
	moveq	#0,d1
	move.w	vb_leny(a5),d1
	moveq	#0,d1
	move.b	8(a6),d1
	move.w	d1,vb_planes(a5)
	move.b	10(a6),vb_compression(a5)
	move.b	9(a6),vb_masking(a5)
	moveq	#0,d1
	moveq	#0,d2
	move.w	vb_lenx(a5),d1

	move.w	#0,vb_mode(a5)

	move.w	vb_lenx(a5),d1
	cmp.w	#370,d1
	ble.s	geen_hires
	move.b	#$FF,vb_hires(a5)
	move.w	#$8000,d2
geen_hires:
	move.w	vb_leny(a5),d1
	cmp.w	#390,d1
	ble.s	geen_lace
	move.b	#$ff,vb_interlace(a5)
	or.w	#$4,d2
geen_lace:
	move.w	d2,vb_mode(a5)
	
	move.l	a1,-(a7)
	bsr.w	unpack_init
	move.l	(a7)+,a1

	bra.w	continue_chunks

no_bmhd_proc:
	cmp.l	#"CAMG",(a1)
	bne.b	no_camg_proc	

	move.w	vb_mode(a5),d2
	move.w	10(a1),d0
	or.w	d0,d2			; rechtstreeks in het de mode-id
	and.w	#$8efd,d2		; oldstyle mask
	move.w	d0,d1
	and.w	#V_SUPERHIRES,d0
	beq.b	cno_shires
	move.b	#$ff,vb_shires(a5)
	and.w	#V_SUPERHIRES,d0
cno_shires:
	move.w	d1,d0
	and.w	#$8000,d0
	beq.b	cno_hires
	move.b	#$ff,vb_hires(a5)
	or.w	#$8000,d2
cno_hires:
	move.w	d1,d0
	and.w	#$4,d0
	beq.b	cno_lace
	move.b	#$ff,vb_interlace(a5)
	or.w	#$4,d2
cno_lace:
	move.w	d1,d0
	and.w	#$800,d0
	beq.b	cno_ham
	or.w	#$800,d2
cno_ham:
	move.w	d1,d0
	and.w	#$80,d0	
	beq.b	cno_half
	and.w	#$f7ff,d2	; clear het ham bit
cno_half:
	move.w	d2,vb_mode(a5)

no_camg_proc:
	cmp.l	#"CMAP",(a1)
	bne.b	no_cmap_proc

	lea	4(a1),a6
	move.l	(a6),vb_cmap_size(a5)
	move.l	(a6)+,d1

	move.l	d1,vb_color_count(a5)

* in d1 het aantal kleuren * 3

	lea.l	vb_colors(a5),a4

	move.l	a0,-(a7)
	lea	vb_colbytes(a5),a0		; store alle kleuren bytes
cmap4:
	moveq	#0,d3
	moveq	#0,d2
	move.b	(a6)+,d3
	move.b	d3,(a0)+
	lsl.w	#4,d3

	move.b	(a6)+,d3
	move.b	d3,(a0)+

	move.b	(a6)+,d2
	move.b	d2,(a0)+
	lsr.b	#4,d2
	and.b	#$f0,d3
	or.b	d2,d3
	move.w	d3,(a4)+
	subq.w	#3,d1
	bne.b	cmap4

	move.l	(a7)+,a0
	bra.b	continue_chunks

no_cmap_proc:

	cmp.l	#"BODY",(a1)
	bne.b	no_body_proc
	move.b	#$ff,vb_body_found(a5)
	lea	8(a1),a6
	move.l	a6,vb_body_start(a5)
	bra.w	continue_chunks

no_body_proc:
continue_chunks:
	add.l	4(a1),a1
	move.l	a1,d0
	btst	#0,d0
	beq.b	no_oneven2
	addq.l	#1,a1
no_oneven2:
	addq.l	#8,a1
	cmp.l	a2,a1
	blt.w	cchunks1
	move.l	#-1,a1
cchunks2:
	movem.l	(a7)+,d0-d7/a0-a6
	rts

unpack_init:
	moveq	#0,d0
	moveq	#0,d1
	move.w	vb_lenx(a5),d0
	move.w	d0,d1
	add.l	#15,d1
	lsr.l	#4,d1			; aantal words
	add.l	d1,d1			; aantal bytes
	move.l	d1,vb_breedte_x(a5)
	move.l	d1,d0
	lsl.w	#3,d1

	move.w	vb_leny(a5),d1
	mulu	d1,d0

	move.l	d0,d2
	moveq	#0,d0
	moveq	#0,d1	
	move.w	vb_planes(a5),d1
	cmp.w	#8,d1
	ble.b	no_24b
	move.w	#4,d1
	tst.b	db_aa_present(a3)
	beq.b	no_24b
	move.w	#6,d1
no_24b:
	cmp.b	#1,vb_masking(a5)
	bne.b	no_masking
	addq.w	#1,d1
no_masking:
	subq.w	#1,d1
mul_size:
	add.l	d2,d0
	dbf	d1,mul_size	
	moveq	#2,d7	

	move.l	d0,vb_unpacked_size(a5)
	move.l	d0,db_unpacked_size(a3)

	move.l	4,a6
	moveq	#2,d1
	jsr	_LVOAllocMem(a6)
	move.l	d0,db_unpacked(a3)
	beq.w	exit

	move.l	db_unpacked(a3),vb_tempbuffer(a5)
	rts

read_whole_file:
	moveq	#3,d7
	move.l	vb_filenaam(a5),d1
	move.l	#mode_old,d2
	move.l	db_dosbase(a3),a6
	jsr	_LVOOpen(a6)
	move.l	d0,vb_filehandle(a5)
	beq.w	exit
	move.l	d0,d1
	lea.l	vb_breedte_x(a5),a2
	move.l	a2,d2
	moveq	#8,d3
	move.l	db_dosbase(a3),a6
	jsr	_LVORead(a6)
	lea.l	vb_breedte_x(a5),a1
	moveq	#1,d7
	cmp.l	#'FORM',(a1)+
	bne.b	exit
	move.l	(a1),d0
	add.l	#8,d0
	move.l	d0,vb_packed_size(a5)

	moveq	#2,d7
	move.l	#$10000,d1
	move.l	4,a6
	jsr	_LVOAllocMem(a6)

	move.l	d0,vb_packed(a5)
	beq.b	exit
	move.l	d0,a0

	move.l	vb_filehandle(a5),d1
	moveq	#0,d2				; seek beginning
	moveq	#-1,d3
	move.l	db_dosbase(a3),a6
	jsr	_LVOSeek(a6)		

	move.l	vb_packed_size(a5),d3
	move.l	vb_packed(a5),d2
	move.l	vb_filehandle(a5),d1
	move.l	db_dosbase(a3),a6
	jsr	_LVORead(a6)		

* hele file nu in het geheugen 

	bsr.b	close_file
	moveq	#0,d0
	rts

close_file:
	move.l	db_dosbase(a3),a6
	move.l	vb_filehandle(a5),d1
	jsr	_LVOClose(a6)
	clr.l	vb_filehandle(a5)
	rts

exit:	
	move.l	db_waarcolors1(a3),a1
	move.l	#COLSIZE,d0
	move.l	$4.w,a6
	jsr	_LVOFreeMem(a6)
	clr.l	db_waarcolors1(a3)
	bsr.w	cleanexit
	move.l	db_easy_exit(a3),a7

	lea	db_fileblok1(a3),a5
	bsr.w	free_memory_view

	tst.l	db_unpacked(a3)
	beq.s	exit1
	move.l	db_unpacked(a3),a1
	move.l	db_unpacked_size(a3),d0
	move.l	$4,a6
	jsr	_LVOFreeMem(a6)
	clr.l	db_unpacked(a3)
exit1:	
	lea	db_fileblok1(a3),a5
	tst.l	vb_packed(a5)
	beq.s	exit221
	move.l	vb_packed(a5),a1
	move.l	vb_packed_size(a5),d0
	move.l	4,a6
	jsr	_LVOFreeMem(a6)
	clr.l	vb_packed(a5)
exit221:

	lea	db_fileblok1(a3),a5
	tst.l	vb_filehandle(a5)
	beq.s	exit21
	bsr.b	close_file
exit21:
	tst.l	db_graphbase(a3)
	beq.s	exit3
	move.l	db_graphbase(a3),a1
	move.l	$4,a6
	jsr	_LVOCloseLibrary(a6)
	clr.l	db_graphbase(a3)
exit3:
	IF PREFS
	tst.l	db_intbase(a3)
	beq.b	exit4c
	move.l	db_intbase(a3),a1
	move.l	$4,a6
	jsr	_LVOCloseLibrary(a6)
	clr.l	db_intbase(a3)
exit4c:
	ENDC
exit51:
	move.l	db_dosbase(a3),a1
	move.l	$4,a6
	jsr	_LVOCloseLibrary(a6)
	clr.l	db_dosbase(a3)
exit5:
	movem.l	(a7)+,d0-d7/a0-a6
	unlk	a5
	moveq	#0,d0
	rts
