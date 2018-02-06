#!/bin/bash
####  PBS preamble

# mail
# when to send mail b = begins e = ends a = abort
#PBS -m ea
# join output with error
#PBS -j oe

# how much of the computer are we using? computers processors, memory and time, ppn = processors per node
# mem is shared by all processors, pmem is per processor
#PBS -l nodes=1:ppn=1,pmem=1gb
# 15 seconds 15:00:00 hours 15:00:00:00 days, 15:00 is minimum amount you should ask for
#PBS -V

# account name
#PBS -A hbmayes_fluxod
# should match suffix
#PBS -q fluxod

#PBS -l walltime=24:00:00
#PBS -N sugar_win1
####  End PBS preamble
####  Commands follow this line

# This script requires no modules loaded

# print this file listing the computers that were used
if [ -e "$PBS_NODEFILE" ] ; then
    echo "Running on"
    uniq -c $PBS_NODEFILE
fi

# changes to the directory that the program is run from, and prints it out
if [ -d "$PBS_O_WORKDIR" ] ; then
    cd $PBS_O_WORKDIR
fi
echo "Running from $(pwd)"

namd2 {job_name}.inp >& {output_name}.log
