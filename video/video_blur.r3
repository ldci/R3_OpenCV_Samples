#!/usr/local/bin/r3
Rebol [
]
;--Oldes's code
cv: import opencv
with cv [
    cam: VideoCapture 0   ? cam   ;; should be a cvVideoCapture handle
    unless cam [quit]

    frame: read :cam      ? frame   ;; should be a cvMat handle
    dst:  Matrix :frame
    frame-sc: resize :frame 25%     ;; creates new scaled cvMat handle
    if frame [
        forever [
            read/into :cam :frame                        ;; reusing existing frame
            resize/into :frame 25% :frame-sc             ;; resize input frame by 25% (reusing existing cvMat)
           	blur/border :frame-sc dst 16x16 BORDER_REPLICATE ;; blur the frame using kernel of size 64x64 pixels
            imshow :dst;frame-sc
            k: pollKey            ;; check if there was any key pressed
            if k = 27 [break]     ;; exit on ESC key
            wait 0.01             ;; let Rebol breath as well
        ]
        destroyAllWindows
        ;; try to save the last resolved frame into a file...
        print "Saving the last frame into test images..."
        prin "test.jpg   " probe imwrite      %tmp/test.jpg   :frame
        prin "test_9.png " probe imwrite/with %tmp/test_9.png :frame [IMWRITE_PNG_COMPRESSION 9]
        prin "test_0.png " probe imwrite/with %tmp/test_0.png :frame [IMWRITE_PNG_COMPRESSION 0]
        prin "test.webp  " probe imwrite/with %tmp/test.webp  :frame [IMWRITE_WEBP_QUALITY 80]
    ]
    print "closing.."
    free :cam
    print "done"
]