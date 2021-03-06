#!/usr/bin/env bash 
echo -e -n 

if [ $# -ne 6 ]
then
    echo "Usage: perf_table.sh directory a n metric targets groups"
    exit
fi

for a in 0.5 0.2 0.1 0.05 0.02 0.01 0.005 0.002 0.001 0.0005 0.0002 0.0001 0.00005 0.00002 0.00001 0.000005 0.0
do
	abool=`echo "$2 <= $a" | bc`
	if [ $abool -eq 1 ]; then
		for tigN in 1 2 3 4 6 8 11 16 23 32 45 64
		do
			nbool=`echo "$3 >= $tigN" | bc`
			if [ $nbool -eq 1 ]; then
			    $4 $5 $1/AGTemp/ag.a.$a.n.$tigN.preds.txt $6 | awk '{printf "%s", $2}'
			    echo -e -n "\t"
			fi
		done
		echo
	fi
done

