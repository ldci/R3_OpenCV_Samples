#!/usr/local/bin/r3
Rebol [
]

comment [
possible mode 
THRESH_BINARY: 0
THRESH_BINARY_INV: 1
THRESH_TRUNC: 2
THRESH_TOZERO: 3
THRESH_TOZERO_INV: 4
]

mode: 2
tValue: 0
tMax: 255

cv: import opencv
with cv [
	onTrackbar: func [val [integer!]][
    	tvalue: val
    	threshold :img :thresh :tValue :tMax :mode
    	imshow/name :thresh "Range"
    ]
	print "Any Key to close"
	img: imread %../images/lena.jpg			;--read image as matrix
	thresh: Matrix :img						;--new matrix
	imshow/name :img "Source"
	imshow/name :thresh "Range"
	moveWindow  "Source" 100x0
    moveWindow  "Range"  400x0
    
    tb: createTrackbar/with "Low:" "Range" 255 system/contexts/user 'onTrackbar
    setTrackbarMin tb 0
    setTrackbarMax tb 255
    setTrackbarPos tb 127
    waitKey 0
    destroyAllWindows
]