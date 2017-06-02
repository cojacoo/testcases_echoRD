mcinif='mcini_gen1'
mcpick='gen_test1.pickle'
runname='gen_test1122'
pathdir='/beegfs/work/ka_oj4748/echoRD/echoRD'
wdir='/beegfs/work/ka_oj4748/echoRD/echoRD_weierbach'
update_prec=0.04
legacy_pick=True

import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,update_mf=update_mf,update_prec=update_prec,legacy_pick=legacy_pick)
