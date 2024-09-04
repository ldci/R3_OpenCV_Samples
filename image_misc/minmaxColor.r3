#!/usr/local/bin/r3
REBOL [
]

cv: import opencv
with cv [
	tmp: imread/image %../images/baboon.jpg  ;--read as a Rebol image
	img: Matrix :tmp
	gs: Matrix :tmp
	
	cvtColor :img :gs COLOR_RGB2GRAY	;--minMaxLoc requires a single channel
	print get-property img MAT_TYPE
	print get-property gs MAT_TYPE
	imshow/name img "Source" 
	moveWindow "Source"  300x100
	
	print ["Mean:" mean img]
	print ["Mini Maxi:" minMaxLoc gs]
	mini: first  minMaxLoc gs
	maxi: second  minMaxLoc gs
	minLoc: third  minMaxLoc gs
	maxLoc: fourth  minMaxLoc gs
	change/dup at tmp minLoc white 10x10
	change/dup at tmp maxLoc red 10x10
	imshow/name tmp "Min Max"
	moveWindow "Min Max"  600x100
	waitKey 0
	destroyWindow "Source" 
]
