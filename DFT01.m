clc;
clear;
close all;
x=[1 1 2 2 3 3];
N=length(x);
X=zeros(1,N);

for k=0:N-1
    for n=0:N-1
        X(k+1)=X(k+1)+x(n+1)*exp(-1j*2*pi*k*n/N);
    end
end

X
abs(X)
angle(X)

k=0:N-1
figure;
subplot(2,1,1);
stem(k,abs(X),'filled');
title('Magnitude');
xlabel('k');
ylabel('|X(k)|');

subplot(2,1,2);
stem(k,abs(X),'filled');
title('Phase');
xlabel('k');
ylabel('|X(k)|');