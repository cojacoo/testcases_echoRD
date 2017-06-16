mcinif='mcini_weiherbach'
runname='weiherbach'
mcpick='weiherbach.pick'
pathdir='..'
wdir='.'
import sys
sys.path.append(pathdir)

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif,mcpick=mcpick,runname=runname,wdir=wdir,pathdir=pathdir,hdf5pick=False)
