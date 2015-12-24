#!/bin/bash

rm -rf /tmp/opencv-3.0.0
unzip /tmp/ocv_3-0-0.zip -d /tmp/
sudo rm -rf ~/libs/opencv-3.0.0/
mkdir ~/libs/opencv-3.0.0/
mv /tmp/opencv-3.0.0/* ~/libs/opencv-3.0.0/
rm -rf /tmp/opencv-3.0.0

