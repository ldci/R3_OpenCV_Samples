#!/usr/local/bin/r3
REBOL [
]
;--based on Oldes's sample
cv: import opencv 
with cv [ 
	img: imread %../images/lena.jpg	;= this is a Rebol image, no handle 
	gray: cvtColor img none COLOR_BGR2GRAY 
	threshold :gray :gray 126 255 THRESH_BINARY 
	namedWindow  srcImg: "Source"
	namedWindow  resImg: "Result"
	moveWindow srcImg 0x10
	moveWindow resImg 260x10
	imshow/name img srcImg 	
	imshow/name gray resImg
	waitkey 0 
	destroyAllWindows
]

