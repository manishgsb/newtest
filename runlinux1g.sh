#!/bin/bash
echo "---------Generating 64GB Random Data of ASCII values---------"
./gensort -a 640000000 64gb
#echo "---------Running MySort.java File on 1GB data---------"
#javac SharedMemorySort.java
#java SharedMemorySort 4gb 4GbOutput
#echo "---------Validating 4GbOutput file for correct sorting by MySort---------"
#./valsort 4GbOutput
start=$(date +%s.%N)
echo "---------Running Linux Sort on same 64GB data---------"
LC_ALL=C sort -S 8G --parallel=4 -o 64GbLinuxSort 64gb
duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "Script Execution Time: $execution_time"
echo "---------Validating 64GbLinuxSort output file for correct sorting by LinuxSort---------"
./valsort 64GbLinuxSort
