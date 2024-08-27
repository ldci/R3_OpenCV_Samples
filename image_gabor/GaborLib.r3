REBOL [ 
] 

{based on https://moonbooks.org/Articles/How-to-plot-a-Gabor-filter-using-python-and-matplotlib-/}

rcvGaborChangeBase: function [
	x y		[integer!]
	theta	[decimal!]
	return: [block!]
][
	x_theta: (x * cos theta) + (y * sin theta)	;-OK
    y_theta: (y * cos theta) - (x * sin theta)	;-OK
    b: copy []
    append b x_theta
    append b y_theta
    b
] 

rcvGaborFunction: function [
	x y		[integer!]
	theta	[decimal!]
	f		[decimal!]
	sigma_x [decimal!]
	sigma_y [decimal!]
	return: [decimal!]
][
	b: rcvGaborChangeBase x y theta 
	r1: b/1 / sigma_x 						;--OK
	r2: b/2 / sigma_y						;--OK
	arg: -0.5 * (( r1 ** 2) + (r2 ** 2)) 	;--OK
	(exp (arg)) * cos(2 * pi * f * b/1)		;--OK
]

rcvGaborKernel: function [
	theta	[decimal!]	;--angle in radian
	f		[decimal!]	;--the wavelength of the filter  > 0.0
	sigma_x [decimal!]	;--the standard deviation of the Gaussian function > 0.0 
	sigma_y [decimal!]	;--ellipticity of kernel function > 0.0
	radius	[integer!]	;--kernel size
	return: [block!]
][
	kSize: radius * 2
	mat: copy []
	x: negate radius
	i: 0
	while [i < (radius * 2)] [
		y: negate radius
		j: 0 
		while [j < (radius * 2)][
			append mat rcvGaborFunction x y theta f sigma_x sigma_y
			++ y ++ j
		]
		++ x ++ i
	]
	mx: find-max mat maxi: mx/1		;--max of Gabor function
	mn: find-min mat mini: mn/1		;--min of Gabor function
	b: copy []
	append b kSize		;--kernel size
	append b mini		;--min of Gabor function
	append b maxi		;--max of Gabor function
	append/only b mat	;--Kernel values
	b
]
