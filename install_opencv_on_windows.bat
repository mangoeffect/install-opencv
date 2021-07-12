
set "branch=master"
mkdir opencv-%branch%
cd opencv-%branch%

echo "Downloading opencv from github"
::Download opencv from githubg
git clone https://github.com/opencv/opencv.git
cd opencv
::checkout appropriate cv version
git checkout %branch%
cd ..
::Download opencv_contrib from git
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
::Checkout appropriate opencv_contrib version
git checkout %branch%
cd ..

cd opencv
mkdir build
cd build
::CMake generate visual studio solution::
echo "CMake generate visual studio solution..."
cmake -G "Visual Studio 16 2019" -DINSTALL_PYTHON_EXAMPLES=ON -DOPENCV_EXTRA_MODULES_PATH=%cwd%\opencv_contrib\modules ..
cd ..

:: CMake build the opencv solution
echo "CMake build the opencv solution..."
echo "Buidding Release..."
cmake --build build --config Release --target INSTALL
echo "Buidding Debug..."
cmake --build build --config Debug --target INSTALL


