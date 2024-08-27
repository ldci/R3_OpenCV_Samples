#!/usr/local/bin/r3
Rebol [
]

moments: func [
	signal 			[vector! block!]
	moment			[decimal!]
	order			[decimal!]
    return:			[decimal!]
][
	sigma: 0.0
	len: length? signal
	foreach v signal [sigma: sigma + power (v - moment) order]
	sigma / len
]

random/seed now/time
	vect: []
	repeat i 30 [append vect random 50]
	probe sort vect
    mu1: moments vect 0.0 1.0
    mu2: moments vect mu1 2.0
    mu3: moments vect mu1 3.0
    mu4: moments vect mu1 4.0 
    
    mean: mu1											;--mean
	sd: square-root mu2									;--SD
	skew: mu3 / (power sd 3.0)							;--skewness coefficient
	kurtosis: mu4 / (power sd 4.0)						;--kurtosis	coefficient	
    print [mean sd skew kurtosis]