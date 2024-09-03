#!/usr/local/bin/r3
Rebol [
]

;--"RBG color to YIQ conversion"
;--Home made tests

cv: import opencv

with cv [
	print "Any Key to close"
	img: imread/with %../images/lena.jpg IMREAD_COLOR
	size: get-property img MAT_SIZE
	vect: get-property img MAT_VECTOR
	
	;--RGB->YIQ
	m1: copy [] 
	foreach [r g b] vect [
		r: r / 255.0 g: g / 255.0 b: b / 255.0		;--[0:1] normalization
		Y: (r * 0.299) + (g * 0.587) + (b * 0.114)
		I: (r * 0.596) - (g * 0.275) - (b * 0.321)
		Q: (r * 0.212) - (g * 0.523) + (b * 0.311)
		append append append m1 Y I Q
	]
	
	;--YIQ->RGB
	m2: copy []
	foreach [Y I Q ] m1 [
		r: Y + (I * 0.956) + (Q * 0.619)
		g: Y - (I * 0.272) - (Q * 0.647)
		b: Y - (I * 1.106) + (Q * 1.703)
		append append append m2 r g b
	]
	;--RGB->YIQ
	vec: make vector! compose [decimal! 32 (length? m1)]
	repeat i length? m1 [vec/:i: m1/:i]	
	mat1: Matrix [CV_32FC3 :size :vec]
	
	;--YIQ->RGB
	vec: make vector! compose [decimal! 32 (length? m2)]
	repeat i length? m2 [vec/:i: m2/:i]	
	mat2: Matrix [CV_32FC3 :size :vec]
	
	;--show matrices
	imshow/name img  "Source"
	imshow/name mat1 "RGB->YIQ"
	imshow/name mat2 "YIQ->RGB"
	moveWindow "Source" 0x0
	moveWindow "RGB->YIQ" 300x0
	moveWindow "YIQ->RGB" 600x0
	waitKey 0
]
