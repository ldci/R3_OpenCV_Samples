#!/usr/local/bin/r3
Rebol [
]

fileName: "../images/lena.jpg"
cv: import opencv


;print ["Running test on Rebol build:" mold to-block system/build]

;--Color map types: a block of words
maps: [
	COLORMAP_AUTUMN
	COLORMAP_BONE
	COLORMAP_JET
	COLORMAP_WINTER
	COLORMAP_RAINBOW
	COLORMAP_OCEAN
	COLORMAP_SUMMER
	COLORMAP_SPRING
	COLORMAP_COOL
	COLORMAP_HSV
	COLORMAP_PINK
	COLORMAP_HOT
	COLORMAP_PARULA
	COLORMAP_MAGMA
	COLORMAP_INFERNO
	COLORMAP_PLASMA
	COLORMAP_VIRIDIS
	COLORMAP_CIVIDIS
	COLORMAP_TWILIGHT
	COLORMAP_TWILIGHT_SHIFTED
	COLORMAP_TURBO
	COLORMAP_DEEPGREEN
]
n: (length? maps) - 1	;--Rebol is one-based
with cv [
    src: imread filename
    result: Matrix :src
    for i 0 n 1 [
        applyColorMap :src :result :i 
        imshow :result
        setWindowTitle "Image" join "Map: " maps/(i + 1) ;--Rebol is one-based
        ;fname: join maps/(i + 1) ".jpg"
        ;imwrite fname :result
        if 0 < waitKey 500 [break]
    ]
    print "A key to close"
    waitkey 0
    destroyAllWindows
]