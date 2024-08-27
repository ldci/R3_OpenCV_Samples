#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's samples
;--bmp images test
filename: %../images/sample.bmp
cv: import opencv
with cv [
	mat: Matrix imread/image filename
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
	imshow/name mat "BMP Image" 
	;moveWindow "BMP Image" 10x50
	waitKey 0
	destroyWindow "BMP Image"
]

