mcinif='mcini_gen2'
runname='gen_Fmac6'
mcpick='gen_Fmac6.pick'
pathdir='/beegfs/work/ka_oj4748/echoRD'
wdir='/beegfs/work/ka_oj4748/gen_tests'
update_prec=0.04
update_mf='05moist.dat'
update_part=False

import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,update_prec=update_prec,update_mf=update_mf,update_part=update_part,hdf5pick=False,fsize=(2.31,4),w_rat=[3.5,0.8],h_rat=[0.8,9])
