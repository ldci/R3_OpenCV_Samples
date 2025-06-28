#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	filename: %../images/mandrill.jpg
	mat: imread/with filename 2	;--read as grayscale image with one channel
	imshow/name mat filename 	;--display the image in the window with file name as title
	moveWindow filename 100x50	;--move window
	vect: get-property mat MAT_VECTOR   
	foreach [property value] query vect object! [
		printf [23] reduce [
			uppercase/part mold to-set-word property 1
			value          
		]
	]   
	print "A key to quit"		;--flip tests
	waitKey 0
]
