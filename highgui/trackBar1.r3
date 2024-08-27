#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
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

n: (length? maps) - 1							;--Rebol is one-based

with cv [
    imshow src: imread "../images/lena.jpg" 	;--load and display the original
    res: Matrix :src                     		;--matrix to display modified source
    onTrackbar: func[
    	"Function used as a callback" 
    	val [integer!]
    ][
        setWindowTitle "Image" join "Color map: " maps/(val + 1);--Rebol is one-based
        applyColorMap :src :res val
        imshow :res
    ]
    ;--create the trackbar in the same window like the source image with the callback
    tb: createTrackbar/with "Value:" "Image" n system/contexts/user 'onTrackbar
    waitKey 0 
    destroyAllWindows                           		
]