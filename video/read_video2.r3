#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    movie: VideoCapture %../images/Homer.mp4
    unless movie [quit]
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
    print ["Step : " seconds * 1000 / nbFrames]
  	pos: nbFrames / 2.0 ;--we need a decimal value 
    frame: read :movie     ;first image
    imshow :frame
    print ["Position" get-property :movie CAP_PROP_POS_FRAMES]
    print ["MS" get-property :movie CAP_PROP_POS_MSEC]
    waitKey 0 
    ;--half movie
    set-property :movie CAP_PROP_POS_FRAMES pos
    read/into :movie :frame      ? frame ;; should be a cvMat handle
    print ["Position" get-property :movie CAP_PROP_POS_FRAMES]
    print ["MS" get-property :movie CAP_PROP_POS_MSEC]
    imshow :frame
   	waitKey 0
   	;--returns to first image
   	pos: 0.0
   	set-property :movie CAP_PROP_POS_FRAMES pos
    read/into :movie :frame      ? frame ;; should be a cvMat handle
    print ["Position" get-property :movie CAP_PROP_POS_FRAMES]
    print ["MS" get-property :movie CAP_PROP_POS_MSEC]
    imshow :frame
    
    waitKey 0
    print "closing.."
    free :movie
    print "done"
]