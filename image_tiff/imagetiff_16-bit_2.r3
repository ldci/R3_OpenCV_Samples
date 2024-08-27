#!/usr/local/bin/r3
Rebol [
]
;--read and display a 1-channel 16-bit TIFF image
cv: import opencv
with cv [
	mat: imread %../images/16bitgray1channel.tif
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
	imshow/name mat "16-bit Tiff" 
	moveWindow "16-bit Tiff" 10x0
	waitKey 0
	destroyWindow "16-bit Tiff"
]