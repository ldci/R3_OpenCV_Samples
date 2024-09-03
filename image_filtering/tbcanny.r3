#!/usr/local/bin/r3
Rebol [
]

mini: 0
maxi: 255
cv: import opencv
with cv [
	showResult: does [
		edges: Canny :src none mini maxi			;--Canny filter (single channel 8-bit image)
    	result: Matrix :edges						;--new matrix
    	cvtColor :edges :result COLOR_GRAY2RGB 		;--RGB color space  (3 channels)
    	setWindowTitle "Canny" join join join join "[" mini "-" maxi "]"
    	imshow/name :result "Canny"
	]
	onTrackbar1: func [val [integer!]][mini: val showResult]
    onTrackbar2: func [val [integer!]][maxi: val showResult]
    src: imread/with "../images/lena.jpg" IMREAD_COLOR		
    imshow/name :src "Source"
    showResult
    moveWindow "Source" 0x0
    moveWindow "Canny" 300x60
    tb1: createTrackbar/with "Mini:" "Source" 255 system/contexts/user 'onTrackbar1
    tb2: createTrackbar/with "Maxi:" "Source" 255 system/contexts/user 'onTrackbar2
    setTrackbarPos tb1 1 setTrackbarPos tb2 255
    print "Any Key to close"
    waitKey 0
    destroyAllWindows
]

