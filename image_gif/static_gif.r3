#!/usr/local/bin/r3
Rebol [
]
cv: import opencv

with cv [
	;--imread won't read any .gif: there is no codec for this (license problem)
	;--so we use Rebol for reading static gifs
	src: load %../images/sample.gif
	img: Matrix [:src/size CV_8UC3 :src/rgb]
	namedWindow win: "Gif"			;--create a window
    imshow/name img win    			;--show the image in the existing named window
    moveWindow win 260x20 			;--move the window into some location    	
    waitKey 0
	destroyWindow win
]