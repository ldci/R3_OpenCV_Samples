#!/usr/local/bin/r3
Rebol [
]
cv: import 'opencv
ctx: context [
    color: 0.0.0
    on-mouse-move: func [
        type  [integer!]
        x     [integer!]
        y     [integer!]
        flags [integer!]
    ][
    	;MOUSEMOVE event
        if flags = 0 [
            color: pick img mcb/pos
            print  ajoin ["Pixel " mcb/pos " :" color]
        ]
    ]
]

with cv [
	filename: %../images/lena.jpg
	img: imread/image fileName
	win: "Source"
	imshow/name img win
	mcb: setMouseCallback win ctx 'on-mouse-move
	waitKey 0
]
