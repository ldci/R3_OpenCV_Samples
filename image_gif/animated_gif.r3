#!/usr/local/bin/r3
Rebol [
]
;--animated gif is considered as a movie
cv: import opencv		;--import Rebol-OpenCV extension
with cv [
    movie: VideoCapture %../images/dance.gif
    unless movie [quit]
    ;--get some information about the gif file
    print ["Width :" w: get-property :movie CAP_PROP_FRAME_WIDTH]
    print ["Height:" h: get-property :movie CAP_PROP_FRAME_HEIGHT]
    print ["FPS   :" fps: get-property :movie CAP_PROP_FPS]
    print ["Frames:" nbFrames: to integer! get-property :movie CAP_PROP_FRAME_COUNT]
    print "ESC to close animation"
    delay: 1.5 / fps
    count: 0
    frame: read :movie ;--first image 
    imshow :frame 
    forever [
        read/into :movie :frame ;--no need to create a new matrix for each frame
        setWindowTitle "Image" join "Frame: " count + 1 ;--Redbol languages are one-based
        imshow :frame 
        wait delay        
        count: count + 1
        ;--when we are at the end of the gif go back to first image
        if count = nbFrames [set-property :movie CAP_PROP_POS_FRAMES 0 count: 0]
        k: pollKey           
    	if k = 27 [break]  
    ]  
   	waitKey 0
    print "closing.."
    destroyAllWindows
    free :movie ;--we must free the memory: no GC for VideoCapture 
    print "done"
]