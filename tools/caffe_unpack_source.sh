rm -rf ~/libs/caffe
git clone https://github.com/BVLC/caffe.git ~/libs/caffe
cd ~/libs/caffe
git checkout master
cp ~/libs/caffe/Makefile.config.example ~/libs/caffe/Makefile.config

# future work, install python requirements
# something like:
#cd caffe
#cd python
#for req in $(cat requirements.txt); do sudo pip install $req; done

echo ""
echo "=============================================="
echo "Modify your new makefile: '~/libs/caffe/Makefile.config"
echo "Change the paths and options for your setup"
echo "=============================================="
x-terminal-emulator -e nano ~/libs/caffe/Makefile.config

gnome-terminal -x bash -c "echo caffe_install_depends.sh : please modify your makefile; echo running  nano ~/libs/caffe/Makefile.config; nano ~/libs/caffe/Makefile.config"
