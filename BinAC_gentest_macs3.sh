#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -l walltime=72:00:00
#PBS -l mem=100gb
#PBS -S /bin/bash
#PBS -N echoRD_gt_macs3
#PBS -j oe
#PBS -o LOG_gt_macs3
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

python gen_Jmac0.py &
python gen_Jmac1.py &
python gen_Jmac2.py &
python gen_Jmac3.py &
python gen_Jmac4.py &
python gen_Jmac5.py &
python gen_Jmac6.py &
python gen_Jmac7.py &
python gen_Jmac8.py &
python gen_Jmac9.py 