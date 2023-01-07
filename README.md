# TP1--Analyse-spectrale-d-un-signal-Transform-e-de-Fourier-discr-te
## Objectif
+ Représentation de signaux et applications de la transformée de Fourier discrète
(TFD) sous Matlab. 
+ Evaluation de l’intérêt du passage du domaine temporel au domaine fréquentiel 
dans l’analyse et l’interprétation des signaux physiques réels.
## Représentation temporelle et fréquentielle 
+ Soit 𝐱(𝐭) = 𝟏. 𝟐𝐜𝐨𝐬(𝟐𝐩𝐢𝟒𝟒𝟎𝐭 + 𝟏. 𝟐) + 𝟑𝐜𝐨𝐬(𝟐𝐩𝐢𝟓𝟓𝟎𝐭) + 𝟎. 𝟔𝐜𝐨𝐬(𝟐𝐩𝐢𝟐𝟓𝟎𝟎𝐭) 
un signal periodique constitué d’une somme de trois sinusoïdes de 
fréquences 440Hz, 550Hz, 2500Hz
1-Representation du signal pour une Fréquence d’échantillonnage : fe = 10000Hz, et un Intervalle : Nombre d’échantillons : N = 5000.
```matlab
fe = 1e4; 
te = 1/fe;
N = 10000; 
t = (0:N-1)*te;  
x = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
plot(t,x,'.');
title('signal x(t) :');
```
