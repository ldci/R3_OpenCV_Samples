#!/usr/local/bin/r3
REBOL [
]
cv: import opencv

getInformation: does [
	print "Welcome to Rebol-OpenCV"
	print ["Rebol version       :" system/version]
	print ["OpenCV version      :" cv/getVersionString]
	print ["Number of ticks     :" cv/getTickCount]
	print ["Number of ticks/sec :" cv/getTickFrequency]
	print ["Number of threads   :" cv/getNumThreads]
	print ["Optimized code usage:" cv/useOptimized]
	;setUseOptimized false
]


getMatDepth: function [
{Depth is the data type of each individual element in the matrix/image data. 
It can take one of these 8 values:}
	mat	[handle!]
][
	depth: cv/get-property :mat cv/MAT_DEPTH
	str: "Invalid depth type of matrix"
	case [
		depth = cv/CV_8U  		[str: "CV_8U"]
		depth = cv/CV_8S  		[str: "CV_8S"]
		depth = cv/CV_16U 		[str: "CV_16U"]
		depth = cv/CV_16S 		[str: "CV_16S"]
		depth = cv/CV_32S 		[str: "CV_32S"]
		depth = cv/CV_32F 		[str: "CV_32F]"]
		depth = cv/CV_64F 		[str: "CV_64F]"]
		depth = cv/CV_USRTYPE1 	[str: "CV_USRTYPE1"]
	]
	rejoin ["Mat Depth: " str]
]

getMatType: function [
{Type combines the data type of the elements along with the number of channels in the matrix/image. 
Since images in OpenCV can have 1-4 channels, it can take one of 28 values}
	mat	[handle!]
][
	rejoin ["Mat Type:  " form cv/get-property :mat cv/MAT_TYPE]
]

;--tests



getInformation

filename: %../images/TeaPot512.ppm
mat: cv/imread filename
print getMatDepth mat
print getMatType  mat


cv/imshow/name mat filename 
cv/setWindowProperty fileName cv/WND_PROP_FULLSCREEN cv/WINDOW_FULLSCREEN
print-horizontal-line
print ["FULLSCREEN" cv/getWindowProperty fileName cv/WND_PROP_FULLSCREEN]
print ["AUTOSIZE" cv/getWindowProperty fileName cv/WND_PROP_AUTOSIZE]
print ["ASPECT_RATIO" cv/getWindowProperty fileName cv/WND_PROP_ASPECT_RATIO]
print ["OPENGL" cv/getWindowProperty fileName cv/WND_PROP_OPENGL]
print ["VISIBLE" cv/getWindowProperty fileName cv/WND_PROP_VISIBLE]
print ["TOP_MOST" cv/getWindowProperty fileName cv/WND_PROP_TOPMOST]
print-horizontal-line

cv/waitKey 0
cv/free :mat
cv/destroyAllWindows


	