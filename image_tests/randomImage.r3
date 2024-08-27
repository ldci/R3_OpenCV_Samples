#!/usr/local/bin/r3
REBOL [ 
] 
;--Rebol code for generating image
random/seed now/time/precise
size: 256x256
img: make image! size
print ["Number of pixels:" to-integer size/area]
repeat i size/area [img/:i: random white]

;--and now OpenCV module for displaying image
print "Any key to close"
cv: import opencv
with cv [
    imshow img 
    waitKey 0
]
