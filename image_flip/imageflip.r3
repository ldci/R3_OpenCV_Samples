#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
	filename: %../images/lena.tiff
	mat: imread/with filename 1	;--read as color image
	imshow/name mat filename 	;--display the image in the window with file name's title
	moveWindow filename 300x50	;--move window
	print "A key for flip"		;--flip tests
	waitKey 0													
	flip mat mat 0				;--down				
	imshow/name mat filename 
	waitKey 0
	flip mat mat 1				;--down and x
	imshow/name mat filename 
	waitKey 0
	flip mat mat -1				;--both axes
	imshow/name mat filename 
	waitKey 0
	destroyAllWindows 
]
