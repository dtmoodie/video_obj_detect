# Setup the environment for opencv
# adapted from <https://github.com/milq/scripts-ubuntu-debian/blob/master/install-opencv.sh>

# Uninstall repository opencv

sudo apt-get autoremove libopencv-dev

# KEEP UBUNTU OR DEBIAN UP TO DATE
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI:
sudo apt-get install -y libvtk6-dev libgtk2.0-dev libgtk-3-dev
sudo apt-get install -y libgtkglext1 libgtkglext1-dbg  libgtkglext1-dev
 # doesn't fix GtkGlExt = YES ...
sudo apt-get install -y libghc-gtkglext-dev libgtkglextmm-x11-1.2-0 libgtkglextmm-x11-1.2-dev

# sudo apt-get install -y qt5-default
# not useing qt-5 just yet

# OpenGL and freeglut
sudo apt-get install -y freeglut3 freeglut3-dev mesa-common-dev libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev

sudo apt-get install -y libgtkglext1-dev libgtkgl2.0-dev

# Video/Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev

sudo apt-get install -y libfaac-dev libfaac0 libmp3lame-dev libxine-dev libxine1-bin v4l-utils x264

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Optimization of routines outside OpenCV
sudo apt-get install -y libatlas-base-dev gfortran

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Gstreamer
sudo apt-get install -y libgstreamer-plugins-base1.0-dev
sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

# Documentation:
sudo apt-get install -y doxygen

# To download the source
sudo apt-get install -y unzip wget

# else
sudo apt-get build-dep opencv

# KEEP UBUNTU OR DEBIAN UP TO DATE
sudo apt-get autoremove




