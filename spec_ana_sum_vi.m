% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to perform spectrum analysis of 
%               a sum of sinusoid using DFT

% Prepare by clearing the screen
clc;clear all;close all;

% Take the inputs 
f = input('Enter the frequency of sinusoid: '); % f = [1000 1001]
fs = input('Enter the sampling frequency: '); % fs = 4000
N = input('Enter the DFT length: '); % N = 32
L = input('Enter the signal length: '); % L = 32, 64, 128

% Compute DFT of given sinusoid
n = 0: L-1;
x = sin(2*pi*f(2)*(1/fs)*n) + sin(2*pi*f(1)*(1/fs)*n);
X = fft(x,N);

% Plot the DFT of sinusoid
stem(abs(X));
grid on;
xlabel('DFT Samples');
ylabel('DFT amplitude in frequency domain');
title('Spectrum of sum of sinusiods');
