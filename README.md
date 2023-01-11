# TP1--Analyse spectrale d'un signal-Transformée de Fourier discrete
## Objectifs
+ Représentation de signaux et applications de la transformée de Fourier discrète
(TFD) sous Matlab. 
+ Evaluation de l’intérêt du passage du domaine temporel au domaine fréquentiel 
dans l’analyse et l’interprétation des signaux physiques réels.
## Représentation temporelle et fréquentielle 
+ Soit 𝐱(𝐭) = 𝟏. 𝟐𝐜𝐨𝐬(𝟐𝐩𝐢𝟒𝟒𝟎𝐭 + 𝟏. 𝟐) + 𝟑𝐜𝐨𝐬(𝟐𝐩𝐢𝟓𝟓𝟎𝐭) + 𝟎. 𝟔𝐜𝐨𝐬(𝟐𝐩𝐢𝟐𝟓𝟎𝟎𝐭) 
un signal periodique constitué d’une somme de trois sinusoïdes de 
fréquences 440Hz, 550Hz, 2500Hz

**1-Representation du signal pour une Fréquence d’échantillonnage : *fe = 10000Hz*, et un Intervalle : Nombre d’échantillons : *N = 5000.***
```matlab
fe = 1e4; 
te = 1/fe;
N = 10000; 
t = (0:N-1)*te;  
x = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
plot(t,x,'.');
title('signal x(t) :');
```
<img width="810" alt="1" src="https://user-images.githubusercontent.com/121026257/211807053-81272c7a-fdad-4a72-82c7-3c68c10764de.PNG">

>Pour approximer la TF continue d’un signal x(t), représenté suivant un pas Te, on utilise les deux commandes : fft et fftshift.
+ On remarquera que la TF est une fonction complexe et que la fonction ainsi obtenue décrit la TF de x(t) entre –1/(2Te) et 1/(2Te) par pas de 1/(nTe) où n est le nombre de points constituant le signal x(t).
+  La commande *fft* codant les fréquences positives sur les n/2 premières valeurs du signal et les valeurs négatives entre n/2+1 et n, la commande fftshift permet de les inverser.

**2-Calcul de la TFD du signal et representation spectral**
```matlab
 f =(0:N-1)*(fe/N); %frequence du spectre
 y = fft(x); % y: spectre , fft(x) : transformee de fourier
 plot(f,abs(y));
 title('Spectre de x(t):');
```

<img width="844" alt="2" src="https://user-images.githubusercontent.com/121026257/211813517-dc1f4909-d819-448d-94b9-65d4d347fe2a.PNG">

**3-Pour mieux visualiser le contenu fréquentiel du signal, utilisons la fonction *fftshift*, qui effectue un décalage circulaire centré sur zéro du spectre en amplitude obtenu par la commande *fft***
```matlab
 fshift = (-N/2:N/2-1)*(fe/N);
 plot(fshift,fftshift(abs(y)));
 title('Spectre de x(t):');
```
<img width="837" alt="3" src="https://user-images.githubusercontent.com/121026257/211813547-32093a37-122c-4d16-8215-af28fbde147f.PNG">

**4-Introduction d'un bruit blanc gaussien dans le signal x(t) et sa visualisation**
```matlab
bruit = 20*randn(size(x)); %bruit
xnoise = x+bruit; % signal+bruit
plot(xnoise);
title('signal bruité')
```
<img width="819" alt="4" src="https://user-images.githubusercontent.com/121026257/211808481-b6e63adf-806f-44df-8c16-050e8cee0fec.PNG">

**5-Commande *Sound* pour ecouter le signal bruité et non bruité**
```matlab
sound(x) %le signal
sound(xnoise) %le signal bruité
```
*Son non bruité:*

https://user-images.githubusercontent.com/121026257/211811684-8f171466-7d58-4559-a65e-710e00a44f50.mp4

*Son bruité*

https://user-images.githubusercontent.com/121026257/211812357-5e8aba9e-f0e3-4dcf-b283-af4373f2eb4d.mp4


>La puissance du signal en fonction de la fréquence (densité spectrale de puissance) est une métrique couramment utilisée en traitement du signal. Elle est définie comme étant le carré du module de la TFD, divisée par le nombre d'échantillons de fréquence

**6-Calcul et representation spectral de puissance du signal bruité centré a la frequence 0**
```matlab
xnoise = x+bruit; % signal+bruit
fshift = (-N/2:N/2-1)*(fe/N);
ybruit = fft(xnoise);
plot(fshift,fftshift(abs(ybruit)));
```

<img width="821" alt="6" src="https://user-images.githubusercontent.com/121026257/211814204-343efff0-c273-4a15-84b9-6f2c55cd9e9d.PNG">

**7-Augmentation de l'intensité du bruit et sa representation spectrale**
```matlab
bruit = 50*randn(size(x));%bruit
xnoise = x+bruit; % signal+bruit
fshift = (-N/2:N/2-1)*(fe/N);
ybruit = fft(xnoise);
plot(fshift,fftshift(abs(ybruit)));
```

<img width="825" alt="7" src="https://user-images.githubusercontent.com/121026257/211814515-ac4b2cf3-8c29-4ea1-a37e-364441a87620.PNG">

>il est observable que l'augmentation de l'intensite du bruit entraine la perte du signal informatif
## Analyse fréquentielle du chant du rorqual bleu
>Il existe plusieurs signaux dont l’information est encodée dans des sinusoïdes. Les ondes sonores est un bon exemple. Considérons maintenant des données audios collectées à partir de microphones sous - marins au large de la Californie. On cherche à détecter à travers une analyse de Fourier le contenu fréquentiel d’une onde sonore émise pas un rorqual bleu.

**1-Chargement du fichier *bluewhale.au* contenant le sous-ensemble de données qui correspond au chant du rorqual bleu du Pacifique avec la commande *audioread***
```matlab
[x,fs] = audioread("bluewhale.au");
chant = x(2.45e4:3.10e4);
```
**2-Lecture et visualisation du signal**
```matlab
%lecture
sound(x,fs)
%Visualisation
chant = x(2.45e4:3.10e4);
N=length(chant);
ts=1/fs;
t=(0:N-1)*(10*ts);
plot(t,chant);
```

https://user-images.githubusercontent.com/121026257/211820326-1a23d0cf-d962-49df-b5d8-a884804754b8.mp4

**3-Specification d'une nouvelle longueure du signal**

>La TFD peut être utilisée pour identifier les composantes fréquentielles de ce signal audio. Dans certaines applications qui traitent de grandes quantités de données avec *fft*, il est courant de redimensionner l'entrée de sorte que le nombre d'échantillons soit une puissance de 2. *fft* remplit automatiquement les données avec des zéros pour augmenter la taille de l'échantillon. Cela peut accélérer considérablement le calcul de la transformation
```matlab
dsp_chant = (abs(fft(chant)).^2)/N;
f = (0:floor(N/2))*(fs/N)/10;
plot(f,dsp_chant(1:floor(N/2)+1))
title('Spectre')
```

<img width="807" alt="8" src="https://user-images.githubusercontent.com/121026257/211820825-83e59c51-124c-4619-9973-612431135b89.PNG">

**4-Determination de la frequence fondamentale du gémissement du rorqual bleu**
>Il est observable que c'est la frequence du 1er pic entre *16Hz* et *17Hz*

<img width="811" alt="9" src="https://user-images.githubusercontent.com/121026257/211821126-7f67156a-4504-4b98-b1d1-4227eb8f49af.PNG">

## Réaliser : par M'HIFED Zineb

## Specialité : Robotique et Cobotique

## Sous la supervision de : Pr AMMOUR Alae





