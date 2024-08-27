#!/usr/local/bin/r3
Rebol [
]
;--OLdes's code
cv: import opencv
with cv [
    cam: VideoCapture 0
    unless cam [print "Failed to initialize VideoCapture" quit]

    ;; resolve input frame size...
    size: as-pair get-property cam CAP_PROP_FRAME_WIDTH
                  get-property cam CAP_PROP_FRAME_HEIGHT

    print ["Input frame size:" size]

    if frame: read :cam [
        ;; initialize VideoWriter (when 0 is used as codec parameter, than the output will be MJPG)
        out: VideoWriter %tmp/out.avi 0 24 size
        unless out [print "Failed to initialize VideoWriter!" quit]

        ;; grab 100 frames maximum...
        loop 100 [ 
            read/into :cam :frame    ;; reusing existing frame
            write out :frame         ;; append the frame to the output video
            imshow :frame            ;; and also show it in the window
            if pollKey = 27 [break]  ;; exit on ESC key
            wait 0.01                ;; let Rebol breath as well
        ]
        destroyAllWindows
    ]
    free :cam
    print "done"
]