clear all, clc;
%% Burada PWM benzeri yeni örneklemeyi test edelim. 
voice=load('handel');
% ReSample -> Orneklemeyi ana frekansa çektik..
%[P,Q] = rat(fs/voice.Fs);
%voice.y = resample(voice.y,P,Q);voice.Fs=fs; %New Sampling rate
Fs=voice.Fs; sigv=voice.y;L=length(sigv); clear voice;
% %50 duty cycle ve klasik resampling ile
p=4; % Tum sonuclar? buna gor yapacag?z.. ReSample ve T?meDoma?n Zero
[P,Q] = rat((Fs/p)/Fs);sign2v = resample(sigv,P,Q); %ReSampling
k=1;
for i=1:length(sigv)
    if (mod(i,p)==1)
        sigp2(i)=sigv(i);
    else
        sigp2(i)=0;
    end
end
sigp2=sigp2';

%% comparison
freq =linspace(-pi,pi,L);
SIGV =fft(sigv,L);SIGV= fftshift(SIGV);SIGV=abs(SIGV);SIGV=SIGV/max(SIGV);plot(freq,SIGV,'g');
hold on;
SIGVN2 =fft(sign2v,L);SIGVN2= fftshift(SIGVN2);SIGVN2=abs(SIGVN2);SIGVN2=SIGVN2/max(SIGVN2);plot(freq,SIGVN2,'b');
hold on;
SIGP2 =fft(sigp2);SIGP2= fftshift(SIGP2);SIGP2=abs(SIGP2);SIGP2=SIGP2/max(SIGP2);plot(freq,SIGP2,'r');
