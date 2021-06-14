#!/bin/sh
# approach 1 
cpu_data=$(ps -eo pid,%cpu,%mem --sort=-%cpu| head -4 | tail -1)
pid=$(echo $cpu_data | awk '{print $1}')
cpu=$(echo $cpu_data | awk '{print $2}')
mem=$(echo $cpu_data | awk '{print $3}')
port_data=$(netstat -plntu | grep $pid/ | awk '{print $4,$7}')
port=$(echo $port_data | awk '{print $1}' | cut -d ':' -f 2 )
programname=$(echo $port_data | awk '{print $2}' | cut -d '/' -f 2)

echo -e "3rd highest CPU\n PROCESSNAME-$programname\n PORT-$port \n PID-$pid CPU-$cpu MEM-$mem \n" > data.txt

mem_data=$(ps -eo pid,%cpu,%mem --sort=-%mem| head -4 | tail -1)
pid=$(echo $cpu_data | awk '{print $1}')
cpu=$(echo $cpu_data | awk '{print $2}')
mem=$(echo $cpu_data | awk '{print $3}')
port_data=$(netstat -plntu | grep $pid/ | awk '{print $4,$7}')
port=$(echo $port_data | awk '{print $1}' | cut -d ':' -f 2 )
programname=$(echo $port_data | awk '{print $2}' | cut -d '/' -f 2)

echo -e "3rd highest MEM\n PROCESSNAME-$programname\n PORT-$port \n PID-$pid CPU-$cpu MEM-$mem \n" >> data.txt

# approach 2 
#ps -eo pid,%cpu,%mem | tail -n +2 | sort -k2,2 -k3,3n | head -3 | tail -1
# reuse above 