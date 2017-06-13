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

cd /home/ka/ka_iwg/ka_oj4748/echoRD/testcases_echoRD

module load devel/python/3.5.1
module load numlib/numpy
module load lib/matplotlib
module load lib/pandas
module load numlib/scipy

python gen_test1111a.py &
python gen_test1112a.py &
python gen_test1121a.py &
python gen_test1122a.py &
python gen_test1123a.py &
python gen_test1211a.py &
python gen_test1221a.py &
python gen_test1222a.py &
python gen_test1223a.py &
python gen_test2111a.py &
python gen_test2112a.py &
python gen_test2121a.py &
python gen_test2122a.py &
python gen_test2123a.py &
python gen_test2211a.py &
python gen_test2212a.py &
python gen_test2221a.py &
python gen_test2222a.py &
python gen_test2223a.py &
python gen_test3111a.py &
python gen_test3112a.py &
python gen_test3121a.py &
python gen_test3122a.py &
python gen_test3123a.py &
python gen_test3211a.py &
python gen_test3212a.py &
python gen_test3221a.py &
python gen_test3222a.py &
python gen_test3223a.py