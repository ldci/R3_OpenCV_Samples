#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	img: imread/with %../images/mandrill.jpg IMREAD_GRAYSCALE
	namedWindow  srcImg: "Source"
	namedWindow  testImg: "Result"
	;--1 channel image
	print ["mat size    :" size: get-property img MAT_SIZE]
    print ["mat type    :" type: get-property img MAT_TYPE]
    print ["mat depth   :" depth: get-property img MAT_DEPTH]
    print ["mat channels:" channels: get-property img MAT_CHANNELS]
	print lf
	;--3 channels image
	result: Matrix [:size CV_8UC3] 
	cvtColor :img :result COLOR_GRAY2RGB
	print ["mat size    :" size: get-property result MAT_SIZE]
    print ["mat type    :" type: get-property result MAT_TYPE]
    print ["mat depth   :" depth: get-property result MAT_DEPTH]
    print ["mat channels:" channels: get-property result MAT_CHANNELS]
    
	moveWindow srcImg 0x10
	moveWindow testImg 260x10
	imshow/name img srcImg
	imshow/name result testImg
	
	waitKey 0
    destroyAllWindows
]
