#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    movie: VideoCapture %../images/Homer.mp4;
    unless movie [quit]
    print ["Width :" w: get-property :movie CAP_PROP_FRAME_WIDTH]
    print ["Height:" h: get-property :movie CAP_PROP_FRAME_HEIGHT]
    print ["FPS   :" fps: get-property :movie CAP_PROP_FPS]
    print ["Frames:" nbFrames: to integer! get-property :movie CAP_PROP_FRAME_COUNT]
    print ["Format:" get-property :movie CAP_PROP_FORMAT]
    codec: get-property :movie CAP_PROP_FOURCC
    print ["Codec :" to string! reverse trim to binary! to integer! codec]
    
    frame: read :movie     ;first image
    imshow/name :frame  "Frame"
    ;print ["Position" get-property :movie CAP_PROP_POS_FRAMES]
    ;waitKey 0 
    ;--we use CAP_PROP_POS_FRAMES to go to the frames with the trackbar
    onTrackbar: func [val [integer!]][
    	set-property :movie CAP_PROP_POS_FRAMES  to decimal! val ;--we need a decimal value
    	read/into :movie :frame 
    	;print ["Frame" pos get-property :movie CAP_PROP_POS_MSEC]
        imshow/name :frame  "Frame"
    ]
    tb: createTrackbar/with "Position" "Frame" nbFrames - 1 system/contexts/user 'onTrackbar
    
	waitKey 0
    print "closing.."
    free :movie
    print "done"
]