#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	;mat: Matrix [1x1 CV_64FC4]
	;probe get-property mat MAT_TYPE   ;== CV_16SC2
	;probe get-property mat MAT_BINARY ;== #{00000000}
	mat: Matrix [1x1 CV_16SC4 #{0000000000000000}]
	print-horizontal-line
	print ["mat size    :"  get-property mat MAT_SIZE]
	print ["mat type    :"  get-property mat MAT_TYPE]
	print ["mat size    :"  get-property mat MAT_SIZE]
	print ["mat depth   :"  get-property mat MAT_DEPTH]
	print ["mat channels:"  get-property mat MAT_CHANNELS]
	print ["mat binary  :"  get-property mat MAT_BINARY]
	print ["mat vector  :"  get-property mat MAT_VECTOR]
	print-horizontal-line
]

;mat1: Matrix [1x1 CV_16SC4 #{0000000000000000}]
;mat2: Matrix [1x1 CV_8UC3 255.255.255]
;mat3: Matrix [382x289 CV_16UC3 :bin]