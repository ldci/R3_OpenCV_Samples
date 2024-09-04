#!/usr/local/bin/r3
REBOL [
]
cv: import opencv
with cv [
	data: #(uint8! 40000)
	mat: Matrix [200x200 :data]
	forall data [data/1: random 255]
    print ["Image size:"        	mat/size]
    print ["CV type:"           	mat/type]
    print ["Channels:"          	mat/channels]
    print ["CV depth:"          	mat/depth]
    print ["Total:"			 		mat/total]
    print ["Width:"			 		mat/width]
    print ["Height:"				mat/height]
    print ["SubMatrix:"				mat/is-submatrix]
    ;print ["Rebol binary data:" 	mat/binary]
    ;print ["Rebol vector value:" 	mat/vector]
    ;print ["Rebol image value:"  	mat/image]
    imshow/name mat "Random"
    moveWindow "Random" 300x0
    waitKey 0
]