#!/usr/local/bin/r3
REBOL [
]

cv: import opencv
with cv [
	data: #(uint8! 64000)
	rgbmat: Matrix [200x200 :data]
	forall data [data/1: random 255]
	imshow/name rgbmat "RGB"
	moveWindow "RGB" 250x10
	print ["Mean:" mean rgbmat]
	print ["Mini Maxi:" minMaxLoc rgbmat]
	waitKey 0
]