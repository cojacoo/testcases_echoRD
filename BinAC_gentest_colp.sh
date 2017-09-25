#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_testcolpR
#PBS -j oe
#PBS -o LOG_testcolpR
#PBS -n

#cd /beegfs/work/ka_oj4748

echo "User:"
whoami
echo "Job running on node:"
uname -a
echo "started on "
date
echo "- - - - - - - - - - -\n"
echo "This script shall test-run all colpach echoRD test cases on a BinAC node."
echo "- - - - - - - - - - -\n"

cd /home/ka/ka_iwg/ka_oj4748/echoRD/testcases_echoRD

module load devel/python/3.5.1
module load numlib/numpy
module load lib/matplotlib
module load lib/pandas
module load numlib/scipy

python colpach207.py &
python colpach204.py &
python colpach201.py &
python colpach2005.py &
python colpach2001.py &
python colpach307.py &
python colpach304.py &
python colpach301.py &
python colpach3005.py &
python colpach3001.py &
python colpach407.py &
python colpach404.py &
python colpach401.py &
python colpach507.py &
python colpach504.py &
python colpach501.py

