#!/usr/local/bin/r3
Rebol [
]
;--read and display a 3-channel 8-bit TIFF image with multi pages
delay: 300 ;--ms
cv: import opencv
with cv [
	images: imreadmulti %../images/images.tiff
	n: length? images
	mat: Matrix images/1
	print ["mat size    :" size: get-property mat MAT_SIZE]
    print ["mat type    :" type: get-property mat MAT_TYPE]
    print ["mat depth   :" depth: get-property mat MAT_DEPTH]
   	print ["mat channels:" channels: get-property mat MAT_CHANNELS]
   	repeat i n [
   		setWindowTitle "Image" join "Page: " i
   		imshow images/:i 
		waitKey delay
   	]
	print "Done. Any key to close"
	waitKey 0
	destroyAllWindows 
]