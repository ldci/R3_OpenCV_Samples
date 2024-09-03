#!/usr/local/bin/r3
REBOL [
]
;--invert requires 32 or 64 1 channel matrices
cv: import opencv
with cv [
	vec1: #(f64! [-1.0 -2.0 -1.0 0.0 0.0 0.0 1.0 2.0 1.0 2.0])
	vec2: #(f64! [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0])
	mat1: Matrix [5x2 CV_64FC1 :vec1]
	mat2: Matrix [2x5 CV_64FC1 :vec2]
	invert :mat1 :mat2 1	;--singular value decomposition
	probe get-property mat1 MAT_VECTOR
	probe get-property mat2 MAT_VECTOR
]