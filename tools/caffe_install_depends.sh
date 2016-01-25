# future work, check out https://github.com/BVLC/caffe/wiki/Caffe-on-EC2-Ubuntu-14.04-Cuda-7
# CuDNN https://github.com/facebook/fbcunn/blob/master/INSTALL.md

# KEEP UBUNTU OR DEBIAN UP TO DATE
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove

# general depends
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev

# BLAS
sudo apt-get install -y libatlas-base-dev

# I/O
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev

# Prompt user to install NVIDIA driver
echo ""
echo "=============================================="
echo "Please install your NVIDIA driver before continuing"
echo "You may abort this script in order to do so now"
read -p "Abort (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo "Aborting..."
        exit 99
    ;;
    * )
        echo "Continuing..."
    ;;
esac
echo "=============================================="

# CUDA
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb -P /tmp
sudo dpkg -i /tmp/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda

# CUDA environment
echo ""
echo "=============================================="
echo "Setup your environment"
echo "Add to your bashrc:"
echo "QUOTE"
echo 'export CUDA_HOME=/usr/local/cuda-7.5'
echo 'LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}${CUDA_HOME}/lib64'
echo 'export LD_LIBRARY_PATH'
echo 'PATH=${CUDA_HOME}/bin:${PATH}'
echo "export PATH"
echo "END QUOTE"
echo "=============================================="
gnome-terminal -x bash -c "echo caffe_install_depends.sh : please modify your bashrc; echo running sudo nano ~/.bashrc; sudo nano ~/.bashrc"

