# SONAR-Results
Resultados experimentais do dataset fornecido pelo IPqM

O repositório é dividio em pastas, sendo o nome dela as classes consideradas como conhecidas.

Os arquivos .mat possuem estruturas com labels "Competitive"(topologia Unânime), "Unspecialized"(topologia não especializada), "Hierarchic"(topologia hierárquica)

As técnicas são as mesmas do projeto de graduação, com exceção da rede neural siamesa que utiliza margem ao invés de peso e um modelo adicional de siamensa que utiliza anomalias sintetizadas por um modelo de mistura guassiana usando o nearest neigbhor com limiar de decisão em 100% para filtrar as anomalias.

OS modelos de siamesa são SNN(One Against All), SNNb(One Against One), SNN_anomaly(Class Against Anomaly), SNNb_anomaly(One Against One+Anomaly)

Os hiperparâmetros estão no texto do projeto de graduação, com exceção dos modelos de siamesa que irei adicionar posteriormente.

Adicionalmente adiciono dois scripts: comandos.m e comandos.py para fazer algumas análises e comparações no dataset.
