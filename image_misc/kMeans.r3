#!/usr/local/bin/r3
REBOL [
]
{
The k-means clustering algorithm is an exclusive method, which stipulates that a data point can exist in only one cluster.
K-means is an iterative centroid-based clustering algorithm that partitions a dataset into similar groups based on the distance between their centroids. 
The centroid, or cluster center, is either the mean or the median of all points in the cluster, depending on the characteristics of the data. Here we use the mean
}
map1: make image! reduce [400x400 black]
map2: make image! reduce [400x400 black]
nPoints: 5000
radius: 5.0
randMax: 2147483647.0 
floatMax: 1e100
k: 7					;--number of clusters
points: copy []			;--to store generated points
centroids: copy []		;--to store calculated centroids

;--we use an object for storing data values
point: object [
	x: 		0.0			;--x position
	y: 		0.0			;--y position
	group: 	0			;--cluster number
]

;--Generate random points
generatePoints: function [count [integer!] radius [decimal!] return: [block!]
][
	random/seed now/time/precise
	blk: copy []
	repeat i count [
		pt: copy point	;--copy point object
		ang: (2.0 * pi * random randMax) / randMax - 1.0
		r: (radius * random randMax) / randMax - 1.0 
		pt/x: r * cos ang
		pt/y: r * sin ang
		append blk pt
	]
	blk
]
;--show generated points
showPoints: function [points [block!]][
	H: W: 400
	minX: floatMax
	minY: floatMax
	maxX: negate floatMax
	maxY: negate floatMax	
	p: 0x0
	;--we need a scale for correct rendering in cartesian coordinates
	foreach v points [
		p/x: to-integer v/x
		p/y: to-integer v/y
		if (maxX < p/x) [maxX: p/x]
		if (minX > p/x) [minX: p/x]
		if (maxY < p/y) [maxY: p/y]
        if (minY > p/y) [minY: p/y]
    ]
    scale: min (W / (maxX - minX)) (H / (maxY - minY))
    cx: (maxX + minX) / 2.0
    cy: (maxY + minY) / 2.0

    foreach v points [   
    	color: random white					;--random color
    	nx: (v/x - cx * scale + W) / 2		;--x coordinate
    	ny: (v/y - cy * scale + H) / 2		;--y coordinate 
    	p/x: to-integer nx					;--as pair/x
    	p/y: to-integer ny					;--as pair/y
		change/dup at map1 p color 3x3		;--update image
	]
]

;--Init centroid block according to the number of clusters 
generateCentroid: function [ncluster [integer!] return: [block!]][
	blk: copy []
	repeat i ncluster [
		pt: copy point	;--make an object
		pt/x: 0.0
		pt/y: 0.0
		pt/group: 0
		append blk pt
	]
	blk
]

;Computes the dissimilarity between points a and b
dist2: function [a [object!]  b [object!] return: [decimal!]][
	x: a/x - b/x
	y: a/y - b/y
	;(x * x) + (y * y)
	sqrt ((x * x) + (y * y))	;Euclidian norm
	
]

;--Distance and index of the closest centroid 
;--called by kMInit and kMeans functions
nearest: function [pt [object!] centroid [block!] ncluster [integer!] return: [block!]] [
	minDistance: floatMax
	minIndex: pt/group	
	repeat i ncluster [
		d: dist2 pt centroid/:i	;--get min distance
		if minDistance > d [
            minDistance: d		;--update min distance
            minIndex: i			;--update index
        ]
	]
	reduce [minIndex minDistance]
]

;--init function
kMInit: function [points [block!] centroid [block!]][
	len: length?  points
	nCluster: length? centroid
	;--take one center chosen uniformly at random from points
	centroid/1: copy points/(random len)
	d: 0.0
	;--repeat until we have taken all nClusters centers
	repeat i nCluster [
		blk: copy []	;--for minimal distance
		sigma: 0.0
		repeat j len [
			d: second nearest points/:j centroid i	;-get point distance to the centroid
			sigma: sigma + d						;--sum of distances
            append blk d							;--store distances
		]
		;initialise sum for each cluster 
		sigma: (sigma * random randMax) / randMax - 1.0	
		repeat j len [
			sigma: sigma - blk/:j
			;--only positive values
			either sigma > 0.0 [
				centroid/:i: copy points/:j			;--update centroid as point object
			] [break]
		]
	]
	repeat j len [
		p: points/:j
		p/group: first nearest points/:j centroid nCluster ;--update group index
	]
]

;--Lloyd K-means Clustering with convergence (k-means algorithm)
;--group element for centroids are used as counters
;--When a set of centroids is defined, the clusters are updated 
;--to include the points closest to each center of the centroid.

kMeans: function [points [block!] nCluster [integer!] return: [block!]][
	len: length?  points
	centroids: generateCentroid nCluster;--create a block of centroid objects 
	kMInit points centroids				;--call kMInit init and get centroid values
	lenpts10: len >> 10					;--Convergence criterion: when iteration ceases
	until [
		;--Cloning objects allows to update centroid objects
		repeat j len [
			p: points/:j			;--get x y data values
			c: centroids/(p/group)	;--clone centroid object
			c/x: c/x + p/x			;--update x centroid value
			c/y: c/y + p/y			;--update y centroid value
			c/group: c/group + 1	;--increase centroid index
		]
		
		;update each centroid
		repeat j nCluster [
			c: centroids/:j
            c/x: c/x / c/group		;--mean x
            c/y: c/y / c/group		;--mean y
            c/group: j				;--update centroid group element
		]
		
		changed: 0
		;find closest centroid for each point
		repeat j len [
			p: points/:j
			min_I: first nearest p centroids nCluster
			if min_I <> p/group [
				changed: changed + 1
				p/group: min_I
			]
		]
		;--stop when 99.9% of points are good
		changed > lenpts10
	]
	centroids
]

showKmeans: function [points [block!] bcentroid [block!] nCluster [integer!]][
	H: W: 400
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
	;--show generated points
	minX: floatMax
	minY: floatMax
	maxX: negate floatMax
	maxY: negate floatMax
	;--we need a scale for correct rendering in cartesian coordinates
	p: 0x0
	foreach v points [
		p/x: to-integer v/x
		p/y: to-integer v/y
		if (maxX < p/x) [maxX: p/x]
		if (minX > p/x) [minX: p/x]
		if (maxY < p/y) [maxY: p/y]
        if (minY > p/y) [minY: p/y]
    ]
	scale: min (W / (maxX - minX)) (H / (maxY - minY))
	cx: (maxX + minX) / 2
    cy: (maxY + minY) / 2
    ;--for each cluster
    repeat i nCluster [
    	repeat j len [
    		pt: points/:j						;--get point
    		nx: (pt/x - cx * scale + W) / 2		;--x coordinate
    		ny: (pt/y - cy * scale + H) / 2		;--y coordinate
    		p/x: to-integer nx					;--as pair/x
    		p/y: to-integer ny					;--as pair/y
    		color: colors/(pt/group)			;--get cluster color
    		change/dup at map2 p color 3x3		;--show generated points in map2
		]
    ]
    repeat i nCluster [
    	c: bcentroid/:i							;--get centroid
		nx: (c/x - cx * scale + W) / 2			;--x coordinate
    	ny: (c/y - cy * scale + H) / 2			;--y coordinate
    	p/x: to-integer nx						;--as pair/x
    	p/y: to-integer ny						;--as pair/y
    	change/dup at map2 p yellow 4x4			;--show centroid mean
    ]
]

;-------------------Main program---------------------
print ["Processing" form nPoints "points"]
t: dt [
	print "Generating random points..."
	points: generatePoints nPoints radius
	showPoints points
	print "Classifying data..."
	centroids: kMeans points k
	print "Generating images..."
	showKMeans points centroids k
]
cv: import 'opencv
with cv [
	imshow/name map1 "Points"
	moveWindow "Points"  100x0
	imshow/name map2 "Clusters"
	moveWindow "Clusters"  501x0
	print ["Done in" form third t "sec"]
	waitKey 0
]

