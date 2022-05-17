#!/usr/bin/env bash
set -e

# 路径准备
OldPath=$(pwd)
SCRIPT_PATH=$(realpath "$0")
ProjectPath="$(dirname "$(dirname "$SCRIPT_PATH")")"

BUILD_DIR="$ProjectPath/build"
if [ -d "BUILD_DIR" ]; then
  mkdir "$BUILD_DIR"
fi

cd "$BUILD_DIR"
cmake ..
make
mkdir -p "$ProjectPath/lib/hardinfo/modules/"
cp *.so "$ProjectPath/lib/hardinfo/modules/"
#cp *.so ../share/
#sudo make install
#sudo rm -rf /usr/local/share/hardinfo
#sudo rm -rf /usr/local/lib/hardinfo
#sudo rm -rf /usr/local/bin/hardinfo
#sudo rm -f /usr/local/share/man/man1/hardinfo.1
#sudo rm -f /usr/local/share/applications/hardinfo.desktop

./hardinfo -r -m devices.so -a -f json > "$ProjectPath/build/test.output.json"

cd "$OldPath"
