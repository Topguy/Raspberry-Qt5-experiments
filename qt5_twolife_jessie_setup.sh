#!/bin/bash

# Adventures with Qt5 and Raspbian Jessie.
# Using libraries from twolife.be

sudo apt-get update
sudo apt-get -y --force-yes dist-upgrade
sudo apt-get -y --force-yes install apt-transport-https

# Add the twolife.be repository.
sudo bash -c 'cat << EOF > /etc/apt/sources.list.d/twolife.list
# Raspbian Jessie (stable)
deb https://twolife.be/raspbian/ jessie main qt
deb-src https://twolife.be/raspbian/ jessie main qt
EOF'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 2578B775

sudo apt-get update

# Install most of the needed Qt packages.
sudo apt-get -y --force-yes install qml-module-qtquick2 qml qmlscene qml-module-qtquick-particles2 libqt5egldeviceintegration5

# Optional: Install the QtQuick/QML demos
# sudo apt-get -y --force-yes install qtdeclarative5-examples

# Optional: Install some prerequisites for the demos
# sudo apt-get -y --force-yes install qml-module-qtquick-controls qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings

# We unfortunatly have to fix some librarynames.
#sudo cp /opt/vc/lib/libGLESv2.so /opt/vc/lib/libGLESv2.so.bak
#sudo cp /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.bak

#sudo mv /opt/vc/lib/libGLESv2.so /opt/vc/lib/libGLESv2.so.2
#sudo mv /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1

# Probably best method for fixing the libraries.
sudo ln -fs /opt/vc/lib/libGLESv2.so /opt/vc/lib/libGLESv2.so.2
sudo ln -fs /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1
sudo ldconfig

# Uncomment these to add some practical environment variables to every login.
#cat << EOF >> ~/.profile
#export QT_SELECT=5
#export QT_QPA_PLATFORM=eglfs
#export LD_LIBRARY_PATH=/opt/vc/lib
#EOF

# Create an EXAMPLE batchfile for running some demo. 
cat << EOF > photoviewer.sh
#!/bin/bash
export QT_SELECT=5
export QT_QPA_PLATFORM=eglfs
export LD_LIBRARY_PATH=/opt/vc/lib
qml /usr/lib/arm-linux-gnueabihf/qt5/examples/quick/demos/photoviewer/main.qml
EOF
chmod u+x photoviewer.sh
