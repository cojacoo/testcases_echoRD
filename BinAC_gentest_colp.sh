#!/bin/bash
#PBS -l nodes=1:ppn=6
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_testcolp
#PBS -j oe
#PBS -o LOG_testcolp
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

python colpach407.py &
python colpach404.py &
python colpach401.py &
python colpach507.py &
python colpach504.py &
python colpach501.py

