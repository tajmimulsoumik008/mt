clc;
clear all;
close all;
fsample=1000;
fp=100;
fs=200;
wp=2*fp/fsample;
ws=2*fs/fsample;

N=ceil((6.1*pi)/(ws-wp));

if rem(N,2)~=0
    N=N+1;
end

w=bartlett(N+1);

b_lp=fir1(N,wp,'low',w);
[h_lp,f_lp]=freqz(b_lp,1,512);

b_hp=fir1(N,wp,'high',w);
[h_hp,f_hp]=freqz(b_hp,1,512);

wn=[wp ws]
b_bp=fir1(N,wn,w);
[h_bp,f_bp]=freqz(b_bp,1,512);

b_bs=fir1(N,wn,'stop',w);
[h_bs,f_bs]=freqz(b_bs,1,512);

figure;
subplot(2,2,1);
plot(f_lp/pi,20*log10(abs(h_lp)),'r','linewidth',1.5);
title('low pass');
xlabel('frequency');
ylabel('magnitude');

subplot(2,2,2);
plot(f_hp/pi,20*log10(abs(h_hp)),'r','linewidth',1.5);
title('high pass');
xlabel('frequency');
ylabel('magnitude');

subplot(2,2,3);
plot(f_bp/pi,20*log10(abs(h_bp)),'r','linewidth',1.5);
title('high pass');
xlabel('frequency');
ylabel('magnitude');

subplot(2,2,4);
plot(f_bs/pi,20*log10(abs(h_bs)),'r','linewidth',1.5);
title('high pass');
xlabel('frequency');
ylabel('magnitude');







