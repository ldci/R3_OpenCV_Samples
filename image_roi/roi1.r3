#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	filename: %../images/mandrill.jpg
	mat: 		imread/with filename 1
	binData: 	get-property mat MAT_BINARY
	nc: 		get-property mat MAT_CHANNELS
	mtype: 		get-property mat MAT_TYPE
	width: 		first get-property mat MAT_SIZE
	
	;imshow/name mat filename 
	r: selectRoi Mat
	print [r/1 r/2]
	bin: #{}
	line: r/1/y
	idx: line * width + r/1/x * nc
	j: 0
	while [j < r/2/y][
		i: 0
		while [i < r/2/x][
			append bin binData/(idx + 1)
			append bin binData/(idx + 2)
			append bin binData/(idx + 0) 
			idx: idx + 3
			i: i + 1
		]
		j: j + 1
		line: line + 1
		idx: line * width + r/1/x * nc
	]
	crop: Matrix [:r/2 :mtype :bin]
	gray: cvtColor crop none COLOR_BGR2GRAY
	namedWindow win2: "Selection"
	imshow/name crop win2
	moveWindow win2 10x10
	namedWindow win3: "Grayscale"
	imshow/name gray win3
	moveWindow win3 250x10
	waitKey 0
	destroyAllWindows
]
