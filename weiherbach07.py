mcinif='mcini_weiherbach'
runnamex='weiherbach'
mcpick='weiherbach.pick'
pathdir='/beegfs/work/ka_oj4748/echoRD'
wdir='/beegfs/work/ka_oj4748/gen_tests'
import sys
from pathlib import Path
import numpy as np
sys.path.append(pathdir)

macscale=0.7

runname=runnamex+str(int(np.round(macscale*10))).zfill(2)
if macscale!=1. and Path(''.join([wdir,'/results/Z',runname,'_Mstat.pick'])).is_file():
	print('resuming into stored run')
else:
	runname=runnamex
	print('resuming into basefile')

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif, mcpick=mcpick, runname=runname, wdir=wdir, pathdir=pathdir, hdf5pick=False, macscale=macscale, fsize=(2.5,4),w_rat=[3.5,0.6],h_rat=[0.8,9])
