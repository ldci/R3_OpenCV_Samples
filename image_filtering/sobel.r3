#!/usr/local/bin/r3
Rebol [
]

;--This filter is directional

cv: import opencv
with cv [
    src: imread/with  "../images/mandrill.jpg" IMREAD_UNCHANGED
    dst1: Matrix :src
    dst2: Matrix :src
    dst3: Matrix :src
    dst4: Matrix :src
    ;--using Rebol vector for the kernel
    vec1: #(f32! [-1.0 -2.0 -1.0 0.0 0.0 0.0 1.0 2.0 1.0])
    vec2: #(f32! [1.0 2.0 1.0 0.0 0.0 0.0 -1.0 -2.0 -1.0])
    vec3: #(f32! [-1.0 0.0 1.0 0.0 0.0 0.0 -1.0 0.0 1.0])
    vec4: #(f32! [1.0 0.0 -1.0 0.0 0.0 0.0 1.0 0.0 -1.0])
    
    ;-- create the 3x3 filter   
    filter1: Matrix [CV_32FC1 3x3 :vec1]
    filter2: Matrix [CV_32FC1 3x3 :vec2]
    filter3: Matrix [CV_32FC1 3x3 :vec3]
    filter4: Matrix [CV_32FC1 3x3 :vec4]
    filter2D :src :dst1 -1 filter1 0 0
    filter2D :src :dst2 -1 filter2 0 0
    filter2D :src :dst3 -1 filter3 0 0
    filter2D :src :dst4 -1 filter4 0 0
    ;-1 will give the output image depth as same as the input image
    
    ;--show result
    imshow/name src  "Source"
    imshow/name dst1 "Sobel 1"
    imshow/name dst2 "Sobel 2"
    imshow/name dst3 "Sobel 3"
    imshow/name dst4 "Sobel 4"
    moveWindow "Source"  0x0
	moveWindow "Sobel 1" 260x0
	moveWindow "Sobel 2" 520x0
	moveWindow "Sobel 3" 780x0
	moveWindow "Sobel 4" 1040x0
    waitKey 0
    destroyAllWindows
]

