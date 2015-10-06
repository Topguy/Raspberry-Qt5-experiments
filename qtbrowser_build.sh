# Checkout and build mlbrowser.

sudo apt-get -y --force-yes install libqt5webkit5-dev qtdeclarative5-dev qt5-default qt5-qmake
git clone https://github.com/Topguy/qtbrowser.git
cd qtbrowser/
mkdir build
cd build/
qmake ../qtbrowser.pro
make
cd ../..

