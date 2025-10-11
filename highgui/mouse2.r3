#!/usr/local/bin/r3
Rebol [
]
cv: import 'opencv
ctx: context [
    color: 0.0.0
    on-mouse-trace: func [
        type  [integer!]
        x     [integer!]
        y     [integer!]
        flags [integer!]
    ][
        print [
            pickz [
                MOUSEMOVE
                LBUTTONDOWN
                RBUTTONDOWN
                MBUTTONDOWN
                LBUTTONUP
                RBUTTONUP
                MBUTTONUP
                LBUTTONDBLCLK
                RBUTTONDBLCLK
                MBUTTONDBLCLK
                MOUSEWHEEL
                MOUSEHWHEEL
            ] :type
            "position:" as-pair x y
            "flags:" flags
        ]
    ]
    on-mouse-draw: func [
        type  [integer!]
        x     [integer!]
        y     [integer!]
        flags [integer!]
    ][
        if type == cv/EVENT_LBUTTONDOWN[
            ;; Modify draw color on left button click
            color: random white
            print ["New draw color:" color]
        ]
        if flags = 1 [
            ;; Modify pixel if left mouse button is down
            ;img/(mcb/pos): color 
            change/dup at img mcb/pos color 5
        ]
        ;; Update the window with modified image
        cv/imshow/name img win
    ]
]

with cv [
    ;; Display blqck image...
    win: "Test mouse window"
    img: make image! reduce [640x480 black]
    imshow/name img win
    ;; Use the mouse callback with a very simple draw handler
    mcb: setMouseCallback win ctx 'on-mouse-draw
    waitKey 0
    ;; Last event data are stored in the cvMouseCallback handle
    print ["Last mouse position:" mcb/x mcb/y]
    destroyAllWindows
]
