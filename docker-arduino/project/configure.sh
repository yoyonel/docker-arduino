#!/bin/bash

mkdir -p $1

mkdir -p $1/src

cd $1

touch run.sh; chmod +x run.sh

ln -s ../scripts/build.sh .
ln -s ../scripts/configure.sh .
ln -s ../scripts/upload.sh .
ln -s ../scripts/kill_ros.sh .

cp ../CMakeLists.txt.template CMakeLists.txt

#subl CMakeLists.txt
editor CMakeLists.txt
