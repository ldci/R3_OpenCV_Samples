#!/usr/local/bin/r3
Rebol [
]
comment[
shape:
MORPH_RECT: 0
MORPH_CROSS: 1
MORPH_ELLIPSE: 2
]
shape: 1			;--for getStructuringElement shape
kSize: 3x3			;--Kernel Size
anchor: -1x-1		;--Center of the kernel
iter: 3				;--number of iterations

cv: import opencv
with cv [
    src: imread/with "../images/lena.jpg" IMREAD_COLOR
    print ["mat type    :" get-property src MAT_TYPE]
    edges: Canny :src none 80 100						;--Canny filter (single channel 8-bit image)
    result: Matrix :edges								;--new matrix 
    cvtColor :edges :result COLOR_GRAY2RGB   			;--RGB color space  (3 channels)
    imshow/name :src "Source"
    imshow/name :result "Canny"
    moveWindow "Source" 0x0
    moveWindow "Canny" 300x0
    waitKey 0
    destroyAllWindows
]

