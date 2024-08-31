#!/usr/local/bin/r3
Rebol [
]
;--Oldes's code
cv: import opencv
with cv [
    cam: VideoCapture 0
    unless cam [print "Failed to initialize VideoCapture" quit]
    if all [
        frame1: read :cam       ;; try to get the first frame
        frame2: Matrix :frame1  ;; make matrices with the same size and type
        result: Matrix :frame1  ;; for reuse later
    ][
        print "Press any key to quit."
        forever [ 
            read/into :cam :frame1          ;; get first frame
            if 0 < waitKey 50 [break]       ;; wait some time
            read/into :cam :frame2          ;; get second frame
            absdiff :frame1 :frame2 :result ;; compute absolute difference
            imshow :result                  ;; display it
            if 0 < waitKey 50 [break]       ;; for some time
        ]
        destroyAllWindows
    ]
     free :cam  ;; release VideoCapture
]