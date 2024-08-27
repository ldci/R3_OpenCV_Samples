#!/usr/local/bin/r3
Rebol [
]
;--Oldes's code 
cv: import opencv
with cv [
    src: imread %../images/lena.jpg
    size: get-property :src MAT_SIZE
    gray: cvtColor :src none COLOR_BGR2GRAY

    num-filters: 32
    sigma: 1.5    ;; The bandwidth or sigma controls the overall size of the Gabor envelope.
    theta: 0      ;; The theta controls the orientation of the Gabor function.
    lambd: 60     ;; The wavelength governs the width of the strips of the Gabor function.
    gamma: 0.75   ;; The aspect ratio or gamma controls the height of the Gabor function.
    psi: PI * 0.5 ;; The phase offset.

    theta-step: pi / num-filters
    kernels: make block! num-filters

    loop num-filters [
        ;- Generate new Gabor kernel
        kern: getGaborKernel 35x35 :sigma :theta :lambd :gamma :psi CV_64F
        normalize :kern :kern 1 0 NORM_L1 CV_64F ;- Brightness normalization
        ;probe get-property kern MAT_VECTOR
        ;- Store it for later use
        append kernels kern
        ;- Update the orientation for the next kernel
        theta: theta + theta-step
    ]

    temp: Matrix [:size CV_8UC1] ;; holds temporary filtered image
    dest: Matrix [:size CV_8UC1] ;; detected edges
    heatmap: Matrix [:size CV_8UC1]	;--for colorspace
    ;- Apply each Gabor kernel to filter the grayscale source
    foreach kern kernels [
        temp: filter2D :gray :temp -1 :kern -1x-1 0
        normalize :temp :temp 0 255 NORM_MINMAX
        ;- Compare our filter and cumulative image, taking the higher value
        max :dest :temp :dest
        ;- Display current detection state
        applyColorMap :dest :heatmap 10
        imshow/name :dest "Edges"
        waitKey 10
    ]
    imshow/name :heatmap "Heatmap"
    moveWindow "Edges" 0x10
    moveWindow "Heatmap" 300x10
    waitKey 0
]