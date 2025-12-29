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


    
    
    
    
   