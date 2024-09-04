#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	kSize: 1								;--Kernel size
	img: imread %../images/mandrill.jpg		;--read image as matrix
    dst:  Matrix img						;--make destination matrix
	namedWindow  src: "Source"				;--create source window
	namedWindow  lap: "Laplacian"			;--create destination windows
	moveWindow src 10x10					;--move source window
	moveWindow lap 270x10					;--move destination window
	Laplacian :img :dst CV_16S kSize 1 0	;--Laplacian filter
	convertScaleAbs :dst :dst 1 0			;--we need a 8-bit image
	imshow/name img src						;--show source window					
	imshow/name dst lap						;--show destination window
	process?: true
	print "Press any key to stop the animation!"
	;--kSize must be odd, > 0 and <=31
	forever [
		either process? [kSize: kSize + 2][kSize: kSize - 2]
		case [
			kSize <= 1 [process?: true]
			kSize >= 7 [process?: false]
		]
		Laplacian :img :dst CV_16S kSize 1 0
		convertScaleAbs :dst :dst 1 0
		imshow/name dst lap	
		if 0 <= waitkey 300 [break]
	]
	destroyAllWindows						;--clear all window		
]
