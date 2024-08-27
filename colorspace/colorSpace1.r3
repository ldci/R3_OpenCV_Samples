#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
	img: imread %../images/taj-bfilter.jpg
	gre: cvtColor :img none COLOR_BGR2GRAY	;--grayscale image
	hls: cvtColor :img none COLOR_BGR2HLS	;--HLS image
	namedWindow  srcImg: "Source"
	namedWindow  greImg: "Grayscale"
	namedWindow  hlsImg: "HLS"
	moveWindow srcImg 0x10
	moveWindow greImg 300x10
	moveWindow hlsImg 600x10
	imshow/name img srcImg
	imshow/name gre greImg
	imshow/name hls hlsImg
	print "ESC key to close"
	forever [
        k: pollKey         	;--check if there was any key pressed
        if k = 27 [break]  	;--exit on ESC key
       	wait 0.01          	;--let Rebol breath as well
    ]
    destroyAllWindows
]
