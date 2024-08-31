#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's code

comment [
borderMode
BORDER_CONSTANT: 0
BORDER_REPLICATE: 1
BORDER_REFLECT: 2
BORDER_WRAP: 3
BORDER_REFLECT_101: 4
BORDER_TRANSPARENT: 5
BORDER_ISOLATED: 16
]

borderMode: 1
kSize: 1x1
cv: import opencv
with cv [
	showResult: does [
		read/into :cam :frame                       ;--reusing existing frame
        resize/into :frame 25% :frame             	;--resize input frame by 25% (reusing existing cvMat)
        blur/border :frame :dst :kSize :borderMode	;--blur the frame using kernel of kSize pixels and border mode
        imshow/name :dst "Blur"
    ]
    
	onTrackbar: func [val [integer!]][
    	if val = 0 [val: 1] 
    	kSize: as-pair val val
    	showResult
    ]
    
	print "ESC-key to close"
    cam: VideoCapture 0   
    unless cam [quit]
    frame: read :cam      
    dst:  Matrix :frame
    imshow/name dst "Blur"
    moveWindow "Blur" 500x100    
    
    tb: createTrackbar/with "Blurring:" "Blur" 1 system/contexts/user 'onTrackbar
    setTrackbarMin tb 1 setTrackbarMax tb 127
    
    if frame [
        forever [
            showResult
            k: pollKey            ;; check if there was any key pressed
            if k = 27 [break]     ;; exit on ESC key
            wait 0.01             ;; let Rebol breath as well
        ]
        destroyAllWindows
    ]
    print "closing.."
    free :cam
    print "done"
]