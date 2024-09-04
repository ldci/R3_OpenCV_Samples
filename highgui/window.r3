#!/usr/local/bin/r3
Rebol [
]

cv: import opencv
with cv [
	filename: %../images/mandrill.jpg					;--file name
	img: imread/with filename IMREAD_UNCHANGED		;--load image as is
	namedWindow "Source" WINDOW_NORMAL				;--name window
	imshow/name img "Source"						;--show image 
	moveWindow "Source" 300x0						;--move
	print-horizontal-line
	print as-yellow "Image"
	print ["Image Size:    " getWindowImageSize "Source"]
	print ["Image Position:" getWindowImagePos  "Source"]
	print-horizontal-line
	print as-yellow "Window Property Flags"
	print ["WND_PROP_FULLSCREEN:" 	getWindowProperty "Source" WND_PROP_FULLSCREEN]
	print ["WND_PROP_AUTOSIZE:" 	getWindowProperty "Source" WND_PROP_AUTOSIZE]
	print ["WND_PROP_ASPECT_RATIO:" getWindowProperty "Source" WND_PROP_ASPECT_RATIO]
	print ["WND_PROP_OPENGL:" 		getWindowProperty "Source" WND_PROP_OPENGL]
	print ["WND_PROP_VISIBLE:" 		getWindowProperty "Source" WND_PROP_VISIBLE]
	print ["WND_PROP_TOPMOST:" 		getWindowProperty "Source" WND_PROP_TOPMOST]
	print-horizontal-line
	print as-yellow "Window Flags"
	print ["WINDOW_NORMAL:" 		getWindowProperty "Source" WINDOW_NORMAL]
	print ["WINDOW_AUTOSIZE:" 		getWindowProperty "Source" WINDOW_AUTOSIZE]
	print ["WINDOW_OPENGL:" 		getWindowProperty "Source" WINDOW_OPENGL]
	print ["WINDOW_FULLSCREEN:" 	getWindowProperty "Source" WINDOW_FULLSCREEN]
	print ["WINDOW_FREERATIO:" 		getWindowProperty "Source" WINDOW_FREERATIO]
	print ["WINDOW_KEEPRATIO:" 		getWindowProperty "Source" WINDOW_KEEPRATIO]
	print ["WINDOW_GUI_EXPANDED:" 	getWindowProperty "Source" WINDOW_GUI_EXPANDED]
	print ["WINDOW_GUI_NORMAL:" 	getWindowProperty "Source" WINDOW_GUI_NORMAL]
	print-horizontal-line
	print as-yellow "Any key to switch to full screen"
	waitKey 0
	;--Full Screen
	;--These two lines will force the "Source" window to be on top with focus
	setWindowProperty "Source" WND_PROP_FULLSCREEN WINDOW_FULLSCREEN 	;-- 1.0
	waitKey 0
	setWindowProperty "Source" WND_PROP_FULLSCREEN WINDOW_NORMAL		;-- 0.0
	waitKey 0
	;setWindowProperty "Source" WND_PROP_TOPMOST WINDOW_FULLSCREEN
	;waitKey 0
]