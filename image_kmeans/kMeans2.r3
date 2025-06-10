#!/usr/local/bin/r3
REBOL [
]

{The k-means clustering algorithm is an exclusive method, which stipulates that a data point can exist in only one cluster.
K-means is an iterative centroid-based clustering algorithm that partitions a dataset into similar groups based on the distance between their centroids. 
The centroid (or cluster center) is either the mean or the median of all points.
see: https://rosettacode.org/wiki/K-means%2B%2B_clustering#}


randMax: 2147483647.0	;--a constant (don't modify)
floatMax: 1e100			;--a constant (don't modify)
H: W: 400				;--you can change all variables
nPoints: 10000			;--number of points to generate 
radius:  5.0			;--radius length (> 1)			
k: 7					;--number of clusters
opencv?: yes			;--is opencv extension used?

;--an object for storing values (points and clusters)
point: object [
	x: 		0.0			;--x position
	y: 		0.0			;--y position
	group: 	0			;--cluster number
]

;--Generate random points with all values within a circle of the radius parameter
generatePoints: function [nbPoints [integer!] radius [decimal!]][
	random/seed now/time/precise
	pts: copy []
	repeat i nbPoints [
		pt: copy point										;--make a point object
		angle: (2.0 * pi * random randMax) / (randMax - 1.0);--polar value
		r: (radius * random randMax) / (randMax - 1.0)		;--polar value   
		pt/x: r * cos angle									;--cartesian value
		pt/y: r * sin angle									;--cartesian value
		append pts pt										;--append point object
	]
	pts
]

;--we need a scale for correct points rendering in images
getScale: function [points [block!]][
	minX: minY: floatMax
	maxX: maxY: negate floatMax
	p: 0x0
	foreach v points [
		p/x: to-integer v/x
		p/y: to-integer v/y
		if (maxX < p/x) [maxX: p/x]
		if (minX > p/x) [minX: p/x]
		if (maxY < p/y) [maxY: p/y]
        if (minY > p/y) [minY: p/y]
    ]
    min (W / (maxX - minX)) (H / (maxY - minY))
]

;--show generated points
showPoints: function [points [block!]][
    scale: getScale points
    p: 0x0
    foreach v points [   
    	color: random white					;--random color
    	x: (v/x * scale + W) / 2			;--scalded x coordinate
    	y: (v/y * scale + H) / 2			;--scalded y coordinate 
    	p/x: to-integer x					;--as pair/x
    	p/y: to-integer y					;--as pair/y
		change/dup at image1 p color 3x3	;--update image
	]
]

comment [Computes the dissimilarity between objects a and b (point and cluster)
Returns the squared euclidean distance between two data points.]

dist2: function [a [object!]  b [object!]][((a/x - b/x) ** 2) + ((a/y - b/y) ** 2)]

;--returns the index and the distance of the cluster centroid nearest to the data point passed to the function.Called by kpp and lloyd functions
nearest: function [pt [object!] bCluster [block!] ncluster [integer!]][
	distance: floatMax
	index: pt/group
	;--compare point to all clusters	
	repeat i ncluster [
		d: dist2 pt bCluster/:i	;--get distance
		if distance > d [
            distance: d			;--update distance
            index: i			;--update cluster index
        ]
	]
	reduce [index distance]
]

;--create a block of objects according to the number of clusters 
generateClusters: function [ncluster [integer!] return: [block!]][
	blk: copy []
	repeat i ncluster [append blk copy point]
	blk
]

;--init function. This function uses the K-Means++ method to select the cluster centroids
kpp: function [points [block!] bCluster [block!]][
	len: length?  points
	nCluster: length? bCluster
	;--Pick the first cluster centroids at random
	bCluster/1: copy points/(random len)
	d: 0.0
	;--repeat until we have taken all clusters centroids
	repeat i nCluster [
		blk: copy []	;--create a block of the cumulative distances
		;--for each data point find the nearest centroid
		;--save its distance in the distance block
		;-- then add it to the sum of total distance
		sigma: 0.0
		repeat j len [
			d: second nearest points/:j bCluster i	;-get point distance to the cluster
			sigma: sigma + d						;--sum of distances
            append blk d							;--store distances
		]
		;--find a random distance within the span of the total distance 
		sigma: (sigma * random randMax) / (randMax - 1.0)
		;--Assign the centroids according to distance	
		repeat j len [
			sigma: sigma - blk/:j
			;--assign the centroids. Only positive distances
			either sigma >= 0.0 [
				bCluster/:i: copy points/:j			;--update cluster as point object
			] [break]
		]
	]
	repeat j len [
		;--each point is affected to it's nearest cluster centroid
		p: points/:j
		p/group: first nearest points/:j bCluster nCluster ;--update group index (OK)
	]
]

comment [Lloyd clustering with convergence (k-means algorithm).
This function clusters the data using Lloyd's K-Means algorithm
after selecting the intial centroids using the K-Means++ (kpp)method.]

lloyd: function [points [block!] nCluster [integer!]][
	len: length?  points
	clusters: generateClusters nCluster	;--create a block of clusters objects 
	kpp points clusters					;--get clusters initial values
	lenpts10: len >> 10					;--Convergence criterion: when iteration ceases
	until [
		;--Cloning objects allows to update centroid objects
		;--Add each observation's x and y to its cluster total
		repeat j len [
			p: points/:j			;--get point values
			c: clusters/(p/group)	;--clone centroid object according to cluster index
			c/x: c/x + p/x			;--update x centroid value
			c/y: c/y + p/y			;--update y centroid value
			c/group: c/group + 1	;--increase centroid index
		]
		
		;--Divide each cluster's x and y totals by its number of data points
		;--and set each centroid's group index
		repeat j nCluster [
			c: clusters/:j
            c/x: c/x / c/group		;--mean x (x centroid)
            c/y: c/y / c/group		;--mean y (y centroid)
            c/group: j				;--set cluster group 
		]
		;--start convergence test
		changed?: 0					
		;find closest centroid for each point
		repeat j len [
			p: points/:j
			cIndex: first nearest p clusters nCluster
			if cIndex <> p/group [
				p/group: cIndex		;--point is updated
				changed?: changed? + 1
			]
		]
		;--stop when 99.9% of points are good
		;clusters are generated with x y and group values
		changed? > lenpts10;--Convergence criterion is reached
	]
	;--clusters values are now OK
	clusters
]

showKmeans: function [points [block!] bclusters [block!] nCluster [integer!]][
	len: length?  points
	;--make color clusters
	colors: copy []
	repeat i nCluster [
		r: (3 * (i + 1) % 11) / 11.0 * 255
		g: (7 * i % 11) / 11.0 * 255
		b: (9 * i % 11) / 11.0 * 255
		t: make tuple! reduce [to-integer r to-integer g to-integer b]
		append colors t
	]
	;--show generated points for each cluster
	scale: getScale points						;--get scale
    p: 0x0
    repeat i nCluster [
    	repeat j len [
    		pt: points/:j						;--get point
    		nx: (pt/x * scale + W) / 2			;--scaled x coordinate
    		ny: (pt/y * scale + H) / 2			;--scaled y coordinate
    		p/x: to-integer nx					;--as pair/x
    		p/y: to-integer ny					;--as pair/y
    		color: colors/(pt/group)			;--get cluster color
    		change/dup at image2 p color 3x3	;--show generated points in image2
		]
    ]
    repeat i nCluster [
    	c: bclusters/:i							;--get centroid
		nx: (c/x * scale + W) / 2				;--scaled x coordinate
    	ny: (c/y * scale + H) / 2				;--scaled y coordinate
    	p/x: to-integer nx						;--as pair/x
    	p/y: to-integer ny						;--as pair/y
    	change/dup at image2 p red 6x6		;--show centroid (mean)
    ]
]

;******************** Main program ***********************
;--create images 
iSize: as-pair W H
image1: make image! reduce [iSize black]
image2: make image! reduce [iSize black]
;--process data
t: dt [
	print ["Generating " nPoints "random points"]
	points: generatePoints nPoints radius
	showPoints points
	print ["Classifying data in" k "clusters"]
	clusters: lloyd points k
	print "Generating images"
	showKMeans points clusters k
]
;--visualisation
if opencv? [
	cv: import 'opencv
	cv/imshow/name image1 "Points"
	cv/moveWindow "Points"  100x0
	cv/imshow/name image2 "Clusters"
	xpos: as-pair W + 100 0
	cv/moveWindow "Clusters"  xpos
	print ["Done in" to-integer ((third t) * 1000) "msec"]
	cv/waitKey 0
]

unless opencv? [
	print "Images saved as png"
	save %points.png image1
	save %clusters.png image2
	call/shell "open points.png"	;--macOS
	call/shell "open clusters.png"	;--macOS
]

