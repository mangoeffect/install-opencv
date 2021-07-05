#!/bin/sh
brew install qt5

# Save current working directory
cwd=$(pwd)

#Specify OpenCV version
cvVersion="master"

git clone https://github.com/opencv/opencv.git
cd opencv
git checkout $cvVersion
cd ..
 
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout $cvVersion
cd ..

cd opencv
mkdir build
cd build

cmake   -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules .. 
            
make -j$(sysctl -n hw.physicalcpu)
make install

cd $cwd