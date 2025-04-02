#!/bin/bash
set -e

echo "📦 Cloning Yosys..."
git clone https://github.com/YosysHQ/yosys.git
cd yosys

echo "🧹 Clean up + GCC config"
make clean
make config-gcc

echo "📥 Init submodules"
git submodule update --init --recursive

echo "🚫 Disable Python to avoid libpython errors"
sed -i 's/ENABLE_PYTHON := 1/ENABLE_PYTHON := 0/' Makefile

echo "🔨 Building..."
make -j$(nproc)

echo "📂 Installing to /usr/local..."
sudo make install

echo "🎉 Done!"
yosys -V
