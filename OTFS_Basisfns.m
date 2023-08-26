clc;
clear all;
close all;
%No. of Subcarriers
M=32;
%No. of symbols
N=32;

F_M=1/M*dftmtx(M);
F_N=1/N*dftmtx(N);

%Pulse shaping
ps=eye(M);

%Generating basis function DD domain
x_DD=zeros(M,N);
x_DD(2,2)=1;

%Generating TF domain
x_TF=x_DD*F_N;

%Generating Time domain
S=ps*F_M*x_TF;
s=reshape(S,M*N,1);

figure()
bar3(x_DD)
axis tight 
xlabel('Delay');
ylabel('Doppler');
title('basis function in DD domain');

figure()
surf(real(x_TF))
axis tight 
xlabel('Subcarrier');
ylabel('Time');
title('basis function in TF real domain');

figure()
surf(imag(x_TF))
axis tight 
xlabel('Subcarrier');
ylabel('Time');
title('basis function in TF imag domain');

figure()
%One OTFS frame
plot((1:length(s))*T/M,real(s))
axis tight 
xlabel('Time');
title('basis function in Time real domain');

figure()
plot((1:length(s))*T/M,imag(s))
axis tight 
xlabel('Time');
title('basis function in Time ima domain');