#!/bin/bash
#Description: DhryStone test
#command

tar -zxvf src/dhrystone.tar.gz -C bin/
make -C bin/dhrystone
./bin/dhrystone/gcc_dry2 > log/dhrystone.log <<eof
100000000
eof
