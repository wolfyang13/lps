#!/bin/bash
#Description: IOzone test
#command

cd /linux_performance/src
tar -xvf iozone3_408.tar -C /linux_performance
cd /linux_performance/iozone3_408/src/current/

if [ "$kernel" == "1" ]; then
	make linux;
elif [ "$kernel" == "2" ]; then
        make linux-arm;
elif [ "$kernel" == "3" ]; then
        make linux-AMD64;
fi

echo "iozone will run auto mode and manual specify one time."

./iozone -f /tmp/iozone -z -Rab /linux_performance/results/log$num_count/iozone_auto.xls
./iozone -y 4k -q 64k -n 32k -g 1m -i 0 -i 1 -i 2 -i 3 -i 4 -i 5 -i 6 -i 7 -i 8 -i 9 -i 10 -i 11 -i 12 -f /tmp/iozone -z -Rab /linux_performance/results/log$num_count/iozone.xls;

