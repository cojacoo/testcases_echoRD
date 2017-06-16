#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=72:00:00
#PBS -l mem=80gb
#PBS -S /bin/bash
#PBS -N echoRD_realworld
#PBS -j oe
#PBS -o LOG_realworld
#PBS -n

#cd /beegfs/work/ka_oj4748

echo "User:"
whoami
echo "Job running on node:"
uname -a
echo "started on "
date
echo "- - - - - - - - - - -\n"
echo "This script shall test-run all column echoRD test cases on a BinAC node."
echo "- - - - - - - - - - -\n"

cd /home/ka/ka_iwg/ka_oj4748/echoRD/testcases_echoRD

module load devel/python/3.5.1
module load numlib/numpy
module load lib/matplotlib
module load lib/pandas
module load numlib/scipy

python weiherbachx.py &
python weiherbach01.py &
python weiherbach04.py &
python weiherbach07.py &
python colpachx.py &
python colpach01.py &
python colpach04.py &
python colpach07.py