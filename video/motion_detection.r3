#!/usr/local/bin/r3
Rebol [
]
;--Based on Oldes's code samples
kSize: 1x1
cv: import opencv
with cv [

	showResult: does [
		read/into :cam :frame1          			;--get first frame
        if 0 < waitKey 25 [break]       			;--wait some time
        read/into :cam :frame2          			;--get second frame
        absdiff :frame1 :frame2 :result 			;--compute absolute difference
        gaussianBlur :result :result kSize 0 0		;--Gaussian filter
        cvtColor :result :result COLOR_BGR2GRAY		;--Grayscale image
        imshow/name :result "Motion"            	;--display Grayscale image
	]
	
	onTrackbar: func [val [integer!]][
    	if val = 0 [val: 1] 
    	if odd? val [kSize: val]					;--odd value required
    	showResult
    ]
	
	;************************** Main Program ************************
    cam: VideoCapture 0								;--default camera
    unless cam [print "Failed to initialize VideoCapture" quit]
    
    frame1: read :cam       						;--first frame
    frame2: Matrix :frame1  						;--make matrices with the same size and type
    result: Matrix :frame1  						;--for reuse later
    cvtColor :result :result COLOR_BGR2GRAY			;--Grayscale image
    imshow/name :result "Motion"
    moveWindow "Motion" 300x10
    
    tb: createTrackbar/with "Threshold:" "Motion" 1 system/contexts/user 'onTrackbar
    setTrackbarMin tb 1 setTrackbarMax tb 127
    
    print "Press any key to quit."
    forever [ 
        showResult
        if 0 < waitkey 25 [break]
    ]
    destroyAllWindows
    
    free :cam  ;--release VideoCapture
]