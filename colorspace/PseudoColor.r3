#!/usr/local/bin/r3
Rebol [
]

;--"Pseudo-color to RGB image"
wR: 0.299
wG: 0.587
wB: 0.114

;wR: 0.2126  wG: 0.7152 wB: 0.0722 

cv: import opencv
with cv [
	img: imread/with %../images/mandrill.jpg IMREAD_COLOR
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

	knl: #(f32! [
    	0.5 0.0 0.5 
    	0.0 0.5 0.0 
    	0.5 0.0 0.5
	])
	
	foreach [r g b] vect [
		xf: (r * knl/1) + (g *  knl/2) + (b * knl/3)
    	yf: (r * knl/4) + (g *  knl/5) + (b * knl/6)
    	zf: (r * knl/7) + (g *  knl/8) + (b * knl/9)	
		append m3  to integer! xf
		append m3  to integer! yf
		append m3  to integer! zf
	]
	
	im: make image! reduce [size to-binary m3]
    mat1: Matrix :im
    imshow/name img srcImg
	imshow/name grayscale testImg
    imshow/name mat1 "Color"
    moveWindow srcImg 0x10
	moveWindow testImg 300x10
	moveWindow "Color" 600x10
	waitKey 0
    destroyAllWindows
]
