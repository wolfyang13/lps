#!/bin/bash
#Description: Stream test
#usage source stream.sh

gcc -o bin/stream src/stream.c
./bin/stream > log/stream.log
