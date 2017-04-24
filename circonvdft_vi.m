% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to find circular convolution of two given sequences
%               using DFT and IDFT

% Prepare by clearing the screen
clc;clear all;close all;

% inputs: x[n], h[n]
xn = input('Enter the first sequence: '); % [1 1 0 1]
hn = input('Enter the second sequence: '); % [1 2 3 0] 

% Specifying the position of samples in each sequence
% To adjust for different length sequences
N1 = length(xn);
N2 = length(hn);
N = max(N1,N2);
xn = [xn, zeros(1,(N-N1))];
hn = [hn, zeros(1,(N-N2))];

% Compute DFT of both sequences
Xk = fft(xn);
Hk = fft(hn);

% Compute output and IDFT
Yk = Xk .* Hk;
yn = ifft(Yk);

% Note: The output of convolution is obtained as a double since fft is used
% to match the output with normal convolution program abs, uint8
% conversions are used
disp('The Circularly convoluted output(using DFT & IDFT) is: ');
disp(yn);

n = 1:N;

% Plot the input sequence 1
subplot(3,1,1);
stem(n,xn);
xlabel('Time in samples');
ylabel('Amplitude');
title('The first input sequence');

% Plot the input sequence 2
subplot(3,1,2);
stem(n,hn);
xlabel('Time in samples');
ylabel('Amplitude');
title('The second input sequence');

% Plot the output sequence
subplot(3,1,3);
stem(n,yn);
xlabel('Time in samples');
ylabel('Amplitude');
title('The Circular convoluted output(using DFT & IDFT) sequence');
