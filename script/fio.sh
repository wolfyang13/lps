#!/bin/bash
#Description: fio test
#command

tar -zxvf src/fio.tar.gz -C bin/
./bin/fio-2.1.10/configure
make -C bin/fio-2.1.10/
make install -C bin/fio-2.1.10/

#hd=`fdisk -l |grep /dev/sd |grep Disk |awk '{print $2}' |sed 's/\://'`
#### function nvme or HDD
function nvem_fio () {
for rw in read write
    do
    	fio -filename=/dev/nvme0n1 -direct=1 -iodepth 256 -rw=$rw -ioengine=libaio -bs=4 -size=50G -loops=10 -runtime=3600 -name=mytest > log/fio4k$rw\.log
    done

for rw in randread randwrite
    do
        fio -filename=/dev/nvme0n1 -direct=1 -iodepth 32 -rw=$rw -ioengine=libaio -bs=128 -size=50G -loops=10 -runtime=3600 -name=mytest > log/fio256k$rw\.log
}

function hdd_fio () {
for rw in read write
    do
        fio -filename=/dev/sda -direct=1 -iodepth 256 -rw=$rw -ioengine=libaio -bs=4 -size=50G -loops=10 -runtime=3600 -name=mytest > log/fio4k$rw\.log
    done
for rw in randread randwrite
    do
        fio -filename=/dev/sda -direct=1 -iodepth 32 -rw=$rw -ioengine=libaio -bs=128 -size=50G -loops=10 -runtime=3600 -name=mytest > log/fio256k$rw\.log
    done
}

#### main process
nvme_chk=`fdisk -l |grep -i nvme`
if [ "$nvme_chk" != "" ] ; then 
    echo "detected NVME drive, FIO chang to run NVME mode"
    nvme_fio
elif
    hdd_fio
fi
