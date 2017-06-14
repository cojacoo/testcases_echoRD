mcinif='mcini_gen2a'
runname='gen_test2221k'
mcpick='gen_test2a.pickle'
pathdir='/beegfs/work/ka_oj4748/echoRD'
wdir='/beegfs/work/ka_oj4748/gen_tests'
update_prec=0.04
update_mf='07moist.dat'
update_part=100

import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,update_prec=update_prec,update_mf=update_mf,update_part=update_part,hdf5pick=False)
