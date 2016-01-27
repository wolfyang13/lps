#!/bin/bash
#Description: bonnie++ start
#command

cd /linux_performance/src
tar -zxvf bonnie++-1.03e.tgz -C /linux_performance/
cd /linux_performance/bonnie++-1.03e
echo "running bonnie++ now, the memory size will be seeting double memory size."

./configure && make

memtotal=$(cat /proc/meminfo |grep MemTotal |awk '{printf "%d",$2}')
let memneed=memtotal/1000/1000*2

./bonnie++ -u root -s $memneed'G' > /linux_performance/results/log$num_count/bonnie++.log
