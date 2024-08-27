#!/usr/local/bin/r3
Rebol [
]
cv: import opencv

with cv [
	print "Color Space Test"
	delay: 1000									;--1.0 sec
	img: imread %../images/taj-bfilter.jpg		;--read as matrix
	namedWindow  srcImg: "Source"				;--create source window
	namedWindow  cvtImg: "Color Conversion"		;--create destination window
	moveWindow srcImg 0x10						;--move window
	moveWindow cvtImg 310x10					;--move window
	
	;--for the first call we create a new cvt matrix
	cvt: cvtColor img none COLOR_BGR2GRAY	
	setWindowTitle cvtImg join "Color Space: " 'COLOR_BGR2GRAY	
	imshow/name img srcImg
	imshow/name cvt cvtImg
	waitKey delay
	
	;--then we use the created cvt matrix
	cvtColor :img :cvt COLOR_BGR2HLS
	setWindowTitle cvtImg join "Color Space: " 'COLOR_BGR2HLS	
	imshow/name cvt cvtImg
	waitKey delay
	
	cvtColor :img :cvt COLOR_RGB2HSV
	setWindowTitle cvtImg join "Color Space: " 'COLOR_RGB2HSV
	imshow/name cvt cvtImg
	waitKey delay
	
	cvtColor :img :cvt COLOR_RGB2XYZ
	setWindowTitle cvtImg join "Color Space: " 'COLOR_RGB2XYZ
	imshow/name cvt cvtImg
	waitKey delay
	
	cvtColor :img :cvt COLOR_RGB2Lab
	setWindowTitle cvtImg join "Color Space: " 'COLOR_RGB2Lab
	imshow/name cvt cvtImg
	waitKey delay
	
	cvtColor :img :cvt COLOR_RGB2Luv
	setWindowTitle cvtImg join "Color Space: " 'COLOR_RGB2Luv
	imshow/name cvt cvtImg
	waitKey delay
	
	cvtColor :img :cvt COLOR_BGR2BGRA
	setWindowTitle cvtImg join "Color Space: " 'COLOR_BGR2BGRA
	imshow/name cvt cvtImg
	
	print "Any key to quit"
	waitKey 0
	print "Done! Closing all windows"
	destroyAllWindows
	quit
]
