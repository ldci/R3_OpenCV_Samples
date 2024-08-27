#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
    cam: VideoCapture 0
    print get-property cam CAP_PROP_FRAME_WIDTH
    print get-property cam CAP_PROP_FRAME_HEIGHT
    set-property cam CAP_PROP_FRAME_WIDTH  640.0
    set-property cam CAP_PROP_FRAME_HEIGHT 480.0
    frame1: read :cam 	;--first frame, so we can prepare the other reusable matrices
    frame2: read :cam	;--second frame	
    gray1:  Matrix :frame1
    gray2:  Matrix :frame2
    dst:    Matrix :frame2
    
    forever [
        read/into :cam :frame1
        if 0 < waitKey 40 [break]
        read/into :cam :frame2
        cvtColor  :frame1 :gray1 COLOR_BGR2GRAY
        cvtColor  :frame2 :gray2 COLOR_BGR2GRAY
        absdiff   :gray1 :gray2 :dst
        threshold :dst :dst 0 255 THRESH_TOZERO
        imshow :dst
        if 0 < waitkey 40 [break]
    ]
    ;--clean memory
    free :cam  ;--release VideoCapture
    print "Done"
]