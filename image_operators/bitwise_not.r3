#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	filename: %../images/mandrill.jpg
	mat: imread/with filename IMREAD_COLOR
	print ["mat type    :" get-property mat MAT_TYPE]
	dst: bitwise-not :mat none none
	imshow/name mat filename 
	imshow/name dst "Not"
	moveWindow filename 0x0
	moveWindow "Not" 260x0
	waitKey 0
	destroyAllWindows 
]

with cv [
	src: imread "../images/mandrill.jpg" 
	result: bitwise-not src none 
	imshow :result
	waitKey 0
]
quit