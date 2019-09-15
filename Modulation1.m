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
fc=40000;wc=2*pi*fc; %fc = [20:100]kHz aral?g?nda...
sc=cos(wc*t);
%%%
sam = ammod(si,wc/(2*pi),fs);si_o = amdemod(sam,wc/(2*pi),fs);
%% FM modulation , deltaF fc/5 ald?m ama deg?seb?l?r.
deltaF=10000/10;
sfm = fmmod(si,wc/(2*pi),fs,deltaF); si_fd = fmdemod(sfm,wc/(2*pi),fs,deltaF/10);

%% PM mod
spm = pmmod(si,wc/(2*pi),fs,pi/8); si_pd = pmdemod(spm,wc/(2*pi),fs,pi/8); 
%%% ezplot(sfm, [min(t) max(t)])  ile çizdirebiliyoruz !!!
%% FFT bolumu
SI =fft(si);SI= fftshift(SI);SI_M=abs(SI);SI_M=SI_M/max(SI_M);plot(freq,SI_M,'g');hold on;
% SC =fft(sc);SC= fftshift(SC);SC_M=abs(SC);SC_M=SC_M/max(SC_M);plot(freq,SC_M,'r');hold on;
% SAM=fft(sam);SAM= fftshift(SAM);SAM_M=abs(SAM);SAM_M=SAM_M/max(SAM_M);plot(freq,SAM_M);
% %
% figure
% plot(freq,SI_M,'g');hold on;
% plot(freq,SC_M,'r');hold on;
% SFM=fft(sfm);SFM_M=abs(SFM/L);plot(freq,SFM_M);
% %
% figure
% plot(freq,SI_M,'g');hold on;
% plot(freq,SC_M,'r');hold on;
% SPM=fft(spm);SPM_M=abs(SPM/L);plot(freq,SPM_M);
%% Demodule edilenler burada
% SI_FD =fft(si_fd );SI_FD= fftshift(SI_FD);SI_FDM=abs(SI_FD);SI_FDM=SI_FDM/max(SI_FDM);plot(freq,SI_FDM,'r');
SI_PD =fft(si_pd );SI_PD= fftshift(SI_PD);SI_PDM=abs(SI_PD);SI_PDM=SI_PDM/max(SI_PDM);plot(freq,SI_PDM,'r');

