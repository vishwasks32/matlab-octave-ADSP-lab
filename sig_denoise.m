% Author: Vishwas K Singh
% Email: vishwasks32@gmail.com
% Script to show denoising signals and images using wavelets

close all;
clear all;
clc;

% Generate a signal
Fs = 8000;
N = 800;
t = (0:N-1)/Fs;
f = 20;
x = sin(2 * pi * f * t);
subplot(3,1,1);
plot(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Original Signal');

% Add awgn noise
% set SNR
snr = 5.0;
y = awgn(x,snr);
subplot(3,1,2);
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Noisy Signal');

% perform wavelet denoising
% wden performs an automatic de-noising process of a one-dimensional signal
% using wavelets.
% De-noise noisy signal using soft heuristic SURE thresholding 
% and scaled noise option, on detail coefficients obtained 
% from the decomposition of x, at level 5 by sym8 wavelet. 
lev = 5;
xd = wden(y,'heursure','s','one',lev,'sym8');
subplot(3,1,3);
plot(t,xd);
xlabel('Time');
ylabel('Amplitude');
title('Denoised Signal');