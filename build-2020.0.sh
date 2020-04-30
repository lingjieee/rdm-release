echo "================Clone repository================"
git clone --recursive https://github.com/uglide/RedisDesktopManager.git -b 2020.0 rdm
echo "================Clone success================"

echo "================Install Python requirements================"
cd rdm
cp ./src/resources/Info.plist.sample ./src/resources/Info.plist
pip3 install -t /bin/osx/release -r src/py/requirements.txt
echo "================Install success================"

echo "================Build================"
cd src
qmake CONFIG-=debug CONFIG+=sdk_no_version_check
make -s -j 8

echo "================Copy requirements================"
cd ../bin/osx/release
macdeployqt Redis\ Desktop\ Manager.app -qmldir=../../../src/qml

echo "=======BUILD SUCCESS====="
