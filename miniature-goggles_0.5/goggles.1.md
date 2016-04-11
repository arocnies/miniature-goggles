# goggles(1) -- a process analysis tool for bash

## SYNOPSIS

`goggles` [-hs] [-f <ps format>] [-o <outfile>] [-i <interval>] [-c <command> | <command>]

## OPTIONS
       -h   help        Display help.
       -s   silent      Target process will not output to stdout.
       -f   format      Specify ps format for goggles output.
       -o   outfile     Specify output file; measurements will not be output to stdout.
       -i   interval    Specify interval in seconds.
       -c   command     Specify command (defaults to last arg).

## DESCRIPTION

goggles(1) is a program that is used to analyze a process and output the data in a graph friendly manner.

goggles(1) fills a need left over from top(1) and ps(1) by providing repetitve updates on process information that is also suitable for review of the process or comparision to other processes.

At a set interval (default of 1 second), goggles retrives process information using the ps(1) command. Goggles accepts all ps(1) format descriptors including AIX format descriptors and ps(1) NORMAL format descriptors. NOTE: For processes that exit soon after starting, goggles may not be able to analyze the process due to the process ending before the first measurement can be taken.

Linux pipes can be used with goggles(1) to analyze processes with input or output. Input piped into goggles(1) will be sent to the process goggles is analyzing. Piping output from goggles(1) will by default send both goggles(1) measurements and the process output through the pipe. The process output can be silenced using the `-s` option, which is usefull for measuring commands quickly in the terminal. The measurement data from goggles can be redirected to an outfile using the `-o` option.

## EXAMPLES

To analyze a process; only displaying goggle measurement output:
goggles -s <command>

To analyze a process's per-milla cpu usage (tenths of a percent), virtual memory size, and elapse time:
goggles -sf cp,vsz,etime <command>

To analyze a process with piped input; only displaying goggle measurement output:
<command> | goggles -s <command>

To analyze a process with piped output; output measurements to a file:
goggles -o <outfile> <command> | <command>

To analyze a process with piped input and piped output:
<command> | goggles -o <outfile> <command> | <command>

## AIX FORMAT DESCRIPTORS
goggles(1) supports all ps(1) format descriptors including AIX format descriptors and ps(1) NORMAL format descriptors. NOTE: The ps format descriptors has a larger selection of format descripters than the AIX format descripters, all of which are compatable with goggles(1).

       CODE   NORMAL   HEADER
       %C     pcpu     %CPU
       %G     group    GROUP
       %P     ppid     PPID
       %U     user     USER
       %a     args     COMMAND
       %c     comm     COMMAND
       %g     rgroup   RGROUP
       %n     nice     NI
       %p     pid      PID
       %r     pgid     PGID
       %t     etime    ELAPSED
       %u     ruser    RUSER
       %x     time     TIME
       %y     tty      TTY
       %z     vsz      VSZ

# AUTHOR

Aaron Nies <arocnies@gmail.com>

## SEE ALSO

ps(1)