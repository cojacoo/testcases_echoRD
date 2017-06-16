mcinif='mcini_XI'
runnamex='colpach'
mcpick='colpach.pick'
pathdir='/beegfs/work/ka_oj4748/echoRD'
wdir='/beegfs/work/ka_oj4748/gen_tests'
import sys
sys.path.append(pathdir)

macscale=0.4

runname=runnamex+str(int(np.round(macscale*10))).zfill(2)
if macscale!=1. and ''.join([wdir,'/results/Z',runname,'_Mstat.pick']).is_file()
	print('resuming into stored run')
else:
	runname=runnamex
	print('resuming into basefile')

import run_echoRD as rE
rE.echoRD_job(mcinif=mcinif, mcpick=mcpick, runname=runname, wdir=wdir, pathdir=pathdir, hdf5pick=False, macscale=macscale)
