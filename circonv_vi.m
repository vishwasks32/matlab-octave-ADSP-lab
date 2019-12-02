% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to find Circular convolution of two given sequences

% Prepare by clearing the screen
clc;clear all;close all;

% inputs: x[n],h[n]
xn = input('Enter the first sequence: '); % [1 1 0 1]
hn = input('Enter the second sequence: '); % [1 2 3 0]

% To adjust for different length sequences
N1 = length(xn);
N2 = length(hn);
N = max(N1, N2);

xn = [xn, zeros(1,N - N1)]; 
hn = [hn, zeros(1,N - N2)];
y = zeros(1,N);

% Generate circular convolution of two sequences
for i = 0:N-1
    for j = 0:N-1
        k = mod((i-j),N);
        y(i+1) = y(i+1) +(xn(j+1) * hn(k+1));
    end
end
n = 1:N;

% display output sequence
disp('Circularly convoluted output sequence: ')
disp(y);

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
stem(n,y);
xlabel('Time in samples');
ylabel('Amplitude');
title('The circularly convoluted output sequence');
