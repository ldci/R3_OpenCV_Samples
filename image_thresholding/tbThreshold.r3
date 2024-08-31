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

mode: 0
tValue: 0
tMax: 255

cv: import opencv
with cv [
	showResult: does [
		thresh: threshold :gray none :tValue :tMax :mode
    	resize/into  :thresh 200% :thresh
    	imshow/name thresh win
	]
	onTrackbar1: func [val [integer!]][
    	tvalue: val
    	showResult
    ]
    onTrackbar2: func [val [integer!]][
    	tMax: val
    	showResult
    ]
	
	img: imread %../images/lena.jpg
	imshow/name img "Source"
	moveWindow  "Source"  100x0
	namedWindow win: "Thresholding"
	gray: cvtColor :img none COLOR_BGR2GRAY
    moveWindow  win  400x0
    
    tb1: createTrackbar/with "Min:" "Thresholding" 255 system/contexts/user 'onTrackbar1
    tb2: createTrackbar/with "Max:" "Thresholding" 255 system/contexts/user 'onTrackbar2
    setTrackbarMin tb1 0
    setTrackbarPos tb1 0
    setTrackbarPos tb2 255
    waitKey 0
    destroyAllWindows
]