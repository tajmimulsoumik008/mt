clc;
clear;
close all;
X=[3,2+j,1,2-j];
N=length(X);
x=zeros(1,N);

for n=0:N-1
    for k=0:N-1
        x(n+1)=x(n+1)+X(k+1)*exp(1j*2*pi*k*n/N);
    end
    x(n+1)=x(n+1)/N;
end

x
abs(x)
angle(x)

n=0:N-1
figure;
subplot(2,1,1);
stem(n,abs(x),'filled');
title('Magnitude');
xlabel('n');
ylabel('|X(n)|');

subplot(2,1,2);
stem(n,abs(x),'filled');
title('Phase');
xlabel('k');
ylabel('|X(k)|');