#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	img: imread/with %../images/taj-bfilter.jpg IMREAD_GRAYSCALE
	imshow/name :img "Source"
	moveWindow "Source" 100x0
	print get-property img MAT_TYPE
	vec: get-property img MAT_IMAGE
	size: get-property img MAT_SIZE
	print ["Mean:" mean img]
	print ["Mini Maxi:" minMaxLoc img]
	mini: first  minMaxLoc img
	maxi: second  minMaxLoc img
	minLoc: third  minMaxLoc img
	maxLoc: fourth  minMaxLoc img
	repeat i 10 [poke vec minLoc + as-pair i 0 yellow]
	repeat i 10 [poke vec minLoc + as-pair 0 i yellow]
	repeat i 10 [poke vec minLoc + as-pair i i yellow]
	repeat i 10 [poke vec maxLoc + as-pair i 0 red]
	repeat i 10 [poke vec maxLoc + as-pair 0 i red]
	repeat i 10 [poke vec maxLoc + as-pair i i red]
	;--????
	;change/dup at vec minLoc yellow 10x10
	;change/dup at vec maxLoc red 10x10
	gs: Matrix :vec
	imshow/name gs "Min Max"
	moveWindow "Min Max" 420x0
	print get-property gs MAT_TYPE
	waitKey 0
]