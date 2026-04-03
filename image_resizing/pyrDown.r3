#!/usr/local/bin/r3
REBOL [
]
cv: import opencv 
with cv [
	src: imread/image "../images/mandrill.jpg" 
	namedWindow win: "Pyr Down"
	imshow/name src win
	print "Any key to start"
	waitKey 0
	reducedSize: src/size
	until [
		reducedSize: reducedSize / 2
		print ["Image size:" reducedSize]
		resizeWindow win reducedSize
		imshow/name src win
		waitkey 1000
		reducedSize = 8x8	;--any value >= 1x1
	]
	print "Any key to close"
	waitKey 0
]