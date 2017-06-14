#!/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_gentests_new
#PBS -j oe
#PBS -o LOG_gentest1
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

python gen_test1110k.py &
python gen_test1111i.py &
python gen_test1111j.py &
python gen_test1111k.py &
python gen_test1112k.py &
python gen_test1120k.py &
python gen_test1121i.py &
python gen_test1121j.py &
python gen_test1121k.py &
python gen_test1122k.py &
python gen_test1210k.py &
python gen_test1211i.py &
python gen_test1211j.py &
python gen_test1211k.py &
python gen_test1212k.py &
python gen_test1220k.py &
python gen_test1221i.py &
python gen_test1221j.py &
python gen_test1221k.py &
python gen_test1222k.py &
python gen_test2110k.py &
python gen_test2111i.py &
python gen_test2111j.py &
python gen_test2111k.py &
python gen_test2112k.py &
python gen_test2120k.py &
python gen_test2121i.py &
python gen_test2121j.py 

