#!/bin/bash
TMP_DIR=$(mktemp -d)
echo "Entering $TMP_DIR"
cd $TMP_DIR

git config --global user.email "ldk-ci@example.com"
git config --global user.name "LDK CI"

git clone https://github.com/eqrion/cbindgen
cd cbindgen/
git checkout v0.20.0
cargo update -p indexmap --precise "1.6.2" --verbose
cargo install --locked --path .

cd ..

git clone https://git.bitcoin.ninja/rust-lightning
cd rust-lightning
git checkout origin/2022-07-109-java-bindings
cd ..

git clone https://github.com/lightningdevkit/ldk-c-bindings
cd ldk-c-bindings
git checkout 0.0.109

./genbindings.sh ../rust-lightning false

cd ..
git clone https://github.com/lightningdevkit/ldk-garbagecollected/

cd ldk-garbagecollected/
./genbindings.sh ../ldk-c-bindings/ "wasm" true false


