#!/bin/bash
#PBS -l nodes=1:ppn=12
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_testupdated
#PBS -j oe
#PBS -o LOG_testsupdated
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

python weiherbach207.py &
python weiherbach204.py &
python weiherbach201.py &
python weiherbachx2.py &
python colpach307.py &
python colpach304.py &
python colpach301.py &
python colpachx3.py &
python colpachx2.py &
python colpach207.py &
python colpach204.py &
python colpach201.py

