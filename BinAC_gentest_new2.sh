#!/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_gentests_new2
#PBS -j oe
#PBS -o LOG_gentest2
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

python gen_test2121k.py &
python gen_test2122k.py &
python gen_test2210k.py &
python gen_test2211i.py &
python gen_test2211j.py &
python gen_test2211k.py &
python gen_test2212k.py &
python gen_test2220k.py &
python gen_test2221i.py &
python gen_test2221j.py &
python gen_test2221k.py &
python gen_test2222k.py &
python gen_test3110k.py &
python gen_test3111i.py &
python gen_test3111j.py &
python gen_test3111k.py &
python gen_test3112k.py &
python gen_test3120k.py &
python gen_test3121k.py &
python gen_test3122k.py &
python gen_test3210k.py &
python gen_test3211k.py &
python gen_test3212k.py &
python gen_test3220k.py &
python gen_test3221i.py &
python gen_test3221j.py &
python gen_test3221k.py &
python gen_test3222k.py