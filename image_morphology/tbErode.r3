#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
comment
[MORPH_RECT: 0
MORPH_CROSS: 1
MORPH_ELLIPSE: 2
]

kSize: 2x2
shape: 0
cv: import opencv
with cv [
    src: imread "../images/mandrill.jpg"
    namedWindow win1: "Source"
    namedWindow win2: "Erosion"
    moveWindow win1 0x0
    moveWindow win2 320x0
    
    showResult: does [
    	kernel: getStructuringElement shape kSize -1x-1 	
   		dst: erode src none kernel -1x-1 1				
    	imshow/name src win1
    	imshow/name dst win2
    ]
    
    onTrackbar1: func [val [integer!]][ 
    	shape: val
    	showResult
    ]
    onTrackbar2: func [val [integer!]][ 
    	if val > 1 [kSize: as-pair val val]
    	showResult
    ]
    
    tb1: createTrackbar/with "Shape:" "Erosion" 2 system/contexts/user 'onTrackbar1
	tb2: createTrackbar/with "Erosion:" "Erosion" 1 system/contexts/user 'onTrackbar2
    setTrackbarMin tb2 1 setTrackbarMax tb2 64
    
    showResult
    waitKey 0
    destroyAllWindows
]