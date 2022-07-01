#!/bin/bash
TMP_DIR=$(mktemp -d)
echo "Entering $TMP_DIR"
cd $TMP_DIR

git clone https://git.bitcoin.ninja/rust-lightning
cd rust-lightning
git checkout origin/2022-06-108-java-bindings
cd ..

git clone https://github.com/lightningdevkit/ldk-c-bindings
cd ldk-c-bindings
git checkout 0.0.108

git clone https://github.com/lightningdevkit/ldk-garbagecollected/

CC=clang ./genbindings.sh ../rust-lightning false

cd ../ldk-garbagecollected/
CC=clang ./genbindings.sh ../rust-lightning false

