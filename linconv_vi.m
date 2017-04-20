% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to find Linear convolution of two given sequences

% Prepare by clearing the screen
clc;clear all;close all;

% inputs output of system y[n], for input x[n], N the number of samples
xn = input('Enter the first sequence: '); %[1 1 0 1]
hn = input('Enter the second sequence: '); %[1 2 3 0]

% Specifying the position of samples in each sequence
n1 = -2 : 1;
n2 = -1 : 2;

% length and positions of the output sequence helps in plotting
ybegin = n1(1) + n2(1);
yend = n1(length(xn)) + n2(length(hn));
ny = ybegin : yend;

% Perform convolution
y = conv(xn,hn);

% display output sequence
disp('Linearly convoluted output sequence: ')
disp(y);

% Plot the input sequence 1
subplot(3,1,1);
stem(n1,xn);
xlabel('Time in samples');
ylabel('Amplitude');
title('The first input sequence');

% Plot the input sequence 2
subplot(3,1,2);
stem(n2,hn);
xlabel('Time in samples');
ylabel('Amplitude');
title('The second input sequence');

% Plot the output sequence
subplot(3,1,3);
stem(ny,y);
xlabel('Time in samples');
ylabel('Amplitude');
title('The linear convoluted output sequence');
