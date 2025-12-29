clc;
clear;
close all;

x=[1 2 3 4 4 3 2 1];
N=length(x);

n=0:N-1;
rev=bitrevorder(n+1);
X=x(rev);

stages=log2(N);

for s=1:stages
    m=2^s;
    wm=exp(-1j*2*pi/m);
    
    for k=1:m:N
        for j=0:(m/2-1)
            t=wm^j * X(k+j+m/2);
            u=X(k+j);
            
            X(k+j)=u+t;
            X(k+j+m/2)=u-t;
        end
    end
end

disp(x)
disp(X)

k=0:N-1;
freq=k/N;

figure;
subplot(2,1,1);
stem(freq,abs(X),'filled');
title('Magnitude')
xlabel('k');
ylabel('Magnitude');

subplot(2,1,2);
stem(freq,angle(X),'filled');
title('Phase spectrum');
xlabel('K');
ylabel('Phase(rad)');
       
        
