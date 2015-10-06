# Checkout and build mlbrowser.

sudo apt-get -y --force-yes install libqt5webkit5-dev qtdeclarative5-dev qt5-default qt5-qmake
git clone https://github.com/Topguy/mlbrowser.git
cd mlbrowser/
mkdir build
cd build/
qmake DEFINES+=_BROWSER_ DEFINES+=_MOUSE_ DEFINES+=_PROPERTYCHANGER_ ../src/mlbrowser.pro
make
cd ../..

