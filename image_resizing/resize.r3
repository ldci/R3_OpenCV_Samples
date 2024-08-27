#!/usr/local/bin/r3
REBOL [
]
;--based on Oldes's sample
cv: import opencv 
with cv [
	;--source image
    img: imread/image %../images/mask.png ;--read as Rebol image
    reducedSize: img/size / 2
    
    ;--resize with % and interpolation
    imshow/name img "Source" 
    img2: resize/with img 200% INTER_NEAREST_EXACT
    imshow/name img2 "Resize 200%" 
    moveWindow "Resize 200%" 250x0
    
    ;-resize with size as pair
    img3: resize/with img reducedSize INTER_NEAREST_EXACT
    imshow/name img3 "Resize 50%" 
    moveWindow "Resize 50%" 0x200
    
    ;--resize to a matrix
    mat: Matrix reducedSize
  	resize/into img reducedSize mat 
    print ["mat size    :" get-property mat MAT_SIZE]
    print ["mat type    :" get-property mat MAT_TYPE]
    print ["mat channels:" get-property mat MAT_CHANNELS]
    waitkey 0
    destroyAllWindows
]

comment [
	;interpolation flags
	INTER_NEAREST: 0
	INTER_LINEAR: 1
	INTER_CUBIC: 2
	INTER_AREA: 3
	INTER_LANCZOS4: 4
	INTER_LINEAR_EXACT: 5
	INTER_NEAREST_EXACT: 6
]