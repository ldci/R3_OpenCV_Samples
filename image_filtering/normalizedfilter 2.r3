#!/usr/local/bin/r3
Rebol [
]
;-- see https://docs.opencv.org/3.4/d4/dbd/tutorial_filter_2d.html 
cv: import opencv
with cv [
    src: imread "../images/lena.jpg"					;--use your own image
    dst: Matrix :src									;--create matrices from image
    anchor: -1x-1										;--kernel center by default																				
    delta: 0.0											;--default value
    ddepth: -1											;--output image depth as same as the input image
    ind: 0												;--counter for forever loop
    print "Press any key to stop the animation!"
    forever [
    	kernelSize: 3 + (2 * (ind % 5)) 				;--odd values in the range [3..11]
    	kSize2: to-integer kernelSize ** 2				;--update kernel size for a normalized filter
    	vec: make vector! reduce ['float! kSize2]		;--create Rebol vector 
    	vec: vec + (1.0 / kSize2)						;--update vector with normalized values		
    	kSize: as-pair kernelSize kernelSize			;--use a pair! for matrix creation	
    	kernel: Matrix [CV_32FC1 :kSize :vec]			;--create kernel 
    	filter2D :src :dst ddepth kernel anchor delta	;--call OpenCV filter2D 
    	imshow/name dst "Normalized Kernel"				;--show result
    	if 0 <= waitkey 500 [break]						;--exit if any key
    	++ ind											;--increment counter
    ]
    destroyAllWindows									;--close window
]