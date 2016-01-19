# from <http://www.bornagainproject.org/documentation/installation/unix/install_third_party_software>
# from <https://wiki.qt.io/Install_Qt_5_on_Ubuntu>

# Installing required packages
sudo apt-get install build-essential
sudo apt-get install mesa-common-dev
sudo apt-get install libglu1-mesa-dev
sudo apt-get install libgsl0-dev libboost-all-dev libfftw3-dev libtiff5-dev

# Installing Qt5
sudo apt-get install qt5-default qttools5-dev qtscript5-dev

# VTK
# redundancy in opencv depends
sudo apt-get install libvtk6-dev
