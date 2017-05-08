#!/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_gentests
#PBS -j oe
#PBS -o LOG
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

module load numlib/numpy
module load lib/matplotlib
module load lib/pandas
module load numlib/scipy

python ~/echoRD/testcases_echoRD/gen_test1111.py &
python ~/echoRD/testcases_echoRD/gen_test1212.py &
python ~/echoRD/testcases_echoRD/gen_test2121.py &
python ~/echoRD/testcases_echoRD/gen_test2222.py &
python ~/echoRD/testcases_echoRD/gen_test3211.py &
python ~/echoRD/testcases_echoRD/gen_test1112.py &
python ~/echoRD/testcases_echoRD/gen_test1221.py &
python ~/echoRD/testcases_echoRD/gen_test2122.py &
python ~/echoRD/testcases_echoRD/gen_test3111.py &
python ~/echoRD/testcases_echoRD/gen_test3212.py &
python ~/echoRD/testcases_echoRD/gen_test1121.py &
python ~/echoRD/testcases_echoRD/gen_test1222.py &
python ~/echoRD/testcases_echoRD/gen_test2211.py &
python ~/echoRD/testcases_echoRD/gen_test3112.py &
python ~/echoRD/testcases_echoRD/gen_test3221.py &
python ~/echoRD/testcases_echoRD/gen_test1122.py &
python ~/echoRD/testcases_echoRD/gen_test2111.py &
python ~/echoRD/testcases_echoRD/gen_test2212.py &
python ~/echoRD/testcases_echoRD/gen_test3121.py &
python ~/echoRD/testcases_echoRD/gen_test3222.py &
python ~/echoRD/testcases_echoRD/gen_test1211.py &
python ~/echoRD/testcases_echoRD/gen_test2112.py &
python ~/echoRD/testcases_echoRD/gen_test2221.py &
python ~/echoRD/testcases_echoRD/gen_test3122.py &
python ~/echoRD/testcases_echoRD/gen_test1123.py &
python ~/echoRD/testcases_echoRD/gen_test2123.py &
python ~/echoRD/testcases_echoRD/gen_test3123.py