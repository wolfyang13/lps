#!/bin/bash
#Description: Bonnie test
#command
mkdir /linux_performance/bonnie
cd /linux_performance/src
tar -zxvf /linux_performance/src/bonnie.tar.gz -C /linux_performance/bonnie/
cd /linux_performance/bonnie
make

./Bonnie -d /tmp -s 100M > /linux_performance/results/log$num_count/bonnie_log100M;
echo 3 > /proc/sys/vm/drop_caches;
sync;

./Bonnie -d /tmp -s 500M > /linux_performance/results/log$num_count/bonnie_log500M;
echo 3 > /proc/sys/vm/drop_caches;
sync;

./Bonnie -d /tmp -s 1000M > /linux_performance/results/log$num_count/bonnie_log1G;
echo 3 > /proc/sys/vm/drop_caches;
sync;

