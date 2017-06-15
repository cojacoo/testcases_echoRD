#!/bin/bash
#PBS -l nodes=1:ppn=18
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_gentests_new3
#PBS -j oe
#PBS -o LOG_gentest3
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

python gen_test1110b.py &
python gen_test1111b.py &
python gen_test1112b.py &
python gen_test1120b.py &
python gen_test1121b.py &
python gen_test1122b.py &
python gen_test2110b.py &
python gen_test2111b.py &
python gen_test2112b.py &
python gen_test2120b.py &
python gen_test2121b.py &
python gen_test2122b.py &
python gen_test3110b.py &
python gen_test3111b.py &
python gen_test3112b.py &
python gen_test3120b.py &
python gen_test3121b.py &
python gen_test3122b.py