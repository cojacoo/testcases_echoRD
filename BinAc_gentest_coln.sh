#!/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_gentests_col
#PBS -j oe
#PBS -o LOG_col_new
#PBS -n

#cd /beegfs/work/ka_oj4748

echo "User:"
whoami
echo "Job running on node:"
uname -a
echo "started on "
date
echo "- - - - - - - - - - -\n"
echo "This script shall run all generic echoRD test cases on a BinAC node."
echo "- - - - - - - - - - -\n"

cd /home/ka/ka_iwg/ka_oj4748/echoRD/testcases_echoRD

module load devel/python/3.5.1
module load numlib/numpy
module load lib/matplotlib
module load lib/pandas
module load numlib/scipy

python col_test1223.py &
python col_test1222.py &
python col_test1221.py &
python col_test1213.py &
python col_test1212.py &
python col_test1211.py &
python col_test1123.py &
python col_test1122.py &
python col_test1121.py &
python col_test1113.py &
python col_test1112.py &
python col_test1111.py &
python col_test0223.py &
python col_test0222.py &
python col_test0221.py &
python col_test0213.py &
python col_test0212.py &
python col_test0211.py &
python col_test0123.py &
python col_test0122.py &
python col_test0121.py &
python col_test0113.py &
python col_test0112.py &
python col_test0111.py 