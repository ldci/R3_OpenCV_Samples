#!/usr/local/bin/r3
Rebol [
]
;--Oldes's sample
cv: import opencv
with cv [
    cam: VideoCapture 0  ? cam   ;; should be a cvVideoCapture handle
    print get-property cam CAP_PROP_FRAME_WIDTH
    print get-property cam CAP_PROP_FRAME_HEIGHT
    set-property cam CAP_PROP_FRAME_WIDTH 640.0
    set-property cam CAP_PROP_FRAME_HEIGHT 480.0
    unless cam [quit]
    frame: read :cam      ? frame ;; should be a cvMat handle
    if frame [
        forever [
            read/into :cam :frame ;; reusing existing frame
            imshow :frame
            k: pollKey            ;; check if there was any key pressed
            if k = 27 [break]     ;; exit on ESC key
            wait 0.01             ;; let Rebol breath as well
        ]  
    ]
    print "closing..."
    free :cam
    print "done"
]