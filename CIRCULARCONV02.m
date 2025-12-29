clc;
clear;
close all;

x=[1 2 3 4];
h=[4 3 2 1];
N=length(x);
y=zeros(1,N);

for n=0:N-1
    for m=0:N-1
        y(n+1)=y(n+1)+x(m+1)*h(mod(n-m,N)+1);
    end
end

figure;
stem(0:N-1,y,'filled');
title('CC');
xlabel('n');
ylabel('y(n)');
