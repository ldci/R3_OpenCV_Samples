#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	;--basic matrix
	;--creates a Matrix with four color channels for values in the range 0 to 255.
	;--CV_8UC4 = 24
	print-horizontal-line

	mat: Matrix 250x141 
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
    print ["mat binary  :" dataSize: length? get-property mat MAT_BINARY]
    ;print ["mat image   :" im: get-property mat MAT_IMAGE]
    print ["mat vector  :" length? get-property mat MAT_VECTOR]
    
    print-horizontal-line
    print "mask.png Image as matrix"
    ;--OK get the correct number of channels
    mat: imread %../images/mask.png
    print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
    print ["mat binary  :" dataSize: length? get-property mat MAT_BINARY]
    ;print ["mat image   :" im: get-property mat MAT_IMAGE]
    print ["mat vector  :" length? get-property mat MAT_VECTOR]
    
    print-horizontal-line
    print "mask.png Image as Rebol image"
    img: imread/image %../images/mask.png
    probe img/size
    mat: Matrix :img
    ;probe mat
    print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
    print ["mat channels:" channels: get-property mat MAT_CHANNELS]
    print ["mat binary  :" dataSize: length? get-property mat MAT_BINARY]
    ;print ["mat image   :" im: get-property mat MAT_IMAGE]
    ;print ["mat vector  :" get-property mat MAT_VECTOR]  
    print-horizontal-line
]

;depth 
comment [
#define CV_8U   0
#define CV_8S   1
#define CV_16U  2
#define CV_16S  3
#define CV_32S  4
#define CV_32F  5
#define CV_64F  6
#define CV_USRTYPE1 7
]