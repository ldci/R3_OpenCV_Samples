#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's samples
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
    pair: 1x1
    add-blur?: true

    print "Press any key to stop the animation!"
    forever [
        either add-blur? [
            size: size + 2
            pair: pair + 2
        ][
            size: size - 2
            pair: pair - 2
        ]
        case [
            size <= 1   [add-blur?: true ]
            size >= 100 [add-blur?: false]
        ]
        blur         :src :blured1 pair
        gaussianBlur :src :blured2 pair 0 0
        medianBlur   :src :blured3 size
        imshow/name blured1 win1
        imshow/name blured2 win2
        imshow/name blured3 win3
        if 0 <= waitkey 100 [break]
    ]
    destroyAllWindows
]