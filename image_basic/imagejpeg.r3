#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's samples
;--jpeg images test
filename: %../images/lena.jpg
cv: import opencv
with cv [
	mat: imread filename
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
	imshow/name mat filename 
	moveWindow filename 10x50
	waitKey 0
	destroyWindow filename
]
