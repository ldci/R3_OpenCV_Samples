#!/usr/local/bin/r3
Rebol [
	title: "Basic OpenCV extension test"
]
;--Adapted from Oldes's test sample
system/options/quiet: false
system/options/log/rebol: 4

CI?: any [
	"true" = get-env "CI"
	"true" = get-env "GITHUB_ACTIONS"
	"true" = get-env "TRAVIS"
	"true" = get-env "CIRCLECI"
	"true" = get-env "GITLAB_CI"
]

if CI? [
	;; for the CI test the module is the build directory 
	system/options/modules: dirize to-real-file %build/ ;@@ to-real-file on linux does not include the tailing slash!
	print ["Using modified modules location:" as-green system/options/modules]
	ls (system/options/modules)

	either system/platform = 'Windows [
		;; include a directory with OpenCV dlls in the PATH environment variable
		set-env "PATH" ajoin [
			to-local-file to-real-file rejoin [%build/ system/build/arch %/vc17/bin/]
			#";" get-env "PATH"
		]
	][
		;; OpenCV libraries were installed into /usr/local/lib so make sure that are found
		set-env "LD_LIBRARY_PATH" "/usr/local/lib:/lib:/usr/lib"
		;; In stable environment it is possible to make it permanent using `ldconfig`
		;; @@ https://unix.stackexchange.com/a/67784
	]
]


try [system/modules/opencv: none] ;; make sure that we use the local one

cv: import opencv
print ["OpenCV: " cv/getVersionString]
print cv/getBuildInformation

print as-green "Encode QRcode..."
mat: cv/qrcode-encode https://github.com/Oldes/Rebol-OpenCV/
save %qrcode1.png img: mat/image

print as-green "Decode QRcode..."
;; the original matrice is too small, so resize it first...
mat: cv/resize/with mat 500% 0     ;; using OpenCV
img: resize/filter img 500% 'box   ;; using Rebol
cv/imShow/name mat "QR Code"
cv/waitKey 500
save %qrcode2.png img

prin "From cvMat: "
probe cv/qrcode-decode mat

prin "From image: "
probe cv/qrcode-decode img

prin "From file:  "
probe cv/qrcode-decode %qrcode2.png

