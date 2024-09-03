#!/usr/local/bin/r3
Rebol [
]

;COLOR_RGB2YCrCb: 37
;COLOR_YCrCb2RGB: 39

cv: import opencv
with cv [
	img: imread/with %../images/lena.jpg IMREAD_COLOR
	size: get-property :img MAT_SIZE
	dst: Matrix [:size CV_8UC3]
	src: Matrix [:size CV_8UC3]
	cvtColor :img :dst COLOR_RGB2YCrCb  
	cvtColor :dst :src COLOR_YCrCb2RGB 
	imshow/name img "Source"
	imshow/name dst "RGB->YCrCb"
	imshow/name src "YCrCb->RGB"
	moveWindow "Source" 0x0
	moveWindow "RGB->YCrCb" 300x0
	moveWindow "YCrCb->RGB" 600x0
	waitKey 0
]