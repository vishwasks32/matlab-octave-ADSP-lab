% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to compare DCT and DFT in terms of energy
%               compactness

% Prepare by clearing the screen
clc;clear all;close all;

% Generate the sequence x[n] = n-64 for n = 0 ..... 127
n = 0:127;
x = n-64;
z = x;

% X[k] = DFT(x[n])
Xk = fft(x);

% For various values of L set to zero "High Frequency coefficients" 
% Xk[64-L] =...Xk[64]=...Xk[64+L] = 0 and find inverse DFT
L = 32;
Xk((64 - L):(L + 64)) = 0;
Yf = ifft(Xk);

% Plot input Sequence
subplot(2,2,1);
plot(x);
title('INPUT SEQUENCE');

% Plot IFFT Output Sequence
subplot(2,2,2);
plot(real(Yf(1:128)));
title('IFFT OUTPUT SEQUENCE');

% XDCT[k] = DCT(x[n])
XDCTk = dct(z);

% For same valuse of L, set to zero "High frequency Coefficients"
% XDCT[127-L]=...XDCT[127] and take IDCT
XDCTk((128-L):(128+L)) = 0;
Xl = idct(XDCTk);

% Plot input squence
subplot(2,2,3);
plot(z);
title('INPUT SEQUENCE');

% Plot the IDCT Output Sequence
subplot(2,2,4);
plot(Xl);
title('IDCT OUTPUT SEQUENCE');
