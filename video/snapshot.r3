#!/usr/local/bin/r3
Rebol [
]
cv: import opencv					;--we need opencv extension
with cv [
    cam: VideoCapture 0  			;--a cvVideoCapture handle on default cam
    print get-property cam CAP_PROP_FRAME_WIDTH
    print get-property cam CAP_PROP_FRAME_HEIGHT
    print "s to take a snapshot"
    print "q to quit"
    unless cam [quit]
    frame: read :cam       			;-- a cvMat handle
    if frame [
        forever [
            read/into :cam :frame 	;--reusing existing frame
            imshow :frame			;--show image
            k: pollKey            	;--check for key pressed
            ;--s key
            if k = 115 [
            	frame2: resize :frame 480x270		;--downsize frame by 4
            	imwrite %fullImage.jpg :frame		;--save fullImage
            	imwrite %reducedImage.jpg :frame2	;--save reduced image
            ]
            ;--q key
            if k = 113 [break]    ;--exit from the loop on q key
            wait 0.01             ;--wait before next frame
        ]  
    ]
    print "closing..."
    destroyAllWindows			;--clear windows
    free :cam					;--free cam
    print "done"
]


