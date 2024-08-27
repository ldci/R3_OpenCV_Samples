# Rebol 3 OpenCV extension
Various samples for playing with OpenCV extension.
Most of the examples are inspired by Oldes' examples code. Thanks to Oldes for sharing these samples. 
Required images are in /images directory.

##You need a recent version of Oldes's R3 
[https://github.com/Oldes/Rebol3/releases
](https://github.com/Oldes/Rebol3/releases)

A very mature version of Rebol 3, maintained by Oldes, a well-known developer.


##You need also
[https://github.com/Siskin-framework/Builder
](https://github.com/Siskin-framework/Builder)

A fabulous based command line utility useful for compilation of various projects, including compiling R3 form sources. Siskin is used to compile opencv extension.
### How to compile Siskin
Open a terminal session. 
Go to the Siskin directory (currently Builder-0.17.0)
and run the command *r3 siskin.r3 rebol/Siskin*.

Found eggs:

1: Preprocess siskin.r3

2: Siskin x86

3: Siskin x86_64

4: Siskin aarch64

Select your version.The compiled file is in the directory Builder-0.17.0/tree/rebol/Siskin/build/. It's a good idea to rename the compiled file to siskin and copy it to /usr/local/bin (*sudo cp siskin /usr/local/bin*).

And of course, you need OpenCV extension to play with images.
[https://github.com/Oldes/Rebol-OpenCV
](https://github.com/Oldes/Rebol-OpenCV)


### How to compile OpenCV extension
Open a terminal session. Go to the Rebol-OpenCV  directory and run the command s*iskin Rebol-OpenCV.nest*.

Found eggs:

  1:	Rebol openCV extension: macos_x64
  
  2:	Rebol openCV extension: macos_arm64
  
Select your version. Rename the file/build/(version).dylib to *opencv.rebx*, 
and copy the *opencv.rebx* file to */Users/your_username/.rebol/modules/* (default location). You can also copy *opencv.rebx* file in each samples directory (not recommanded).


## Attention! 

OpenCV extension runs only on macOS, but on both intel or ARM architectures. Code is developed under macOS (Sonoma 14.6.1) on ARM M1 processor (and also tested on ARM M2 processor).




