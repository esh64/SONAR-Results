optimalResults=[];
optimalGnames={};
kMeans=load('kMeans.mat');
KNN_Mean=load('KNN_Mean.mat');
kNN=load('kNN.mat');
LOF=load('LOF.mat');
NNd=load('NNd.mat');

%--------------Calculando a mediana Distancia----------------

resultsLabels={'kMeans-U','kMeans-C','kMeans-H','KNN_Mean-U','KNN_Mean-C','KNN_Mean-H','kNN-U','kNN-C','kNN-H','LOF-U','LOF-C','LOF-H','NNd-U','NNd-C','NNd-H'};
resultsArray=median([transpose(kMeans.Unspecialized),transpose(kMeans.Competitive),transpose(kMeans.Hierarchic),transpose(KNN_Mean.Unspecialized),transpose(KNN_Mean.Competitive),transpose(KNN_Mean.Hierarchic),transpose(kNN.Unspecialized),transpose(kNN.Competitive),transpose(kNN.Hierarchic),transpose(LOF.Unspecialized),transpose(LOF.Competitive),transpose(LOF.Hierarchic),transpose(NNd.Unspecialized),transpose(NNd.Competitive),transpose(NNd.Hierarchic)]);
[M,I] = max(resultsArray);
tempValues=[transpose(kMeans.Unspecialized),transpose(kMeans.Competitive),transpose(kMeans.Hierarchic),transpose(KNN_Mean.Unspecialized),transpose(KNN_Mean.Competitive),transpose(KNN_Mean.Hierarchic),transpose(kNN.Unspecialized),transpose(kNN.Competitive),transpose(kNN.Hierarchic),transpose(LOF.Unspecialized),transpose(LOF.Competitive),transpose(LOF.Hierarchic),transpose(NNd.Unspecialized),transpose(NNd.Competitive),transpose(NNd.Hierarchic)];
optimalResults=[optimalResults, tempValues(:,I)];
optimalGnames(1)=resultsLabels(I);

%--------------Boxplot Distancia----------------

boxplot([transpose(kMeans.Unspecialized),transpose(kMeans.Competitive),transpose(kMeans.Hierarchic),transpose(KNN_Mean.Unspecialized),transpose(KNN_Mean.Competitive),transpose(KNN_Mean.Hierarchic),transpose(kNN.Unspecialized),transpose(kNN.Competitive),transpose(kNN.Hierarchic),transpose(LOF.Unspecialized),transpose(LOF.Competitive),transpose(LOF.Hierarchic),transpose(NNd.Unspecialized),transpose(NNd.Competitive),transpose(NNd.Hierarchic)],'Notch','off','Labels',{'kMeans-U','kMeans-C','kMeans-H','KNN_Mean-U','KNN_Mean-C','KNN_Mean-H','kNN-U','kNN-C','kNN-H','LOF-U','LOF-C','LOF-H','NNd-U','NNd-C','NNd-H'});

%--------------Friedman Distancia----------------

[p,tbl,stats] = friedman([transpose(kMeans.Unspecialized),transpose(kMeans.Competitive),transpose(kMeans.Hierarchic),transpose(KNN_Mean.Unspecialized),transpose(KNN_Mean.Competitive),transpose(KNN_Mean.Hierarchic),transpose(kNN.Unspecialized),transpose(kNN.Competitive),transpose(kNN.Hierarchic),transpose(LOF.Unspecialized),transpose(LOF.Competitive),transpose(LOF.Hierarchic),transpose(NNd.Unspecialized),transpose(NNd.Competitive),transpose(NNd.Hierarchic)]);

%---------Mostrando o valor do p do FriedmanDistancia----------

disp(p)

%--------------Comparando Distancia----------------

[c,m,h,gnames] = multcompare(stats);

%--------------Mostrando Tabela da comparacao----------------

gnames=transpose({'kMeans-U','kMeans-C','kMeans-H','KNN_Mean-U','KNN_Mean-C','KNN_Mean-H','kNN-U','kNN-C','kNN-H','LOF-U','LOF-C','LOF-H','NNd-U','NNd-C','NNd-H'});
tbl = array2table(c,'VariableNames', {'Group', 'Control','Lower' ,'Difference','Upper','P'});
tbl.('Group') = gnames(tbl.('Group'));
tbl.('Control') = gnames(tbl.('Control'));



GM_diag=load('GM_diag.mat');
GM_full=load('GM_full.mat');
GM_spherical=load('GM_spherical.mat');
GM=load('GM.mat');

%--------------Calculando a mediana Mistura----------------

resultsLabels={'GM_diag-U','GM_diag-C','GM_diag-H','GM_full-U','GM_full-C','GM_full-H','GM_spherical-U','GM_spherical-C','GM_spherical-H','GM-U','GM-C','GM-H'};
resultsArray=median([transpose(GM_diag.Unspecialized),transpose(GM_diag.Competitive),transpose(GM_diag.Hierarchic),transpose(GM_full.Unspecialized),transpose(GM_full.Competitive),transpose(GM_full.Hierarchic),transpose(GM_spherical.Unspecialized),transpose(GM_spherical.Competitive),transpose(GM_spherical.Hierarchic),transpose(GM.Unspecialized),transpose(GM.Competitive),transpose(GM.Hierarchic)]);
[M,I] = max(resultsArray);
tempValues=[transpose(GM_diag.Unspecialized),transpose(GM_diag.Competitive),transpose(GM_diag.Hierarchic),transpose(GM_full.Unspecialized),transpose(GM_full.Competitive),transpose(GM_full.Hierarchic),transpose(GM_spherical.Unspecialized),transpose(GM_spherical.Competitive),transpose(GM_spherical.Hierarchic),transpose(GM.Unspecialized),transpose(GM.Competitive),transpose(GM.Hierarchic)];
optimalResults=[optimalResults, tempValues(:,I)];
optimalGnames(2)=resultsLabels(I);

%--------------Boxplot Mistura----------------

boxplot([transpose(GM_diag.Unspecialized),transpose(GM_diag.Competitive),transpose(GM_diag.Hierarchic),transpose(GM_full.Unspecialized),transpose(GM_full.Competitive),transpose(GM_full.Hierarchic),transpose(GM_spherical.Unspecialized),transpose(GM_spherical.Competitive),transpose(GM_spherical.Hierarchic),transpose(GM.Unspecialized),transpose(GM.Competitive),transpose(GM.Hierarchic)],'Notch','off','Labels',{'GM_diag-U','GM_diag-C','GM_diag-H','GM_full-U','GM_full-C','GM_full-H','GM_spherical-U','GM_spherical-C','GM_spherical-H','GM-U','GM-C','GM-H'});

%--------------Friedman Mistura----------------

[p,tbl,stats] = friedman([transpose(GM_diag.Unspecialized),transpose(GM_diag.Competitive),transpose(GM_diag.Hierarchic),transpose(GM_full.Unspecialized),transpose(GM_full.Competitive),transpose(GM_full.Hierarchic),transpose(GM_spherical.Unspecialized),transpose(GM_spherical.Competitive),transpose(GM_spherical.Hierarchic),transpose(GM.Unspecialized),transpose(GM.Competitive),transpose(GM.Hierarchic)]);

%---------Mostrando o valor do p do FriedmanMistura----------

disp(p)

%--------------Comparando Mistura----------------

[c,m,h,gnames] = multcompare(stats);

%--------------Mostrando Tabela da comparacao----------------

gnames=transpose({'GM_diag-U','GM_diag-C','GM_diag-H','GM_full-U','GM_full-C','GM_full-H','GM_spherical-U','GM_spherical-C','GM_spherical-H','GM-U','GM-C','GM-H'});
tbl = array2table(c,'VariableNames', {'Group', 'Control','Lower' ,'Difference','Upper','P'});
tbl.('Group') = gnames(tbl.('Group'));
tbl.('Control') = gnames(tbl.('Control'));



LSTM_AE=load('LSTM_AE.mat');
ODIN=load('ODIN.mat');
SNN_anomaly=load('SNN_anomaly.mat');
SNN=load('SNN.mat');
SNNb_anomaly=load('SNNb_anomaly.mat');
SNNb=load('SNNb.mat');

%--------------Calculando a mediana Redes Neurais----------------

resultsLabels={'LSTM_AE-U','LSTM_AE-C','LSTM_AE-H','ODIN-U','SNN_anomaly-C','SNN_anomaly-H','SNN-C','SNN-H','SNNb_anomaly-C','SNNb_anomaly-H','SNNb-C','SNNb-H'};
resultsArray=median([transpose(LSTM_AE.Unspecialized),transpose(LSTM_AE.Competitive),transpose(LSTM_AE.Hierarchic),transpose(ODIN.Unspecialized),transpose(SNN_anomaly.Competitive),transpose(SNN_anomaly.Hierarchic),transpose(SNN.Competitive),transpose(SNN.Hierarchic),transpose(SNNb_anomaly.Competitive),transpose(SNNb_anomaly.Hierarchic),transpose(SNNb.Competitive),transpose(SNNb.Hierarchic)]);
[M,I] = max(resultsArray);
tempValues=[transpose(LSTM_AE.Unspecialized),transpose(LSTM_AE.Competitive),transpose(LSTM_AE.Hierarchic),transpose(ODIN.Unspecialized),transpose(SNN_anomaly.Competitive),transpose(SNN_anomaly.Hierarchic),transpose(SNN.Competitive),transpose(SNN.Hierarchic),transpose(SNNb_anomaly.Competitive),transpose(SNNb_anomaly.Hierarchic),transpose(SNNb.Competitive),transpose(SNNb.Hierarchic)];
optimalResults=[optimalResults, tempValues(:,I)];
optimalGnames(3)=resultsLabels(I);

%--------------Boxplot Redes Neurais----------------

boxplot([transpose(LSTM_AE.Unspecialized),transpose(LSTM_AE.Competitive),transpose(LSTM_AE.Hierarchic),transpose(ODIN.Unspecialized),transpose(SNN_anomaly.Competitive),transpose(SNN_anomaly.Hierarchic),transpose(SNN.Competitive),transpose(SNN.Hierarchic),transpose(SNNb_anomaly.Competitive),transpose(SNNb_anomaly.Hierarchic),transpose(SNNb.Competitive),transpose(SNNb.Hierarchic)],'Notch','off','Labels',{'LSTM_AE-U','LSTM_AE-C','LSTM_AE-H','ODIN-U','SNN_anomaly-C','SNN_anomaly-H','SNN-C','SNN-H','SNNb_anomaly-C','SNNb_anomaly-H','SNNb-C','SNNb-H'});

%--------------Friedman Redes Neurais----------------

[p,tbl,stats] = friedman([transpose(LSTM_AE.Unspecialized),transpose(LSTM_AE.Competitive),transpose(LSTM_AE.Hierarchic),transpose(ODIN.Unspecialized),transpose(SNN_anomaly.Competitive),transpose(SNN_anomaly.Hierarchic),transpose(SNN.Competitive),transpose(SNN.Hierarchic),transpose(SNNb_anomaly.Competitive),transpose(SNNb_anomaly.Hierarchic),transpose(SNNb.Competitive),transpose(SNNb.Hierarchic)]);

%---------Mostrando o valor do p do FriedmanRedes Neurais----------

disp(p)

%--------------Comparando Redes Neurais----------------

[c,m,h,gnames] = multcompare(stats);

%--------------Mostrando Tabela da comparacao----------------

gnames=transpose({'LSTM_AE-U','LSTM_AE-C','LSTM_AE-H','ODIN-U','SNN_anomaly-C','SNN_anomaly-H','SNN-C','SNN-H','SNNb_anomaly-C','SNNb_anomaly-H','SNNb-C','SNNb-H'});
tbl = array2table(c,'VariableNames', {'Group', 'Control','Lower' ,'Difference','Upper','P'});
tbl.('Group') = gnames(tbl.('Group'));
tbl.('Control') = gnames(tbl.('Control'));




%--------------Boxplot melhores tecnicas----------------

boxplot(optimalResults,'Notch','off','Labels',optimalGnames);

%--------------Teste de friedman melhores tecnicas----------------

[p,tbl,stats] = friedman(optimalResults);

%---------Mostrando o valor do p do Friedman comparando os melhores de cada grupo-----------

disp(p)

%--------------Comparando melhores tecnicas----------------

[c,m,h,gnames] = multcompare(stats);



gnames=transpose(optimalGnames);



tbl = array2table(c,'VariableNames', {'Group', 'Control','Lower' ,'Difference','Upper','P'});
tbl.('Group') = gnames(tbl.('Group'));
tbl.('Control') = gnames(tbl.('Control'));
tbl

%--------------Boxplot Todos Modelos----------------

boxplot([transpose(kMeans.Unspecialized),transpose(kMeans.Competitive),transpose(kMeans.Hierarchic),transpose(KNN_Mean.Unspecialized),transpose(KNN_Mean.Competitive),transpose(KNN_Mean.Hierarchic),transpose(kNN.Unspecialized),transpose(kNN.Competitive),transpose(kNN.Hierarchic),transpose(LOF.Unspecialized),transpose(LOF.Competitive),transpose(LOF.Hierarchic),transpose(NNd.Unspecialized),transpose(NNd.Competitive),transpose(NNd.Hierarchic),transpose(GM_diag.Unspecialized),transpose(GM_diag.Competitive),transpose(GM_diag.Hierarchic),transpose(GM_full.Unspecialized),transpose(GM_full.Competitive),transpose(GM_full.Hierarchic),transpose(GM_spherical.Unspecialized),transpose(GM_spherical.Competitive),transpose(GM_spherical.Hierarchic),transpose(GM.Unspecialized),transpose(GM.Competitive),transpose(GM.Hierarchic),transpose(LSTM_AE.Unspecialized),transpose(LSTM_AE.Competitive),transpose(LSTM_AE.Hierarchic),transpose(ODIN.Unspecialized),transpose(SNN_anomaly.Competitive),transpose(SNN_anomaly.Hierarchic),transpose(SNN.Competitive),transpose(SNN.Hierarchic),transpose(SNNb_anomaly.Competitive),transpose(SNNb_anomaly.Hierarchic),transpose(SNNb.Competitive),transpose(SNNb.Hierarchic)],'Notch','off','Labels',{'kMeans-U','kMeans-C','kMeans-H','KNN_Mean-U','KNN_Mean-C','KNN_Mean-H','kNN-U','kNN-C','kNN-H','LOF-U','LOF-C','LOF-H','NNd-U','NNd-C','NNd-H','GM_diag-U','GM_diag-C','GM_diag-H','GM_full-U','GM_full-C','GM_full-H','GM_spherical-U','GM_spherical-C','GM_spherical-H','GM-U','GM-C','GM-H','LSTM_AE-U','LSTM_AE-C','LSTM_AE-H','ODIN-U','SNN_anomaly-C','SNN_anomaly-H','SNN-C','SNN-H','SNNb_anomaly-C','SNNb_anomaly-H','SNNb-C','SNNb-H'});

%--------------Friedman  Todos Modelos----------------

[p,tbl,stats] = friedman([transpose(kMeans.Unspecialized),transpose(kMeans.Competitive),transpose(kMeans.Hierarchic),transpose(KNN_Mean.Unspecialized),transpose(KNN_Mean.Competitive),transpose(KNN_Mean.Hierarchic),transpose(kNN.Unspecialized),transpose(kNN.Competitive),transpose(kNN.Hierarchic),transpose(LOF.Unspecialized),transpose(LOF.Competitive),transpose(LOF.Hierarchic),transpose(NNd.Unspecialized),transpose(NNd.Competitive),transpose(NNd.Hierarchic),transpose(GM_diag.Unspecialized),transpose(GM_diag.Competitive),transpose(GM_diag.Hierarchic),transpose(GM_full.Unspecialized),transpose(GM_full.Competitive),transpose(GM_full.Hierarchic),transpose(GM_spherical.Unspecialized),transpose(GM_spherical.Competitive),transpose(GM_spherical.Hierarchic),transpose(GM.Unspecialized),transpose(GM.Competitive),transpose(GM.Hierarchic),transpose(LSTM_AE.Unspecialized),transpose(LSTM_AE.Competitive),transpose(LSTM_AE.Hierarchic),transpose(ODIN.Unspecialized),transpose(SNN_anomaly.Competitive),transpose(SNN_anomaly.Hierarchic),transpose(SNN.Competitive),transpose(SNN.Hierarchic),transpose(SNNb_anomaly.Competitive),transpose(SNNb_anomaly.Hierarchic),transpose(SNNb.Competitive),transpose(SNNb.Hierarchic)]);

%---------Mostrando o valor do p do Friedman Todos Modelos----------

disp(p)

%--------------Comparando Todos Modelos---------------

[c,m,h,gnames] = multcompare(stats);

%--------------Mostrando Tabela da comparacao----------------

gnames=transpose({'kMeans-U','kMeans-C','kMeans-H','KNN_Mean-U','KNN_Mean-C','KNN_Mean-H','kNN-U','kNN-C','kNN-H','LOF-U','LOF-C','LOF-H','NNd-U','NNd-C','NNd-H','GM_diag-U','GM_diag-C','GM_diag-H','GM_full-U','GM_full-C','GM_full-H','GM_spherical-U','GM_spherical-C','GM_spherical-H','GM-U','GM-C','GM-H','LSTM_AE-U','LSTM_AE-C','LSTM_AE-H','ODIN-U','SNN_anomaly-C','SNN_anomaly-H','SNN-C','SNN-H','SNNb_anomaly-C','SNNb_anomaly-H','SNNb-C','SNNb-H'});
tbl = array2table(c,'VariableNames', {'Group', 'Control','Lower' ,'Difference','Upper','P'});
tbl.('Group') = gnames(tbl.('Group'));
tbl.('Control') = gnames(tbl.('Control'));
