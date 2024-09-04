#!/usr/local/bin/r3
Rebol [
]

;COLOR_RGB2YUV: 83
;COLOR_YUV2RGB: 85

cv: import opencv
with cv [
	img: imread/with %../images/mandrill.jpg IMREAD_COLOR
	namedWindow  srcImg: "Source"
	size: get-property img MAT_SIZE
	dst: Matrix [:size CV_8UC3]
	src: Matrix [:size CV_8UC3]
	cvtColor :img :dst COLOR_RGB2YUV  
	cvtColor :dst :src COLOR_YUV2RGB 
	imshow/name img "Source"
	imshow/name dst "RGB->YUV"
	imshow/name src "YUV->RGB"
	moveWindow "Source" 0x0
	moveWindow "RGB->YUV" 300x0
	moveWindow "YUV->RGB" 600x0
	waitKey 0
]