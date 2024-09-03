#!/usr/local/bin/r3
Rebol [
]

alpha: 1.0										;--scale factor
cv: import opencv
with cv [
	onTrackbar1: func [val [integer!]][
    	mat: convertTo :img none CV_8U alpha negate val
    	imshow/name :mat "Source"
    ]
    
    onTrackbar2: func [val [integer!]][
    	mat: convertTo :img none CV_8U alpha val
    	imshow/name :mat "Source"
    ]

	filename: %../images/lena.jpeg					;--file name
	img: imread/with filename IMREAD_UNCHANGED		;--load image as is
	imshow/name img "Source"						;--show image 
	moveWindow "Source"  260x0						;--move image 			
	tb1: createTrackbar/with "Low:" "Source" 255 system/contexts/user 'onTrackbar1
	setTrackbarPos tb1 1 setTrackbarMin tb1 1
    tb2: createTrackbar/with "Hight:" "Source" 255 system/contexts/user 'onTrackbar2
    setTrackbarPos tb2 1 setTrackbarMin tb2 1
	print "Any Key to close"
	waitKey 0										;--any key to close
]
