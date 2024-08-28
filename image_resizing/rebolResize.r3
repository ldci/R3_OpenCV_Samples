#!/usr/local/bin/r3
REBOL [
]
;--test R3 resize (not yet supported by Red)
cv: import opencv 
;--names: a block of words (from system/catalog/filters)
;--resizing filters : see https://imagemagick.org/Usage/filter/#filter
names: [
	Point
    Box
    Triangle
    Hermite
    Hanning
    Hamming
    Blackman
    Gaussian
    Quadratic
    Cubic
    Catrom
    Mitchell
    Lanczos
    Bessel
    Sinc
]


img: load %../images/lena.jpg
repeat i length? names [
	;--the blur factor where > 1 is blurry, < 1 is sharp.
	blur: random 5
	dst: resize/filter/blur img 150% names/:i blur  
	cv/imShow :dst 
	cv/setWindowTitle "Image" ajoin ["Filter: " names/:i " [Blur: " blur "]"]
	cv/waitKey 500
]
print "Any key to close"
cv/waitKey 0
cv/destroyAllWindows

