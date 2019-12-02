% Author: Vishwas K Singh
% Email: vishwasks32@gmail.com
% Script to study time-fequencey analysis of Continuous Wavelet transforms

close all;
clear all;
clc;

% Generate a noisy signal y from x with SNR 0.5
f = 1000;
Fs = 4000;
N = 100;
t = (0:N-1)/Fs;
x = sin(2*pi*f*t);
y = awgn(x,0.5);

figure(1);
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Input Signal');

% Take the Continuous Wavelet Transform of the signal and
% analyze the time-frequency tiling
% daubechies-4 wavelet is used
figure(2);
c = cwt(y,1:50,'db4','plot');
title('Continuous Wavelet Transforms');
xlabel('Time');
ylabel('Scale');


