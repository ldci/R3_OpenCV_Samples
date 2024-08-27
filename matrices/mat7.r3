#!/usr/local/bin/r3
REBOL [
]
cv: import opencv
with cv [
    ;; create an image filled with a BGR pattern
    ;mat: 		Matrix [200x200 CV_8UC3 #{FF0000 00FF00 0000FF}] ;--pbs
    data: #(uint8! 64000)
	rgbmat: Matrix [200x200 :data]
	forall data [data/1: random 255]
    ;--create matrices with binary values
    bluemat: 	Matrix [200x200 CV_8UC3 #{FF0000 FF0000 FF0000}]
    greenmat: 	Matrix [200x200 CV_8UC3 #{00FF00 00FF00 00FF00}]
    redmat: 	Matrix [200x200 CV_8UC3 #{0000FF 0000FF 0000FF}]
    ;--when binary data source is shorter when constructing a matrix,it is copied repeatedly
    blackmat: 	Matrix [200x200 CV_8UC1 #{00}] ;should make a matrix with 40000 zeros
    imshow/name rgbmat 		"BGR"
    imshow/name bluemat	 	"Blue"
    imshow/name greenmat 	"Green"
    imshow/name redmat 		"Red"
    imshow/name blackmat 	"Black"
    moveWindow "BGR" 		10x10
    moveWindow "Blue" 		210x10
    moveWindow "Green" 		410x10
    moveWindow "Red" 		610x10
    moveWindow "Black" 		810x10
    ;probe get-property blackmat MAT_VECTOR
    waitKey 0
    destroyAllWindows
]

