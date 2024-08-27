#!/usr/local/bin/r3
Rebol [
]
;--read and display a 3-channel 8-bit TIFF image with multi pages
;--use scrollbar to get access to pages
cv: import opencv
with cv [
    images: imreadmulti %../images/images.tiff 
	n: length? images  	        
	mat: Matrix :images/1
	imshow mat
    onTrackbar: func [val [integer!]][
    	setWindowTitle "Image" join "Page: " val
    	imshow images/:val
    ]
    ;--create the trackbar in the same window like the source image with the callback
    tb: createTrackbar/with "Page" "Image" n system/contexts/user 'onTrackbar
    setTrackbarMin tb 1
    waitKey 0  
    destroyAllWindows
]