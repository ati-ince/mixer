clear all,clc;
%%
fs=1000000;%1M/Sample al?ns?n
n=fs;
A=1;L=n/10000; %Sample olsun, geni?letilebilir gibi...
freq =linspace(-pi,pi,n);
%
WinFunc=[zeros(1,1) A.*ones(1,L) zeros(1,n-L-1)];%Bu L deg?s?rken(gni?le,, daral) daha sonra
plot(WinFunc(1:100));figure;
%% FFT
WF =fft(WinFunc);WF= fftshift(WF);WF_M=abs(WF);WF_M=WF_M/max(WF_M);plot(freq,WF_M,'b');
hold on;
L=2;
WinFunc=[zeros(1,1) A.*ones(1,L) zeros(1,n-L-1)];%Bu L deg?s?rken(gni?le,, daral) daha sonra
WF =fft(WinFunc);WF= fftshift(WF);WF_M=abs(WF);WF_M=WF_M/max(WF_M);plot(freq,WF_M,'r');

