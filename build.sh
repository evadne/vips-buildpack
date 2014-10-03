#!/bin/sh

# heroku build http://www.vips.ecs.soton.ac.uk/supported/7.40/vips-7.40.10.tar.gz -b https://gist.githubusercontent.com/evadne/6b629875c0104166793b/raw/build.sh

# capture root dir
root=$(pwd)
prefix=/app/vendor/vips
 
# change into subdir of archive
cd $root/vips-*

# generate Makefile
./configure --prefix=$prefix

# fix Makefile for gnu make
cat Makefile | sed -e 's/^\.//g' > /tmp/Makefile; mv /tmp/Makefile Makefile

# make dirs
mkdir -p $prefix/bin
mkdir -p $prefix/man/man1
 
# configure and compile
make
make install

# remove source files
rm -rf $root/*

# copy build artifacts back into the root
mv $prefix $root/