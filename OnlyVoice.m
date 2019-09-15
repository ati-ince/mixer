clear all, clc;
%%
fs=1000000;%Sampling
T=1/fs;
%%%
voice=load('handel');
% ReSample -> Orneklemeyi ana frekansa çektik..
[P,Q] = rat(fs/voice.Fs);
voice.y = resample(voice.y,P,Q);voice.Fs=fs; %New Sampling rate
L=length(voice.y);
t=(0:L-1)*T;
freq =linspace(-pi,pi,L);
%
si=voice.y;si=si(1:L)';%adjust the length
plot(si,'r');
%% FFT bolumu
figure;
SI =fft(si);SI= fftshift(SI);SI_M=abs(SI);SI_M=SI_M/max(SI_M);plot(freq,SI_M,'b');
