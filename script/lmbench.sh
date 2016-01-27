#!/bin/bash
#Description: lmbench test
#command

tar -xvf src/lmbench3-fix.tar -C bin/
cp  bin/lmbench3/results/Makefile tmp/
rm -rf bin/lmbench3/results/*
cp tmp/Makefile bin/lmbench3/results/
#cd /linux_performance/lmbench3/src

export num_threads=`cat /proc/cpuinfo | grep processor | wc -l`
make results -C lmbench3 <<eof
$num_threads
4

all
no
no
none


/usr/tmp
/dev/tty
no
eof

make see -C lmbench3 > log/lmbench.log
