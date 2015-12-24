################
# START USER INPUT
################
path_source=~/libs/opencv-3.0.0/
num_jobs=2
################
# END USER INPUT
################

path_release=$path_source/release/
path_debug=$path_source/debug/

sudo rm -rf $path_debug
mkdir $path_debug/install -p
sudo rm -rf $path_release
mkdir $path_release/install -p

cd $path_release
cmake -D CMAKE_INSTALL_PREFIX=$path_release/install \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D BUILD_SHARED_LIBS=OFF \
      -D BUILD_DOCS=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D INSTALL_C_EXAMPLES=ON \
      -D BUILD_EXAMPLES=ON \
      -DWITH_GDAL=ON \
      -D WITH_OPENGL=ON \
      -D WITH_QT=OFF \
       USE_EIGEN=/usr/include/eigen3 \
      -D WITH_XINE=ON ..
read -p "Continue to make (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    exit
fi
echo "Building release..."
make clean
time make -j $num_jobs
sudo make install

cd $path_debug
cmake -D CMAKE_INSTALL_PREFIX=$path_debug/install \
      -D CMAKE_BUILD_TYPE=DEBUG \
      -D BUILD_SHARED_LIBS=OFF \
      -D BUILD_DOCS=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D INSTALL_C_EXAMPLES=ON \
      -D BUILD_EXAMPLES=ON \
      -DWITH_GDAL=ON \
      -D WITH_OPENGL=ON \
      -D WITH_QT=OFF \
       USE_EIGEN=/usr/include/eigen3 \
      -D WITH_XINE=ON ..
read -p "Continue to make (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    exit
fi
echo "Building debug..."
make clean
time make -j $num_jobs
sudo make install
