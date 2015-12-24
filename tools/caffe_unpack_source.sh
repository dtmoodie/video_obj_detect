rm -rf ~/libs/caffe
git clone https://github.com/BVLC/caffe.git ~/libs/caffe
cd ~/libs/caffe
git checkout master
cp ~/libs/caffe/Makefile.config.example ~/libs/caffe/Makefile.config
