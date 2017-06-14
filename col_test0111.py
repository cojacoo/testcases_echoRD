mcinif='mcini_g63'
runname='col_test0111'
mcpick='col_test1.pickle'
pathdir='/beegfs/work/ka_oj4748/echoRD'
wdir='/beegfs/work/ka_oj4748/gen_tests'
colref='False'
prec2D='False'
update_part=100

import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,colref=colref,prec2D=prec2D,update_part=update_part,hdf5pick=False)
