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
	print ["Optimized code usage:" CV/useOptimized]
	;setUseOptimized false
]


getMatDepth: function [
{Depth is the data type of each individual element in the matrix/image data. 
It can take one of these 8 values:}
	mat	[handle!]
][
	depth: cv/get-property mat cv/MAT_DEPTH
	str: "Invalid depth type of matrix"
	case [
		depth = cv/CV_8U  		[str: rejoin [form depth " [CV_8U]"]]
		depth = cv/CV_8S  		[str: rejoin [form depth " [CV_8S]"]]
		depth = cv/CV_16U 		[str: rejoin [form depth " [CV_16U]"]] 
		depth = cv/CV_16S 		[str: rejoin [form depth " [CV_16S]"]]
		depth = cv/CV_32S 		[str: rejoin [form depth " [CV_32S]"]]
		depth = cv/CV_32F 		[str: rejoin [form depth " [CV_32F]"]]
		depth = cv/CV_64F 		[str: rejoin [form depth " [CV_64F]"]]
		depth = cv/CV_USRTYPE1 	[str: rejoin [form depth " [CV_USRTYPE1]"]]
	]
	rejoin ["Mat Depth is " str]
]

;under progress
getMatType: function [
{Type combines the data type of the elements along with the number of channels in the matrix/image. 
Since images in OpenCV can have 1-4 channels, it can take one of these 28 values:
}
	mat	[handle!]
][
	mtype: cv/get-property mat cv/MAT_TYPE
	print form mType
	str: "Invalid type of matrix"
	case [
		mtype = 'CV_8UC1  [str: rejoin [form mtype " [CV_8UC1]"]]
		mtype = 'CV_8UC2  [str: rejoin [form mtype " [CV_8UC2]"]]
		mtype = 'CV_8UC3  [str: rejoin [form mtype " [CV_8UC3]"]]
		mtype = 'CV_8UC4  [str: rejoin [form mtype " [CV_8UC4]"]]
		mtype = 'CV_8SC1  [str: rejoin [form mtype " [CV_8SC1]"]]
		mtype = 'CV_8SC2  [str: rejoin [form mtype " [CV_8SC2]"]]
		mtype = 'CV_8SC3  [str: rejoin [form mtype " [CV_8SC3]"]]
		mtype = 'CV_8SC4  [str: rejoin [form mtype " [CV_8SC4]"]]
		mtype = 'CV_16UC1 [str: rejoin [form mtype " [CV_16UC1]"]]
		mtype = 'CV_16UC2 [str: rejoin [form mtype " [CV_16UC2]"]]
		mtype = 'CV_16UC3 [str: rejoin [form mtype " [CV_16UC3]"]]
		mtype = 'CV_16UC4 [str: rejoin [form mtype " [CV_16UC4]"]]
		mtype = 'CV_16SC1 [str: rejoin [form mtype " [CV_16SC1]"]]
		mtype = 'CV_16SC2 [str: rejoin [form mtype " [CV_16SC2]"]]
		mtype = 'CV_16SC3 [str: rejoin [form mtype " [CV_16SC3]"]]
		mtype = 'CV_16SC4 [str: rejoin [form mtype " [CV_16SC4]"]]
		mtype = 'CV_32SC1 [str: rejoin [form mtype " [CV_32SC1]"]]
		mtype = 'CV_32SC2 [str: rejoin [form mtype " [CV_32SC2]"]]
		mtype = 'CV_32SC3 [str: rejoin [form mtype " [CV_32SC3]"]]
		mtype = 'CV_32SC4 [str: rejoin [form mtype " [CV_32SC4]"]]
		mtype = 'CV_32FC1 [str: rejoin [form mtype " [CV_32FC1]"]]
		mtype = 'CV_32FC2 [str: rejoin [form mtype " [CV_32FC2]"]]
		mtype = 'CV_32FC3 [str: rejoin [form mtype " [CV_32FC3]"]]
		mtype = 'CV_32FC3 [str: rejoin [form mtype " [CV_32FC4]"]]
		mtype = 'CV_64FC1 [str: rejoin [form mtype " [CV_64FC1]"]]
		mtype = 'CV_64FC2 [str: rejoin [form mtype " [CV_64FC2]"]]
		mtype = 'CV_64FC3 [str: rejoin [form mtype " [CV_64FC3]"]]
		mtype = 'CV_64FC4 [str: rejoin [form mtype " [CV_64FC4]"]]
	]
	rejoin ["Mat Type is " str]
]

_getMatDepth: function [
{Depth is the data type of each individual element in the matrix/image data. 
It can take one of these 8 values:}
	mat	[handle!]
][
	depth: cv/get-property mat cv/MAT_DEPTH
	str: "Invalid depth type of matrix"
	case [
		depth = 0 [str: rejoin [form depth " [CV_8U]"]]
		depth = 1 [str: rejoin [form depth " [CV_8S]"]]
		depth = 2 [str: rejoin [form depth " [CV_16U]"]] 
		depth = 3 [str: rejoin [form depth " [CV_16S]"]]
		depth = 4 [str: rejoin [form depth " [CV_32S]"]]
		depth = 5 [str: rejoin [form depth " [CV_32F]"]]
		depth = 6 [str: rejoin [form depth " [CV_64F]"]]
		depth = 7 [str: rejoin [form depth " [CV_USRTYPE1]"]]
	]
	rejoin ["Mat Depth is " str]
]


_getMatType: function [
{Type combines the data type of the elements along with the number of channels in the matrix/image. 
Since images in OpenCV can have 1-4 channels, it can take one of these 28 values:
}
	mat	[handle!]
][
	mtype: cv/get-property mat cv/MAT_TYPE
	print mtype 	
	str: "Invalid type of matrix"
	case [
		mtype =  0 [str: rejoin [form mtype " [CV_8UC1]"]]
		mtype =  8 [str: rejoin [form mtype " [CV_8UC2]"]]
		mtype = 16 [str: rejoin [form mtype " [CV_8UC3]"]]
		mtype = 24 [str: rejoin [form mtype " [CV_8UC4]"]]
		mtype =  1 [str: rejoin [form mtype " [CV_8SC1]"]]
		mtype =  9 [str: rejoin [form mtype " [CV_8SC2]"]]
		mtype = 17 [str: rejoin [form mtype " [CV_8SC3]"]]
		mtype = 25 [str: rejoin [form mtype " [CV_8SC4]"]]
		mtype =  2 [str: rejoin [form mtype " [CV_16UC1]"]]
		mtype = 10 [str: rejoin [form mtype " [CV_16UC2]"]]
		mtype = 18 [str: rejoin [form mtype " [CV_16UC3]"]]
		mtype = 26 [str: rejoin [form mtype " [CV_16UC4]"]]
		mtype =  3 [str: rejoin [form mtype " [CV_16SC1]"]]
		mtype = 11 [str: rejoin [form mtype " [CV_16SC2]"]]
		mtype = 19 [str: rejoin [form mtype " [CV_16SC3]"]]
		mtype = 27 [str: rejoin [form mtype " [CV_16SC4]"]]
		mtype =  4 [str: rejoin [form mtype " [CV_32SC1]"]]
		mtype = 12 [str: rejoin [form mtype " [CV_32SC2]"]]
		mtype = 20 [str: rejoin [form mtype " [CV_32SC3]"]]
		mtype = 28 [str: rejoin [form mtype " [CV_32SC4]"]]
		mtype =  5 [str: rejoin [form mtype " [CV_32FC1]"]]
		mtype = 13 [str: rejoin [form mtype " [CV_32FC2]"]]
		mtype = 21 [str: rejoin [form mtype " [CV_32FC3]"]]
		mtype = 29 [str: rejoin [form mtype " [CV_32FC4]"]]
		mtype =  6 [str: rejoin [form mtype " [CV_64FC1]"]]
		mtype = 14 [str: rejoin [form mtype " [CV_64FC2]"]]
		mtype = 22 [str: rejoin [form mtype " [CV_64FC3]"]]
		mtype = 28 [str: rejoin [form mtype " [CV_64FC4]"]]
	]
	rejoin ["Mat Type is " str]
]


getInformation
mat: cv/Matrix 250x141 
prin getMatDepth mat
print getMatType mat

filename: %../images/TeaPot512.ppm
mat: cv/imread filename
prin getMatDepth mat
print getMatType mat
cv/imshow/name mat filename 
cv/waitKey 0
cv/free :mat


	