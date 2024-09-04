#!/usr/local/bin/r3
Rebol [
]
;--read and display a basic 4-channel TIFF image
cv: import opencv
with cv [          
	mat: imread/with %../images/binaire.tiff -1
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
	imshow/name mat "Tiff" 
	moveWindow "Tiff" 100x50
	waitKey 0
	destroyWindow "Tiff"
]

