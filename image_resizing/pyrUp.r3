#!/usr/local/bin/r3
REBOL [
]
cv: import opencv 
with cv [
	src: imread/image "../images/mandrill.jpg" 
	upSize: src/size
	namedWindow win: "PyrUP"
	resizeWindow win upSize
	imshow/name src win
	print "Any key to start"
	waitKey 0
	until [
		upSize: upSize * 2
		print ["Imagesize:" upSize]
		resizeWindow win upSize
		imshow/name src win
		waitkey 1000
		upSize = 1024x1024	;--any value
	]
	print "Any key to close"
	waitKey 0
]