################
# START USER INPUT
################
path_source=~/libs/opencv/
num_jobs=4
################
# END USER INPUT
################

# check if you have cloned to the right location
if [ ! -d "$path_source" ]; then
    echo "======"
    echo "path to the specific dir for opencv source doesn't exist: " $path_source
    echo "clone opencv with:"
    echo "$ cd <your path>"
    echo "$ git clone https://github.com/Itseez/opencv.git"
    echo "$ cd opencv"
    echo "$ git checkout 3.1.0"
    echo "======"
    exit 99
fi

clear
echo ""
echo "========================================================================="
echo "Compile opencv START"
date
echo ""

path_release=$path_source/build/release/
path_debug=$path_source/build/debug/

rm -rf $path_debug
rm -rf $path_release
mkdir $path_debug -p
mkdir $path_release -p

make_options=" \
-DWITH_QT=ON \
-DWITH_OPENGL=ON \
-DBUILD_SHARED_LIBS=OFF \
-DBUILD_DOCS=ON \
-DWITH_TBB=ON \
-DWITH_V4L=ON \
-DBUILD_EXAMPLES=OFF \
-DINSTALL_C_EXAMPLES=OFF \
-DWITH_GDAL=ON \
-DWITH_VTK=OFF \
-USE_EIGEN=/usr/include/eigen3 \
-DWITH_XINE=ON \
-DWITH_CUDA=ON \
-DENABLE_FAST_MATH=1 \
-DCUDA_FAST_MATH=1 \
-DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda/ \
-DWITH_CUBLAS=1 \
-DCMAKE_INSTALL_PREFIX=/usr/local"

# RELEASE
cd $path_release
cur_options="-DCMAKE_BUILD_TYPE=RELEASE $make_options"

echo "    calling..."
echo "    cmake $cur_options $path_source" |& tee cmake_console_output.txt
echo ""
cmake $cur_options $path_source |& tee -a cmake_console_output.txt
	# call cmake with only *two* input vars
read -p "Continue to make (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo ""
    exit
fi
echo "Building release..."
make clean
time make -j $num_jobs
sudo make install
sudo ldconfig

# DEBUG
cd $path_debug
cur_options="-DCMAKE_BUILD_TYPE=RELEASE $make_options"

echo "    calling..."
echo "    cmake $cur_options $path_source" |& tee cmake_console_output.txt
echo ""
cmake $cur_options $path_source |& tee -a cmake_console_output.txt
	# call cmake with only *two* input vars
read -p "Continue to make (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo ""
    exit
fi
echo "Building release..."
make clean
time make -j $num_jobs
sudo make install
sudo ldconfig

