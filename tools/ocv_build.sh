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
echo "========================================================================="
echo "Compile opencv START"
date

path_release=$path_source/build/release/
path_debug=$path_source/build/debug/

mkdir $path_debug -p
mkdir $path_release -p

make_options="      -D BUILD_SHARED_LIBS=OFF \
      -D BUILD_DOCS=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D BUILD_EXAMPLES=OFF \
      -D INSTALL_C_EXAMPLES=OFF \
      -D WITH_GDAL=ON \
      -D WITH_OPENGL=ON \
      -D WITH_VTK=ON \
      -D WITH_GTK=ON \
      -D WITH_QT=OFF \
       USE_EIGEN=/usr/include/eigen3 \
      -D WITH_XINE=ON \
      -D WITH_CUDA=ON \
      -D ENABLED_FAST_MATH=1 \
      -D CUDA_FAST_MATH=1 \
      -D WITH_CUBLAS = 1 \
      -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda/ \ "

cd $path_release
cmake "-D CMAKE_BUILD_TYPE=RELEASE \ $make_options" $path_source
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

cd $path_debug
cmake "-D CMAKE_BUILD_TYPE=DEBUG \ $make_options" $path_source
read -p "Continue to make (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo ""
    exit
fi
echo "Building debug..."
make clean
time make -j $num_jobs
sudo make install

