%%
fe = 1e4; 
te = 1/fe;
N = 10000; 
t = (0:N-1)*te;  
x = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
plot(t,x,'-');
title('signal x(t) :');
%%
 f =(0:N-1)*(fe/N); %frequence du spectre
 y = fft(x); % y: spectre , fft(x) : transformee de fourier
 plot(f,abs(y));
 title('Spectre de x(t):');
 %%
 fshift = (-N/2:N/2-1)*(fe/N);
 plot(fshift,fftshift(abs(y)));
 title('Spectre de x(t):');
%%
bruit = 20*randn(size(x)); %bruit
xnoise = x+bruit; % signal+bruit
plot(xnoise);
title('signal bruité')
%%
sound(x) %le signal
%%
sound(xnoise) %le signal bruité
%%
xnoise = x+bruit; % signal+bruit
fshift = (-N/2:N/2-1)*(fe/N);
ybruit = fft(xnoise);
plot(fshift,fftshift(abs(ybruit)));
%%
bruit = 50*randn(size(x));%bruit
xnoise = x+bruit; % signal+bruit
fshift = (-N/2:N/2-1)*(fe/N);
ybruit = fft(xnoise);
plot(fshift,fftshift(abs(ybruit)));
%%
[x,fs] = audioread("bluewhale.au");
chant = x(2.45e4:3.10e4);
%%
%lecture
sound(x,fs)
%Visualisation
chant = x(2.45e4:3.10e4);
N=length(chant);
ts=1/fs;
t=(0:N-1)*(10*ts);
plot(t,chant);
%%
dsp_chant = (abs(fft(chant)).^2)/N;
f = (0:floor(N/2))*(fs/N)/10;
plot(f,dsp_chant(1:floor(N/2)+1))
title('Spectre')
%%
