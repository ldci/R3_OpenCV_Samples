#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
    cam: VideoCapture 0
    set-property cam CAP_PROP_FRAME_WIDTH 640.0
    set-property cam CAP_PROP_FRAME_HEIGHT 480.0
    frame: read :cam ;; first frame, so I can prepare the other reusable matrices
    gray: Matrix :frame
    dst:  Matrix :frame
    
    forever [
        read/into :cam :frame
        gaussianBlur :frame :dst 5x5 0 0
        cvtColor :dst :gray COLOR_BGR2GRAY
        Laplacian :gray :dst CV_16S 3 1 0
        convertScaleAbs :dst :dst 1 0
        imshow :dst
        if 27 = waitkey 10 [break]
    ]
    ;--clean memory
    print "Closing..."
    free :cam
    print "Done"
]