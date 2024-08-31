#!/usr/local/bin/r3
Rebol [
]
imgSize: 640x480
kSize: 1x1
cv: import opencv
with cv [
	showResult: does [
		read/into :cam :frame
        frame: resize/with :frame imgSize INTER_NEAREST_EXACT
        gaussianBlur :frame :dst kSize 0 0
        cvtColor :dst :gray COLOR_BGR2GRAY
        Laplacian :gray :dst CV_16S 3 1 0
        convertScaleAbs :dst :dst 1 0
        imshow/name :dst "Filter"
	]
	onTrackbar: func [val [integer!]][
    	if val = 0 [val: 1] 
    	if odd? val [kSize: as-pair val val] ;--odd value required for kSize
    	showResult
    ]
    
	print "ESC-key to close"
    cam: VideoCapture 0
    set-property cam CAP_PROP_FRAME_WIDTH imgSize/x
    set-property cam CAP_PROP_FRAME_HEIGHT imgSize/y
    frame: read :cam ;; first frame, so I can prepare the other reusable matrices
    gray: Matrix :frame
    dst:  Matrix :frame
    imshow/name dst "Filter"
    moveWindow "Filter" 500x100
    tb: createTrackbar/with "Threshold:" "Filter" 1 system/contexts/user 'onTrackbar
    setTrackbarMin tb 1 setTrackbarMax tb 15
    
    forever [
        showResult
        if 27 = waitkey 10 [break]
    ]
    ;--clean memory
    print "Closing..."
    free :cam
    print "Done"
]