clc;
clear;
close all;
fsample=1200;
fp=120;
fs=220;
rp=1;
rs=12;

wp=2*fp/fsample;
ws=2*fs/fsample;

[n_lp,wn_lp]=buttord(wp,ws,rp,rs);
[b_lp,a_lp]=butter(n_lp,wn_lp,'low');
[h_lp,f_lp]=freqz(b_lp,a_lp,512,fsample);

[n_hp,wn_hp]=buttord(wp,ws,rp,rs);
[b_hp,a_hp]=butter(n_hp,wn_hp,'high');
[h_hp,f_hp]=freqz(b_hp,a_hp,512,fsample);


fp=[ 220 450]
fs=[180 500 ]

wp=2*fp/fsample;
ws=2*fs/fsample;

[n_bp,wn_bp]=buttord(wp,ws,rp,rs);
[b_bs,a_bp]=butter(n_bp,wn_bp,'bandpass');
[h_bp,f_bp]=freqz(b_bs,a_bp,512,fsample);

fp=[ 220 450]
fs=[260 410 ]

wp=2*fp/fsample;
ws=2*fs/fsample;

[n_bs,wn_bs]=buttord(wp,ws,rp,rs);
[b_bs,a_bs]=butter(n_bs,wn_bs,'stop');
[h_bs,f_bs]=freqz(b_bs,a_bs,512,fsample);

figure;
subplot(2,2,1);
plot(f_lp,20*log10(abs(h_lp)),'r','linewidth',1.5);
title('Low pass');
xlabel('frequency');
ylabel('Magnitude');

subplot(2,2,2);
plot(f_hp,20*log10(abs(h_hp)),'r','linewidth',1.5);
title('Low pass');
xlabel('frequency');
ylabel('Magnitude');

subplot(2,2,3);
plot(f_bp,20*log10(abs(h_bp)),'r','linewidth',1.5);
title('Low pass');
xlabel('frequency');
ylabel('Magnitude');

subplot(2,2,4);
plot(f_bs,20*log10(abs(h_bs)),'r','linewidth',1.5);
title('Low pass');
xlabel('frequency');
ylabel('Magnitude');




