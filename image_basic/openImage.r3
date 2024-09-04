#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	img: imread/with %../images/mandrill.jpg IMREAD_UNCHANGED
	setWindowTitle "Source" "IMREAD_UNCHANGED"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_GRAYSCALE
	setWindowTitle "Source" "IMREAD_GRAYSCALE"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_COLOR
	setWindowTitle "Source" "IMREAD_COLOR"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_ANYDEPTH
	setWindowTitle "Source" "IMREAD_ANYDEPTH"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_ANYCOLOR
	setWindowTitle "Source" "IMREAD_ANYCOLOR"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_LOAD_GDAL
	setWindowTitle "Source" "IMREAD_LOAD_GDAL"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_REDUCED_GRAYSCALE_2
	setWindowTitle "Source" "IMREAD_REDUCED_GRAYSCALE_2"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_REDUCED_COLOR_2
	setWindowTitle "Source" "IMREAD_REDUCED_COLOR_2"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_REDUCED_GRAYSCALE_4
	setWindowTitle "Source" "IMREAD_REDUCED_GRAYSCALE_4"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_REDUCED_COLOR_4
	setWindowTitle "Source" "IMREAD_REDUCED_COLOR_4"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_REDUCED_GRAYSCALE_8
	setWindowTitle "Source" "IMREAD_REDUCED_GRAYSCALE_8"
	imshow/name :img "Source"
	waitKey 500
	
	img: imread/with %../images/mandrill.jpg IMREAD_REDUCED_COLOR_8
	setWindowTitle "Source" "IMREAD_REDUCED_COLOR_8"
	imshow/name :img "Source"
	waitKey 500
	
	print "Any Key to close"
	img: imread/with %../images/mandrill.jpg IMREAD_IGNORE_ORIENTATION
	setWindowTitle "Source" "IMREAD_IGNORE_ORIENTATION"
	imshow/name :img "Source"
	waitKey 0
]