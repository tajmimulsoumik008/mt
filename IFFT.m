clc;
clear;
close all;
X = [20.0000 + 0.0000i -5.8284 - 2.4142i 0.0000 + 0.0000i -0.1716 - 0.4142i   0.0000 + 0.0000i -0.1716 + 0.4142i 0.0000 + 0.0000i -5.8284 + 2.4142i];
N=length(X);

n=0:N-1;
rev=bitrevorder(n+1);
X=X(rev);

stages=log2(N);

for s=1:stages
    m=2^s;
    wm=exp(1j*2*pi/m);
    
    for k=1:m:N
        for j=0:(m/2-1)
            t=wm^j * X(k+j+m/2);
            u=X(k+j);
            
            X(k+j)=u+t;
            X(k+j+m/2)=u-t;
        end
    end
end

x=X/N;

disp('Time domain signal x[n]:');
disp(x);
disp('Magnitude |x[n]|:'); disp(abs(x));
disp('Phase angle(x[n]):'); disp(angle(x));
