#!/usr/local/bin/r3
Rebol [
]
;--read and display a 1-channel 16-bit TIFF image in 0..4096 range
cv: import opencv
with cv [
	alpha: 256 / 4096
	beta: 64
	mat: imread %../images/IMG_10007.tif
	print ["matrix size    :" size: get-property mat MAT_SIZE]
    print ["matrix type    :" type: get-property mat MAT_TYPE]
    print ["matrix depth   :" depth: get-property mat MAT_DEPTH]
    print ["matrix channels:" channels: get-property mat MAT_CHANNELS]
   	convertTo :mat :mat CV_8U alpha beta 
	imshow/name mat "16-bit TIFF" 
	moveWindow "16-bit TIFF" 200x0
	waitKey 0
	destroyAllWindows 
]
