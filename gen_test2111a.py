mcinif='mcini_gen2'
mcpick='gen_test2.pickle'
runname='gen_test2111'
pathdir='/beegfs/work/ka_oj4748/echoRD/echoRD'
wdir='/beegfs/work/ka_oj4748/echoRD/echoRD_weierbach'
update_prec=0.01
legacy_pick=True

import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,update_mf=update_mf,update_prec=update_prec,legacy_pick=legacy_pick)
