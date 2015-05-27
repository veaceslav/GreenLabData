#!/bin/bash

for i in *CPU*
do
    tail -n +3 $i | awk -F ',"' '{print $1}'| tr "," "." >> cpu.csv
done

for i in *MEM*
do
    tail -n +3 $i | awk -F ',"' '{print $1}'| tr "," "." >> mem.csv
done

for i in *Power*
do
    tail -n +3  $i | cut -d "," -f 1 | tr "," "." >> power.csv
done

for i in *Power*
do
    tail -n +3  $i | cut -d "," -f 2 | tr "," "." >> date.csv
done

for i in *READ*
do
    tail -n +3  $i | cut -d "," -f 1-2 >> read.csv
done

for i in *WRITE*
do
    tail -n +3  $i | cut -d "," -f 1 | tr "," "." >> writes.csv
done

echo "\"TimeStamp\",\"CPU\",\"POWER\",\"MEM\"" > hostvm_cpu_power.csv
paste -d , date.csv cpu.csv power.csv mem.csv  >> hostvm_cpu_power.csv
echo "\"Reads\",\"TimeStamp\",\"Writes\"" > hostvm_disk_io.csv
paste -d , read.csv writes.csv >> hostvm_disk_io.csv

rm date.csv cpu.csv power.csv read.csv writes.csv mem.csv