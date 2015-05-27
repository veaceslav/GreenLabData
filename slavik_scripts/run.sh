#!/bin/bash

mkdir trimmed

for i in *.csv
do
	python2 trim.py $i trimmed/$i
done
