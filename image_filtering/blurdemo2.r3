#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's samples
;--forever loop modified
cv: import opencv
with cv [
    src: imread "../images/mask.png"
    blured1: Matrix src
    blured2: Matrix src
    blured3: Matrix src
    namedWindow win1: "blur"
    namedWindow win2: "gaussianBlur"
    namedWindow win3: "medianBlur"
    moveWindow win1 0x0
    moveWindow win2 250x0
    moveWindow win3 500x0

    size: 1
    add-blur?: true
    forever [
        either add-blur? [
            size: size + 2
            add-blur?: size < 100
        ][
            size: size - 2
            add-blur?: size <= 1
        ]
        blur         :src :blured1 :size
        gaussianBlur :src :blured2 :size 0 0
        medianBlur   :src :blured3 :size
        imshow/name blured1 win1
        imshow/name blured2 win2
        imshow/name blured3 win3
        if 0 <= waitkey 100 [break]
    ]
    destroyAllWindows
]