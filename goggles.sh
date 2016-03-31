#!/usr/bin/env bash

#The user pipes a command into the system. The system calls that command and monitors it's mem, time, cpu (similar to top). The system outputs the usage in a table of text.
#
#The system must call arbitrary linux commands.
#The system must be aware of the mem usage of the call.
#The system must be aware of the cpu usage of the call.
#The system must be aware of the runtime usage of the call.
#The system must log the above resources at regular intervals.
#
#Bash:
#Run the command and get the PID.
#Every interval, get the ps aux line for that PID
#COMMAND:
#top -p PID -n 1 -b | tail -fn 1 | awk '{printf "%s,%s,%s,%s,%s\n",$1,$12,$9,$10,$11}'
#OUTPUT:
#PID,CMD,CPU,MEM,TIME

# Run the command and save the PID to a variable.
COMMAND=$1
eval ${COMMAND} &
CMD_PID=$!

# If this script is killed, kill the command.
trap "kill ${CMD_PID} 2> /dev/null" EXIT

# Output PID and command
top -p ${CMD_PID} -n 1 -b | tail -fn 1 | awk '{printf "%s,%s\n",$1,$12}'

# Monitor loop while proc is running.
while kill -0 ${CMD_PID} 2> /dev/null; do
top -p ${CMD_PID} -n 1 -b | tail -fn 1 | awk '{printf "%s,%s,%s\n",$11,$10,$9}'
done

