#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/KhronosGroup/SPIRV-LLVM-Translator -b v17.0.0 ./spirv-llvm-translator-17
cp -rvf ./debian ./spirv-llvm-translator-17/
cd ./spirv-llvm-translator-17

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
