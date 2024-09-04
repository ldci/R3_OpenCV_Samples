#!/usr/local/bin/r3
Rebol [
]

{Image embossing is a computer graphics technique in which each pixel of an image is replaced either by a highlight or a shadow, 
depending on light/dark boundaries on the original image. 
Low contrast areas are replaced by a gray background. See https://en.wikipedia.org/wiki/Image_embossing}

cv: import opencv
with cv [
    src: imread/with "../images/mandrill.jpg" -1
    dst0: Matrix :src
    dst1: Matrix :src
    dst2: Matrix :src
    dst3: Matrix :src
    dst4: Matrix :src
    ;--using Rebol vector for the kernel
    vec0: #(f32! [
    	  1.0 0.0 0.0
		  0.0 0.0 0.0 
		  0.0 0.0 -1.0]
    )
   
    ;other kernels that can be used for direction embossing
    vec1: #(f32! [
    	  1.0 1.0 0.0
		  1.0 0.0 -1.0 
		  0.0 -1.0 -1.0]
    )
    
    vec2: #(f32! [
    	  0.0 1.0 1.0
		  -1.0 0.0 1.0 
		  -1.0 -1.0 0.0]
    )
    
    vec3: #(f32! [
    	  0.0 -1.0 -1.0
		  1.0 0.0 -1.0 
		  1.0 1.0 0.0]
    )
    
    vec4: #(f32! [
    	  -1.0 -1.0 0.0
		  -1.0 0.0 1.0 
		  0.0 1.0 1.0]
    )
   
    
    ;-- create and apply the filters 
    ;print ["Sum of vector must be equal to 0"]
    filter: Matrix [CV_32FC1 3x3 :vec0]
    filter2D :src :dst0 -1 :filter -1x-1 0	;--same depth as the input image (-1)
    filter: Matrix [CV_32FC1 3x3 :vec1]
    filter2D :src :dst1 -1 :filter -1x-1 0	;--same depth as the input image (-1)
    filter: Matrix [CV_32FC1 3x3 :vec2]
    filter2D :src :dst2 -1 :filter -1x-1 0	;--same depth as the input image (-1)
    filter: Matrix [CV_32FC1 3x3 :vec3]
    filter2D :src :dst3 -1 :filter -1x-1 0	;--same depth as the input image (-1)
    filter: Matrix [CV_32FC1 3x3 :vec4]
    filter2D :src :dst4 -1 :filter -1x-1 0	;--same depth as the input image (-1)
    ;--show result
    imshow/name src  "Source"
    imshow/name dst0 "Emboss 0"
    imshow/name dst1 "Emboss 1"
    imshow/name dst2 "Emboss 2"
    imshow/name dst3 "Emboss 3"
    imshow/name dst4 "Emboss 4"
    moveWindow "Source"  0x0
	moveWindow "Emboss 0" 260x0
	moveWindow "Emboss 1" 520x0
	moveWindow "Emboss 2" 780x0
	moveWindow "Emboss 3" 0x300
	moveWindow "Emboss 4" 260x300
    waitKey 0
    destroyAllWindows
]

