# Setup the environment for opencv
# adapted from <https://github.com/milq/scripts-ubuntu-debian/blob/master/install-opencv.sh>

# Uninstall repository opencv

sudo apt-get autoremove libopencv-dev

# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get autoremove

# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI:
sudo apt-get install -y libvtk6-dev
# sudo apt-get install -y qt5-default
# not useing qt-5 just yet

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

$ sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Optimization of routines outside OpenCV
$ sudo apt-get install libatlas-base-dev gfortran

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen

# Downloading the source
sudo apt-get install -y unzip wget

# Download the source
wget -O /tmp/ocv_3-0-0.zip https://github.com/Itseez/opencv/archive/3.0.0.zip


