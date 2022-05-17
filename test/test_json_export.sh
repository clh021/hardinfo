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
sudo make install

cd "$OldPath"

hardinfo -r -m devices.so -a -f json > "$ProjectPath/build/test.output.json"