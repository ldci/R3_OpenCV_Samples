#!/usr/local/bin/r3
Rebol [
]
;--read and display a 1-channel 32-bit TIFF image
cv: import opencv
with cv [
	mat: imread %../images/binary32bit1.tiff
	print ["Reading 32-bit TIFF image" newline]
	print "Before Conversion"
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
  	
  	;--use convertTo to create a 8-bit image with 1 channel
    convertTo :mat :mat CV_8U 1.0 0	
	;--show result
	imshow/name mat "32-bit TIFF" 
	moveWindow "32-bit TIFF" 10x50
	print newline
	print "After Conversion"
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
	waitKey 0
	destroyWindow  "32-bit Tiff"
]
