#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	onTrackbar1: func [val [integer!]][
    	mat: convertTo :img none CV_8U 1.0 - (val / 16) 0
    	imshow/name :mat "Source"
    ]
    
    onTrackbar2: func [val [integer!]][
    	mat: convertTo :img none CV_8U val 0
    	imshow/name :mat "Source"
    ]
    
	filename: %../images/lena.jpeg
	img: imread/with filename IMREAD_UNCHANGED
	imshow/name img  "Source" 
	moveWindow "Source"  260x0
	tb1: createTrackbar/with "Low Contrast:" "Source" 1 system/contexts/user 'onTrackbar1
	setTrackbarMin tb1 1 setTrackbarMax tb1 16 setTrackbarPos tb1 1
    tb2: createTrackbar/with "High Contrast:" "Source" 1 system/contexts/user 'onTrackbar2
    setTrackbarMin tb2 1 setTrackbarMax tb2 16 setTrackbarPos tb2 1
	waitKey 0
]