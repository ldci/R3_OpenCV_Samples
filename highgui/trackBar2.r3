#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	imshow src: imread/with "../images/lena.jpg" IMREAD_GRAYSCALE 	;--load and display the original as grayscale
    res: Matrix :src                    								;--used to display modified source
    onTrackbar: func [val [integer!]][
    	threshold :src :res :val 255 THRESH_TOZERO						;--to zero threshold image (0..255) 
    	imshow :res
    ]
    tb: createTrackbar/with "Filter:" "Image" 255 system/contexts/user 'onTrackbar
	waitKey 0
]