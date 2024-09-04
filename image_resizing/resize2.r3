#!/usr/local/bin/r3
REBOL [
]
cv: import opencv 
with cv [
	src: imread/image "../images/mandrill.jpg" 
	reducedSize: src/size / 2
	namedWindow win: "Window"
	imshow/name src win
	waitKey 0
	resizeWindow win reducedSize
	imshow/name src win
	waitKey 0
	reducedSize: reducedSize / 2
	resizeWindow win reducedSize
	imshow/name src win
	waitKey 0
	reducedSize: reducedSize * 2
	resizeWindow win reducedSize
	imshow/name src win
	waitKey 0
	reducedSize: reducedSize * 2
	resizeWindow win reducedSize
	imshow/name src win
	waitKey 0
	reducedSize: reducedSize * 2
	resizeWindow win reducedSize
	imshow/name src win
	waitKey 0
	destroyAllWindows
]