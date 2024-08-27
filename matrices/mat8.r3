#!/usr/local/bin/r3
REBOL [
]
cv: import opencv
with cv [
    ;--create an image filled with a BGR pattern
    ;--when binary data source is shorter when constructing a matrix,it is copied repeatedly
    ;rgbmat: 	Matrix [200x200 CV_8UC3 #{FF0000 00FF00 0000FF}] ;--pbs 
    data: #(uint8! 64000)
	rgbmat: Matrix [200x200 :data]
	forall data [data/1: random 255]
    ;--create matrices with tuples 
    bluemat: 	Matrix [200x200 CV_8UC3 0.0.255] 
    greenmat: 	Matrix [200x200 CV_8UC3 0.255.0]
    redmat: 	Matrix [200x200 CV_8UC3 255.0.0]
    blackmat: 	Matrix [200x200 CV_8UC3 0.0.0]
    imshow/name rgbmat 		"RGB"
    imshow/name bluemat	 	"Blue"
    imshow/name greenmat 	"Green"
    imshow/name redmat 		"Red"
    imshow/name blackmat 	"Black"
    moveWindow "RGB" 		10x10
    moveWindow "Blue" 		210x10
    moveWindow "Green" 		410x10
    moveWindow "Red" 		610x10
    moveWindow "Black" 		810x10
    waitKey 0
    destroyAllWindows
]

{r3(16582,0x1eb1d8f40) malloc: double free for ptr 0x120328000
r3(16582,0x1eb1d8f40) malloc: *** set a breakpoint in malloc_error_break to debug
/Users/fjouen/Library/Containers/com.barebones.bbedit/Data/tmp/mat8-746450011.456.r3.command: line 3: 16582 
Abort trap: 6 /usr/local/bin/r3 /Users/fjouen/Programmation/RebolR3/Oldes/Rebol-OpenCV/samples/matrices/mat8.r3}