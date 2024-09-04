#!/usr/local/bin/r3
Rebol [
]
;--Oldes's sample
filename: %../images/mandrill.jpg
cv: import 'opencv
with cv [
	img: imread/image fileName			;--read as a Rebol image
	if img [
		namedWindow win: "Source"		;--create a window
    	imshow img             			;--show the image using default name
    	imshow/name img win    			;--show the image in the existing named window
    	moveWindow win 260x20 			;--move the window into some location    	
    	print "Press ESC in any window to close all of them!"
    	forever [
        	k: pollKey         			;--check if there was any key pressed
        	if k = 27 [break]  			;--exit on ESC key
       	 	wait 0.01          			;--let Rebol breath as well
    	]
	]
	destroyAllWindows
]
