#!/bin/bash
 
########################################################
#       Install opencpn on Raspberry PI
#
#      6 Feb 15  by opencpn@agurney.com 
#      see http://opencpn.org/ocpn/compiling_source_linux    
########################################################################

echo
echo
echo "$(tput setaf 1)"
echo "########################################################"
echo "Install OpenCPN dependencies"
echo "########################################################"
echo "$(tput setaf 6)"


cd ~

# sudo apt-get install -y build-essential cmake gettext \
# 	git-core gpsd gpsd-clients libgps-dev wx-common \
# 	libwxgtk2.8-dev libglu1-mesa-dev libgtk2.0-dev \
# 	wx2.8-headers libbz2-dev libtinyxml-dev \
# 	libportaudio2 portaudio19-dev

echo "$(tput setaf 1)"
echo "########################################################"
echo "download and extract the latets OpenCPN sources"
echo "check opencpn.org to see if there's a newer version"
echo "########################################################"
echo "$(tput setaf 6)"

# git clone git://github.com/OpenCPN/OpenCPN.git


cd OpenCPN/
mkdir -p build
cd build
cmake ../
make -j4
sudo make install


echo "$(tput setaf 1)"
echo "########################################################"
echo "Done ... just a desktop link to create"
echo "########################################################"
echo "$(tput setaf 6)"

cp /usr/local/share/applications/opencpn.desktop /home/pi/Desktop/

echo
echo "$(tput setaf 1)"
echo "########################################################"
echo " Add a couple of lines to the /boot/config.txt file; use any text editor such as vi or leafpad."
echo "  sudo vi /boot/config.txt"
echo "$(tput setaf 7)"
echo "       framebuffer_depth=32"
echo "       framebuffer_ignore_alpha=1"
echo "$(tput setaf 1)"
echo "These changes will be effective following the next reboot and are required"
echo "to resolve problems that the Pi/armhf has with vector charts. "
echo "########################################################"
echo 
echo "DONE"
echo "$(tput setaf 7)"
echo



