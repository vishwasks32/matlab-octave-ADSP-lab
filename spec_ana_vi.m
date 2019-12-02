% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to perform spectrum analysis of 
%               a single sinusoid using DFT

% Prepare by clearing the screen
clc;clear all;close all;

% Take the inputs 
f = input('Enter the frequency of sinusoid: '); % f = 1000
fs = input('Enter the sampling frequency: '); % fs = 4000
N = input('Enter the DFT length: '); % N = 32

% Compute DFT of given sinusoid
k = 0 : N-1;
x = sin(2*pi*k*f*(1/fs));
X = fft(x);

% Plot the DFT of sinusoid
stem(k,abs(X));
grid on;
xlabel('DFT Samples');
ylabel('DFT amplitude in frequency domain');
title('Spectrum of a sinusoid of certain frequency');
