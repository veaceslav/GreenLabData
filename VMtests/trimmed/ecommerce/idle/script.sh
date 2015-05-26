#!/bin/bash

for i in CPU*
do
    tail -n +3 $i | awk -F ',"' '{print $1}'| tr "," "." >> cpu.csv
done

for i in MEM*
do
    tail -n +3 $i | awk -F ',"' '{print $1}'| tr "," "." >> mem.csv
done

for i in POWER*
do
    tail -n +3  $i | cut -d "," -f 1 | tr "," "." >> power.csv
done

for i in POWER*
do
    tail -n +3  $i | cut -d "," -f 2 | tr "," "." >> date.csv
done

for i in Reads*
do
    tail -n +3  $i | cut -d "," -f 1-2 >> read.csv
done

for i in Writes*
do
    tail -n +3  $i | cut -d "," -f 1 | tr "," "." >> writes.csv
done

echo "\"TimeStamp\",\"CPU\",\"POWER\",\"MEM\"" > cpu_power.csv
paste -d , date.csv cpu.csv power.csv mem.csv  >> cpu_power.csv
echo "\"Reads\",\"TimeStamp\",\"Writes\"" > disk_io.csv
paste -d , read.csv writes.csv >> disk_io.csv

rm date.csv cpu.csv power.csv read.csv writes.csv mem.csv