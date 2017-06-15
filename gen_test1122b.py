mcinif='mcini_gen1'
runname='gen_test1122b'
mcpick='gen_test1b.pickle'
pathdir='/beegfs/work/ka_oj4748/echoRD'
wdir='/beegfs/work/ka_oj4748/gen_tests'
update_prec=0.06
update_mf='07moist.dat'
update_part=500

import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,update_prec=update_prec,update_mf=update_mf,update_part=update_part,hdf5pick=False)
