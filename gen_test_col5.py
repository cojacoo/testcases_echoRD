import numpy as np
import pandas as pd
import scipy as sp
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import os, sys
try:
   import cPickle as pickle
except:
   import pickle
#connect echoRD Tools
pathdir='../echoRD' #path to echoRD
lib_path = os.path.abspath(pathdir)
#sys.path.append(lib_path)
sys.path.append('/home/ka/ka_iwg/ka_oj4748/echoRD/echoRD')
import vG_conv as vG
from hydro_tools import plotparticles_t,hydroprofile,plotparticles_column



# Prepare echoRD

#connect to echoRD
import run_echoRD as rE
#connect and load project
[dr,mc,mcp,pdyn,cinf,vG]=rE.loadconnect(pathdir='../',mcinif='mcini_g63_nomac',experimental=True)
mc = mcp.mcpick_out(mc,'g63_nomac.pickle')

runname='gen_test_col5'
idx=int(np.shape(mc.soilgrid)[1]/2)
mc.soilgrid[:,idx-1:idx+1]=13 

mc.advectref='Shipitalo'
mc.soilmatrix=pd.read_csv(mc.matrixbf, sep=' ')
mc.soilmatrix['m'] = np.fmax(1-1/mc.soilmatrix.n,0.1)

precTS=pd.read_csv(mc.precf, sep=',',skiprows=3)

precTS.tstart-=340
precTS.tend-=340
precTS.intense=2.*0.063*60./1000.# intensity in m3/s



#use modified routines for binned retention definitions
mc.part_sizefac=200

mc.gridcellA=abs(mc.mgrid.vertfac*mc.mgrid.latfac)
mc.particleA=abs(mc.gridcellA.values)/(2*mc.part_sizefac) #assume average ks at about 0.5 as reference of particle size
mc.particleD=2.*np.sqrt(mc.particleA/np.pi)
mc.particleV=3./4.*np.pi*(mc.particleD/2.)**3.
mc.particleV/=np.sqrt(abs(mc.gridcellA.values)) #assume grid size as 3rd dimension
mc.particleD/=np.sqrt(abs(mc.gridcellA.values))

#for column:
total_volume=np.pi*0.5**3
mc.particleV=total_volume/(mc.mgrid.vertgrid[0]*mc.mgrid.latgrid[0]*(2*mc.part_sizefac))

mc.particlemass=dr.waterdensity(np.array(20),np.array(-9999))*mc.particleV #assume 20C as reference for particle mass

mc=dr.ini_bins(mc)
mc=dr.mc_diffs(mc,np.max(np.max(mc.mxbin)))

[mc,particles,npart]=dr.particle_setup(mc)

#define bin assignment mode for infiltration particles
mc.LTEdef='instant'#'ks' #'instant' #'random'
mc.LTEmemory=mc.soilgrid.ravel()*0.

#new reference
mc.maccon=np.where(mc.macconnect.ravel()>0)[0] #index of all connected cells
mc.md_macdepth=np.abs(mc.md_macdepth)

mc.prects='column2'
mc.colref=False

#theta=mc.zgrid[:,1]*0.+0.273
#[mc,particles,npart]=rE.particle_setup_obs(theta,mc,vG,dr,pdyn)
[thS,npart]=pdyn.gridupdate_thS(particles.lat,particles.z,mc)
#[A,B]=plotparticles_t(particles,thS/100.,mc,vG,store=True)



# Run Model

mc.LTEpercentile=70 #new parameter


t_end=24.*3600.
saveDT=True

#1: MDA
#2: MED
#3: rand
infiltmeth='MDA'
#3: RWdiff
#4: Ediss
#exfiltmeth='RWdiff'
exfiltmeth='Ediss'
#5: film_uconst
#6: dynamic u
film=True
#7: maccoat1
#8: maccoat10
#9: maccoat100
macscale=1. #scale the macropore coating 
clogswitch=False
infiltscale=False

#mc.dt=0.11
#mc.splitfac=5
#pdyn.part_diffusion_binned_pd(particles,npart,thS,mc)

#import profile
#%prun -D diff_pd_prof.prof pdyn.part_diffusion_binned_pd(particles,npart,thS,mc)

wdir='/beegfs/work/ka_oj4748/gen_tests'
drained=pd.DataFrame(np.array([]))
leftover=0
output=60. #mind to set also in TXstore.index definition

dummy=np.floor(t_end/output)
t=0.
ix=0
TSstore=np.zeros((int(dummy),mc.mgrid.cells[0],2))

try:
    #unpickle:
    with open(''.join([wdir,'/results/Z',runname,'_Mstat.pick']),'rb') as handle:
        pickle_l = pickle.load(handle)
        dummyx = pickle.loads(pickle_l)
        particles = pickle.loads(dummyx[0])
        [leftover,drained,t,TSstore,ix] = pickle.loads(dummyx[1])
        ix+=1
    print('resuming into stored run at t='+str(t)+'...')
except:
    print('starting new run...')
    
#loop through plot cycles
for i in np.arange(dummy.astype(int))[ix:]:
    plotparticles_column(particles,mc,pdyn,vG,runname,t,i,saving=True,relative=False,wdir=wdir)
    [particles,npart,thS,leftover,drained,t]=rE.CAOSpy_rundx1(i*output,(i+1)*output,mc,pdyn,cinf,precTS,particles,leftover,drained,6.,splitfac=4,prec_2D=False,maccoat=macscale,saveDT=saveDT,clogswitch=clogswitch,infilt_method=infiltmeth,exfilt_method=exfiltmeth,film=film,infiltscale=infiltscale)
    TSstore[i,:,:]=rE.part_store(particles,mc)

    #if i/5.==np.round(i/5.):
    with open(''.join([wdir,'/results/X',runname,'_Mstat.pick']),'wb') as handle:
            pickle.dump(pickle.dumps([leftover,drained,t,TSstore,i]), handle, protocol=2)

