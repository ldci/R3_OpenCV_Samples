#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    movie: VideoCapture %../images/watershed.webm
    print ["Width :" w: get-property :movie CAP_PROP_FRAME_WIDTH]
    print ["Height:" h: get-property :movie CAP_PROP_FRAME_HEIGHT]
    print ["FPS   :" fps: get-property :movie CAP_PROP_FPS]
    print ["Frames:" nbFrames: to integer! get-property :movie CAP_PROP_FRAME_COUNT]
    print ["Format:" get-property :movie CAP_PROP_FORMAT]
    delay: 1.0 / fps
    minutes: to integer! nbFrames / fps / 60
    seconds: nbFrames / fps % 60
    ms: rejoin [form minutes ":" form seconds]
    print["Duration [M:S]:" ms]
    unless movie [quit]
    frame: read :movie      ? frame ;; should be a cvMat handle
    if frame [
    	count: 1
        forever [
        	print ["Frame: " count]
        	print ["MS" get-property :movie CAP_PROP_POS_MSEC]
        	if count = nbFrames [break]
            read/into :movie :frame ;; reusing existing frame
            imshow :frame
            k: pollKey            ;; check if there was any key pressed
            if k = 27 [break]     ;; exit on ESC key
            wait delay             ;; let Rebol breath as well
            count: count + 1
        ]  
    ]
   	waitKey 0
    print "closing.."
    free :movie
    print "done"
]