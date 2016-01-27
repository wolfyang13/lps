#!/bin/bash
#Description: Main Process for Supermicro Linux Performance suite
#Usage: lps[vesion].sh
#Author: Server Team/550 Leo Liu#

#### build dialog menu
tar -zxvf src/dialog_1.1-20111020.orig.tar.gz -C src
cd src/dialog-1.1-20111020
./configure && make && make install

#### Notice message
dialog --title "Linux performance suite" --msgbox "
        This is a testing framwork for performance test.
        If you want to run manually, you can check:
        lps/doc
        The log and result will be put on: 
        lps/log
        " 20 60
#### Make folder
if [ -d bin ] ; then 
    echo " bin folder is exist. "
else 
    mkdir bin


#### menu, select the test case
dialog --title "Please select the test case" --checklist "Test case" 20 60 14 \
1 "FIO" on \
2 "LINPACK" on \
3 "Stream" on \
4 "DhryStone" on \
5 "lmbench3" on \
6 "IOzone" off \
7 "Bonnie++" off \
2>tmp/testcase_selection

testcase_selection=$(cat tmp/testcase_selection)

#### Function
for testcase in $testcase_selection
do
    if [ "$testcase" == '"1"' ] ; then
	source script/fio.sh
    elif [ "$testcase" == '"2"' ] ; then
	source script/linpack.sh
    elif [ "$testcase" == '"3"' ] ; then
	source script/stream.sh
    elif [ "$testcase" == '"4"' ] ; then
	source script/dhrystone.sh
    elif [ "$testcase" == '"5"' ] ; then
	source script/lmbench.sh
    elif [ "$testcase" == '"6"' ] ; then
	source script/iozone.sh
    elif [ "$testcase" == '"7"' ] ; then
	source script/bonnie++.sh
    fi
done

#### Create Webpage result
source script/webpage_create.sh


