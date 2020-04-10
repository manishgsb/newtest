#!/bin/bash
echo "---------Generating 64GB Random Data of ASCII values---------"
./gensort -a 640000000 64gb
echo "---------Running MySort.java File on 1GB data---------"
javac SharedMemorySort.java
java SharedMemorySort 64gb 64GbOutput
echo "---------Validating 1GbOutput file for correct sorting by MySort---------"
./valsort 64GbOutput
#start=$(date +%s.%N)
#echo "---------Running Linux Sort on same 4GB data---------"
#LC_ALL=C sort -S 8G --parallel=4 -o 4GbLinuxSort 4gb
#duration=$(echo "$(date +%s.%N) - $start" | bc)
#execution_time=`printf "%.2f seconds" $duration`

#echo "Script Execution Time: $execution_time"
#echo "---------Validating 4GbLinuxSort output file for correct sorting by LinuxSort---------"
#./valsort 4GbLinuxSort
