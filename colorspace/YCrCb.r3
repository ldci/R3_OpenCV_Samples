#!/usr/local/bin/r3
Rebol [
]

;--"RBG color to YCrCb conversion"
wR: 0.299
wG: 0.587
wB: 0.114

;wR: 0.2126  wG: 0.7152 wB: 0.0722 

cv: import opencv
with cv [
	img: imread/with %../images/taj.jpg IMREAD_COLOR
	namedWindow  srcImg: "Source"
	namedWindow  testImg: "Grayscale"
	print ["mat size    :" size: get-property img MAT_SIZE]
    print ["mat type    :" type: get-property img MAT_TYPE]
    print ["mat depth   :" depth: get-property img MAT_DEPTH]
    print ["mat channels:" channels: get-property img MAT_CHANNELS]
    ;--OpenCV conversion
    grayscale: Matrix [:size CV_8UC1]
    cvtColor :img :grayscale COLOR_RGB2GRAY 
	vect: get-property img MAT_VECTOR
	m3: copy []  ;--3 channels image
	delta: 64
	foreach [r g b] vect [
		Yy: (r * wR) + (g * wG) + (b * wB)
		cr: ((r - Yy) * 0.713) + delta
		cb: ((b - Yy) * 0.514) + delta 
		append m3  to integer! Yy
		append m3  to integer! cr
		append m3  to integer! cb
		;print [Yy cr cb]
	]
	
	im: make image! reduce [size to-binary m3]
    mat1: Matrix :im
    imshow/name img srcImg
	imshow/name grayscale testImg
    imshow/name mat1 "YCrCb"
    moveWindow srcImg 0x10
	moveWindow testImg 300x10
	moveWindow "YCrCb" 600x10
	waitKey 0
    destroyAllWindows
]
