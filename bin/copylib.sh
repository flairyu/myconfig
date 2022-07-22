#!/bin/bash

# copylib.sh

LibDir=$PWD"/lib"

Target=$1

lib_array=($(ldd $Target | grep -o "/.*" | grep -o "/.*/[^[:space:]]*"))

$(mkdir $LibDir)

for Variable in ${lib_array[@]}
do
echo cp "$Variable" $LibDir
cp "$Variable" $LibDir
done


echo "now you can use patchelf at target machine to fit libs with:"
echo "    patchelf --set-rpath `pwd`/lib $Target"
echo "    patchelf --set-interpreter `pwd`/lib/ld-linux-x86-64.so.2 $Target"
echo ""
echo "you can install patchelf by: "
echo "    git clone https://github.com/NixOS/patchelf.git"
echo "    ./bootstrap.sh"
echo "    ./configure"
echo "    make && make install"
