import scipy.io
from scipy.stats import tukey_hsd
from scipy.stats import friedmanchisquare
import scikit_posthocs as sp
import numpy as np
import pickle

#distance
kmeans=scipy.io.loadmat('kMeans.mat')
kNN=scipy.io.loadmat('kNN.mat')
kNNb=scipy.io.loadmat('kNN_Mean.mat')
LOF=scipy.io.loadmat('LOF.mat')
NNd=scipy.io.loadmat('NNd.mat') 
#mixture
GM=scipy.io.loadmat('GM.mat')
GM_diag=scipy.io.loadmat('GM_diag.mat')
GM_spherical=scipy.io.loadmat('GM_spherical.mat')
GM_full=scipy.io.loadmat('GM_full.mat')
#neural networks
SNN=scipy.io.loadmat('SNN.mat')
SNNb=scipy.io.loadmat('SNNb.mat')
SNNa=scipy.io.loadmat('SNN_anomaly.mat')
SNNba=scipy.io.loadmat('SNNb_anomaly.mat')
ODIN=scipy.io.loadmat('ODIN.mat')
LSTM=scipy.io.loadmat('LSTM-AE.mat')

NN=[SNN, SNNb, SNNa, SNNba, ODIN, LSTM]
Dis=[kmeans, kNN, kNNb, LOF, NNd]
Mix=[GM, GM_diag, GM_spherical, GM_full]

toCompare=[]
toCompareGlobal=[]
for model in Dis:
    for topolgy in ['Unspecialized', 'Competitive', 'Hierarchic']:
        if len(model[topolgy][0])!=0:
            toCompare.append(model[topolgy][0])
            toCompareGlobal.append(model[topolgy][0])
toCompare=np.array(toCompare)
print("---------")
print("Distance:")
print(sp.posthoc_nemenyi_friedman(toCompare.T))
print("---------")

toCompare=[]
for model in Mix:
    for topolgy in ['Unspecialized', 'Competitive', 'Hierarchic']:
        if len(model[topolgy][0])!=0:
            toCompare.append(model[topolgy][0])
            toCompareGlobal.append(model[topolgy][0])
toCompare=np.array(toCompare)
print("---------")
print("Mixture:")
print(sp.posthoc_nemenyi_friedman(toCompare.T))
print("---------")

toCompare=[]
for model in NN:
    for topolgy in ['Unspecialized', 'Competitive', 'Hierarchic']:
        if len(model[topolgy][0])!=0:
            toCompare.append(model[topolgy][0])
            toCompareGlobal.append(model[topolgy][0])
toCompare=np.array(toCompare)
print("---------")
print("NN:")
print(sp.posthoc_nemenyi_friedman(toCompare.T))
print("---------")

