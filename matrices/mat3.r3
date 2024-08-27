#!/usr/local/bin/r3
Rebol [
]

;--under progress
cv: import opencv

with cv [
	;v: #[uint8![0 1 2 3 4 5]] -> map now
	v:   #(uint8! [0 1 2 3 4 5]) ;-> vector now
	
	probe type? v
	;mat: Matrix [3x2 #[uint8! [0 1 2 3 4 5]]] ;--old definition
	bin: to-binary v
	mat: Matrix [3x2 CV_8UC1 :bin]
	print-horizontal-line
	print ["mat size    :"  get-property mat MAT_SIZE]
	print ["mat type    :"  get-property mat MAT_TYPE]
	print ["mat channels:"  get-property mat MAT_CHANNELS]
	print-horizontal-line
	probe get-property mat MAT_VECTOR
	probe get-property mat MAT_BINARY
	print-horizontal-line
]

;n: 10 v: make vector! reduce ['float! n]