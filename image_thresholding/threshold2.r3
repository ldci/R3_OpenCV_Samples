#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	img: imread %../images/mask.png
	gray: cvtColor img none COLOR_BGR2GRAY
    namedWindow win1: "THRESH_BINARY"
    namedWindow win2: "THRESH_TRUNC"
    namedWindow win3: "THRESH_TOZERO"
    namedWindow win4: "THRESH_TOZERO_INV"
    namedWindow win5: "With THRESH_OTSU"
    moveWindow  win1   0x150
    moveWindow  win2 260x150
    moveWindow  win3 520x150
    moveWindow  win4 780x150
    moveWindow  win5 1040x150
    thresh1: threshold gray none   0 255 THRESH_BINARY
    thresh2: threshold gray none 200 255 THRESH_TRUNC
    thresh3: threshold gray none 200 255 THRESH_TOZERO
    thresh4: threshold gray none 200 255 THRESH_TOZERO_INV
    thresh5: threshold gray none 200 255 THRESH_TOZERO_INV + THRESH_OTSU
    imshow/name thresh1 win1
    imshow/name thresh2 win2
    imshow/name thresh3 win3
    imshow/name thresh4 win4
    imshow/name thresh5 win5
    waitKey 0
    destroyAllWindows
]