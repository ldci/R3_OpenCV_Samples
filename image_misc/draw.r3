#!/usr/local/bin/r3
REBOL [ 
] 
cv: import opencv

;--Rebol code for generating image
random/seed now/time/precise
mSize: 256
img: make image! reduce [as-pair mSize mSize black]
color: random white
y: 0
while [y < mSize] [
	x: 0
	while [x < mSize][
		idx: y * mSize + x + 1
		if x = y [img/:idx: color]
		x: x + 1
	]
	y: y + 1 
]
;--and now OpenCV module for displaying image
print "Any key to close"
with cv [
	imshow img 
	waitKey 0
]
