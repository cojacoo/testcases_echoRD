#!/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -l walltime=72:00:00
#PBS -l mem=120gb
#PBS -S /bin/bash
#PBS -N echoRD_cols
#PBS -j oe
#PBS -o LOG_col
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

python gen_test_col1.py &
python gen_test_col2.py &
python gen_test_col3.py &
python gen_test_col4.py &
python gen_test_col5.py &
python gen_test_col6.py &
python gen_test_coR1.py &
python gen_test_coR2.py &
python gen_test_coR3.py &
python gen_test_coR4.py &
python gen_test_coR5.py &
python gen_test_coR6.py &
python gen_test_cXl1.py &
python gen_test_cXl2.py &
python gen_test_cXl3.py &
python gen_test_cXl4.py &
python gen_test_cXl5.py &
python gen_test_cXl6.py &
python gen_test_cXR1.py &
python gen_test_cXR2.py &
python gen_test_cXR3.py &
python gen_test_cXR4.py &
python gen_test_cXR5.py &
python gen_test_cXR6.py
