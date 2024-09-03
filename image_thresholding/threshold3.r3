#!/usr/local/bin/r3
Rebol [
]
;--https://docs.opencv.org/4.x/d7/d4d/tutorial_py_thresholding.html
cv: import opencv
with cv [
	tValue: 0
	img: imread %../images/lena.jpg
	? img
	gray: cvtColor img none COLOR_RGB2GRAY
    namedWindow win: "Thresholding"
    moveWindow  win   100x150
    thresh: threshold gray none tValue 255 THRESH_TOZERO_INV
    imshow/name thresh win
    process?: true
	print "Press any key to stop the animation!"
	forever [
		either process? [
			process?: (tValue: tValue + 1) <= 255
		][
			process?: (tValue: tValue - 1) <= 0
		]
		threshold gray thresh tValue 255 THRESH_TOZERO_INV
    	imshow/name thresh win
		if 0 <= waitkey 10 [break]
	]
    destroyAllWindows
]